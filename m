Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36047.1793161477607085818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZviNwzlU;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso191137a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161477; x=1793766277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=ZviNwzlUl3E45+FZP+yp4LAcxgCAWMzWyBlqWadTkwPEIRhJ4np8QQ9UxYIfiBbRXO
         JeagZ45TCnS0u8E/o5Zgee+ghY4IVduH+kxp5mW7MN2gtFy6nol0Ma++7MRL1wqE/JJt
         n5U4JHG8m0S0FXV16NsfDfQ4Mr7xvSKzGMUoi8/eiqmx6uWQTGbZZW32wl8QxxrSC9ON
         q3n/NjHpxFAeawcP1QhsCyJz0uiuOm9StJW2Lgl09Q1rTT7BoGGpHUSofYqQ4OV2dGpm
         0zTGXZukV3lQ8prYAtXm3leiI1kOpVau1hrAx5k8D5bSo4WyrSk4c+eceYF2PGKEFnfd
         5X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161477; x=1793766277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=eAkgziErNTom0g8OZvGCNp2NKlwedXSomu8a9iManDfJkQIpNuEAgkloiM6GL4827d
         eM/LCo2XyCVDQ6Hd8XdWFb/Z3iFl87pEv8A3WpfR4pnXL2/GK+EPOzj/oK3O1uD1GcSO
         kzVOIYLHbhU/mWqETxN5+RhxYlA6/HBh7scRXu9TCVsHhe2C2JKtEMiT5gtsJo8scBWd
         z2jkHcBPwM+XhK0G1pC07q3n1M4tHTk4dJsl9o67RBkaA4bSz0v3KlkdJqXTkRqFeWAr
         vpfVTRop6snaq7+DEiJoOS/dF53gKeaBVisAwSqtxcq3lalbDxLLFnO846/AV62u33Dp
         +QTg==
X-Gm-Message-State: AFq9FYLEA1lYBqgcCmHKuIN3DeGuweQ7vQ9ha7lcuN6X1eDaE7rggbZH
	xcTxwJ/uUT85MI1ybC3YQ3yMn2vdL6C6AomkcYhKixQPOsqnrkga3Q33aE21zA==
X-Gm-Gg: AYBFou0vDNiDNvbp8BX4AMvrbDTJ+oE08403b5u9H1/ZLu3SG35FC/IUIQ1oK6VXH9R
	V22R/7DxDFzj5d0VgLDAEw91MIjCE097ItNqRyDVlicWs//pIjtdnmkQB0HBVMxCA0yksRcwvym
	3jSKKOcN8E+uZkQT5UVGQHrL9QZ7qKJm9FgMTbJOKAyJ+fPsm3WNaEwqKfS2e1NFMr+8q+loeA7
	QpxOV8e2e0tQSqzfWvAxocOV3I2dq+THSgj4PBmiPlvFBPjqDLwZYy40Yi6xizUHBQhTxVbtmAR
	Nablab32d+eL5xJiY3qpD12ZBS9ULEg/iHVcrtkymRoj9+Kor2lYc66PBocTqox0ZX6kgEiKeBV
	ATm8ulsnFWgLw1GZGd4O9vzcQHIEqbt8jLEYQuu0+XYVCJJ2lPlqegSTU1ZinEuEtI7IpbDZGzz
	EbeMqeZvbtb3ID1RuPMs4e8Lv7CYfbHK2XmwjqaO8zrWZ3I3LrIWAn1a6Cka9VnBWtovaTbt59j
	R43hCHglKi5ld0K2ksK6cRC0W4lbjvqT2Qpc3lqhsWBSd1V9TWDdWRU0ndHHHdihnm5mQMEhmOw
	b5irBCMgsdQLUNJlKNBQwT4vlP+LN3wh5NzG24OQ4sqFAlzCn3HB0bXbkaXG2g==
X-Received: by 2002:a17:90b:3ec4:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3ae58236d16mr896491a91.54.1793161477023;
        Tue, 27 Oct 2026 21:24:37 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 13/60] python3-pyjwt: upgrade 2.13.0 -> 2.14.0
Date: Wed, 28 Oct 2026 17:23:11 +1300
Message-ID: <2b5240d70183fed9e05b4b37aa2998b562dde93d.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131565
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jpadilla/pyjwt/blob/2.14.0/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
index 1b018f605b..a2cb84587b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
+SRC_URI[sha256sum] = "77283c83fb56ecf566a886c757a714bc83668e38156de2cce8263302f42e0b86"
 
 CVE_PRODUCT = "pyjwt"
 
