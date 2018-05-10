Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED1375289
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:23 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p5-v6so2557447wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Grfdu93827xqvgnI77RQIZ+ZF1dqaWkVgatkjcAwPRQ=;
	b=sTUscmR4fOuDETgnULR2Bt7hzrHEdXqHRSTik6Tq5V/hjIpE/oKFGsdIfaIRFLDQAA
	5R59UFZlUDQgKLzlj+4BSlr2m0h9GOo2AfTIIFVLsujRmrCUqKldXxXHI3pkUYU1SI4w
	si5abIXZr/3lKd4Hgkpy1oayWf1oMZY6BQhKNmJogpfUwCqq96HlmzytAecDC5DUV4bm
	U+V5DCUoNoqSM5L2lkdKCpBQrM2S9R2/HpQI4B2a6i9TeEk7s7L+2wCnugIUAc54lytI
	elEld28YAscnDDYOkBwFo5TK36eWZWolGw1vkSr5sjTPVyoCIJ1RilgoC9KLDpymN29l
	4ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Grfdu93827xqvgnI77RQIZ+ZF1dqaWkVgatkjcAwPRQ=;
	b=Q4ONA5/NGoTtLDi1KPmQSyVM1DlJPjDeOtPEwTTMshrnGTuRpfYqKl8kWR64fAo3y2
	3ruPRva9T6W/0o2786kV5OwHCwPlVgJOIxECnq0iVpwut/H7ds0iHfDr6fEXQ0Tq2KKv
	7I8DwhZiv+6UTL1Z2MXr10NCRLZ8AgEuY7O64E6gN1i/eCTdvgkpSiJVBlE+rX8xTKnQ
	CtWfe6WWDkehO6QQ/ThNeoCMZsSub9NovfZVzXbjkGXlEhF1w6aayRrdOLSaS8VyDIkK
	GitrlHPzTaDBYe9LDP8A0/GD92975ziDEwjiqC+q3dX1+xgRhNquVUZv6rFTxR8zhYPK
	8t7w==
X-Gm-Message-State: ALKqPwer7U8+CvWtKWcoNKzguWGvPSHQBYSxMiofiZ2apHAuZujeX8FF
	jRSkH53z53viZDErnY4zRe/adQ==
X-Google-Smtp-Source: AB8JxZrOvgOAy3ypSVtwusoEZkC0YC3mkiBYPON/c9Lpw2Lc8QlUmB7kUc3mHRYIt+erMz1z65hsew==
X-Received: by 2002:adf:8407:: with SMTP id 7-v6mr1984843wrf.176.1525968864383;
	Thu, 10 May 2018 09:14:24 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:09 +0200
Message-Id: <20180510161415.12827-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] xfce4-embed-plugin/DEPENDS: replace deprecated xproto by xorgproto
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
X-List-Received-Date: Thu, 10 May 2018 16:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
index 32d6edfb4..cab3ea754 100644
--- a/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
+++ b/meta-xfce/recipes-panel-plugins/embed/xfce4-embed-plugin_1.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-# DEPENDS += "xfconf xproto libxtst"
+# DEPENDS += "xfconf xorgproto libxtst"
 
 SRC_URI[md5sum] = "c5b86cbc1c54ee7c1d2e95a4502fed8e"
 SRC_URI[sha256sum] = "35d4c6c56dd6468c0e5afe66f657c1526f2d830a577105a51da43657651832e3"
-- 
2.14.3


