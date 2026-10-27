Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14647.1793092841073956625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PunXHM2P;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so28547555e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092839; x=1793697639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZzG666CbGEsdHmq+4Gg5rSZ9MhGpEh75oY2rdkv9rY=;
        b=PunXHM2P4L0s4RUYulsAzyLdQYMDTqz5AlZjHaRty+Kj/T1nNzw8XdHRwF2GwarIem
         mpmsc6axwUwIzW+AysIBuVih3ULCcAf+h8p4RjQ2tvJYjbOZO5IeJxHGSgP+4qRcvckc
         rnWVSsUYqz5rVGRyejGMfC/pHEPFwJ/wMpxNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092839; x=1793697639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZzG666CbGEsdHmq+4Gg5rSZ9MhGpEh75oY2rdkv9rY=;
        b=uLRn27dG9pLrE4h8Ry3YftrIqzN/6d3hoa+uUblR5s++lHFn9ILAvgxaS/1QjGVPFq
         XxZTB8SfrgwFSrOZNIsIUMf3gGgQXtCboaonWhwaG/tShToJNYW59UkQiEk3I2ISct6I
         kRRJ3ojL1rW6iUGy47X/iHg0gUUjIgz0xR5nCCaaIbg7hpYFJtwKc8Hhyfd9PVKgwOA5
         B/wgsCSWs8Y1ZOLvMNWulJ9+LJ9g9l5xlyFONnSFdjqjozCdLuki/ZfHbDuTPMBWfE0+
         gRyeu7g6SWt5N7yZVir0NGsNU3+myWrOpQ0IElEwPV5H4aORwt1R2sLKOmDiS4YrjHac
         ni/w==
X-Gm-Message-State: AFq9FYJZE6sFsTC1G4sKpFlSy94zbehfAhnKxtZ83MwiCZtwpGz2/5qr
	weqpGiw1Mx3XaEKU4cdATHR7mMbbezXOSOsnsgFlQWz/ySyUHpcA5pweGTYMyfm/gbi+u6RhR+C
	b87Cn
X-Gm-Gg: AYBFou1A3+n32rURjlMOFY0ymlMX+BCRZyN3+l69bdMKmYFxaXJCC9lTk3qBMRVwj66
	HTtZF4FNU3dh0nQaTJAdG6PuAUz7KlJsj7dVChZ7d3agjAeoVdGni4eg/5SXLK6hX9YM4pQGgai
	WFN69cZN90E1mUuMOZMkkeHSEdXIPb0hDBnL08V1Iq9TOjkgMMcdPzepa4Hj9sxH22AebENMLzH
	eSGcSzqmpnSlf6uHcvMWrRpIRAv0u31bj7GklA6wS5pbGAsnBZhRQuwJDyL4aBBAYnYwi7z5cDu
	lvNT2U2IzwJL3UmQp95gJzuzneTrST/2v8CVO5iKnRvhBMgKC6Jswb1UoG6WU3jFN3H0H+p05lG
	138IBU9ycMCSf+rzCaorYlQgTzmjkmqR2OuIMl56ZRK94zN01CYiOg5TZ2A/qSD9Z0Y1TMeNlxa
	slIod830ffVuRTW9781ib3tJ4b0pFW4XWtUguEQcx6+BmSbBRV5mluPWoovdiUoyCb7RwRWaL5f
	ZFSLQhYjMN8vcizxJGAoKSk7gS75qvBf1XS5qOvExySCjemU2uUjlt3t7ajc5+qg8hTrbrkulbt
	3nebc2tLZ6GWvUYGfOKZFIxzN0BglG0UIa65tUCBQ1v3eldOz//QRzZaGQeKP3T5VEDvNk+MD8C
	im6pYpxOiUyKgS7WC3/nYPz3tAA==
X-Received: by 2002:a05:600c:3115:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a35ac9f6a7mr178889885e9.21.1793092839346;
        Tue, 27 Oct 2026 02:20:39 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/61] python3-huey: Upgrade 3.4.0 -> 3.5.3
Date: Tue, 27 Oct 2026 11:19:34 +0200
Message-ID: <20261027092028.782979-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131471
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.5.3:

- Close the storage connection before forking process workers, this
  just simplifies things.
- Run the callback of an empty chord with an empty results list.
  Previously it was never enqueued.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_3.4.0.bb => python3-huey_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.4.0.bb => python3-huey_3.5.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.4.0.bb b/meta-python/recipes-devtools/python/python3-huey_3.5.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.5.3.bb
index 282a32afe7..722d25baca 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.5.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 
-SRC_URI[sha256sum] = "ac9b02e741f13da4092ea19bcaafc73669e97d3153914d2fed2868df144f6dfa"
+SRC_URI[sha256sum] = "3d9e8fe95638bde843fbcfe38c063d906afa0d4b0cf94955a24c0f90eb09bb44"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.47.3

