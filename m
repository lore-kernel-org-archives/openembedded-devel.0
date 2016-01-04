Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBC16011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 11:24:27 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id p186so47004975qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 03:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=XnNhW2vRfBu+EO3YJVHwdN6gdYZSIejGk1XA/t4QVl8=;
	b=1IbM9GeoZnf7F5LLPouVbVkH7y7yal6bgi9/m+KU4Q1WPnZ8DM7wbq3UBlKx5rMPiK
	xSAVid5s+8/32Opdnr8Gv/ag8sq5VYE0Z8710TiWERW6CFFR7L0YvNfMtRIV5IrDta/A
	NZPiNICFqGVK93+c++o8DLXXbBVJC7a1ivUUuSPhtsw9XmGCWMV5cEyG4VSb3gPYgo3N
	jFiISbnGbOksq2dwRRJOrURdzttxXMYRzswr2HhS/FnLmer+YKhs3g87ODpwqojfeywr
	Z8yxkA31flVhslvFINI3ZjnRIn5N8vxS7Lti2qo7PAY5r8H/eV6ZfxOO3dIZ55h2KPb3
	dhtQ==
X-Received: by 10.55.55.72 with SMTP id e69mr112901424qka.42.1451906668581;
	Mon, 04 Jan 2016 03:24:28 -0800 (PST)
Received: from localhost ([177.127.6.55]) by smtp.gmail.com with ESMTPSA id
	g90sm38971565qgg.45.2016.01.04.03.24.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 03:24:27 -0800 (PST)
Message-ID: <568a566b.63208c0a.c22e9.64ec@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Mon, 04 Jan 2016 09:24:23 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Mon, 04 Jan 2016 09:24:23 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2016-01-04
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
X-List-Received-Date: Mon, 04 Jan 2016 11:24:28 -0000

Hello,

I pushed following updates:

commit 8b776ac68f9af4596be3824152bcf0bc6b67fa1d (HEAD -> master, yocto/master, m/master)
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Thu Dec 31 17:26:34 2015 +0800

    classpath: fix invalid options
    
    After updated to version 0.99, the following options
    became invalid:
    
    * --with-ecj: use JAVAC env variable instead
    * --with-fastjar: change to --with-jar
    * --with-vm: uae JAVA env variable instead
    * --disable-qt4-peer: invalid even in 0.93, just drop it.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 3f634889bc81bcb928e5669631d094df79d14cae
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Wed Dec 30 15:14:11 2015 +0800

    openjdk-8: fix the alternative for javac
    
    * ${PN}-jdk doesn't exist at all so the alternative
      for javac is invalid.
    * remove the useless commented lines as well.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 1f7db1fce7b141811de90662407525619fefa29f
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Mon Dec 28 14:12:45 2015 +0800

    openjdk-7: fix the incorrect URIs and checksums
    
    The error in do_configure is like:
    openjdk.tar.bz2: FAILED
    /usr/bin/sha256sum: WARNING: 1 of 1 computed checksum did NOT match
    
    That's because the URIs and checksums do not match the ones defined
    in Makefile.am, then the configure will fail the test and download
    again from ICEDTEA_DROP_URL.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 74cfd0579c5d5bde9b9a9df92814489739fa456f
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Sep 17 13:03:59 2015 -0400

    openjdk hotspot build system std.h fix
    
    Backport from upstream from jdk9
    Hotspot build system looking for sdt.h in the wrong place
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 6273537d06b9df611a2f41b3de6e552941e1cf94
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 18:24:53 2015 -0400

    icedtea7-native/openjdk-7: fails on hosts with no unzip
    
    Fails with an error message /usr/bin/unzip not found.
    Additionally, icedtea7 enables you to specify an unzip to use by setting
    the variable UNZIP, this results in an error because unzip uses UNZIP
    to specify options, hence you'll end up with unzip trying to unzip unzip.
    
    Note: Same issue applies to  openjdk
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 23ae934ae40898e1910d3e126a7796b9b2feec36
Author: Amy Fong <amy.fong@windriver.com>
Date:   Fri Sep 18 08:51:40 2015 -0400

    openjdk-7: add depends on attr
    
    openjdk depends on attr, this can result in a configure
    failure if the dependency is missing.
    
        checking for sys/epoll.h... (cached) yes
        checking attr/xattr.h usability... no
        checking attr/xattr.h presence... no
        checking for attr/xattr.h... no
        configure: error: Could not find required system headers;
          install the appropriate files from glibc-headers,
          libc6-dev and/or libattr-devel, libattr1-dev or use
          --disable-compile-against-syscalls if necessary.
        Configure failed. The contents of all config.log files follows to aid debugging
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 5112a6f952ed57d7bc79ab399a458d4fb356fc07
Author: Amy Fong <amy.fong@windriver.com>
Date:   Fri Apr 24 13:59:32 2015 -0400

    jamvm-git uprev to 2.0.0
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit bf1362e05be0fccbcccb8d55291b8a5cf42c0f30
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:48:46 2015 -0400

    openjdk: fix CVE-2014-1876
    
    Rather than creating /tmp/unpack.log and insecure permissions,
    if unpack cannot create teh specified log file, it defaults to writing
    to /dev/null, failing that, stderr. (These are the default options if
    it cannot write to /tmp/unpack.log)
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit e3ac9836ab585c0b4134c7c0857cc275c403ad32
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:04:02 2015 -0400

    icedtea7-native compile failure undefined reference to `main'
    
    On hosts without /usr/include/X11/extensions, icedtea7-native compile
    results in a build failure while trying to create an object file:
    
    +/data/home/.../git/csu/../sysdeps/x86_64/start.S:118: undefined reference to `main'
    [2015-03-31 15:22:53.115930161+00:00] | collect2: error: ld returned 1 exit status
    
    The compile line shows: (-c gets eaten)
      ... -I -c -o
    
    The makefile tries to do the following which results in a faulty build
    line if /usr/include/X11/extensions doesn't exist:
    
      CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
                         $(wildcard /usr/include/X11/extensions))
    
    This looks like a missed line from the following patch which removes
    the need for X11/extensions:
    
      icedtea-ecj-disable-compilation.patch
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 278c9b5530a22bb3646cbe5883b9ae857da70dff
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:55:00 2015 -0400

    openjdk: postinst cleanup
    
    Some of the postinst rules results in a build error because "ERR" is in
    the first line.
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit dd000cb1b4e0a9d4871d6ecae7af18674b01f6e3
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:53:06 2015 -0400

    openjdk: add keytool link
    
    Add alternative link keytool
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 9cc46ee141db5f4931a68ffd458020927cbb2901
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:14:16 2015 -0400

    openjdk-7: added java tools to the jdk package
    
    The jdk package was missing tools like javac and tools.jar.  Adding
    jvm to the packaging pulls in the tool set.
    
    Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 6f3a8e88a491a4f47a00c841d1b492f3402999ae
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 13:56:46 2015 -0400

    Missing inheritance and dependencies in some java packages
    
    icedtea7-native, openjdk-7, and jamvm-native requires pkg-config to
    configure without running into an error similar to
    
    7554: syntax error near unexpected token `NSS,'
    7554: `PKG_CHECK_MODULES(NSS, nss, NSS_FOUND=yes, NSS_FOUND=no)'
    
    classpath-native and jamvm-native both needs to depend on
    java-initial-native
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit ada652564f09756a81f54495cbc2091125239625
Author: Amy Fong <amy.fong@windriver.com>
Date:   Wed Jul 15 15:57:00 2015 -0400

    base-files: Define JAVA_HOME by default
    
    In the default /etc/profile, search for and define JAVA_HOME
    in the environment variables.
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit a754bae09713199e40ec6bf145383a9a66c5360b
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:25:00 2015 -0400

    jamvm.inc: jamvm recipe cleanup
    
    jamvm.inc's SRC_URI isn't used anymore, all jamvm bb recipes have been
    defining their own.
    
    In a rare instance, a build failed because it was using the SRC_URI
    defined from jamvm.inc instead (jamvm_git.bb), this cleanup should
    prevent this oddity from occuring.
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 218db90441fff1fdb2e95a162fb3e7a483dd4efc
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:22:59 2015 -0400

    openjdk: autools not to override B var
    
    ${B} is set before autotools and thus is overrided
    by autotools.  Some of the patches within icedtea are
    expected to be patched against ${S}/build (during
    do_configure() phase).  As autotools to change B
    = "${WORKDIR}/build", so this causes some patches failed
    to apply and hence breaks do_configure() with the following
    errors:
    
    | patching file openjdk/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
    | can't find file to patch at input line 13
    | Perhaps you used the wrong -p or --strip option?
    | The text leading up to this was:
    | --------------------------
    | |---
    | | build/openjdk/corba/make/common/shared/Defs-utils.gmk       |    6 +++---
    | | build/openjdk/jdk/make/common/Demo.gmk                      |    2 +-
    | | build/openjdk/jdk/make/common/Release.gmk                   |    2 +-
    | | build/openjdk/jdk/make/common/internal/ImportComponents.gmk |    4 ++--
    | | build/openjdk/jdk/make/common/shared/Defs-utils.gmk         |    6 +++---
    | | build/openjdk/jdk/make/common/shared/Sanity.gmk             |    2 +-
    | | build/openjdk/jdk/make/java/redist/Makefile                 |    4 ++--
    | | 7 files changed, 13 insertions(+), 13 deletions(-)
    | |
    | |--- a/build/openjdk/corba/make/common/shared/Defs-utils.gmk
    | |+++ b/build/openjdk/corba/make/common/shared/Defs-utils.gmk
    | --------------------------
    | File to patch:
    | Skip this patch? [y]
    | File to patch:
    | Skip this patch? [y]
    | Skipping patch.
    
    Signed-off-by: Vu Tran <vu.tran@windriver.com>
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit c64369872559ba6604429070a72003719f54098f
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 14:16:32 2015 -0400

    inetlib: fix inetlib dependency during compilation
    
    Fix a dependency issue when building many parallel threads for
    inetlib.  The build failure looks like:
    1. ERROR in source/gnu/inet/util/SaslCallbackHandler.java (at line 43)
            import javax.security.auth.callback.Callback;
                   ^^^^^^^^^^^^^^
    The issue is due to the jar linking before all the objects are
    complete.
    
    Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit 24092dc5e6680602d8a4b66bd9046f345bf58b3a
Author: Amy Fong <amy.fong@windriver.com>
Date:   Thu Apr 16 13:52:36 2015 -0400

    java.bbclass: java missing classes during compile
    
    oe_makeclasspath is used to define the classpath argument passed to
    javac for a number of packages. The current behaviour takes a number
    args specifying jar files to look for and if the files exist, it adds
    it to a specified variable.
    
    On some builds, oe_makeclasspath cannot find the jar file.
    
    oe_makeclasspath used an invalid test to see the package is native.
    (testing if the build arch and package arch are the same, if so, native)
    We test to see if PN matches *-native or *-nativesdk instead.
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit dfb21b449dd652b99bc4725796d143e8c9779cd6
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Thu Dec 17 18:40:50 2015 -0800

    openjdk-8-native: fix improper do_install and PROVIDES
    
    We had:
    virtual/jar-native provided by fastjar-native
    virtual/java-native provided by cacao-native and jamvm-native
    virtual/javac-native provided by ecj-bootstrap-native
    
    Then openjdk-8-native added and also provides:
    virtual/java-native and virtual/javac-native
    (it also installs ${STAGING_BINDIR_NATIVE}/jar but
    doesn't add virtual/jar-native in the PROVIDES)
    
    which introduces circular dependencies,
    java-bootstrap-components.bbclass is to avoid the
    circular dependencies but it's not a correct way
    since it make two conflicted packages build into
    the same sysroot:
    
    DEPENDS_prepend_class-native = " ecj-bootstrap-native "
    DEPENDS_prepend_class-target = " virtual/javac-native "
    
    virtual/javac-native is provided by openjdk-8-native,
    and it assumed that ecj-bootstrap-native, fastjar-native and
    cacao-native/jamvm-native are always built before openjdk-8-native,
    then in the do_install of penjdk-8-native, it removes them from
    staging dirs first, then install (create symlinks for) these files
    in staging dirs directly, which results with empty sstate and
    builds from sstate cache or builds not in this assumption
    will fail.
    
    The fixes here includes:
    - Revert "meta-java: rely on well known bootstrap-path" in
      previous commit to remove the improper
      java-bootstrap-components.bbclass
    
    - Do not let openjdk-8-native provides jar, java and javac,
      just like what we do in icedtea7-native, which can provides
      but not to avoid circular dependencies and conflicts.
    
    - make cacao-native back to provide virtual/java-native,
      and ecj-bootstrap-native back to provide virtual/javac-native
    
    - Add back provider settings in README.
    
    - Remove the update-alternatives in openjdk-8-native,
      it doesn't work for native package.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

commit ec7b984fbd0662b7aa1707f229ab09c555bb2cf6
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Tue Dec 22 22:26:16 2015 -0800

    Revert "meta-java: rely on well known bootstrap-path"
    
    This reverts commit 04d5d0bf414c05ca59618d77f17ff9898aa1c566.
    
    Detail reason is in the following commit.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

