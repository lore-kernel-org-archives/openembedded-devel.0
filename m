Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E515660797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:45:05 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bMZe5-0005IC-EZ for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2016 13:45:05 +0200
Received: from host-091-097-062-046.ewe-ip-backbone.de ([91.97.62.46])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:45:05 +0200
Received: from patrick.ohly by host-091-097-062-046.ewe-ip-backbone.de with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 13:45:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 11 Jul 2016 11:29:36 +0000 (UTC)
Message-ID: <loom.20160711T131713-153@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 91.97.62.46 (Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Firefox/38.0 Iceweasel/38.7.1)
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2016 11:45:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dan McGregor <danismostlikely <at> gmail.com> writes:
> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
> 
> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> elimination by default. OpenJDK 8 is not ready for either of these
> changes, so set the C++ standard back to gnu++98 and disable dead
> store elimination.
> 
> Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
> patch fixes building when using those flags, and are needed to get
> CFLAGS into the JDK build in the native case.

Has anyone tested this on a host system where gcc is still 4.x, like 4.9.2
on Debian Wheezy?

I'm finding that -fno-lifetime-dse is also getting passed to the gcc used
for compiling native binaries (obviously in openjdk-8-native, but also for
some helper executables in openjdk-8). This then breaks the compilation
because older gcc rejects that flag.

I've briefly toyed with the patch below which worked for openjdk-8-native,
but not for openjdk-8. I'm just going to work around it by staying on gcc
5.x and clearing these extra flags.

I'm not familiar enough with the openjdk-8 build process to propose a better
solution, but perhaps someone else has an idea?

diff --git a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
index dd3d397..060d828 100644
--- a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
+++ b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
@@ -237,6 +237,25 @@ EXTRA_OECONF_append = "\
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
 "
 
-CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
-CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
+# GCC 6 sets the default C++ standard to C++14 and introduces dead store
+# elimination by default. OpenJDK 8 is not ready for either of these
+# changes.
+FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+
+# All supported cross compilers support the compiler flags that were
+# added to make compilation with gcc6 work. But the host compiler for
+# native compilation is a different story: it may be too old (for example,
+# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
+# version is and unset the flags when gcc is not yet GCC 6.
+python () {
+    if d.getVar('PN', True).endswith('-native'):
+        import re, subprocess
+        version = subprocess.check_output(d.expand('${CC}
--version').split()).decode('utf-8')
+        m = re.search(r'^gcc.* (\d+)(\.\d+)*$', version, re.MULTILINE)
+        if m and int(m.group(1)) < 6:
+            d.setVar('FLAGS_GCC6', '')
+}
+
+CFLAGS_append = " ${FLAGS_GCC6}"
+CXXFLAGS_append = " ${FLAGS_GCC6}"
 CXX_append = " -std=gnu++98"

Bye, Patrick


