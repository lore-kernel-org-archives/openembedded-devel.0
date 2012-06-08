Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrH-0004Oq-0m
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:55 +0200
Received: by mail-ee0-f47.google.com with SMTP id d49so983789eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/+EcStqkyOm69TENXKC0zqxJ7NC4E3PWQr0U26TIqr8=;
	b=lPsB8XVgEbWEk6hr8c3p07IDIlKv91ydkNOUIDpkZRHLU05/3uIMjuk5TSc3KUbMOG
	EDx0Ei6Y+Legu245BCkIyi+1wrXqoRDTZ75VnbIx0IT26gOaxcZX5leI/WE4Glo3poZe
	j/MynjUpDG6djgi08r60Ysq54WZstDhnAddPDqDoT7N3CQZamIM6GcWv2PXia/E+hrtj
	U2flf/c5ByCO9gPYB6cseU7ImJ4gPoKXqbdpk+pOnseWQ8S/ULYwSgebgRKVMaGFMoqK
	lEAcgLGEaWnbrOgUytQK0NhvbkIvl/CWdNhukS+p7d9eWHRloS+5+PKx1octbXShgNkj
	HBNw==
Received: by 10.14.53.65 with SMTP id f41mr3377237eec.179.1339148487410;
	Fri, 08 Jun 2012 02:41:27 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm20276251eeg.0.2012.06.08.02.41.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:35 +0200
Message-Id: <1339148443-9467-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmpo/MNgcSrE7imnR04EYF2+A8rUjFQp7Jviv+k2qru42Gk5VedFb9C+UiggMUtQtyRsnqI
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 06/14] nodejs 0.6.18: fix patch name
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
index d5785d2..7136ffc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://gcc-4.7.patch"
+           file://fix-hardfloat-detection.patch"
 
 SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
 SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
-- 
1.7.10



