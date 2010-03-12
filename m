Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nq8qj-0001kt-AQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 18:40:49 +0100
Received: by bwz20 with SMTP id 20so1240723bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=u98Fy1rZPguVc3+JF3TOoQ3LuwAwUS+A+bvr9N/xUAM=;
	b=RKWhgK1ELUloeHfph53dhOy6c180dXIVdi9Twbh+1bOpkIaIqHqIweMWMbLZ+Ks80a
	IyWyH9RKWCbt8lwU67sox4Zf17QFN7lrAzqd2Eq4M0GRtDCsvPUZaJWGVtIelPLwio5C
	Sdn8V8jVliPZVzzIHDpgb0FL8GsXX91SQh1kA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xc2VCAsxjagrOnHpW5+vLRAMg0RW97Ya+VGxhTUMmYYVJR3E543WlVecnBME2rDNWI
	qXoRkyPR0VIxabV5HbI68mUudsAQn5qrGM7/rRmSnAbnNTztaoD1bZLzITM+9WFNmhuq
	xw29VlD5dJOtJaxyH7wFVk+DL2xDRFzjrq9YA=
Received: by 10.204.142.77 with SMTP id p13mr2294710bku.75.1268415456879;
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
Received: from s42.loc (85-127-85-230.dynamic.xdsl-line.inode.at
	[85.127.85.230])
	by mx.google.com with ESMTPS id 16sm948189bwz.5.2010.03.12.09.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Mar 2010 09:37:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nq8wb-00056r-Ik; Fri, 12 Mar 2010 18:46:41 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 18:46:31 +0100
Message-Id: <1268415992-19603-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] sane-toolchain: add PREFERRED_UCLIBC_VERSION
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
X-List-Received-Date: Fri, 12 Mar 2010 17:40:50 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/include/sane-toolchain-uclibc.inc |    7 +++++++
 conf/distro/include/sane-toolchain.inc        |    3 +--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index 3069820..d22cd3c 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -15,6 +15,13 @@ USE_NLS_glib-2.0 = "yes"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
+PREFERRED_VERSION_uclibc                    ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-initial            ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross              ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-sdk          ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-initial      ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
+
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index daa2def..7d561fe 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -13,8 +13,7 @@ PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_VERSION_eglibc             ?= "2.10"
 PREFERRED_VERSION_eglibc-initial     ?= "2.10"
-PREFERRED_VERSION_uclibc            ?= "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial    ?= "0.9.30.1"
+PREFERRED_UCLIBC_VERSION            ?= "0.9.30.1"
 
 # Some systems need a special gcc version
 PREFERRED_GCC_VERSION_486sx          ?= "4.3.2"
-- 
1.7.0



