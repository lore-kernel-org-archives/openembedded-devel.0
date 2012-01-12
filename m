Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlJud-0007ZV-DG
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 13:37:47 +0100
Received: by eaao13 with SMTP id o13so567222eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 04:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rF0AcHY60SmORSocvwjszgRDFIkCNkWcDnYN77h3oLU=;
	b=E5syJ+gQ6DY3e54L88Ts2qRUzOU2Xu8mYTMYM670aCtXTZ3xDo8HIzX+LNYJwNpRha
	xdFTjTS4FyfZB8YsyDvwV0ncDTUoQcns+eG8YxFOxb1eKYbJx2m6dKVSg96ujh/OkLX0
	KSdQkPZD5ZrgCQiToJ1poRyWd6UEsnNq7UWaQ=
Received: by 10.213.4.16 with SMTP id 16mr761991ebp.93.1326371416447;
	Thu, 12 Jan 2012 04:30:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e12sm18969658eea.5.2012.01.12.04.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 04:30:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 13:30:01 +0100
Message-Id: <1326371401-10179-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [meta-oe][PATCH] gpsd: disable xmlto
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 12:37:47 -0000

* xmlto is used if xsltproc test fails
  xstlproc is found in sysroot right, but then it's tested like this:
  sysroots/x86_64-linux/usr/bin/xsltproc --nonet --noout http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl conftest.xml
  and that fails if there isn't right docbook.xsl on host
  /usr/share/sgml/docbook/xsl-stylesheets/manpages/docbook.xsl
* xmlto then fails with:
  xmlto  man './gps.xml'
  | xmlto: /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-2.96-r1/gpsd-2.96/./gps.xml does not validate (status 3)
  | xmlto: Fix document syntax or use --skip-validation option
  | I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
  | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-2.96-r1/gpsd-2.96/./gps.xml:8: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
  |    "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
  |                                                               ^
  | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-2.96-r1/gpsd-2.96/./gps.xml:133: parser error : Entity 'mdash' not defined
  | should default to using for display &mdash; imperial, nautical, or
  |                                            ^
  | I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd
  | warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
  | validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
  | Document /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-2.96-r1/gpsd-2.96/./gps.xml does not validate
* without xstlproc and xmlto it disables man pages building
  configure:18182: WARNING: Neither xsltproc nor xmlto works: I will not build man pages.
  configure:18184: WARNING: To build man pages, install xsltproc/xsltlib or xmlto and run autogen.sh again.
* this can be reverted as soon as there is working xmlto using OE
  provided DTDs in DEPENDS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index 0dc06a1..69b26b3 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -32,6 +32,8 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 do_configure_prepend() {
     # skip first
     sed -i "s#for pylibpath in '/usr/lib'#for pylibpath in #g" ${S}/configure.ac
+    # disable xmlto, in case xsltproc doesn't work xmlto is used and fails 
+    sed -i "s#AC_CHECK_PROG(WITH_XMLTO#AC_CHECK_PROG(WITH_XMLTO_DISABLED_IN_OE#g" ${S}/configure.ac
 }
 
 do_compile_prepend() {
-- 
1.7.8.3



