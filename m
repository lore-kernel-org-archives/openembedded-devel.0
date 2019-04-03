Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id DEFF060017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:06:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id t4so14471672ljc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XrWja4/l4ZL/Y4244Mh2V8nyWTYSrVDHBW/3wkXADjQ=;
	b=Bf1dxTduOSbvGHyLlmTlgLIj4aE/E+yUO5STlvv71/KGl7AXNUSc1xzbHNPvtoeLkK
	Tlf7tU9cONCp1o8GeAAqo8x+bjirDWJkNZOCfF2AGaewAoY9NNPI6If3x75fZ9EvocQm
	1tXyjFFrNMqFDQpAXKCBodQRaP5e2GVSLtubqT0JYfJVM/KFelwMlkx6SRrqCo2VZtTH
	KllW269yI40JX2C6eMzoOd8/cwvPRVdPvs4yI9i7U5jFK+9JE40xY9VYaxJjLA2qZfSo
	P+lEIYuG83J7PJ0W8KYfiC086jpVGfz6y3GFJjIKqMcgEPWWjkjpk9c9cWKxPu6fKmfr
	bHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XrWja4/l4ZL/Y4244Mh2V8nyWTYSrVDHBW/3wkXADjQ=;
	b=oXk0cGfn0N7amtv0u+lKVFBI4sxsIDZmkMYwDqar514FdV5CKeiWCB+kPutWxitdGY
	9oMM9GNwxZIyM8yqxabwHp8HyWl6ykHurTV3iGqQ/ovMF214FXzKQnljrGT7r3qjatUA
	P33A7kyQk7kfka4rcn0vf4jmmj3sBpl+ihmugaJnaeO4CBfp6NkACO5HxIagkSa8Kf7L
	ZtGelXg76mT30Vr2dScNCF2pzA7FFCZTphZZLoIkaoqNkb5cuHT9aLQHvQRvTywW3QAf
	OG0YvlUdPt1qqxwaWw07vdEzerSWqnFso1jJ0+BwtlvA4mbDiS9ng06WDJ9xU80nBYjp
	A+yQ==
X-Gm-Message-State: APjAAAUxgavJWQBWuUBX2Ad2Mm1EPXML4z1+S5ZTV4tQNRSo9OkgMuu1
	D8IkJob6K/YiFQa2DFT38JmpyvZc9T8=
X-Google-Smtp-Source: APXvYqxfMvLKXRXnKkDgkwtzC20DANrapPOW7lpHvHU2uAjVhWEChQX5jeSKp3t1ceOBf9f8ZHzxqQ==
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr26185308ljq.56.1554289602253; 
	Wed, 03 Apr 2019 04:06:42 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	i24sm3218417ljb.31.2019.04.03.04.06.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 04:06:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 13:06:37 +0200
Message-Id: <20190403110637.48836-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe] can-isotp: bump to latest git revision
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
X-List-Received-Date: Wed, 03 Apr 2019 11:06:43 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 6ce3cab11..2cf2307b1 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,9 +1,9 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "6003f9997587e6a563cebf1f246bcd0eb6deff3d"
 PV = "1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"
+SRCREV = "78084ded1916da4d41a6a2f2bb61fad3d74b7cce"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


