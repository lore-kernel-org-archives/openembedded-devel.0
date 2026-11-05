Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32582.1793879741088349340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pMOM33gJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so13826915e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879739; x=1794484539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIE2tdQPJFbe3rBBlLOFI9yfXVCIBCjGIUcK8v9/mq0=;
        b=pMOM33gJqiVO/U0Qh/6Ed0PXZac4rNBitr0Sl5q9/VewqwtTt2uc5GJ+o1r5oLwCwf
         xVgDHaqE2Mafz6Fh/nv2Z3Vbj4ZVIMZpue610YHBrZy6+w9yAFM2dkEPl9vRiLcEoUnv
         8zzrBesUqIgqzSjAW2pqXaDksjZH8XWaYCUyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879739; x=1794484539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NIE2tdQPJFbe3rBBlLOFI9yfXVCIBCjGIUcK8v9/mq0=;
        b=thEWbFVFObtWgObKz1RK2LMjVZ3bV5dHbGKEnxGgOkA5t2bf3MgRgfoRWllY8xjgFv
         a0X947G1x8fYPnArEq7OkZCB6K+zyE6T8skaZAT7nzxsqQdRNj7G0qrB9tUBi5KIM0Df
         +8q2bzpeWQU8QenkZUdTmLQw3bchN2Eq5Q9jPcxw39IyUlXeQI9mRG+MuVTfpMac3/6g
         6jgAy7pNtTRhCrZTbOAesBXoUhH5TTPPJOyXNv2DB6YO16N0XokE4t8h2W+cLkyLvtHR
         qjCsygMlvPbH0CjfBXInSDz0SYpzIcCOva5i7tVFa5EpigUN8yxeP/VkhUDJ+A517RLM
         HOww==
X-Gm-Message-State: APuU4Z9FJig4S2uUrzJMsWVBcFRGZy3o9WsoefWfycK7t4s8/U1z9bIK
	A6AmRyOnOyjSmCqyAQsgfARonW6fSv2wN6VSWNJNovVY5Wo2MvppC0QrU0SHZmagdWZGb1ww66v
	dAvS1
X-Gm-Gg: AYBFou1nY+F15lrohwURRJC5I+Gd8psb5ITcK72/I5NmmFzRx/cJ6Bm6pXG/AkUX/jC
	4Y6QYB5cUL15lKRw7ncf4ltcSlr/YPWcXXfza4j6KYjFKijSx93v+SmwwfGavxq/RDzJ5wIIP9a
	VZIVcRjbvQ+HQJsdD5q0M5eRnZ0j7si02HT4DS5V4H4eEvKXF3z+Liqx0GVaenLPka0xmS3szkQ
	85siio4ouzM0bG2JjVKtWHujNSTkw3PsfvMlG991tbHeS05OiHdpNj9tDQIsro2QvMDNwdOOAfZ
	Lb+wZC8y+KOe8ecjfEtVrBznHMTUI3JgeTVQbs2KUxqkQMidRUR2WVo+CTSDlpdGESpXU8cQGeh
	cuycxVcckJ6/m57sjoOJVRFaHaBzNf1fCzUASTe3znqMOYkDvpzuc+QdA8v/REc8D5MIXuj9UyK
	5u9j3rx907SDRUiuA853LgOxCGn/nzOhGmyYQBIOpbnZIZAIMWvcsiRsCNluGrak+zlfYJrqIUb
	OWyChiPN02hgnwvbZIJrC01UfTkNGanRVdNkHikoG64Avd/CsPK4+jdoGMyCP4wsbVQIxv6IIQk
	xrzJHrJ3znvPGDLD9KlbePTcJK4BkDRYYvb+nuNjIH0W+N8l4XTzccKSvIWRY9+UdJYtoTPV5sL
	1yHIbgFrBlg8tabKLaAeF06aPvn1y56nkuBJidZBMaGn9JxTUQnct5A==
X-Received: by 2002:a05:600c:870f:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4ac185bcf74mr404164125e9.15.1793879739347;
        Thu, 05 Nov 2026 03:55:39 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/19] python3-pymodbus: Upgrade 3.16.1 -> 3.16.2
Date: Thu,  5 Nov 2026 13:55:19 +0200
Message-ID: <20261105115526.634289-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131912
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.16.2:

- Discard the late response of a cancelled request
- Fix missed buffered serial replies after a delayed wakeup
- Test case for cancelling request.
- Test wrong response gets discarded.
- Answer ILLEGAL_VALUE for a Write Single Coil value other than
  0x0000/0xFF00
- Partial solve ext. cancel sideeffects.
- Correct CI for PR runs.
- Report bad file record frames as undecodable
- Wait for data when an RTU request arrives split
- return ILLEGAL_VALUE for out-of-range counts
- Correct doc of write_coils / readwrite_registers
- Isolate PDU methods (using decoder).
- Fix decoders.decode()
- Fix convert_to_registers mutate value.
- add fixtures for PDU, socket and content.
- Combine decode in pdu.
- Allow multiple frames with bad decoding.
- Echo transaction id and device id in exception for undecodable
  request.
- Remove rtu_byte_count_pos from pdu.
- Remove packet when MDAP is wrong.
- Correct fc in exception response.
- Multiple frames in one packet.
- Remove rtu_frame_size from pdu.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymodbus_3.16.1.bb => python3-pymodbus_3.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.16.1.bb => python3-pymodbus_3.16.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.16.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.16.2.bb
index f843b931f5..7497a9772f 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.16.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33"
+SRC_URI[sha256sum] = "64057981fac117ed4b75ea8ef6035369f6ae803247700a5efdf75d76a2be8aef"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

