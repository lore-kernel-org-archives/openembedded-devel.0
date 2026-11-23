Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48067.1795411903758917797
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HRcJHF/k;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so3710746eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411903; x=1796016703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNBtRWjQKrAcPXFk6V1KfA5ZOaDP/vi19ROrCJHsGr0=;
        b=HRcJHF/keu4qnVl8YmTC1MeX3eBTShJDySGnEis6RiEtqvs+IDmqcV0mxfkXu26TFi
         yRhfEJNrAjUaQ8zWjbT9P/YF8+ezXSRtlNYNH+G2HvezguzOCD9MGr/PEjUAUcbfgvGt
         cE1Bbow4kofCqpVwMV7hgntosTSL+s0/iMxZZPAPEzOuGBR1mERYj//yVT+Sr7N4QvJT
         yrvJZygcWAeZVucjZUKPJga3PHF9ERC0OGZNE+gcoHAdfsTMi9yHz+r/Puhl+JElAigU
         6loDmm7VtaYYqdZYgm44P+xkvDw31iDpNzalfliHStvZrKHBb//eQcgJhkG0ejCxiZtb
         Rs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411903; x=1796016703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNBtRWjQKrAcPXFk6V1KfA5ZOaDP/vi19ROrCJHsGr0=;
        b=2X8Jcw/4SJqhxT+MR/zpgtOe3FDNtmWlBhoz+3Y+AkE/QxQizkH7fJcPulCuPVmLV2
         EZ/ik/geOkLcp3WKmTHWQOAV07so5tBv/t4cAuRvFzJj8uUu8u2bQyTWotlG8y/M3pZi
         rP8a02xisCKI6e6pYtGYT/vfOI9+23Nopsh7MmcdOcWHlXnSWoLZaBc4nP49l3QdnVTW
         mgTRLIuJDZ3QoOLTj/hbLIF0r14Yt8FCHuW7Ppet0yo2HFWKP7/2XPcbmnUJ+qmXtRO9
         9Ma03d0j9g9ut+xyJeUSQGm6tmt4Qm+ockDXh2o4N4jnex7pzoBRKmi4sxTLpYIBDv6w
         loag==
X-Gm-Message-State: APuU4Z982rOehlkA+rGl9BVR78BzcQi3Qv3yGSGz1ZSVoRP2RSnIitvV
	BeUpqK5G6WpPUIqXQbGY64JNwVwXfNj/srUjUpC8ymyZRMl/bpYUM1ltUtaWg5a9C4A=
X-Gm-Gg: AZFdTZcBd2YFsT8b4Ocf17SsTAIJdSShnRWKca7teqD9R0PH03aNx/hy+h4UUIQcAsd
	la7N/5hF2SGKNqZ4OsLLwFE/9np3SkyhOWLzgJK+N5UrS5eOu6r/da+ks2dOLazCUvasDA9qUjP
	v4jOQs33G2zkqc6tCgwxMwzDBUtC0AiJ33qU0ZVrQ0d7g7B2BpmjxISD63CEKTU6gqw9p06OJA5
	p4LNFE6mt9qEq6tWx+Zkm39ciUZ7eORGOfTM9TUl/8Hv+7c4yh1n1Fb22S6dBU1VOP9G3ra0DXx
	PuR5BLvHFulpm23wPHPWAaQaOXDmK01B17IQgVzGz5qt4u9QyecBR/DsWer2DYpfliY1VumxCPw
	eWiI+5OLLvD2pgxYODiEuMrEkyIJTpKTAbYK4eRu2e9lp1ADApVgfRXtgQbKH2YsFe8rpLXUtC1
	/qOEi5VTT8azk34b81lrHqZeO97SXEu+Dm8SOfycaHKlNhQP7QytjmtfOZEpZjtmBqGwMRsZJLC
	GaVyb6QifiAzZO49Id+UpydS7RV136l2W4p9Au+TY50KrV7wqxB+D2C95ESS5HYQD6K930r3DsZ
	9g7MfFkLpWn2oMvQlM6LoyQQCfCAOcNOkiI87m46/mroeHJMUmdhnel+9hUXNqyKMAhvca6jzyM
	CjOfhrVkjk3+xqYOpz1OrwyVp8S//bX9Yi4tVgpiWAGftos7jGbbUjjRJYjIEOZwCreF1nVnMDJ
	HD2HlC2p+VAEEyXZMzxfJNKVdq7AZSGyS9aaMth4p9cotYMQxc02sDZiP8Wb9OuggwJGM+t9h+v
	gWHidVd3HIsWBZ9qwkq+U+Go8CRhBKNDn6Ifi8P58qo7cPfD1I0kXmkPVAOw7qPiC8hLvpQI0uK
	vRIi
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr9578312eec.23.1795411902984;
        Sun, 22 Nov 2026 21:31:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 13/16] python3-watchdog: upgrade 7.1.0 -> 7.1.1
Date: Sun, 22 Nov 2026 21:29:43 -0800
Message-ID: <20261123052953.3658549-87-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132874
Content-Type: text/plain; charset="utf-8"

- inotify: deliver events read before a queue overflow and report lost
  events via EventsLostEvent and the new on_events_lost() handler
  (also on Windows on buffer overflow)
- inotify: allocate instances lazily on first schedule(); raise
  OSError again when a recursive watch hits ENOSPC/EMFILE
- Fix a race between Observer.start() and schedule(), and stop holding
  the observer lock during event dispatch
- Patterns are matched relative to the watched root (e.g. *.json)
- dirsnapshot: fix false moves/replacements on inode reuse
- kqueue fixes for duplicate and lost events

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-watchdog_7.1.0.bb => python3-watchdog_7.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_7.1.0.bb => python3-watchdog_7.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
index e206e93c5f..23ab17ca7e 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_7.1.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Filesystem events monitoring"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d3861e255416f49a1384474cb2efa097de165fb330d4c5432ce6708b509ed922"
+SRC_URI[sha256sum] = "d7dc3bf0c3417c002ee976e958479c54d8ca18cbb3532fadbe69511fa389da15"
 
 inherit pypi setuptools3
 
