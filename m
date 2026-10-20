Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6337.1792499561699499408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TrolyJMD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so21924045e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499560; x=1793104360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgS0/SD5kV5xcEqKA9y6eWH/gr3CAnKLuxHJ6+0O0Yo=;
        b=TrolyJMDRGU3inkbOkOzHH91ehUAFBcOZ80xOs7+/UD6UE4/EOh+Y1oK2M7693jv3L
         tyzZtzBvD1mUt+oD4F4u70E23ivIdgemCOVm++LcyzdfVS0Ud/+3fONvHfZTjrUKap5s
         miBnP8/93nxBNelIxvT01TkeBe04p+0bS91Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499560; x=1793104360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgS0/SD5kV5xcEqKA9y6eWH/gr3CAnKLuxHJ6+0O0Yo=;
        b=dq7dolUSvVunaHD0lm0+9xTRpNmrVwz+atcIlQIAq6IJ1oJWyqw4/cX+FvZ6tX9sX5
         bFlaTCaKNaQl8r7SZO1k+uhXlGCa10MouPhTboEuQ0lcSqTIlQVRZK1q+bDuLYxXkLRp
         LG09g0miXg+ApRo/nAqkkQnBMZC2RuqrmgoOgC+ableSUdxuMOhET9KCVtJ5KQlImUIG
         cWMZaeONwn1e6FA+TgzpZtgG8x3K0By6FeO157Lz0e3a+3mo9Vf/GgvQ+Qm4h36L82F1
         UqaQyO8jPOsAr1BaPtyW/cBfIFYZdLPgk7ZMsMgzSFksdtXZwlp7LHN3csjwMeHa9q7x
         o5wg==
X-Gm-Message-State: AFq9FYKjXpd9C+zcsWSCm4kdBrfH2MYQ+mqHhx0/O4J03DNv4ISB4CNU
	M52UONq4oKsv/5BA9UDo5PxDCqjjD98WpEBhqMCOiJ3tZBHRq45HP8jw+q4PqTfV4mw/cYrxAer
	qKmVd
X-Gm-Gg: AYBFou0eAOnDPi1wevwCzOOvCab2cugPkmburol5+Vcano0MNiXhDX7rIKecDlBGOK4
	yfEEJmCtT9T/Fw0Fs7GtZKDoJ9bGbIjiu1WVT+Qcyh//M6+d9BFYhye2Tq38YZzCNqmsu05G3O8
	ak21QGy/l9eCHRjcypPbUYAkXidrTzV8RWkD2OeEBDqYRUEoEuEsdK5HaudQUb28YkWCfg9I7u+
	CDweHwqz3z8c9uY5H88obeXJiiDdEco9x/JFN+ptuUfExptmA/OyMYuJnPp0b3CMxkHiLKgKeM/
	iH/8H8nLwJcQ2oJOleauBhIiUBTjMD4IQT0FafPK/TU/ITrZ8YWSJLz+Hsx8bG992OGvHn8tKpc
	a92Sn052N9hPla/5zUrbrZRj0SyjeSkLeFB1H+nbfQogTDb3YIT01+HkWWOa4A/zsT5njO2wpSL
	IIFSY+tduVKVC6Ode5iA6HHAY3jmVhzUiFjvAxAzuktsEMsCl0QY1pNhCp9cu5F4rezBtJRM0HD
	HQccmmYEdlmRyURFtbx10tK3VTqEQHpNLUF8b5DXvjwBU4gxWk+SLMZyGgY2Z7OenpTJUb9KX8b
	maCFF93c8qRwDtwpaYqlom0=
X-Received: by 2002:a05:600c:83c4:b0:4a1:dfd4:9426 with SMTP id 5b1f17b1804b1-4a1dfd4958bmr173680325e9.19.1792499559893;
        Tue, 20 Oct 2026 05:32:39 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/14] python3-filelock: Upgrade 4.0.4 -> 4.2.4
Date: Tue, 20 Oct 2026 15:32:23 +0300
Message-ID: <20261020123226.4033600-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131169
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.2.4:

- Keep GitHub Release notes free of extra blank lines while
  retaining the PyPI and version comparison links.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_4.0.4.bb => python3-filelock_4.2.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.0.4.bb => python3-filelock_4.2.4.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
index 23cc4484c8..ad4efd998b 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5"
+SRC_URI[sha256sum] = "c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3

