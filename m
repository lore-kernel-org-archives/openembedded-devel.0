Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MwKIA-0002VP-66
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 20:34:17 +0200
Received: by fg-out-1718.google.com with SMTP id e21so357933fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XRwudtIkZY2lOwOxWBaDpZTBiFmmdHfqvCY/mRoKSyI=;
	b=nNkWrXjesGNlpnWZKZobrbGi49eQedlf9uJuXNlurPjmMXbz/zxGfBqV4ioVchsnzk
	/tQ4v0AcEQT/KEIkBXj/BqHFz+fFjF8K0dZO8MmazbiVIFBGROO7iprIiI+LsSDd6y/3
	wkeLbjObeYVXBgQrhCAhixiqMOcqBreCBDJnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=H2ySYhNgNU9umPt/xVEW1w48s68AoorhLgB8Nu7zj5AdnRGVZWAkakHBVqnrscuk7b
	FB//obbLGVzPwbU8+sAS7v/6gxspdfmy/FO5ycilHWzwgntGgY+VX4lVylGbAjFjMkJO
	peq+KQUwtzNmppoXgObQf3sphXHQSt+5JAnYA=
Received: by 10.86.227.27 with SMTP id z27mr2695007fgg.66.1255113204983;
	Fri, 09 Oct 2009 11:33:24 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l19sm141245fgb.12.2009.10.09.11.33.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Oct 2009 11:33:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Oct 2009 11:32:56 -0700
Message-Id: <1255113176-19171-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1255113176-19171-2-git-send-email-raj.khem@gmail.com>
References: <1255113176-19171-1-git-send-email-raj.khem@gmail.com>
	<1255113176-19171-2-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] classes: Use linux-gnuspe instead of non existing linux-spe
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
X-List-Received-Date: Fri, 09 Oct 2009 18:34:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/insane.bbclass                 |    2 +-
 classes/siteinfo.bbclass               |    2 +-
 conf/distro/include/sane-toolchain.inc |    2 +-
 recipes/lsof/lsof_4.78.bb              |    2 +-
 recipes/openssl/openssl.inc            |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 0dacaf8..950bb97 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -77,7 +77,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          True),
                         "armeb" :     (40,     0,    0,          False,         True),
                       },
-            "linux-spe" : {
+            "linux-gnuspe" : {
                         "powerpc":    (20,     0,    0,          False,         True),
                       },
             "linux-uclibcspe" : {
diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index c89014a..5c929df 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -58,7 +58,7 @@ def get_siteinfo_list(d):
                "ppc-linux":               "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
                "ppc64-linux":             "endian-big bit-64 common-linux common-glibc powerpc-common powerpc64-linux",\
 	       "powerpc-linux":           "endian-big bit-32 common-linux common-glibc powerpc-common",\
-	       "powerpc-linux-spe":       "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
+	       "powerpc-linux-gnuspe":       "endian-big bit-32 common-linux common-glibc powerpc-common powerpc-linux",\
                "powerpc-linux-uclibc":    "endian-big bit-32 common-linux common-uclibc powerpc-common",\
                "powerpc-linux-uclibcspe": "endian-big bit-32 common-linux common-uclibc powerpc-common powerpc-linux-uclibc",\
                "sh3-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 561c97a..5c326d7 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -184,7 +184,7 @@ def compute_os_portion_of_target_triplet (d):
 			else:
 				abi_suffix = "gnueabi"
 		elif bparch in ppc_spe_supporting_arches.split():
-			abi_suffix = "spe"
+			abi_suffix = "gnuspe"
 		else:
 			abi_suffix = ""
 	else:
diff --git a/recipes/lsof/lsof_4.78.bb b/recipes/lsof/lsof_4.78.bb
index 243b5da..02852a7 100644
--- a/recipes/lsof/lsof_4.78.bb
+++ b/recipes/lsof/lsof_4.78.bb
@@ -22,7 +22,7 @@ LSOF_OS_linux-uclibc = "linux"
 LSOF_OS_linux-uclibceabi = "linux"
 LSOF_OS_linux-uclibspe = "linux"
 LSOF_OS_linux-gnueabi = "linux"
-LSOF_OS_linux-spe = "linux"
+LSOF_OS_linux-gnuspe = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 8b8e870..00f9782 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -70,7 +70,7 @@ do_configure () {
 	linux-powerpc)
 		target=linux-ppc
 		;;
-	linux-spe-powerpc)
+	linux-gnuspe-powerpc)
 		target=linux-ppc
 		;;
 	linux-supersparc)
-- 
1.6.3.3



