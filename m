Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14654.1793092850171601933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kEQxNjbo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27260295e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092848; x=1793697648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IZ9nttynXZYxkgjOU/gRkxRUL2s8JkcD+I1EDbz1A0=;
        b=kEQxNjboYw8jmQ1wKjfuR8qIgiyABGqL/pJxj6xgSwG0o4OPRSvU0W0YBkd34iyaKY
         LgXOF0CYor6udb275ab5hXfZopmrLgPl+rHS5HKw4mtflLxCgZ6wJ264YjQ6Z9mNDvUZ
         p0RglnIeem9DIHCsLNoaR9UbOf7lAt2y7MkKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092848; x=1793697648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IZ9nttynXZYxkgjOU/gRkxRUL2s8JkcD+I1EDbz1A0=;
        b=tmDeKH66p+4743BhYarlhJqYSKGnrswNbUC64A0WFW6YbfXivam45Kvtqvg/ZBh13S
         S0/UoB7Ltip3zpwrD6PAPYWN45y26gmOeK+FyJxopupcbbFOQvezmg37unK3rbquC63b
         FMOmSXpMi27dYPufY9K0WVtWQRxvb+S87BrJu6fSuISiMnZfXYcmEpoWcqlXddK1h6CX
         nU9Ia2vQ+9qfpYDxD8Kc6BSItNTRiqbPZFCNw4yamSv605YGyBywruxj8XUAA/Q7QgRs
         OiKN5pdvdc9o3dGzZZqn54BdEL42AmNH9ivAvy6C4abUaZcy9pGf0bLHzoDYwcHPbnSm
         BkPA==
X-Gm-Message-State: AFq9FYLQ0xiHAP2qL/pN16eGDXoOd1mbjo4Xu0pcfoLvQG0hu6GgzuhJ
	sdV9GiP6/6UN2KJe+T79EQXdQvPCbYi0+SGtnUKrbPwAVGxgFUgzIrogpw9jlukMysWV+9azU1B
	d5qoI
X-Gm-Gg: AYBFou1A1r3FvkFJJuNW6SpVCCC8GzKA2lNbTiBxRoOxEVZ0e8zNMZgw03ahfE/1eLF
	8dmBA+4ZD6lRIGmzJfDsdMUg8Y+rUHus6x9hPJIPEqT4MK6HBAQgTNrBztE1QyIoDOdnYExk0kl
	W3yqI24xrXyPd6/tDxV3fcDcWOy/dgaRd1WS6LqnnCUjX/H3dIqlrUht7FOdM6mxvZekq+k3gaU
	c+4RM8vqWazBNmawcZGX1P5NQFb0kILf02ttRBmxJTF95p2E2rKey4aQONVYwAA/yPNrTB+NFAz
	BUu98ETOefMM12kXG+iWnWqXzYdahXkTLhNLtkt34+njWqzWK4Qu/329tHTIXVvLrNsWpX3x5KD
	ouic1APrLCuvyLffE3Ysc8jsktXiEq34c1iUg5QMhDWslC0Qi2VM2jmEU+/UYca/5+lRoYFXkb+
	x7MW4ccgOCSqV87HUuIbfTolzKku8uZPCK+jf2Xh2h8H7vsscUAzgJdwsf55GGrd/HhcvVIu6CV
	EX3uHcaT3ZnvzLbEFNxD+Sbc/dV12HECBSAd3+tYXPrbuFPF/GQVphl3ejoIBwguE5rPO00Hy05
	kRkdaK40iWgy6bvby3SzccW68FIRntemGHIP2u0cE6hh1xMzdfN7BLN7ghMeAYRVrLeQXWVE9ig
	94qzC
X-Received: by 2002:a05:600c:4f55:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4a35ac3d022mr184587125e9.4.1793092848451;
        Tue, 27 Oct 2026 02:20:48 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/61] python3-pycodestyle: Upgrade 2.14.0 -> 2.15.0
Date: Tue, 27 Oct 2026 11:19:43 +0200
Message-ID: <20261027092028.782979-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131480
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.15.0:

- Improve performance of module_imports_on_top_of_file.
- Improve performance of python_3000_invalid_escape_sequence.
- Improve performacne of missing_whitespace_after_keyword.
- Drop EOL python 3.9.
- Add support for python 3.15.
- Fix loading unrelated configuration due to commonprefix.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pycodestyle_2.14.0.bb => python3-pycodestyle_2.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.14.0.bb => python3-pycodestyle_2.15.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.15.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.15.0.bb
index 4389198fba..cf4171dc03 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.15.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "c4b5b517d278089ff9d0abdec919cd97262a3367449ea1c8b49b91529167b783"
+SRC_URI[sha256sum] = "318f5db083869b4c4dad922d0b11124fb27ab181b6730b93371da671e31bd50e"
 
 inherit pypi setuptools3
 
-- 
2.47.3

