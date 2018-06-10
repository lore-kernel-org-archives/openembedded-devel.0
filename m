Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAE078BCC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 01:23:58 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 69-v6so10099621wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2018 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+7MC+Xqenn+fCef/8nBWKBxPfnhwGbSovhZ50Rj8nTI=;
	b=yOCfZyOKnC+ziKRavIOfWo99/8zvj6DDUXtyS2YL4Q8+6HD73b7ozJnDT0r8Gnq0jR
	O39voGypseBEBl0MSXLlD2u8PQVNrvqjTmW0OeqCIk2FrujhR26UtuQ8p0MTkdnHb6Qx
	Lp4tELA/MPP5G3eFWTmO67Alc42Kdc15sX166ufM7uGhiDUPCVMRn68mbZMVihuIE5Vt
	adMaAfi4WMwbTMZWIGZS2/mC4LGCqTqL7ocPl/osYumOYXU08HL35YoFIKlXKtg6txB4
	1m5xXMm1ElUxlPl9ozolR878+b7H26EE9v6gO7sOZ0oKTqZfiN/SKfsuF2Xvzyxw9gEF
	5lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+7MC+Xqenn+fCef/8nBWKBxPfnhwGbSovhZ50Rj8nTI=;
	b=ZB9mEqW5cL8L+YwEKEh4KXQT4WKLuSCP4z9NicEn7Re8yP8ck4u2ppb8nHzbQzHy2p
	oDYQZ57crOkJe39VHddyP1h1XspFyELTXhjm1/RblRM/cAmyIdVkm0hY9RWAmN5O27bG
	tmO3gZa2ewAfEsZg6D9vdVDRvO1EpFItkhSReyxu1kZMjMlGaY4ZyqPiilC6hu3pRoZN
	zb8Pn+1R7zV83ymRVYR2L+QgIXpgH5YE3rxCkXlTEHKAMabyfutsPCYYPINSS/KHUk/6
	xn5+zYokuHYkVc4E09a75NeTPU2YSoSrED3aqHytDLhLciW2HzA7cwiP51rVOgGLkS7p
	L6eg==
X-Gm-Message-State: APt69E35VHGwXR0ZbTW+g2z9ehr5maqG3qFeWZZoGZK+43/TTILxY3yD
	XHqc/fWZN/xzfEEe7pbrHG7l0AFB
X-Google-Smtp-Source: ADUXVKKSRrukxNeNQetvn57Lcui1zr8vi6liHoQsEj4zo7f7r2wbhaeF3NhniKDpkXdMj2+aMTg4YQ==
X-Received: by 2002:a50:a7a1:: with SMTP id
	i30-v6mr7534584edc.74.1528593838868; 
	Sat, 09 Jun 2018 18:23:58 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:ddc6:6bd0:776b:2bb8])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm19009635edm.13.2018.06.09.18.23.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 18:23:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 03:23:54 +0200
Message-Id: <20180610012354.12172-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] mercurial: upgrade to 4.6.1
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
X-List-Received-Date: Sun, 10 Jun 2018 01:23:58 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb} (79%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
similarity index 79%
rename from meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
index 90524974b..7e0df2e66 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
@@ -10,8 +10,9 @@ RDEPENDS_${PN} = "python python-modules"
 inherit python-dir
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "c1d9fad1b7ed7077b0d4ae82e71154db"
-SRC_URI[sha256sum] = "234af4a67565c85923b0a1910c704ab44bcf12f69b85532687208776563d87de"
+SRC_URI = "https://www.mercurial-scm.org/release/mercurial-4.6.1.tar.gz'."
+SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
+SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.17.1


