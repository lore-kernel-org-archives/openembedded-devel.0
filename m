Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzD1J-0007ms-4Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 20:29:17 +0200
Received: by pxi11 with SMTP id 11so923684pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=IGuIbQtij7ZNO13TjAzFqkftgqpnc0unjF4FEbHWd0I=;
	b=AR6YU5lcFRiFNGNUj0X/yiWhJnZpymEANA7f47h7SR9m9mZvyoY5+VuV3STLishHeA
	4Ffr+gP5z1oADYGFUOMX4fK+qsDS9k/mmFa4QqwfOzsT359/H5eCvhF24Lg9a4g/tevR
	VIefhTf6+uJ5KZQAidCwyA6hTV5HjyKvSu9BA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uTpiK4qrVoIL8INOeapH3LYHjovMK+WJoTrfmB4FnyeQ/fJ/OwC6rZq5MY8/5h2ISU
	ImAixCoIiqQG/GETktisn/WrsmcxHz09t+lk/+pgbk/EKUSkDJq/C3oq2oGG5XsRbwPT
	g+mYU4viTMVlDl6FyTXSaurKO7xS96dUf3H7A=
Received: by 10.143.164.8 with SMTP id r8mr3088570wfo.118.1285352947980;
	Fri, 24 Sep 2010 11:29:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d10sm2622515wfe.22.2010.09.24.11.29.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 11:29:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 11:28:59 -0700
Message-Id: <1285352939-23376-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] staging.bbclass: Use sysroot_stage_dir instead of autotools_stage_dir
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
X-List-Received-Date: Fri, 24 Sep 2010 18:29:17 -0000

Some packages like package-stagemanager-native dont use autoools
and autotools_stage_dir can not be found for such recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/staging.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index b871226..303f74c 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -73,7 +73,7 @@ sysroot_stage_dirs() {
 		sysroot_stage_dir $from${sysconfdir} $to${STAGING_DIR_HOST}${sysconfdir}
 		if [ "${prefix}/lib" != "${libdir}" ]; then
 			# python puts its files in here, make sure they are staged as well
-			autotools_stage_dir $from/${prefix}/lib $to${STAGING_DIR_HOST}${prefix}/lib
+			sysroot_stage_dir $from/${prefix}/lib $to${STAGING_DIR_HOST}${prefix}/lib
 		fi
 	fi
 	if [ -d $from${libdir} ]
-- 
1.7.0.4



