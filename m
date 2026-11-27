Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10353.1795753053454532782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mYYvyUd9;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso10731400c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753053; x=1796357853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7hk9doRA5Ky44Nlq7UXQtUnK7s9dfm6SrRRvvtYNNA=;
        b=mYYvyUd9muAcONNa0iNVLne9fNY1dozDNmN7PaDatoejTCO5OJvXuE2DEvU8jEcpc7
         12I+p2p/oIvZo8tAAYFOKvjEF4qA+I//Ku3Jhy+rRyNcVlMjB+zNLCrc/X6czS6AXGBn
         SX+x73dXhKGfjHruhFRfd4PfiY21fjSCZGu3tGtWNtazu0hLF9FCxdWH2Hxuniu70Dcq
         VHIblMauQSqWqAQc32rmVtPT48Alvz5oh+ENUGX29B3GYEyxemy2lUx8HR9VBwmxpW4C
         lnW7VVu9zu4QwRUOC6pC7GSINCY/pWdvzImcqa1XVcU4hBX36PlT/Kq+HlSPWBgldgUT
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753053; x=1796357853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7hk9doRA5Ky44Nlq7UXQtUnK7s9dfm6SrRRvvtYNNA=;
        b=pn3iRSwsTx6OXdiq7qpWuY7B9/LKHRw6nxuBZnW6BQ6mDZpr3Q3loMkJEgFZjKVFso
         Xl1AWO1ulM9vQwGqdf8/RxWI1yVCmST0tEeWTN1HGfPHJVlUlBADmNa7daYTfSDONBmE
         7bZaKIwLKqonLO7xUE0ahmCilBkuyrtXX5v6KH7be/uJNfmiryQFFYIdZfxrMgbcjw90
         AXJgGBaKLxtm1X+68KZfv6Hw5ehjFsZ+ThdQ6J4ektCfYu68ywxaqhR9Uxs2xvu3aEh3
         dMgHfQDr+LpEi9eLjE1/vUPzzL8rJ2iFXGMDpdtzb64FmyQYTmi6pe2rgPC9dMsTfrek
         LYXA==
X-Gm-Message-State: APuU4Z8Ec1pRBKIlqP/LKaX3CBbwwCGWEBUFy3/fP53Uq0fiPO3s6UdU
	5BFhVMrJxtz7vosPuYj/Gfl0yDhOiKZakO1TYX0HjrD02ONfovcR0mQ8Da8tcr21
X-Gm-Gg: AZFdTZdXaePq+GyrcD7hYe1YHAawVsHJNl4Ic+VugWBYFAwT3vgMiTTt0XM2/kTSn0j
	7U13nqmVr2rFjqtpc/lK+Jvyr4RfjlF1Oh1Mj7/14lPr8Rv8CCg8uqRG2/du4IS3c5lXTA46DJN
	B9INCY2h4D4f4lKWr92nJ6qTDhH/cxKoROu7oubRUlZurYFjF7OoF2t2F76f6qUckK4RjrWp1LD
	8y+mzmegdMY26CavTErU9CsMwLL5cdoqy1Qo9rmCupItXYdzoxuTJo9nRKT19C12V/7na960KC0
	W/K3GyDLJFezV6kIu6X8pMHoUlwYscH971UsHlEPW7g7rT5i/PKqyH28I2T8rYUHjPfbabzY9Co
	/6dktsgm0H59raLs3GQK9NgbV8MbYUDAN0SLDe849r4HaRPM+BI2GsRHplLUMphnL6NmVDNGZQG
	4u1dgdFlJh9S/PqE2mn5q2yFDtR68oFr77gG+98MHdB15TVXutxXowArT6IdY0WF13KJheHKjbp
	Ip+fbBWHeZJCf3nqln9yN2+v9GUJsz9qA5GW7q6PJOWjiAdyTe7XWxzn3eQsVtuUpbsN4TWa6RV
	MxOJ3xg0o3pY9gNUEwYqA6JhnEyBG7zIo0dDmjAzvXwGLcN5jqUZ+asMXTNco7JixP5ZIOlvQJF
	ohn3iEk2L/i7d3DxZ3QTmrOATQr9USIgvuXPdsvzQW+vJwPfQXWPJvNjALAsm7K/TCKZdlPzdJB
	YxA0xxMop5G3D26hjI5ZTjcpunAoFFKTGoEr01GHaRKPrT8FljS+TTtr/I1Psu5diOaxComftEr
	t7BHTWe9fdpxGKYd0VEa5ULbLl7kYHlMZgNFiptKwVyODkub86pS9dQErdGPqQha0QM5uRXGhWB
	/y/0
X-Received: by 2002:a05:701a:ccdd:20b0:1b5:5699:6703 with SMTP id a92af1059eb24-1b5569968c8mr24630391c88.17.1795753052680;
        Thu, 26 Nov 2026 20:17:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 13/35] ippool: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:53 -0800
Message-ID: <20261127041715.1776485-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133265
Content-Type: text/plain; charset="utf-8"

The SRC_URI directory is not a listing, so nothing was found. Check the
ippool folder of the openl2tp SourceForge project for version directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index ede4491309..827ed6311e 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -37,6 +37,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
 SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
 SRC_URI[sha256sum] = "d3eab7d6cad5da8ccc9d1e31d5303e27a39622c07bdb8fa3618eea314412075b"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openl2tp/files/ippool/"
+UPSTREAM_CHECK_REGEX = "/ippool/(?P<pver>\d+(\.\d+)+)/"
+
 inherit systemd
 
 DEPENDS = "readline ppp ncurses gzip-native rpcsvc-proto-native libtirpc"
