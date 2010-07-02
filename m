Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUaBK-0001yI-2j
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:57:04 +0200
Received: by pwi10 with SMTP id 10so1175889pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=PVAZQ96igR2nBfryi1y3tdlRJJFrSRnvT8sn7n0mjC4=;
	b=GBDeHcKj82RNA46IJZ0cUnIMUQayVjHpdzc/KiDczYeUjqc5Kskw91cCShllYBGcoD
	RHdKkduxswEfqfCigiL3kduPV3wzrUjcU4+KwajuelRYxv3MovNGwbyxArmtJDHePcK6
	6CvPp4SCbowFEIy94pLFDkfEY039rBry6m9xU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=caGYRRpiG7q55in1MrP4eN0q/GQQcly+xtgv935WVceW9e4FMTgTjjP1/5/cVmYNnE
	EUUdZWYkcY8HhPHU5qzLs0u0jrMbdnlWJqQz6+MWhXtznEYL+V8x+iVWRC7Gvn96S/VT
	U+R5IYAk3HMHBLS6ilaaHEyDZ2MgSX5Tgejbc=
Received: by 10.142.233.10 with SMTP id f10mr406134wfh.280.1278053534642;
	Thu, 01 Jul 2010 23:52:14 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 21sm424306wfi.5.2010.07.01.23.52.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 23:52:14 -0700 (PDT)
Message-ID: <4C2D8C99.2070508@gmail.com>
Date: Fri, 02 Jul 2010 16:22:09 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tcl_8.5.8.bb: fix build for mips/mipsel.
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
X-List-Received-Date: Fri, 02 Jul 2010 06:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch |   26 ++++++++++++++++++++++++++
 recipes/tcltk/tcl_8.5.8.bb                   |    3 ++-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch

diff --git a/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch b/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch
new file mode 100644
index 0000000..b846d0f
--- /dev/null
+++ b/recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch
@@ -0,0 +1,26 @@
+http://sourceforge.net/tracker/index.php?func=detail&aid=2902010&group_id=10894&atid=110894
+
+--- ../generic/tclStrToD.c.orig
++++ ../generic/tclStrToD.c
+@@ -71,9 +71,10 @@
+ 
+ /*
+  * MIPS floating-point units need special settings in control registers
+- * to use gradual underflow as we expect.
++ * to use gradual underflow as we expect.  This fix is for the MIPSpro
++ * compiler.  
+  */
+-#if defined(__mips)
++#if defined(__sgi) && defined(_COMPILER_VERSION)
+ #include <sys/fpu.h>
+ #endif
+ /*
+@@ -2166,7 +2167,7 @@
+     } bitwhack;
+ #endif
+ 
+-#if defined(__mips)
++#if defined(__sgi) && defined(_COMPILER_VERSION)
+     union fpc_csr mipsCR;
+ 
+     mipsCR.fc_word = get_fpc_csr();
diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
index 2209ca4..9d030b9 100644
--- a/recipes/tcltk/tcl_8.5.8.bb
+++ b/recipes/tcltk/tcl_8.5.8.bb
@@ -3,7 +3,7 @@ LICENSE = "tcl"
 SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
@@ -14,6 +14,7 @@ SRC_URI = "\
   file://tcllibrary.diff;striplevel=2 \
   file://tclpackagepath.diff;striplevel=2 \
   file://tclprivate.diff;striplevel=2 \
+  file://mips-tclstrtod.patch;striplevel=0 \
 "
 
 SRC_URI[md5sum] = "7f123e53b3daaaba2478d3af5a0752e3"
-- 
1.7.1



