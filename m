Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A934C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:32 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11293.1784590771964229060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CQb+CJ9E;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so8576442a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590771; x=1785195571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rstI+VxTJhwHLdx806CzDRp88GsKtIoYWiD3DJyfwTY=;
        b=CQb+CJ9Ex0PAipmQZJBUdbFd6Pee+0NUWUSxhFU/pZb4CLhEcld+gS0XJf/q6g99rs
         3flHSzqgXLrOsMUFn1ow4oiePv+f0xnQDt8OPr4zUjWHG2MXjNcjY3KEKnL7ek8txKXo
         B79LXcuAlJP+LrQFCVs+F001OLDj6GRw6VyTVso8S3Mof/VDeGTZk0a/c4dittSLUuVG
         ZFYE5/0+o4Nf40MDPOFVhbf9cbLbZ3fx66GCrWluoxSN9ha83DwAUJrAD5F2qNmBJFF8
         TXdUTsoE//CzEOjvyuW6GKMeBjeN8EL0vFJw45fu/mGpkSqgzxBYxCo101ujkGu/MaNq
         rAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590771; x=1785195571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rstI+VxTJhwHLdx806CzDRp88GsKtIoYWiD3DJyfwTY=;
        b=iqQ5rfmtEuXM7/23k7dNHAY0FHX2y96x2tVvpDhVItKyv6fKHgJTTt6e7ZdaVdnBMo
         YdQRIo9H4FuGcqyid+SJJqYEJcpYQ8cSPt3mUkD4SUIW/tJvsAWo+N4tOU4pdF/qt/Fk
         mtO7keTwgWVrJDjFI3qNkm7DXPmzhOxVk6hBUsMqbZc7h9rJSw7L60cqaqJVLWLjiDpo
         nTMXM0n8VjfS+rodBRGvrZQkW4TpVq4ahix68V4QzHURwBcot5j1NJTValFIXrqFiXqd
         S+DyS9D5hx8NAL5zp/HaOMxYDblQtkCXN9SAi1BNxStw7ntr8Dtx7C7DDDoEEavuIekD
         flmw==
X-Gm-Message-State: AOJu0Yzxsdn5dzP/ScuPVKNmfC2CYl7hkE5QMp2DG3iQKsphZdqHYbN0
	HsNY36iTMgV172OavlpZDNbvQ/BB13klbRuNkTB1GPkFbAWgDDpUqbmiBRS8LA==
X-Gm-Gg: AR+sD12PqM11vkWT3ihGVENr07UdyzoEm9mmIvWTcW9VAnZLmBJ7hR7wdpy6ldMeOpC
	kox1aiRx9qDN6Kl2wH6zN6t5UAvSeDTcL2N35ThPijx6zbYgB0vZGyIPp4pJ1OYs1vJ3EOJB6yC
	n1iBfzAtcJrReUDEt6WCiyna3MgZpdngx+wVjWGlv04nlCm0l3wW9KFl5le8l89aJpkaqPda1Xl
	oxMBwDD429OdWgGoh4KPZg4J1UD33AFpAbB3xVqPAidBrdmOqyoyChar5PGNn2kQqm/rGxmmRvM
	9JD6JJ+JeUiWd0IplhnouunNC+VdTHs8KvlrWmSkHcfDW3V5rZu3118Woa+pKHeXC2PgupcqOTy
	RhDxIQTJvM6eII0wmDegbvCRpeh00/4q2a9HERd/7gg2LBxmsdfZk3uqqaIjQJDbFFyBpZX0wF/
	05Onqzcmj6PooXnw0=
X-Received: by 2002:a17:90b:28d0:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-38e4b3e1334mr15875032a91.4.1784590771370;
        Mon, 20 Jul 2026 16:39:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 26/30] memcached: upgrade 1.6.43 -> 1.6.45
Date: Tue, 21 Jul 2026 11:38:07 +1200
Message-ID: <20260720233811.2324493-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128327

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 537a8708894b1454f544b6bd62ede07b7ab4a0d9)

Release Notes:
https://github.com/memcached/memcached/wiki/ReleaseNotes1644
https://github.com/memcached/memcached/wiki/ReleaseNotes1645

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../memcached/{memcached_1.6.43.bb => memcached_1.6.45.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.43.bb => memcached_1.6.45.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.43.bb b/meta-networking/recipes-support/memcached/memcached_1.6.45.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.43.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.45.bb
index 9a98932f95..516b97def2 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.45.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435"
+SRC_URI[sha256sum] = "d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 

