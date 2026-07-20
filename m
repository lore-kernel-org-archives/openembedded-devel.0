Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F8FC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:32 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11422.1784590769239087177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MKZk9oEk;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb85186d43so27645a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590769; x=1785195569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcDNUHzfZbV7sP7zstAaUvR+O1w5nieKlWz+iwdylRQ=;
        b=MKZk9oEkBMgetxMa+K4CLfKUX5U2cxuls1GOrSwwb24w62hBDZprYbdJaIj/z4gmnp
         9j5XnDCJVEuC4ctukuRy+MvKP13kHa/6yuIFNe98zQ1TKwUGSW8htF15/Ge2u2FrCWPl
         SJEbPlFBsELbfAcduFBFeN+KFxZHLKgsFIiSx7HBRDW5xP4tYilan3/X4d0W/UVrgqTI
         6wjPWDuMzvZYyoJt3//gkheB4K3+tE9JAz3lxe98Jb3JM6wD80G8YJB+kHpiV0QcRYvU
         KHBBHfy1xMPrB0qJwd34w+FiSUxGqQKMvuoAjsgn6gsN/AXpDzRSFv7qJb4HDkx19bLR
         0q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590769; x=1785195569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcDNUHzfZbV7sP7zstAaUvR+O1w5nieKlWz+iwdylRQ=;
        b=BPYUERzQAFmsZzk70wyUIRsMtyTWXbXD1BsIl9Bar4fpv6GRoVHBw1ghWKAfXaBqHD
         0lwiJJNrbRU3GYdITpgacHn7ymLU8Wx/5zoGEXr5pdHJlYHMhVKWiIescLi8gVgTKQct
         Wtw6JQwfZLglhK6jdSDuKJoDkwyy50tFKV4M9p7Lf5XApflFNinhX8ewkno+ekIS1Wu8
         r9mumBwYAtQElUE8eyo/QqrQnB0z8y+ri+KVLAl4N35t29VJ5ei/XH/ogdiRuFQG0rEH
         +S5oKUCcFCcuPAvRQlsKAPSdaojJ4pRjNUrjIHfoaZd5kh+XfoMWsHI3Fg9RnRhKHA1v
         Xntw==
X-Gm-Message-State: AOJu0Yz8yRa56wtwzVuZHQAqfALYGYTVdEHWvD9vslGyFQpJfug9hQFr
	M2aTXKHuzzWrKVWib5RlnmlNBVsypEKDHOGG/0Rq50a3QHhb3zlTA+fZGFeUgw==
X-Gm-Gg: AfdE7clG2ueAGUE03O4zCxGLTgWKF6txnqTI2v6u0nc/xIEav/LvfE7H0wvmCPkGkBI
	E46nTgvPSvd0jbTBQWIW3YQJwpDq5HjlctJKlOH22GyssxKhi8jEWrcbCq2M7gU0RZWNySgsbSd
	TFFyPaf1bdkySR9NfuPOEhcAfgucFOt+zHA8bJK5xuWYl7F6/r98HJHCgzfPN82uXI9pDbgXKv1
	xlCy1zYDvBQIqwMR+MtSTpB0SmkwOQFeVvWC5akgvl9ynquLPgkdtOXOAuCKULgCTPY3b/9MOIW
	GNQrGpTdcD1QkEWhorYKbMVw2/3X8Pt7qBug0IxaFxuyC+4S9EiWDZ7UxjwKfSDAUZ0LS7VDBpx
	LMVoul+0SDiTSC9LoNi1JYsL8sM10aubNKvEH4smBB9mDIiG+zsz9/SC1H3IFH/+0O4z/OStJTn
	2unKkJOx2EG4VjsKw=
X-Received: by 2002:a05:6a21:7008:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c3ad7a439fmr18085621637.22.1784590768650;
        Mon, 20 Jul 2026 16:39:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 25/30] memcached: upgrade 1.6.42 -> 1.6.43
Date: Tue, 21 Jul 2026 11:38:06 +1200
Message-ID: <20260720233811.2324493-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128326

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit abc5c5be3b9f32d60b0f958095a0c83a17cb2860)

Release Notes:
https://github.com/memcached/memcached/wiki/ReleaseNotes1643

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../memcached/{memcached_1.6.42.bb => memcached_1.6.43.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.42.bb => memcached_1.6.43.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.42.bb b/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.42.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.43.bb
index 28d8ba3cf9..9a98932f95 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7"
+SRC_URI[sha256sum] = "8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 

