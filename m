Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3799.1794728976481279920
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WQ+meC63;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4584049eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728976; x=1795333776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TcxMR2eSyHcZR2VkATI17nSJ3O4dPmVEx8XWDjGmfU=;
        b=WQ+meC63pkXKq/4GW4uk/RJpNdqyoeI/tD8V7XZH3UkPZcUmPn4MYVdhoXQr6C2cyb
         2NeCWiFxVrhpju66KpPbzePOMUUoHVmACFXfC9XMMjDkaZffBFSPH5/WOTA8Tyo7BQul
         BakRarDbDYwjwIT891f6utYq9lOOfVUM8kEEh3Q3pO67im0pkgmY9VIqi5xAINCPk4Q9
         /eUMRxFt9nRPkmYTpRJ3AoXT6YYAiCetJbvibnCEqrLr0UuZfgj7n5LZ7XapDHzSTfPX
         AHHRi2aP3+VNqAr/LWUkn6PJwD5TT5ISGVhhZ5dgvsU/+gQrFkwcltnyFX7E4oUOzfl2
         42Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728976; x=1795333776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TcxMR2eSyHcZR2VkATI17nSJ3O4dPmVEx8XWDjGmfU=;
        b=p1sVhfy7F8Ss2EOmilB0EUkw9St+bKI8/eX7l2f1wtx3CROhxFMGZI3NbHDd70ZKNO
         trAEm8MvxOcb/POaXqxlCxiGua1J6HwfIzhx8cWc8qbu4TJulmKIqTzHwQD7kBywGP0F
         9GsK0d5WVrUaJEEN9rrTbE5L+AIGqpbflPzyckI3gYUUodiT7ETxPMAcIqERIGOWLYGz
         IqED2RHWWoUgBFA05Gyntb2poYg8ojE5ib+a9OC4lygNXTNgPX0pH83I+NIu8FYwG/f2
         M6v4Pv9LQWmWODLEY4eiyHRExV58OgNveFaovL9UAPaH0myir7XXB4WItVxn1OM878IG
         H+Aw==
X-Gm-Message-State: APuU4Z8lxMkCs1lqLTBtI+YoPyGFuC1PK+Aa/LLJqeyyeyhJS2Ffy3CM
	n2z9IY7T+zMLAx4BwChS5hEuCV/ZAs+8C/2Z2m+AvPU/UtUNKnvGgqgnnaqvXcNC
X-Gm-Gg: AYBFou1rmj6IjpixYZl6LYYcjZhBj2a5WIYu8UBXHs+WoVSu753rQyTs3h3cJHPv7x8
	5eh9OZDHfJEirrVqulV4X29zi84GRhy6ruxQfgygA+oZHra1IirvbVMyANRYHRJ0+Odzbm5Urov
	XQTq5oxTTAJiExzhYhm3E3UnRIN563yDs4NLOP/vQaaEQIKI1IAAGV+/N9QDxkc30G+BakDaccg
	siXsfbI2yX7MtEM/bVLZqK1nyuS4K2m3I0bud//T3BzsQIIlqMAcQgqEVTfNzGO2NrOW8YtZlQk
	800hrcsJV4ILFLAbVkBRKpiBw/NaWZDDGCxuB5ScSHZEsUbzRX82zieIh+cym+nRv+dyw8iq3Aq
	6Az37nsygQnxfbkK8L1SgrvzgUEjoPJlif0wl1WwNVEW05i1TWVG73WJGS1C6XA7B/tgF3jR8VT
	7AGRxsZEnCKglCPMPfvQVdZ9SkNwMDFlN/1OhFwd6lFvRkPzdIy6U5SvTddZdb5Q3mO2b7Ee6xd
	K2dXgMIkFnnAHq/x3Y8c4vFQlqKVSNFqRDroxR6wUz/7H0wASk99yWw/IiqI5JhU3sf5vswf9pL
	X41CuNqFfJxrLZ1yg70CpWFOSjS+DGAN/O/5EImxsnO2kGRCBnRGOJPa3IlNEmcoWh0z1n435jB
	JKoIaamhXTUFcp5YpQ1ldWUuB686GgMmnUBQ9sNvexltyfco2OD9aCQDVt+23/FxSCPcSj7l1fH
	9TKv/JlAu/t81RuVRkz+Sw/zhOijfuKn3Gq+uB0juu8G9gZ0Df6Hmzfi3XoMz0zO4B13NXpHLUN
	PPAmzWXd+Gsc6OisVqLfNAETgelUQOecxIyQjQnuu8/KXhSFuk2I0IXiN6qxUh1bhZF/KwW/LxY
	S7aM
X-Received: by 2002:a05:693c:829b:10b0:370:ff2:f78d with SMTP id 5a478bee46e88-37965ca7d77mr8139456eec.8.1794728975665;
        Sat, 14 Nov 2026 23:49:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/96] gsoap: upgrade 2.8.146 -> 2.8.147
Date: Sat, 14 Nov 2026 23:47:47 -0800
Message-ID: <20261115074918.2932593-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132279
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gsoap/{gsoap_2.8.146.bb => gsoap_2.8.147.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.146.bb => gsoap_2.8.147.bb} (94%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.147.bb
similarity index 94%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.147.bb
index ca9919f4d0..797e70ee74 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.146.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.147.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "821af2ecfb93ca9dbd9bdae67fa0d57f9165fb4252bb40e23cd510dc4d49ec98"
+SRC_URI[sha256sum] = "112e92a40e734566f57f782b61e39b4ebbe9049f0f1cae49893272f59dd096e2"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${BPN}2/files/"
 UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.zip"
