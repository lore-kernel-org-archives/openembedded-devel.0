Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYFLk-0001hb-Oj
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 09:58:43 +0100
Received: by yxe5 with SMTP id 5so792729yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=OJcRsvJD4gVALGQIW4YOYoNecSnGXVXGbr593Q4F7gs=;
	b=IYOg5NZdZ00Oeusf4i6s1nJP9i7Kczmu8KwYelSnW4Ys31ACe4YGBX1RfDgzghqs3T
	/bb1kjktP3ngl1X8LzCb9rsViLHJ498yKc1ppRp28s+rouviHUzsXhjuMkR4hWvitLHu
	e7NUaBCgtf4RQl1GzhG1UOGCzx8BNHOi7N7/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IsPPfyeVO56V6p9TonF6C1BUL8ZuO3SctXaHNKPm8qK7x05KCzmnWEA8U1oQ8+A/7z
	fvYm+nBp1HMrxZaKVOId1f2jQePLrdHZlO9+NbdFFoz0blj8ubKVOcoF4bWFk3Z0pZra
	WYN637alTH58BZFTYXRC/cNnmFtjQMc9UDi2U=
Received: by 10.101.141.33 with SMTP id t33mr3362980ann.218.1264150582754;
	Fri, 22 Jan 2010 00:56:22 -0800 (PST)
Received: from localhost ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm731194ywh.30.2010.01.22.00.56.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 00:56:22 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 16:55:56 +0800
Message-Id: <1264150556-8147-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix a bug of COMPATIBLE_HOST defination in linux-sun4cdm_*.bb
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
X-List-Received-Date: Fri, 22 Jan 2010 08:58:44 -0000

* Correct the defination of COMPATIBLE_HOST in linux-sun4cdm_2.4.26.bb and linux-sun4cdm_2.6.8.1.bb, the previous defination causes linux-sun4cdm never been selected.
---
 recipes/linux/linux-sun4cdm_2.4.26.bb  |    2 +-
 recipes/linux/linux-sun4cdm_2.6.8.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-sun4cdm_2.4.26.bb b/recipes/linux/linux-sun4cdm_2.4.26.bb
index 52b3ecb..78a64d7 100644
--- a/recipes/linux/linux-sun4cdm_2.4.26.bb
+++ b/recipes/linux/linux-sun4cdm_2.4.26.bb
@@ -10,7 +10,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.4/linux-${PV}.tar.bz2 \
            file://defconfig"
 S = "${WORKDIR}/linux-${PV}"
 
-COMPATIBLE_HOST = 'sparc-linux'
+COMPATIBLE_HOST = 'sparc.*-linux'
 
 inherit kernel
 
diff --git a/recipes/linux/linux-sun4cdm_2.6.8.1.bb b/recipes/linux/linux-sun4cdm_2.6.8.1.bb
index 4058390..7b097a1 100644
--- a/recipes/linux/linux-sun4cdm_2.6.8.1.bb
+++ b/recipes/linux/linux-sun4cdm_2.6.8.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
            file://sun4c_defconfig"
 S = "${WORKDIR}/linux-${PV}"
 
-COMPATIBLE_HOST = 'sparc-linux'
+COMPATIBLE_HOST = 'sparc.*-linux'
 
 inherit kernel
 
-- 
1.5.4.3



