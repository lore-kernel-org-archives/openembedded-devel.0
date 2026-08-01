Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E504C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13736.1785620742759806504
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E13gzs0d;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2018846a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620742; x=1786225542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rijC0Q6JDQO2/KjydTy5APc5NOmfvCTUATIkRJNc43Y=;
        b=E13gzs0dschSPDx4hcj+GW5515fkTIWtDGwflEig7mu8XTZY+yL0M0ul/7e+MFaIqQ
         fpyVYvT6gN82yRNWAhszFWiRmyQMSn8eAD8yUPkTEN9qtyCrWmjydYyr3KAze22It8X7
         IOU0VTIDdn+QTJh0cj3eI2ruEMJ6ldN33WHK/1++UKnFsmGq1wdSG/dLdVYLdseIaSH3
         mVn9erdKKPDhWSCOUOE6ncFKqA3CexNyEzOX/84VQISpt0VQJbxe/tXOggFKhAK8aDSQ
         ghaSdahSopyhZSk7oPzD05SiB1y6OokZQrmL9ktxjW04kBlJ47JodJHFjDnj5yc+ySWO
         FVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620742; x=1786225542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rijC0Q6JDQO2/KjydTy5APc5NOmfvCTUATIkRJNc43Y=;
        b=rGQxR2zGGNaAkQMHFS/9P7o2b6Efen3nCHfYWLn32hyVR8VcRuSyVCcdtg+P3EZ4rL
         lkBXjbX+vunJsOBq9R8gBTctTBh9yStM8yITAJUp9g1zOo+41TBj7m0RDFeVHhKhdxQg
         qhTZYDMY5CTRiLyaFlY/zRr18rRlk/7ISoakUpIk5CnWgj/ldUeCH0mSk4GQ/Oz4Vq9p
         YsXpZwsRdTNhImczkRzRDZpJYNfwVMtgIZOHd57sUsHwqh+TZ+Y57VLw0qr/NR49Dw3+
         ieDYw8P1f+VhKugv6XWECKJaGR8lpfR0jWkM3YoWo5gOyGelsQPA1bj7MU6V7d+yvZHK
         g+pg==
X-Gm-Message-State: AOJu0YyRIHbOgzrnb95CNHDko2gxvw+8DgZIx0WeSgFAwxdHSLYOyyXv
	Fiux/t/FjVA8YgV/5OVpYdwkTyznRxO8Q2rwdIwqTkQU42bjM+UBU0UeJvrIA5Qa
X-Gm-Gg: AR+sD115KVxAYPQoLYNEAk+qsr2tIQ/eOizTHg3ZG4tMD48cZDxYCowMTkd/N9rHJWy
	qvRmDqZExf8mBed3LX/+W28Qj8PvSMr/8a1EpJSvWd5RDQ9kKDqRh4KjCuFuQcpzMDEfSUzFxu3
	51y+J1YfdGzdYydZc+Zm/yVxTLReLi0Xx0cdCaE1EDNV+uIFWut4BB0E8uz6xZ/G3/vsCjllQKS
	IfsmBYujCJ/0a3Bwf7j+eXoiR+BN3PMGMu1e3TcZT6F1K8Bv/4X4BiuCH2MgzMXhhVlc/pti8kz
	D8jbjhSaCuTrhMOXK7+QewDtPbhxJN0DNGAdzN8Q1BVYgGJmVQOlSO/e9HyMKk3SRvWgzCATIB7
	wzXDajml5UHvgYuHWN8s1NotWjkDTisg+veVWpXQjvrwRIqtfYJz7ZYW3vvMehBShhuEy+ezoX1
	qyvKaqKFNvI+7srhLA0WrLzat7bZwNaj7lOeo2UBbeytWGkB9lvmqo6AQnJANsbByQjZBZjPI+2
	mnZ3+KhHB017zMKh/htxgc28/37HxRuyzhHQZW4DCiIv+rtIliS8eBsGW+K1wVrHwpHy4gwsfuo
	7x9iFV2LblNEMz0muJMl07g/CJgXOZKE6jKLD/skPQPwrMFjFGjJ05vW3qL5IytlzYWBxpTbKGP
	2ew==
X-Received: by 2002:a05:6a21:a97:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c92a7c8adbmr4437004637.33.1785620742083;
        Sat, 01 Aug 2026 14:45:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 14/31] gssdp: upgrade 1.6.4 -> 1.6.6
Date: Sat,  1 Aug 2026 14:45:09 -0700
Message-ID: <20260801214526.788343-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128631

Upstream changes (NEWS):
 * 1.6.5: block the corresponding TCP socket when allocating a UDP socket.
 * 1.6.6: fix binding to unicast sockets (regression from 1.6.5).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb} (92%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
similarity index 92%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
index 94679ce28b..944a4ef16f 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit gnomebase pkgconfig gobject-introspection vala gi-docgen features_check ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
+SRC_URI[archive.sha256sum] = "767d2275254ce0efeaeac64419ff9f4f0ad470d134ef672f5c556b2abb786bcb"
 
 DEPENDS = " \
     glib-2.0 \

