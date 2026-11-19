Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1925.1795113522042364033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U99dR0oW;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so86659b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113521; x=1795718321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDBSwJBFWmOwVGT8x20+Gu3+IQamlbGQilOuTcWP1hY=;
        b=U99dR0oWN12Vg5TWbVKzxkfXRBpIZ8ozh7UfBNq6ui81xWhrgDlM8qz8KtEyEoLv4P
         7KgZ52qUyXAx3fzDqSe87mziuEWjW1YTjj3PUr5Dmtawwib6DxH2yN5WNvR0RBRWJemV
         DrD6yRkuIVvzy/Y0mPlEuEmXr1f114F0dvEh9cYOl0VEUp++SMJw4lwz4y9KpOLfdlwH
         nau0yFaFIp2bAWhEfmx08A/lXDuvFbRtAIHzU4byoQtKdpOeGWBDZ4wJarIuDx/UQkyT
         KlB5zKyviTGkg77HtQ7sSwhWrtgoSmWECaDPzYSnQ4nQSPqWbIuU3XYZJ7LcWseot4WP
         wtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113521; x=1795718321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDBSwJBFWmOwVGT8x20+Gu3+IQamlbGQilOuTcWP1hY=;
        b=DVJBdUf5fyBmupeg1t70/Cm5VBuQ4pPLbsGbI9VNT5CmzmU7vja0DFOulCfrsCVIyo
         cOPKNoRi5+cRZAAK/nBkw3EGT0tLBVrO/yI1dA4Ne4UDPcbuD08r3bjEXJQykCnjc6jw
         7ClKKaZapZX1ThNNTBP9nEh8ivWKgPlzLKwPAMkw0ap/RXJyKMpMX9d7j7J6+k/ARXaT
         r00UEqqE+cNJ72YZn7QOo4JvwnQNHWaIheH/rYtawdblN1cV/qmP9f6DYCqHqmG2cUYK
         JKryD920HJj3yGToGhWmVNvQCoX0aEaOYvclIAnUSuAsUtKck7Yk2kaAYFPrNWDQoLX2
         b89A==
X-Gm-Message-State: APuU4Z/42h9kes6Sd7UA1tb/PwxdcxJGNduI2lPaMx6yCqYtycwwy+sk
	GuTkozoIbJ394rMshttN4+4dzSabA1+ewdhqYmQMo5+ExFR8J9SpQ5eJtWY0jw==
X-Gm-Gg: AYBFou2CHIfR5rZguvKhWqs9k6KpiGEw0gcQRkOJLWoEzkNqTA7tJD8AHtUiOSV9paz
	V5VGUNle4qbhoKSbzXhidwEeRik5OzJMJffAzSlWf0M0yoFixD3o0a8n+l77GaBSlUsI2borIc9
	M2FGndIqDAzYLkyZ/0nBYlU9azAQNxgqScHAV/Q6WNSOh01rhtl1mh9ylGBNEYHy+FtVGwNP512
	nb4hRRMGs7nPLdyFHuWKx3+ze5nGrntYDJapJc137X2dhmbPET10OsNb4aBHZWWkOXwx0gRaEWs
	neMgPDEmaBSuqv5k3liAG5mrUmVcLdHtZIg+3KCbTy6bGXxuSBo8uwZ13X9qgMvgyRgWJ1LLkV4
	3aL56c0GuxxYrU+J7FPHmU0+9rYM93xYmky7YSPX6+iAlQ5z57Fod1UMpIfBPfzv9Qy2+blBmo8
	a4ATbYuQ7MrJazDEHv5MK3dOyxoHWNUPObrl7RV7tV6M4lkl6NG/zED4XBoqjw6e9gU0GoVvlGD
	lLZooNCKbLQEROI/Vc+3BOvqCwS/NGHcXSvSMZgtQU3DacKo+t1hDbQMZz0O9jkBZjIwx+5QDxW
	njEzOkEgVBCxNkIPlY60kn6ZD08d70OH3Oqlq4FqXkLV5kRjsj3ZbJDzpUsQJw7tcz7nYjmFiEJ
	o7EVx1Pk=
X-Received: by 2002:a05:6a00:4fcc:b0:89a:8a44:5db5 with SMTP id d2e1a72fcca58-8c87cb4bbc5mr488774b3a.44.1795113521450;
        Thu, 19 Nov 2026 10:38:41 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 64/64] libplacebo: update SRC_URI branch
Date: Fri, 20 Nov 2026 07:33:32 +1300
Message-ID: <a0413b03fe80a66a454e5364768d36cd1fdbeb7e.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132754
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
index 94767730a8..6c6c640da7 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
-SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=release;tag=v${PV}"
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.360;tag=v${PV}"
 SRCREV = "cee9b076f2c63104ccfd497fa79c39a867293ec4"
 
 inherit meson pkgconfig
