Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A331878055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 22:21:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i130so6521437qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jJs/fepl5a95IfSn6cwXpzmt4ENsAtAGhC9b5npO1eA=;
	b=neKSpJ187THs8Zabx0bMcqBkraG2yPNKScA9zXBObgxSrxKVDoFbTVCLA/QXhgJALZ
	b0SlOYv4nctm+IWgRv0I16u9pmxIj9usqLDhoaLEKd5ApxRjyXkV1a0odfxFWSgYDn+2
	gMxV6htgf10vdCDZOkYFZrzq7ovUa10tJpxNTw7vyNMxx0se5XFZsEHEggMShjuxEhW5
	ODpa3Ps3qhXHoHowPtTcCtWHQ75CryC7r717aCUtM/EKEA/EGmSx1irjFVZ6cN/4qLp+
	P/NxvZXIpme0+oI+jk6Z99HPkxsKUTZDj9fqG7Qr1q/SjPY0bPiyXDzonhgl78QLHfjC
	l69w==
X-Gm-Message-State: AKGB3mLAy2YXo0W2TZ0NvD/KEEdJIbAWCM4TmCh+zpyHWnPscr7ZH+/t
	Fnmw7EQXAp+xnN6yqXf0CX3zzx/w
X-Google-Smtp-Source: AGs4zMZ1aJaY7+6QKRwz6IAnxz9B6ZGxHTEN1rz2eTqZ6LR9zuh2IYzXs2+jkZ4/85ZPVxHqSZcW8w==
X-Received: by 10.55.192.19 with SMTP id o19mr608206qki.148.1511994088570;
	Wed, 29 Nov 2017 14:21:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k75sm2066032qkk.19.2017.11.29.14.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 14:21:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 17:21:21 -0500
Message-Id: <1511994081-18517-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 22:21:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 026489a..e79f433 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -11,7 +11,9 @@ SRC_URI[sha256sum] = "fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-threading \
 "
 
-- 
2.7.4


