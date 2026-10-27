Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19429.1793108989577881666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WWLPOPXi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso27780765e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108987; x=1793713787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+h1YHlO9PrUtFwUNt5prvlc6dK/+d5Frcnl9By1XL7A=;
        b=WWLPOPXig7REvZzvlLktocfaYYk8i2bQegZeh/zlFTProN7E/4q+b7CGqYwx33KSqh
         n9tAFOtOExTG2RaRkWZLMg7dDJHUZiHP8t+oop9XZb4hUarj1zbh2DGDfx4krLqufp3v
         J2ROODOD+SPe9f2iUsRjuOiO0TH7wzU89ERAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108987; x=1793713787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+h1YHlO9PrUtFwUNt5prvlc6dK/+d5Frcnl9By1XL7A=;
        b=bDZxk0tbVFkq0e4p2azO1/2b1+zDcbfJzKZVQBII2cOOe20axPTqMWFpJ7NqdmdgTN
         ulay438SlupXss0E+KUNzqK5SygNfWfgmwcuIon5sEFZMhwJl14E8ZXvV8Qir4uX+Kle
         PzrZJC00knacBf/L1fl4AEFKdzAfsjRzrg+CCdqhAv8cSDCuQdO1O94MYtpWMxkXiG3i
         RSkpid1noWowxXkWW67Js7k6JUMA861xm7SfYRYbKXllV/8IrBR8AU48LCHtgrHpK97l
         eyJKn8K3DG/xWnQHhgdza1BGBCqpvu28NeP5MH10Ub3c5RrXGHQzkcQs+tCYpFq+BO1l
         GJ9Q==
X-Gm-Message-State: AFq9FYKARej1wMsJoD+kA4VQHm5q1ozsTeMBRNBKfnMJj6zNuJuz/25M
	0yRSJ+gQF3maPN2DpLNjb/6xIbU1hsU6CIVUjC7rk9hpdz5+jclVp3yz06nBFF/gv/napEcB2FR
	Q61+R
X-Gm-Gg: AYBFou2yDCeuz9uOEpTW72LKyFTHFeAjrgCgEBwS6HgJ8sat4oH8ZL3wgHh7ImJydcR
	3cHghXehME4J97f11MmQNtSEnc4OtS71lPhGmMQh4wHUb5zRywygtbbUzux0UK2Fty1V/YqH4Mp
	9EH1iOXPkGRfXgHlh0/k7wQjSqoOaFegN+MD3glXo6hHTdLg0dzYY+Tbx3A2xVd/UB7lsYNXdsr
	anXLiOs9SuoAJJvRsKsogZjbEHWd8svxL9emIOnq9Nr+H4sEWJ199TrcYCbkQZty1hz8IYhqiLr
	hBx6s2vAiayFQW18q2O0k3hqjJVIDno6Yf+POFjFCJoQZvc7RLJLlwCazDkWRSHNA+W0scqYSOT
	+r8uOy7JhH58SQT6rBiBDdRVNQ6gwSvoBQ2XNE3HNalKVSK2c+AteSxJW/HgJef6CDpz5EzPfrW
	OSY5ixDshDxp6jFEFd7j9IC7+5Fh49A/7S282LdGg//JrYd/a38lI8JNeA6BuMBmidwkicK5LiT
	rTTxQiLE/KXICukeqTBc51WlnJgViErpnDMj2/gKPR5dNkQIjDjCgWwO8+bhnsu2DXFC194XkuC
	OfRpCBxQRhT6jeB7R3K4JArqLH0zJu/bHPJiqa4F/P43LDZRCmDFbvvPqZ37MzCQOLOrvM4mbFx
	ktwlq
X-Received: by 2002:a05:600c:3493:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4a35ac9d0e8mr193436585e9.11.1793108987379;
        Tue, 27 Oct 2026 06:49:47 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 1/7] ipcalc: Upgrade 1.0.3 -> 1.2.0
Date: Tue, 27 Oct 2026 15:49:37 +0200
Message-ID: <20261027134943.1011404-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131530
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.0:

- Added the --cidr option, which prints the network in CIDR notation
  (e.g., 192.168.123.0/24); the JSON output has the new CIDR key
- Added the --binary option, which prints the bits of an address,
  or of the network part of a network, as a diagram that maps the
  address to its bits
- The geographic information includes the city (CITY), which was
  never printed, the accuracy radius of the coordinates in
  kilometers (ACCURACYRADIUS), the continent (CONTINENT), the postal
  code (POSTALCODE), the time zone (TIMEZONE), the autonomous system
  (ASN, ASORG) and its network (ASNETWORK), e.g., the ISP's
  allocation, and the network for which the database holds these
  values (GEONETWORK).
- Added the --wildcard option, which prints the IPv4 wildcard
  (inverse) mask (e.g., 0.0.0.255 for a /24); --all-info shows it
  too, and the JSON output then has the new WILDCARD key
- Added the --format option, which selects the output format: human,
  shell (VAR=VALUE), json or value; with it the specific info
  options select exactly the fields printed in every format, e.g.,
  "ipcalc --format=json -n -m 192.168.1.5/24" prints only NETWORK
  and NETMASK. Without --format the output is unchanged
- The -j and --no-decorate options are deprecated in favor of
  --format=json, --format=value and --format=human; they keep
  working unchanged with a hint.
- Removed support for libGeoIP, whose databases are no longer
  published; geographic information requires libmaxminddb.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/ipcalc/{ipcalc_1.0.3.bb => ipcalc_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ipcalc/{ipcalc_1.0.3.bb => ipcalc_1.2.0.bb} (86%)

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb b/meta-networking/recipes-support/ipcalc/ipcalc_1.2.0.bb
similarity index 86%
rename from meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
rename to meta-networking/recipes-support/ipcalc/ipcalc_1.2.0.bb
index 18970751c3..9b459b21a0 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.3.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.2.0.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
-SRCREV = "c341e55be386649c0a5347eefeae410753c4e753"
+SRCREV = "e364dbbcfaf604b039649e941a7603615e674d91"
 
 
 inherit meson
-- 
2.47.3

