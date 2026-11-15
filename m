Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3861.1794729008297983501
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eaBVrU61;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3150659eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729008; x=1795333808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMUCdDba5s6dke2ov0QJ8JeEobFAI+jeiKph2R7S5co=;
        b=eaBVrU61lqdC33r/kP00i2S9e24CbpL2nFKlHGo5dednDzamr1a1REOMdB+85XyjBJ
         cfxwNbPKrnKOsPSaxe1YJp2b4HrEKxL6AE6tdmv2e607aViyWweRWokf3KCH9X7btByz
         6qrrWF9sI9cku0+8mrTlWljX4CITN6TaSVyEvwuox54USKKF1cfusVICsY6ksSocqoh0
         haie3Zrji8935HhwDBF9GIpJPOxdJF/3kRBD+DsqONxqrRT86nNGgVY+JlDwxMITbU+Q
         w9Otnyt+2CdnH58fXfqkXDtFE9HHwcJJ4nJMGbt/ES/JPAG24B3qS7mmKRs/gFnxWq3Z
         IPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729008; x=1795333808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMUCdDba5s6dke2ov0QJ8JeEobFAI+jeiKph2R7S5co=;
        b=WxWC83NFB9Jh9Azx7VMGMHzwHvvhZPRdYwAQu/SIDsx4kSr/puNWwqB0bQcY8ck6N3
         dxX5255aE67+umAgSrxS3IR5urQa3MePMJ/HCp+w/nYJLW94QFwTmIhPvvpA2tUmOXqk
         qLkJCGeeb9O1jL2vYU65jbZ8FYOG0/E24bgw/M/K66NdezHIE7Dv5sTrrZkTJ57U7KC+
         cG1umwXudmL+DKW3/AYItDu40pM9eZY0ZObLOt1fSLLikPAt/e39nZvxLmE1TJk7CaQy
         cNQMGFrz3c6aJuDXmanKl7VhLk8xTxdwQNG0V4OrCZ9LIKo/JoWzj7Pczxm1KmZRzE0k
         b+wg==
X-Gm-Message-State: APuU4Z+cuuV/CwNJ8jmed8UQyFOK5eSgv8hWVKOG/9se6Q83jFmPIzOX
	UkmsVY1ChEYOmLxhAEs4PKDYqiheUTXKf5/LX+zUWy+4CaMt7qhh88pBm92eSoR+
X-Gm-Gg: AYBFou36BvNP6uaHrKvFk0bAYFSFMIMFpaj92kJqNZtOZU/I1UNTC0BsK1o+sKlW23M
	B2/XUN2GE5kiHE/l/LNNAb+KWbS5aLmFsB7kK1skBjHJswv9FKO12/V47Fza16y+wI3LucENYmc
	gDUPFovvJlkt83mC+5Ctib27mw3bXhYPnkDlY6tFYiXTPKE2PhwH1fvrmy++3v8oUEiuMkv3/bn
	wtCGWZkt5nuD2IBLjnWKtQAKKQeXASqJCF8h9eCeW2qYmdkOCqSNaqFPk7QYZTLE0HVJnGLXdq2
	p8Rtwsi8+I2N+DwBE9bJdzmEubwzz0rA5MVI5xkpjNh7TTyfYIsh940+YzNsSkdEhocWFYPG6EQ
	snubpTT9kfF2/l5IIUeYiRAaHgtnv08pdurIbG/qLot+PLH5CDCuqXzDHu3wf1stSbtYbHRKEA+
	pXzG7AAvjhv9iEudxe9U4wjeik4nWu9Kdz2AGTwr81EPLu3DEiEu4jYDmd/I8EojZTonNMt9NzT
	a4F7s975YUCSAY4ceO/D5l/oDEfOKtj80mF9nALoVV+I6nCVWsl4uGkkDpLMGGnOC/uKKBFjU16
	2bRo1klQLzJmSv/vDdp1+TS0Unhwm1UOhezPUjIPiUNVdB5ObvXLle63Kb5dEB51qjmQF+yQ3yW
	SGD8WJ32JaymelwSBKMVOrItKEbzaFXcq9Vb4DdLaWzWHOWfEM6yvY9r03Dkc4s0/HdXM+swqrN
	EwzaP9gfskY4khBbE4klYCThHZIcR7dxrok/nWPFPhDFxtlby/gvaSEc9vuShw8gh9bRKKQAKta
	yX527js5jZIuOVo6Oi+0FEKQbQZ+p7ErBBF8YXfMQ9FW3k8TfKjqwcbPLL7Mw+NtpsZJKYLSNtg
	hPvqCQ==
X-Received: by 2002:a05:7300:72cc:b0:376:98e7:eeae with SMTP id 5a478bee46e88-37965da98bamr10742516eec.6.1794729007543;
        Sat, 14 Nov 2026 23:50:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/96] libtatsu: upgrade 1.1.0 -> 1.1.1
Date: Sat, 14 Nov 2026 23:48:07 -0800
Message-ID: <20261115074918.2932593-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132299
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libimobiledevice/{libtatsu_1.1.0.bb => libtatsu_1.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice/{libtatsu_1.1.0.bb => libtatsu_1.1.1.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.1.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb
rename to meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.1.bb
index 9139c8be0e..5eff8c8693 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.0.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libtatsu_1.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 SRC_URI = "https://github.com/libimobiledevice/libtatsu/releases/download/${PV}/libtatsu-${PV}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://github.com/libimobiledevice/libtatsu/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-SRC_URI[sha256sum] = "96c8abd97552a4a0c487c701aba9a65d590c338dd331058ffb38304290b696c7"
+SRC_URI[sha256sum] = "18f471f131c1d55ccc02fa09565d870030c6ce92f737b89fe1b3849941ebb303"
 
 DEPENDS = "curl libplist"
 
