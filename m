Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8060.1795739686565789108
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cSWAJ/rX;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so4102922eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739686; x=1796344486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Szj/jMg/Zw3mL1yoXtXAvOx7Uy3OOdHEk1K6EeYml8w=;
        b=cSWAJ/rXrgqgwRFjkbX0a2BSsilAUwIpdolGFhEWvZflXNcvfgetNzcfZ7k7Coucx6
         uCRf7FV3Kb3yw42s/iyLJ+17bWW51wT4Dl+RKT0NqZls2WMdPg9ozQI04IocrN29/+If
         dtHVHb69lUcilaDO9C44U/1PwSaCGWa0cyd8a7HV9N7Y36+ngoW/iXdymHIPARVWDwXG
         zbiJBar299s54dv1Rc6xFe0RU+mtswIERSWA8TJCpRG4Zt4vTfIUHK6zsvZobOvxF4nb
         px5/7KtMoVWKymtlESz8vbRloNeJsS2b7G9u7adM8j/+334skfVUiiETArWM+1fqaQ70
         XECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739686; x=1796344486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Szj/jMg/Zw3mL1yoXtXAvOx7Uy3OOdHEk1K6EeYml8w=;
        b=yFTpWADLfikXLP22Ad4u/LMJFO/MYyzaQoVAFM4qEsC0I+KozgjTE6bUtaoRncX52J
         e2hOA4O8SUI7+1klycIN31tVH0I8ta4FVC/pDbJzY+3oLiFVuatvQe0mQ99AshenVuQg
         TYUkPMph4BOq/24r8QVq7P4Mp0EM3sqICBbsuoPnmbAtD8e907221lnhfcSSbzkjkL5f
         YZLHohk9F60/jb0248qqZ5m5WrppgdzgnjmI03RWOIzpLcqNtOXrltmDBuXtUjhAQD8h
         42WC6S8nR43tLg/wT7r1RELqP8UzQLXl0GVZgPTTOkq3lq3HitwonumN5dve6iZHGcg4
         KgTQ==
X-Gm-Message-State: APuU4Z/pG50LbEDRh7fGp8BNJhzWNfWgi6y0/QloGjAGoLiHuNFDWoAm
	suNV7vLFeP99opoFj645usSmSrLpfIyyg4kRxBMXlWvg/D957ZUB2i3IP4V1Sy7F
X-Gm-Gg: AZFdTZcKiOMeI4UbODDllLt6e66dJ1884A2kr80zcgMQMzX+NlLEExvJU3ZhKqdc03e
	583rRsBMIXoZfBr3+5qfOz9A+/Jva2xhehLxXncMYSrV0lr8vtZn8ahXZCk1desqQydO6vOPFey
	ftyNGNppUkDI42AvJ7G2KfllD4vPb9szawlFYGGRf9KT7ek0rIn5U+raQ6DCvErqzo0Qr93GVBL
	H700v/cAARM+d6gqGInuaozzEN9Dopb152MzOf9nf3jM8K1iM0ljAUrPbzijIns4+GLyQOG3nqr
	Txt2JgJtx1PZ2YaT5ciCBtMCdt5ny3p3qttODQzXbYjRx45R0wFZ5IBSNl7i2Ym5l8qp5ADHNuP
	6CIGVqyMfKNTgcWep2ZgwYLygEeubzww3mQvLn3N4GYNqcSAj/kVluGdw+6olJA2zQdrtUPqxWr
	7BUC9spzbErQL6n7OUFHpBW4mqG+1/ueJfjyjof7WbB+pPWDE12bz0AALpXzhPzZ73il9GThyRQ
	zHf91EPU152sQ+J458JZRN5tk92UihvIJUn0/V/Y98URBDlqrrm2I4fVUQ/jP8LPT7MnoMMXmSu
	h8B/f3cfh0KZWGo6V7pWzZrt/G/5xQAzT3uiUgxcxX6pyY4GHMp7NpKQvAiFLpmpU1Pk/hPiLyL
	KVOdqqyFOeoPbZTigcmMGYVijIPcyHADM5jkZCkb6bol601qg+fgwFA0hpS731CsL1Ruuc8R26y
	3h44sxhQWvtyYprToprAIClsocdv+/N40MYPZHsOYxw05YVXxCZ4Pwx4pIft2JtjmYfVeTNRYHo
	m4DwDoFIrrmPpsuOEkKxIAjxJurP+avpziOPF9tKRCf+FgZuJGtEh+8rfe8JXHGI0gjJiWNC62t
	J8vn
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr25210050eec.29.1795739685957;
        Thu, 26 Nov 2026 16:34:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/69] e2fsprogs-ext4sparse-native: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:31 -0800
Message-ID: <20261127003425.2166632-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133115
Content-Type: text/plain; charset="utf-8"

The default tag regex picked a date-like number (20011130) from old
tags. Only match vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
index 04f9aaaf2b..feb1e6669a 100644
--- a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "e2fsprogs-native android-tools-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
 SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit native
 
