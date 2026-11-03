Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7967.1793701450348312887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tQVjQS+G;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so44248625e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701449; x=1794306249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asXcxWTq7B4mQ4TVUBgDXP+R8U+SAf7T7pu1zu9Hsgk=;
        b=tQVjQS+GTWReGywi4XbEhbWsW4OThTFr/PQY9S29mSIl/aGLVcZKRidMNcvjJUN51w
         mAcrrkWVAoxWe6Qg7mibOzmJhyr962QafRaA/QjV47AE4LNGeIBiNmQgSGZnUmBGpg5U
         YN7zrQ5m7QiQqY+mGYgjcnOlZAgjP1vBn9gTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701449; x=1794306249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=asXcxWTq7B4mQ4TVUBgDXP+R8U+SAf7T7pu1zu9Hsgk=;
        b=Cre5tRosT11UYrEIoqnMPjf0hpAopV3KH1LniOzlMyV4hrbmPkEAU3WQRoKoVYZLKV
         JjCI+W3iM8e9NuEcelsc/PgibpzAx/uSuYcCBI46I+f3Od1e89YVx1CE82j2ZOVyClG7
         oYfidwG5MX0JtyDLEGtT0FDjk87Xat9xwnEmwoUGgLqzRDZGss3gyEh5yhgMK1ihBZjF
         hMz/4E53d6q078CdqjjFBdwFUk+IGyvbl40XvCjl9LXX5PZXExz0PHMljeVsleHC9TVP
         92GXztMnVvKIugkWiiWxTQyvENMSf6/st0yt/ppH9fl4IMo2Rl0bsANqcvWNP9roNdYi
         2hkA==
X-Gm-Message-State: APuU4Z86pgZG/mhq30n7rn/xKqew5R3W1s8QiPO52vZz49EKWqIHKyri
	YNzMDXyGalyzzkKEThaxoYfpuYbDqS+6UNC9ggT7ppllAClrKShUm3Fi4oUXsxBOgsSFgU55bhG
	NXocB
X-Gm-Gg: AYBFou2nZEEvtc0T0ouU5QpJlAdR6DQZah5UZvrPTycnl0Adxs+p7ujyP562rfWXI+B
	ArerlT4R6BAHNwwKP/qxuPu+yYiQHKMM5aK27Na6aeYF20kAedBIG+7s8nEKZmaFJnZ+IexOIAx
	5GSXBshDP3TuhCVKvPCjpZse0L9AAo20xyjfOzV53Mx+PfNhcl1ziHLVFKYMT+ynmg+9MeYDkoy
	bTjIoQtkjD1bl65f3ktHnsFZRgtzSJurumhYjUqg4n/rThEzX63tz4/M2aHXRHVeDdzxjHVRGRB
	BTQ9xp27DTIsoEtVDEDh6bYOWu2E3qLVRARLvnC66HFkF9qpk+eAmBv9RsC1wDc15qizOFLlyCl
	zXjnzOUtqZlBQx832vRRscZejs8NpLftuqIMZlRJ1k5ioY772pt+TEN9VU3RdStbPlUq7Qk5Mur
	WuaRprQD1sCywSMN5JTpSk/waE2JaUtidwnPtumoAI+ItQn7TSERJago5HS6IsK28MTROTs766n
	iG7+M3kC3EgHdIeaQbIoJIOWGRAvutgue6KMk6E6Uau1lLKnMvgJg0gz7jeSt3TX7Z4j7lpkG6/
	98gI+wQpDh5uI06C/CzNzfscXqRAzRzdlg/5l45fzlpyopGcF+h/g2qSkV6DYAU176upoe/ysp9
	G8qSIyUj+l/UEkkiR+lOCrvvDdh6VKbPeJBLMpoUXPWSTsbACz8tyig==
X-Received: by 2002:a05:600c:34d6:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4ac150b2192mr294207035e9.3.1793701448707;
        Tue, 03 Nov 2026 02:24:08 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:08 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/22] python3-fastjsonschema: Upgrade 2.22.2 -> 2.22.3
Date: Tue,  3 Nov 2026 12:23:33 +0200
Message-ID: <20261103102350.1952237-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131768
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.22.3:

- Fixed property names with { or } being evaluated as format string
  in error messages
- Fixed numeric keywords (minimum, maximum, multipleOf,
  exclusiveMinimum, exclusiveMaximum) being applied to booleans
- Fixed propertyNames: false crashing on non-object values
- Fixed the date-time format accepting months, days and hours out
  of range (such as 2020-19-39T29:00:00Z) and rejecting a leap
  second (23:59:60Z)
- Fixed the date and date-time formats accepting days that do not
  exist in their month, such as 2021-02-29 and 2021-04-31
- Fixed the time format accepting hours, minutes, seconds and
  offsets out of range (such as 29:99:99)
- Fixed minimum and maximum being exclusive in draft 06 and later
  when exclusiveMinimum or exclusiveMaximum is set to a number
  other than zero
- Fixed bools in uniqueItems
- Added type annotations for public API and py.typed marker
  (PEP 561)
- Added message to JsonSchemaValuesException joining messages of
  all collected errors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...astjsonschema_2.22.2.bb => python3-fastjsonschema_2.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.22.2.bb => python3-fastjsonschema_2.22.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.3.bb
index 04e2a3ea49..90f5fedf68 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.22.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRC_URI[sha256sum] = "72064e12356a7d6ef02165be2946b9abadbdf238536e07eb587e3dbaa33099cf"
+SRC_URI[sha256sum] = "8330c91b027dcf941efcb7b1f0998515ff95d177ea15bbabdfe8671965620901"
 
 inherit ptest-python-pytest pypi setuptools3
 
-- 
2.47.3

