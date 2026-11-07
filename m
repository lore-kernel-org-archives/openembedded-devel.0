Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6379.1794046336353045394
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nnJamWB9;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso45013c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046336; x=1794651136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItMpuz/oITOV2kJZHPF/QnAZ9bl+flbn0BHEeNokRys=;
        b=nnJamWB9qwh/LbD92nARlmEvE6HGiDNX+LgC1DazSS32J66HiS5Yk7/f2+a132PXrB
         +FXQrdoKABsNYFPpcazd2MLjMVq3CgWQjnOcluOt39ZmzPnjAM+YN4R0nqE88Xq/olQI
         j+janK+hh3jAOMT4dBC5UFV/NyZJPgYmZR4bg8lvQKTZEiup0/2yhR7D3U4GPi+vfzjx
         ZasOqnuX89vCTu5KJTf1XZRyoiEsRH54+MOn/FIaaSsRGqA9UPB1NTNiSo9XSjWh2ETV
         KugBF+EoDAVfVTrwxIs/ARrUk+J/HsQYWrkSfvluJLH+1kCOs6rkW1niZ4/CQ20+X0rk
         IAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046336; x=1794651136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItMpuz/oITOV2kJZHPF/QnAZ9bl+flbn0BHEeNokRys=;
        b=kvkwfBurWcFvh9XySUFEUXpxHA3gRCXh4a1TQOObjRCugX6PIuRjJzh8JQah6u0aM/
         TSMhZH6qWPFcLvSEXEdPy/qD92eT7o9QOH68JpoTkwGnk6Jp8+cQ0puZWPEQU5UYPhtP
         bhWAo9GkG2CobwBzhdl+iw8SnjBzhUWUpFnWircgxs5V6SSMNPanwJuQGq0nxsLABxtT
         P8EfLdRcX3AiXQ7TYX1DEOvTK5558MwNT/NY+9VFTqLXGud5xh3qKtxEFPOP8DtIH7op
         xLoCJ+CfWz4mv/nAb11gm09ahKvJNfqc+7B/JwSHpnZuEIOlpek9AYuxsL2qL9CQIbkk
         BT4Q==
X-Gm-Message-State: APuU4Z/F4iIOPcNZAjJyL1889GxCD7aV9+OXZpbftxv2jiCZ5e47MDaJ
	TU4RdAs6Rc2LjF0w9Nt7i+SnrJRyFjPRVrOr1Kt97M99skHnYdg5zy7aDQKefw==
X-Gm-Gg: AYBFou2zGxOzzOp4ztbhEOiVw+fBmIjLUxpY3/2vs2N8MVF0C7mUxnR7XDPrH/meiI4
	4fBTYZjciAUWJvaKB0pETRkJi6C6XSK69/LMFf9VjuGrb/rafjNQRBpmUaQ3eEfclFl1qJFrkpE
	vuh8rOrjgTlHQwI1MUwayfweiVTgFKb0XSjK1Xf8RGIt6lck4gY5lNwwTHWTefhcutN6ZeQWyfc
	5tBlkEZIJW9lSA5fmTMLWWRLo0a+ohuE0j2fzbkNVabKvSMEjwQOs1gtdw2Y/ESlQtYzpJ7GdA8
	3mZrs59XgNYpR40Bu/WJUJucC7/9K7zoFIhUfeR3ai7KUwLbsIjvvLL/dIHLHLSwbHmnb949BuB
	HudtxqAXiHoXGZbZ8jzzIVxHSv2bNdYuF5rh7kPjntZbH8rKmhKht2e3azVs3AlLVx28LBEsWrG
	IQJqr9Xcen5RrkDfUGYkGxwkhDqYT+4Vda/vTRrV7PBUqsS2ikbqAZx3yspSxns3Z9hIulnjJUy
	XbH9UctLuzh0hTuupC7xRyEkF6R5pJHqyDA5A8tCeq4k6tXYT32/v+9G/MzdzK759Clo+Du6ZC+
	5PfZ3qvN+1o5lvmFC3maiKf5JrhnYZ00e+ujf7gbZ3fkm0Q403nV9/6rBazovw==
X-Received: by 2002:a05:701b:2916:b0:17a:e684:b497 with SMTP id a92af1059eb24-1b25d293b87mr6763045c88.5.1794046335569;
        Sat, 07 Nov 2026 02:12:15 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/11] openvpn: upgrade 2.7.8 -> 2.7.9
Date: Sat,  7 Nov 2026 23:11:51 +1300
Message-ID: <20261107101154.2992152-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131982
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenVPN/openvpn/releases/tag/v2.7.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/{openvpn_2.7.8.bb => openvpn_2.7.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.8.bb => openvpn_2.7.9.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.9.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.9.bb
index 6040935d4a..8b262f9acd 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.9.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36"
+SRC_URI[sha256sum] = "c42a6ed892ddfe2d6e3317a5040f19bec5827564affb2fe3f2b3904a94daacb1"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
