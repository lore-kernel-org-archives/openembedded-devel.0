Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8096.1795739743422786733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NokElfuG;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so6671349eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739743; x=1796344543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8B20Nsb5fhH5Idoa2pl6oNwtEbZFymPSD7wITwgEmU=;
        b=NokElfuGUG/VpkvBujuR6iXeDOiyjeeUrHoTccaf1W//Q4IXMj/F3Z+0mdmgk6g6sU
         cAyu4QK4IIjAYyuN0CCr1IvJfUDnfe3mb9igudBVzVv8k3OI0biKnxioYuw9n30WIHTL
         pi4Oksu8JpdTmW5vPYRaPCYvZ3qN3c76pgifqy6pxxR8S/2+0cl2YVZnHNUaTB566VXQ
         4P4GrhnnsfQ3dv0nXbNdyHL5jHvuJ1ovSEjoU3Oz6PGyb/IpLliaMrCTrrGRDGJpEHiI
         QibXUyDj9rFmr4QbRSDyRh6b9k3N5FT0iGHWRlWZDqv3jlWYEqXSqgdE/RfINsz0Fs91
         BxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739743; x=1796344543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8B20Nsb5fhH5Idoa2pl6oNwtEbZFymPSD7wITwgEmU=;
        b=1ZFAb01/QAE5E8ZEd/M2x9OraCaQdzOvO/lUvroen9aZEYVh2a4Tv4sQ2czg5TM09q
         SAaJWU4Nx1n1LveDt//w2BbcbBYq7rcEFVpj5tnr/yiAmLNSqEjTW5UqFzMnab5Hr/ki
         tvvfs9J/LneRx1/TkEylJtJu7gyLNMeYJR3CZ89U5okw3/T2qHycxBVRyR4Ma3bPigMN
         4z+bSz5rwG+veiancVtywOA75xxTDVnZmBpdqF7AbPQ//9Bngs3S8Nb7Anr98kKMwRML
         YWja5CJb9HIg+6S2xfuR9jWySSghuW96tArr+f5X8/eaKCleMqZ+9Ga7VHKnLzysumXb
         vjqg==
X-Gm-Message-State: APuU4Z/3KfZm22xUl75IJvGEyZwyGKlnGXrCPI1Q4dvaJ9JicqbDo6ZB
	czU7ec3GJyUmBrs6FHFF4WrblbjYLfr0hLzJq7uscD20YeajD4uewNYydvMGWiny
X-Gm-Gg: AZFdTZd7tZvya7sV5/v58UCJgTZ75EWLHFJ2/Jg5DOv/EHfBKpMPImVnS3oEpVELNQs
	c5wnlYuAGfhrAQ7QErzuFQauS41g7I84lm5i4Q7CR/h1AtyOi3Naa+9K18Z5RVv+zgItjqGPmSx
	pO9NKM8vdqjtLEwEx97JGTFm8cQlauMc3hJXFI1u2Ytjo2OqPgqQh9hdU0ywFR6Nll/++UcPDuX
	OLZXJI6Q8qi6FTUeAC2DWtGZZOGTgam1qBqbycav6bsDe815UnCyJcOtIGqSgiZSewTu11VrPLZ
	O5+b5S7Kv4gM/HR9AGwkYAVhR+0E7qGJ2BFQUt9szjzyGa8dgOslgZ3KW0x2c1lp7AAmUUsftsq
	8YYCchlStJPvtZkXOHPnjdYIdAwY/yTjDcH6p7OsrZVQXvahR0uLhrAM0YOXxarZ9ekuzj8x+Lj
	EYQNZQDwPxK2izgcJQtx80LX+oJs9+oprzR36bhCEHLEqMwaONoMiSpQeIbE6vwGwGc3Ny9TIR7
	BcvvOGEAUpnVGLJoyOTJy/MpHaiHOL9CXajUwi/f7mWZU1g4I4mrZU+xvQ7+P/EDqfIgQZAuKBF
	DOCFRt0MB/cMYnzPVgq5Au+4yzwuTxa9w4NhxIiOdNvLkd8QXfwltOnZJdXC8bVLhJSKeh8+epo
	DxRfwNdJKEGpdwiJQg3nL9zuB9eUQdiX+0n1OlzyGovqClpwQeJPVms/q+4QRGXpRXW2DyIknKj
	PAjnbJLP5QTfr3uIL+K4Rty3e1957gNd2Mtzz4s9KGOhB8G5dQC+GcT1rvW/ufeP0LsB0iEgV+E
	rRjm2lbq9XzCgmmSgSvhfMPuXodpmy44DsxmXxdpzSbiekqq0lQTdxHVRIO0nmiKWhg/gbWz+5r
	oBZw
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr33746337eec.7.1795739742795;
        Thu, 26 Nov 2026 16:35:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 69/69] sdbus-c++: Add upstream version check
Date: Thu, 26 Nov 2026 16:34:25 -0800
Message-ID: <20261127003425.2166632-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133169
Content-Type: text/plain; charset="utf-8"

Match the vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
index 276132273d..a73508a082 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=ma
            file://0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch \
            file://run-ptest"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 EXTRA_OECMAKE = "-DSDBUSCPP_BUILD_CODEGEN=OFF \
                  -DSDBUSCPP_BUILD_DOCS=ON \
                  -DSDBUSCPP_BUILD_DOXYGEN_DOCS=OFF"
