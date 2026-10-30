Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8942.1793358214425975435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AjFmsbWM;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso529869f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358213; x=1793963013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9HiARvFqvHrlOBJ/At+xUW9SaYV+ShQrcyF3GLRZgg=;
        b=AjFmsbWMBjKdb8kRQjQ7bw8imESU9o+c/Y2CYjKkHkfkbCZa6haOTvyZFcWCusvc5A
         VcuwDAe/47QFDMVDJsDV7BbT1xyFq6taDTUpsxjIGWRUgrdnGSh9EuYggQLwCL4C1cSC
         L06SnNATFr5Ffh7EhqpUyJ11VNIu9gaWIf5ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358213; x=1793963013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9HiARvFqvHrlOBJ/At+xUW9SaYV+ShQrcyF3GLRZgg=;
        b=W6q2qn3Y3/KDqWSoRcTFl9DmHxC8S1yHcjR+6bUVyUsCpdea62v23ox3AAyKu6Ifwm
         BKNtAGX3FyU9LkCEve6VhyOnf7LFljMoa8J6tD7tsCfJ8x4xLAwJf39+5a7xhpQqQxH8
         wvvGQFkw7oLX5S71EATTFUdHtocHsBRp4azH8zr0CMbAtUlvQHMvNOQxF+5EUHkqZMnq
         0ttTSuzVSXM+Nb8EpGEfhPckbCjbixUIR3aMr7JiYekeGa2ew14VLiU1dy7IWHg7BMqR
         o0Zb7TXbEI+aEFcEc+5dLCkn1GcqG9aUqOol05EIjHwRQufcykeGA9CnaKM10LRcqbju
         1ElQ==
X-Gm-Message-State: AFq9FYI6qcClpLxdQxUwiP6CFGWqc85vXBA2B3INy3AjEwub1po4Y/aQ
	X1aYJuqkg4ix230nwRh/pKHQNSj4nnpAnW/QqVvQ9LyZt8EEFc7G5oZUqAXG/UNpBoJ1G5/aAAX
	lGf+Q
X-Gm-Gg: AYBFou2b9jTWt5zOPw5GXVo+3E/UFv2htchrtH7VSEUZ6gDGY8fHJqRPilGVdDGFOuW
	vR+v/J9xOa8/xCt+XYB18F7bf2Aq4xopzJfLVJdHxWWWA6w3dng48eEq3/xPSoyxB1glhDWjVeN
	wP+5AzIEkDZKNfm7fWunJ17KpGJSiZjWtpQoQbc7t/RQ2ol7OE3NUzOt7vShSG2khE002cIuwOP
	lSUpKjtqv4mzZpjdinWvFpDEG7b0wJ1MPwf/om2TLzJL1gUEtirtRpogkdEjVsdzyfwiHP9r+uB
	HIpP0noHwE+7m1sRr2ZT6m2nk+S7sbl8rpbQm21KnUieWRvnDYtpgeJ4tufOPoU4eLgQkOHyP2B
	hJlGu3JPpwPk1IVC3dB8x1LVVjyRM3TAXEdFlB++g2CEE6h5Ujs2eNhJdUNfxpW59as5V0A15mk
	RLyOopyQbMlHIe7er2ahQOOu64kvSlgDMKGxptvxok5GAEJlkn1UaPLBnEICBTe5eAVjRfYBpnC
	dGnWvE+7JRgRM8ncH4KEyWDAGmEuwx27j5z9KIfbbmoXJ+kLxuxPPYvUnigkVODymzsBYgvRXuD
	3Ek3dvaSVDHqBxS1/vqkc9A2Mx6hi3KrroampoKIdRIYsCeWCQIl7uSANp0ScKb9b/iHL+IrzJp
	SbqMD1iBPtfNGiEXRPpQdyenrgRrfPSiMZ9ugmNOC24RnDW/GrCANQQ==
X-Received: by 2002:a5d:5e8d:0:b0:48d:fd53:828d with SMTP id ffacd0b85a97d-48e6e50d75fmr4483906f8f.30.1793358212640;
        Fri, 30 Oct 2026 04:03:32 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/25] python3-tzdata: Upgrade 2026.5 -> 2026.6
Date: Fri, 30 Oct 2026 13:03:01 +0200
Message-ID: <20261030110309.1124614-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131699
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.6:

- Cuba will not fall back 2026-11-01; stays on -04 through
  2027-11-07.
- No more leap seconds, and leap second tables no longer expire.
- Improve 1965/1966 data for Brazil.

Changes to future timestamps:

- Cuba will not fall back to -05 on 2026-11-01 and instead plans to
  maintain -04 through 2027-11-07.

Changes to past timestamps:

- In 1965 Brazil ended DST on 03-31 at 24:00 not 00:00, and in 1966
  it ended DST on 03-01 at 01:00 not 00:00.

Changes to documentation and commentary:

- Documentation and commentary now reflect leap seconds' demise.

Changes to commentary:

- Discussion on timekeeping in northwestern Ontario has been updated
  to reflect that provincial regulation has been issued to allow
  these areas to stay aligned with America/Winnipeg and follow
  Manitoba's adoption of year-round -05 after all.

- Discussion on timekeeping in Saskatchewan has been updated to
  document its new Time Act, 2026 which comes into force on
  2026-10-30. No change is expected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tzdata_2026.5.bb => python3-tzdata_2026.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.5.bb => python3-tzdata_2026.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
index 4590cec28d..b13eae98f6 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
+SRC_URI[sha256sum] = "85d2cd9c09f81f0bb29db27759fc83af4f1e620efb814f8c5bf8b4cc4feece6d"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

