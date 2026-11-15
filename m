Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3817.1794729011446444229
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vM4OaQnX;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1429597eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729011; x=1795333811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1/KsG+d8ut3rMnbpYRS7c9Zkum8GJq+Uf8DQcOH/bE=;
        b=vM4OaQnXtGkxR5g3JO9yhpmSMp+BZ908srIo1hlsdW/FBOzXMi94tThZiz0RAt617u
         2VAyw5lUodpPjxP4i8f69kfBTAHjDS2yjjlGI4acPjsHE0+I++yYEtyYIPxSZWNJvCbd
         a2XAeoDYHzZGmG3tqbu8TeL98NL7SzLYyqfxNFopZkJccVgs15fVy/KUvnnxkY3SPROo
         HbnNfuMm/UHqio2HcMp2JJEYSSpVQWF4rbQ7N2P5QH6MhB3t1g7U2rFpuBR4F0bwnPNr
         2JNhH8e4hbgWMYeybl6ZGINsfFTQPEvp0KbhpnVcKnKnE2EoXZYPmKK6p9RG6rZpRTTB
         Lbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729011; x=1795333811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1/KsG+d8ut3rMnbpYRS7c9Zkum8GJq+Uf8DQcOH/bE=;
        b=huA3lXbUofu6Ph1ndhz4Vk60+6J5vQCs6SzDFPEZhvRZaY1n3pE0SZqV1JX+cGNPoR
         R9SQ2Jbf+7OjD8k++AxJXoSuHJ12GfPV9dll6nYNuYgfqx6RUVhSX2+fU8zYImt2mtgh
         cg6WLUE19vvcKZeot5jl0Yy8KPkvUdWWNlIVX0EoPYBIVhx2us5vRe5LPMkZe+daazaJ
         zvjjui7GaGk6VzxWxqCKxvy5kYsWVGHC1trTUV/yAdrnv2aGSo3Ht1b7DmjvU72cSFxi
         TV3u+CYqIMnY84YKcLUV7PmcxbfIkbXv1HKvimqm3qIo9MtZHKrvI6Zti6B6bAxH1hgK
         ZaZg==
X-Gm-Message-State: APuU4Z8S1qrsJCV7/6LPSp3nSuChOOYVN2aD3Ra7c9F6yJW9DM0vKr8h
	Fqq8l7drQ6AXiFoX0PPjapB+XH61FgeLx5vAw/6jqKzP8SuLpTjNu6F/nT7Nrg73
X-Gm-Gg: AYBFou0giMgrs+RT0k+x2SzuWM1svLz7+lY1iUH4dPRCdTSYu1vBG/fdp4x7ZCugOPP
	UAnYni7D0rcqC9ux99gjmew8UvbGOos1A+PaXjPZndNOk4GEtgm1JjwZJBXawA8kWNBmDLpMpVE
	CirU+3pghZJ6VbcD35HpzgkPVo770VUMNezKvIKVyXVxm8+LQga4HB5ayQXGclXrACJxILPwBCa
	MXKS4dTHQPFMBgHn+bPKKpm3ENjluxSl6kodE77oQESPeiV6Kb67i7He36ef9+/6iargkrUpx/5
	PpuDiisq51rp60Owxq8u5Ou2CuWCP+12m6dcmQ7mUkZcEhhLFRbQg7THw4JDqNNZqAm4gpd5mQ1
	uuxcn85VotTtSTGOWQ/HVX7mNoIdYACluADFhqImBf+LnF/BkrqVytUf2Bki/IilR3A64DNHT96
	f4DeNHnj4WrooaHbJWEtNrTIvw0bet/Vhdc99ZArJBS30PSiMzu7lTIzZlmCCztgrILIFR+r0s/
	STMGMPSOkW84ssgG88+26kwZ/ABfsjDtgqWjdSwj892f5sR4cDTY5VR8UE4p5RvYjN1B0AldjU0
	Vgzxd3MSxouAHfY6u3/M1HxcxM2cANnc78ymaAwhhFI+3q6eirVTt2/Q87I4iVk3RtZTnG2K/xb
	ViSuEKrX/acI2yBSN8Enu7wSCrB/cWujqUO0d7SUO6OwqzyUFlmNpd3Ro4BNqYaaz3o1lpffMgK
	xlP/hnKnEkbM2qQWriRikuzLwxlkddpoLDZXOQH0qxyh/dMfgSulIsdpjU7wWxUu6e2OH2yBS6D
	dvxA/Io9AsKAvZOgibIb3/i7wmgGfJ86pgLEeLJ7l+iP57ciLYuZmecVODXLSpNMhbY+oxLdtEE
	fHwV
X-Received: by 2002:a05:7301:e0f:b0:36d:a465:b38e with SMTP id 5a478bee46e88-379633768eemr7088174eec.5.1794729010746;
        Sat, 14 Nov 2026 23:50:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 31/96] rtorrent: upgrade 0.16.27 -> 0.16.28
Date: Sat, 14 Nov 2026 23:48:09 -0800
Message-ID: <20261115074918.2932593-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132301
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rtorrent/{rtorrent_0.16.27.bb => rtorrent_0.16.28.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.27.bb => rtorrent_0.16.28.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.28.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.28.bb
index d562173f24..bb94ccdfa2 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.27.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.28.bb
@@ -8,7 +8,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV} \
            "
 
-SRCREV = "cab23f12a4ecf43db046ed813bed3d835416338e"
+SRCREV = "0c23d278a7838402d4cec9689bf71e051332be67"
 
 inherit autotools pkgconfig
 
