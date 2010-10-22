Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9Bae-00028J-58
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:59:01 +0200
Received: by mail-iw0-f175.google.com with SMTP id 35so593381iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VF6tf3NW4MTtgF3DfnTU8qe9Sgg69gcDvwGj+cl0WI4=;
	b=pVzb0ZTycw5wU9+bXe7KK65vgVMPNEJ6VE1UAjCmuzUETm0eK7xQ7eSsVDWGmXRVqD
	6jX86CXvNCVPWjJjOPjGwrSdSoWSUSOIhoPOgBEE0tXjY6vPPfwuF2ZTK20YLWaFnX4s
	tkGeM9m6bK/bYpTxjzg2aeTOpRcpB4XMqjN1Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ANB8bB9HABBDcKEpjGMOn5sVmwDkAOMCLVJxb98pYA4cvz6HUOILNJskXyDpEwv+5E
	V7aNOvpacFgglVn6XkzQhb7G9Rzh9BBZhitZS+NJidXADeDrLgdoA2rINOihYCHrbvQw
	ZPXDVV5yBLJ9LT2mrvKOm2BOj6ggaeOKuYOm4=
Received: by 10.231.184.71 with SMTP id cj7mr1978495ibb.159.1287730702499;
	Thu, 21 Oct 2010 23:58:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w9sm2787396ibc.7.2010.10.21.23.58.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:58:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 23:58:04 -0700
Message-Id: <1287730684-14143-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] gcc-configure-target.inc: --with-sysroot -> --with-libtool-sysroot rename means we dont need to filter out --with-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 06:59:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc              |    2 +-
 recipes/gcc/gcc-configure-target.inc |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index dd11395..b86b9d8 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 SRCREV = "164562"
 PV = "4.5"
diff --git a/recipes/gcc/gcc-configure-target.inc b/recipes/gcc/gcc-configure-target.inc
index 24b9a16..57852cf 100644
--- a/recipes/gcc/gcc-configure-target.inc
+++ b/recipes/gcc/gcc-configure-target.inc
@@ -5,4 +5,3 @@ EXTRA_OECONF_PATHS = " \
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-build-sysroot=${STAGING_DIR_HOST} \
    "
-CONFIGUREOPTS := "${@oe_filter_out('--with-sysroot', '${CONFIGUREOPTS}', d)}"
-- 
1.7.1



