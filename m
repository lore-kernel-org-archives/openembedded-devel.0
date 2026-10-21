Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8883.1792580515970719837
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B+jSkM0n;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so955621a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580514; x=1793185314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lq5twC8AgZzDjkJyY4WW1mCVwJb3Wlc2YKiErZMS4yM=;
        b=B+jSkM0n2nOqlSICvZAUTTSuen0339XVphqo5tETwjeCrgZoTXfOQwRpG8RRYSlcIU
         c+ClNIndtjQnAmDdE/g/OWfxILubhtkuijF98SDFqF9CpS3OA0SpSZbJskeahwwR9pi/
         JlO3ywi/Rd911OTFafHZb8rV1Ij8aQVO1FBF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580514; x=1793185314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lq5twC8AgZzDjkJyY4WW1mCVwJb3Wlc2YKiErZMS4yM=;
        b=ZRFFDOXoCA4zNYBKSoyFFvovlASlC4Xe9X3k5DkhZB/0qsVVlJh2Jx+T+DlhpIvtt+
         R/VFJx9MUZ4zzllGx2fWfzXUlU7xBurmziIJYwWCCDsTf8XGIHkAn6KSwOptLxAzQBFy
         vTXXP1Mx3hVJ3TAgc0xPWDi5yAo3KAC8Sa4ON57cDWloPN1RZG0RfZAvYDnUrQ5qxPXn
         ytJ8OOC6aInlL1/PxW63ZnHoF+S5DZ4Lh0O2YdJI2DivwNz7BhKvaVDHzN2LtuF6Zm3p
         EJrGEUiZ0Qu6a1Y3ETaSrCk6GzKS/j7hYuq6Gmab9mfTxH7xgtELi28IMK6OiWL/jSWF
         oEGQ==
X-Gm-Message-State: AFq9FYINoSskRbS/b8pRbQ7dk6e+NB7SoamnPJ9B4ASKPfK+4FU4dEiL
	o+piV89Ppn768SUOQxxKJylYYflHwnQbdHyXBItu7W3qTqH5TYTVdSSB+t86HnoSED6NjlmgEfW
	4SdDV
X-Gm-Gg: AYBFou1DvA3hkkBA72C3CExqcWyPwRgQgCNABmUkmCTgw1xdJl+a1GyyAcBHiEq4K+X
	kF9Zs7lQ5q80+V0EPQOd+2Sohl6ZNrdKhZL6q5EBJmFA4eyKUJGSygZxDbfV55Rdkzv0TvRiGSE
	CrtsAtMsd/i1suGN+sXnuhlZUxNxkPMFw+gUQ6HruEWzi65TZ42R+prpCMpB8ys1jgFdlh8heun
	4d+hi6iddkOeRLeMbJeiOsqQlA/A3K88TCAVx0eWnkWvtWfeApswIc8YAUa3xta12xynwIHgHv7
	WlmtL4Y2SAsf0dq/jWM/hEZ/lOTbf+5L55PKroIEQrC+HZtR9iGtIDLL+Y6DdWkT5FG/OATQtV+
	Hh2By4TfmfxARUCpcp4PVJeaM0/EY6cfy9G8ZbbIfYlG/YFazO/3nV0VU+xopHNAGElvKW6Rn5R
	/UmNPTv0h2WT8yfPrWbNYX8bQLUFXpgdOxBNT5lSht7lURFL1/UQRRYpJMsh+tnl09z1VIXdbUD
	sub+bnQgrkcozRFbOhQuV4FCaXA2//yVjP7IaO3EDWsR7rfi2/bJaYhNpFR8VM/x50ZP4oZGThW
	MD96LNWBNTBLC1QsL7wi/5QchRjOWBdeqjW9ysXEYUgumPGbh3u3jb/MtXe0kWPeXLUq8JL1bPN
	Prtlt
X-Received: by 2002:a05:6402:11cc:b0:6b1:a4cb:51fa with SMTP id 4fb4d7f45d1cf-6b408e9e79amr1100065a12.8.1792580514125;
        Wed, 21 Oct 2026 04:01:54 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:53 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 27/36] python3-mmh3: Upgrade 5.3.0 -> 5.3.1
Date: Wed, 21 Oct 2026 14:00:51 +0300
Message-ID: <20261021110103.1943456-27-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131285
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.3.1:

- Add Linux riscv64 wheels (manylinux and musllinux).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mmh3_5.3.0.bb => python3-mmh3_5.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mmh3_5.3.0.bb => python3-mmh3_5.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb b/meta-python/recipes-devtools/python/python3-mmh3_5.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-mmh3_5.3.1.bb
index c7f3f18ad4..ef15ac41aa 100644
--- a/meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mmh3_5.3.1.bb
@@ -8,6 +8,6 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "95832419b87b882bec9dcd7d041d74887ba7745b3659c14be1ae1db5cfa35cad"
+SRC_URI[sha256sum] = "bd86d0c86b52332319d981d03781ff77811a29db544a69902dc06b5506bb3e19"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

