Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.729.1794955428872827722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kSkGgH8J;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso3150665e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955427; x=1795560227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx8W+4QLxKfrHZ0K5ZoDGsptvYq2o1POky4p7uRXwf4=;
        b=kSkGgH8JMpSh+CSm+nM5e+hDiWaKvAJXqwLMUAWexR7t4WBfs2EjLplopGTTa4unMT
         FFL26abKmcTk7jp6Gbw9IVENLDuMbtv/a1rdJzjCMuxejnSRUvXJpsZWnvf+qXBdssfk
         u5OKG8ouspC7p/Etwxb9jAit5w24ex5PGzup8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955427; x=1795560227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fx8W+4QLxKfrHZ0K5ZoDGsptvYq2o1POky4p7uRXwf4=;
        b=YMr+3cub+JL4Ghocm+9mvxyu44DJeMYsUEpUdUz+18f5hEpGieacM0suGFVBVK1aop
         PpMsjjpR0khCFcSIM1yMx7AdyaZg4iv85qIpj+q5CbjXH2duezDw896cFDjfQ/InEXf1
         qSnF5TGHTE8211zecgXHLY7vT8wHLmpWwXQrzrQTNDPlBoQSk91+9yHhzp3ZvFBqvnZz
         EfrccqZPEjpCutHRFpdBr9myD79WHHrLHUDgEk9Exuy5ZiC81d86iTwz+1wi3LXewxKo
         18uAmHd9IrGNeXLWmE88z3cv2TcR3oo9ey/XWtWZdRxQxcd08ohBR7SQYC0X5diuCOaN
         UIdw==
X-Gm-Message-State: APuU4Z8ZLYq8tPGBBer9z1GVFBmTNRIYqEYKxGbwxIJs2k4u4o2B8jto
	5qOsZLXpQPkQsuQtqjKSRqwV2EWQALtuucIr7vX1uxar8+rGP3e/fNy0WJstFT+2otdNh8xhxvM
	OLccy
X-Gm-Gg: AYBFou3wRvBlDJyFMlBkm7CC0ypoyJw97tvjKx8oZlKy1xonebPF9XXIrvIw1/ZYmI1
	1fBH84Uw21v8UH0pAZaQNmPF/PreIpL4iDb5AMZzmeHJZ441cra+SsixCHrF37rpu67hDcS5YxT
	lI339b/yZTs35yBib3EyMG3JcxvHfFp5jBvO6g5eqM0N9h1DKu/7nqSszShiovvRhjrjA0cCSKP
	X8h/AUp2gEfEAiwe6dedndD4eSnaRqh4s2uJ06IV0nrqI87Vt6IQES6m5x0nvSvJsLwIovd27Up
	z/N3dWXwrcOLGLMBsTfTNz7nfK7Ea5FUrVqXP/m7Xf8J+EJGhlFbprV79Q91fC6w3p5T8ydcYJZ
	6YXmHl6v0UtX9oSiceW2NTlmOQyr+Jg5Dnftd3PULfleeXyUODwiuSBPNO98WjEF6GS2juMilv2
	0AA92+H7hIGWZ9lmCLbo8nLEIgJQVMr7Gwfe+z6pDa84oq1pvRaRydmH1cdAjZydELwMx7trpYi
	OVBx+XAq7rayWrQCG+64wwRY8KaD6fmzQnKKHa26Kt8zqF0fLX3Gm5HmET7azG/USFjdHIor2ij
	ts1dI9CY7IR7zhyL9ST2TDsc2xi5azNFEkICBYZ8JFEbRE42vaSk5yf4JXXnVZ4BT1ZdAG4f4qI
	jtDcvxyVIthtA0lYVdDtWeSxiHh4OkDGVpWBoGLvSUZ752A+8bsuANSx12/k3AMvzSS+tjhELEo
	8=
X-Received: by 2002:a05:600c:3111:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb7da2bb49mr11237295e9.31.1794955426987;
        Tue, 17 Nov 2026 14:43:46 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 09/11] usb-modeswitch-data: Upgrade 20251207 -> 20261111
Date: Wed, 18 Nov 2026 00:43:35 +0200
Message-ID: <20261117224337.4181772-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132599
Content-Type: text/plain; charset="utf-8"

Upgrade to 20261111 that adds new devices:

- [0bda:1a2b] Realtek Wifi Dongle
- [046d:c26d] Logitech G923 Wheel (Xbox ed.)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eswitch-data_20251207.bb => usb-modeswitch-data_20261111.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20251207.bb => usb-modeswitch-data_20261111.bb} (84%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20261111.bb
similarity index 84%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20261111.bb
index 3bced56f44..5da108b67d 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20261111.bb
@@ -7,7 +7,7 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66"
+SRC_URI[sha256sum] = "221507574da7d11debdba94e40cf164b59fb8b19be1a3ecbec76e348b7a4fa73"
 
 do_install() {
     oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
-- 
2.47.3

