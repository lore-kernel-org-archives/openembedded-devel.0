Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B30EC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:55:57 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16048.1788969348537160267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EsnO0Lkl;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so777365f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788969347; x=1789574147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArOelljF42uDMGdHZdWbWXArOYx1Wdllx224Q3HdcGA=;
        b=EsnO0LklYOhQMxQcAIdT11lZuDffqV3yi6wmIfoQx5DR87Tq9s3tAdKMzdf3WKZyvi
         qTtROPPHZOmKExzUqG/QTb3hX08XPk/PMcY+PlGdH4GIDWrA4ltzZWr6UlHbtjV4EVo7
         DlXKDxu4S4QFaJ9DW0T/NdBde5s4zqN1eWnv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969347; x=1789574147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArOelljF42uDMGdHZdWbWXArOYx1Wdllx224Q3HdcGA=;
        b=FGTPrJ+S56yoHyZB0hP+py35HGeYPObnWjCuygdZXe9iVYr6/0hXBpt+crGEX3gHt/
         6mMJYCSjAOL2uItj9iKi5gBMtN38M/UhS7vW7DjK//+kfYUYqaE0zEjuz/2q+0PtKelb
         pX8MMGoAzBRHPq4wteCc1dlYuVNzcnNiKqqtfvAG+8imgBuhmMIoDBIy9Ts9/ahxzrOh
         +s5QurG5qqSmh297o1cAE+TlVSM5vfa5oBciPgP+6VsCSb+VJbg/0q0A88JciIPetW5V
         61VRRJVtZkULXx8WvxIf8YHPV1R+vx59sFGcuWbLF4ZSTLQsgfYGVtXhq+AHRKBJmh8i
         wJbQ==
X-Gm-Message-State: AFuF++mGq675meWMl/S8je8y2/0fAhxCwFRIAjYKNBMJuSQcEnJTfFWz
	zsys4WGoGEzPi5KXWZveMrtFm+sugPo88Q6MT2R96Kx1c8q+j/tkN1vx+JGSsuDiBQLdXLePfBU
	cWk9S
X-Gm-Gg: AYBFou06M4/Wjz8W/Y78uOzOV7ky2P3A4YWcBmun0X/bLQeBaH0CJqYctw95yCZnzhi
	XJzq3v6GYioN8ja6fdvna1C0HpW5lS8o/I5cddD/wwIDLP14PgMMo/fvl++Yp2AlpQvX0xQmOVq
	RRCvXvyh+k8KDagddpD13fVRvT+23yP1DQYA1wStYTZ+d69D9sHv+hW0uoAw0zR0AaxCYDn0bea
	HpWZZGvTHBfL/ckHxggUREG9HTH2wMMx5Z/D7xzMzGdvFPKstP4r4LHptNQx+M3DMuStgPlBvvS
	Tp1z4NVsuL/Ee0hCoU6Ego2WmmCkMwz0XAktamGFGihMu58Go7CuTYSLqAtZFtSapfg8fQTMIqb
	vRIJbt5WPxRRb7yLjzPSKn9N6Fwjcbh0hqHqHpEI0ZwvAZRSz7/z81BrYHf30xDOwfHjUIZYhIi
	YBLNq1h+9EgGBw01oJN6pK4iEHzA+KMIL5Fty/CVmINRJ9VRTG7XB+swFiC37qJ8smxsR+Q4Fqk
	P6mx7W7LINAnnvY2cFDHPcBHxYK1KTO3zz4pQVKwO4TUllfJid3EMh7+qsiGHUrJlU/v5fKUf6N
	pSaDBWCLQBE5VYc4bSoiwngw
X-Received: by 2002:a05:6000:4b0c:b0:482:dac8:cd0d with SMTP id ffacd0b85a97d-485aaddef7amr14089107f8f.21.1788969346541;
        Wed, 09 Sep 2026 08:55:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm39511740f8f.2.2026.09.09.08.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:55:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] 7zip: Upgrade 26.02 -> 26.03
Date: Wed,  9 Sep 2026 18:55:42 +0300
Message-ID: <20260909155543.2469658-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 15:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129889

Upgrade to release 26.03:

- Improved support for Joliet ISO images and Compound archives.
- Some bugs and vulnerabilities were fixed.
- CVE-2026-58052 : 7-Zip failed to preserve the Mark-of-the-Web
  when extracting a crafted archive.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.02.bb => 7zip_26.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.02.bb => 7zip_26.03.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.02.bb b/meta-oe/recipes-extended/7zip/7zip_26.03.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.02.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.03.bb
index 1e29ad5d9c..ca50aed8ea 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.02.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.03.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "f9d78aff31a5f2521ae7ddbdc97c4a8855808959"
+SRCREV = "0766b733fe3e06dd2a7f9a3cfbf2108ac73abd17"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
-- 
2.47.3


