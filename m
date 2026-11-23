Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48058.1795411896632147689
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qL7ftsmL;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38587f3de36so3516689eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411896; x=1796016696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGCMcAJYVqdlejdvlD2WGrUX+2BsDyJA38vRCfFZXU0=;
        b=qL7ftsmLKF2+GYN2s/IeTcKiwB8BZ/ylvH0iPumg8qCTxX2a8T261AWbnXn6hDoPB0
         vILkbEiwvmCOh2CkhfaatctfXCULOEN+KTUKQu7dDtmDSbXxLUSVKCdD0NbgiyMvim5G
         7W1hzIXJm60/tHY9HxLkeHYldTW89RXlwIghuPWK16wwvtPEl/7RsSO+Jm6AG7pm3Ynv
         00BTFbm94T9ERgB83u8h4SIAfH9LsQmOtgXGrDAkJV+xdAKTAJ/0VLC8jIDr4hUyYzPM
         tcRX7TCHjoMs2+DfBRrMznKsc9CzewrmKaYk5z7y6EChf90VgEoLVB7sWpmO/PCumDjK
         BKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411896; x=1796016696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGCMcAJYVqdlejdvlD2WGrUX+2BsDyJA38vRCfFZXU0=;
        b=TYDZB0cT6J11vG1xFpUOBIgYOUgKWoqtD+PZiqebxTlPRrtAbNJROT4G3bWERq8BtA
         jzzykA/nBpjPX8CyV03Iuzjiqx/ag/Qt+/xyTiSd/Kyk3r6HfGk9CT6K2jgm5sQuY0Vw
         ILfaCCB+Soty3g1zwk7/8hzmUCzi9mGEqHvcR+Dm6ajdrimGvIpAyrylNkEozq4i75Vt
         29OAvO6iY02o20b+1KXk5er75wjc5ZU4YINZ0z6eYlPvRZIEkJWUhhptflOzSI9WEyT1
         iZUWLpYERkljpdSnxHCw5kUH8ybRKRsIw9M0BaD+4FJhojbUozx/rCvQeSrjx0ntL7Rt
         Uddw==
X-Gm-Message-State: APuU4Z8ttJQjwFQItodhC9MNhnjIdhVmk7N7Gj63GzHtmejHHw6cKJ/K
	F2UJtX9q0slqdgdBwJJJn/f/9rmhMhEEAs8fFq18kfob9D8rQ+LwhPW/KJ6eX7/ViwM=
X-Gm-Gg: AZFdTZenH6VSmYnLmcyIVOD0Zf2f8zzZhL0r5zzYm2b2FxI5flool3Wy2M/p10pymvX
	eXxUllMcn62k9RSUKj3c0GyI5ljCx9Po3EkpskloL9o7bld/8TOwZUQn33qAGsrqB0mLU8wx1e2
	XN7CgX0AQN3CiTC0wgi0QZRS9hlTufoZlqG04q45ImEN6iYjO8QquE8ggIBoeyYcbRG9+0HbG8S
	1wBNsI2oW+szozFZjY1UyMAOSS0KF1f6j/kBZRLDzYhmJ8VWLYW5V7zj3LyL6jBhPsTcf52rJdJ
	M+BFEge9FahN3ycAFC7p1Dxc7WvvZ6dfaRr+qVUfMFnh5cXdxW0ahTgHmOhhKiGH41C4+ZB5kLA
	epHe8z/GDzYDhKzG21N4Ui4KHBogfnklC+SjNDhcqwCYykX8F13xIuwQ84/tbv91GF//aJgQFGj
	0EAaFOM6Xs4cPUzEIOhymVWpIQg9rpv8q6YSk/nSHoojPj7pD/NpsBAwnVIuWrM19IhF+4jm5vu
	5rBhhU/ocJDKrLA9wXx/VKVKHB6MRaCT+mKWpVFb9HF5ogHxxjDw0cxm2IlGkMvu51fVPUJbeOb
	nzdCG7A295P371EEvnPlEEsq9dQVCpGSVPHMss1txlthFb3RXnGftFqVDRSkbhjlHGESWau5jL/
	5mzNKEZt1lfaJQ65HcBWPPJJEZReI4IPHwlV8FLG9PoTxwYEJ+mL9EeK7aXGPySO9bFxbRxYWTb
	xCAsR1dEXqgI5tBGUPdLhTP8H1xbTNnOh3D3CmqziC42iwF/M9yA8txAeLL0mylPpvtLjX1CP4n
	bIkKgsfZ/Qo+4WHft6ZLOyZFex7+w3Nai8WcGM/0DiyHLf9DxzroO+jKKi3mMhj/4PSj/4Clqfo
	H6t0
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr15259845eec.23.1795411895778;
        Sun, 22 Nov 2026 21:31:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 07/16] python3-pydantic: upgrade 2.14.3 -> 2.14.4
Date: Sun, 22 Nov 2026 21:29:37 -0800
Message-ID: <20261123052953.3658549-81-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132868
Content-Type: text/plain; charset="utf-8"

- Bump jiter to 0.19.0, fixing memory issues from the previous release
- Subclasses of @deprecated classes are no longer marked deprecated in
  JSON Schema
- Fix InitVar fields in the serialization JSON schema and validation
  constraints leaking into the Decimal JSON schema
- Fix more GC tracking issues in pydantic-core
- Fix model signature when a field alias is the extra kwargs name,
  strict=True for complex, and type alias parameter defaults
- Performance: cache the UTC TzInfo, skip needless schema dedup

2.14.4 pins pydantic-core 2.50.5, which pydantic-core was upgraded to;
with 2.14.3 the pin check fails in recipes that build against
pydantic, e.g. python3-lief.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pydantic_2.14.3.bb => python3-pydantic_2.14.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.14.3.bb => python3-pydantic_2.14.4.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
index e660a3851a..333dfc4097 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "ea492e04654ab7f7a1f9287ea912419452ead4dd"
+SRCREV = "1642a816171707dd8c58da6fff8061a59348402c"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes;tag=v${PV}"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
