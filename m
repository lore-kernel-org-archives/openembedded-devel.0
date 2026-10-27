Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14850.1793092868961547436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q2j9MHy4;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39620675e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092867; x=1793697667; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APGQoTYmy9Nx4UbUzmq4dyxqCQyUtK0rnOJcXX67tU8=;
        b=q2j9MHy4IvTuOpLOKWZNVYptW5VBpqWonmfbFd5FjYHGUqelKsv1UaKOrnwNSkNmpx
         cA7t6bPN4VqQI+zUlTntMDcTwqzM79BiMrhpi8iIQURzsk2E3brTZU6D3kHE3Lc+m1m8
         nftdigwYPyLTAAn65snYPC46Y6aUVluPOfO4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092867; x=1793697667;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APGQoTYmy9Nx4UbUzmq4dyxqCQyUtK0rnOJcXX67tU8=;
        b=RmV09sAP13GxhhK1wyBmpG1vBMhDY7FRi8m36EDLLw6YLr0Xg7DuCWtY4uSc+v6gTq
         PMctA0SN8Bw8yn/kF4LDaR9f8Z+0pS4JzVmxa8N5iNcnF/8rur18Db8/ALpmWliYoUeR
         sH+JLNm4HeLJJ0wjFPJ0h6U2Ir3Efs7vPz7mHg/MB0oLIQeNj/5HjgG0U3FUyAqYGtLr
         J8xP3gqXB2rOa5raLJvVe3lHMAfq4NRlYvvfU08nT1QCmbkLTjVW+vIbevHIKZsrd74N
         lC7sgJ6esV/U6vLcInoDscerXwe0ltj5Vd4a1rVH07eTSjxXbJdcVBtrQWpyzS3hz2oD
         RM8g==
X-Gm-Message-State: AFq9FYIFUJ0bW29Ig9lB4tbWBxwEjBe8VfxD9X+YVmRM2uQQ2xITIVfH
	25b8lvlF833kiodYKjlkJ6dgoy5/u8VJezrFykhmT3uO0kM6HjdkyD8sf3m2BY/xAm+v4jQSziL
	Tcf2V
X-Gm-Gg: AYBFou3SPEEKw0z2K/irvytZqh3PHzpZ193A3IRbAaEkhsCnDe21aoeyxT3xhvX9mcX
	+DNdP9kSExQQHA09vT7J0h0ehkEE6pFGqFjANSotcofnHwO6JKAafjPXBwrTV7ro/8mniGWY8Va
	SSq82Sw5+LViHFABejg85djWEzSSEqoqz0bLM/+9+Milq1sOjjhahU1hNssn1p3NhoQygurOczB
	r/4ZLuecdQjavTmaTODyTwYFYJ1jwAszKAbSDkXHXjwqXEi/VRmEWpOnQst6Ob+7RNKyIjNW70y
	S+LgxhmjFvrYOeJdU2AZD2b6zBZ0XFwyLiSW83+ipk+MzxdVQJMGSsTFLOHUJqD0pYxX+z9a2ou
	KFZIzShg88IqWkRkRYIjPVuWsysuwtQHKwt8wWUZIjWNaylv2j0lMQU191WLqNKMA9DI75NiZem
	kZa3/Ie1BdoPECR4Snxl+fAzrtM/Bz75Wu1d/elaznT1fxbKOQHSIDg9GZVl2pEzoTk1gGnG0cD
	v5fm8YsWimPAOXnWpB+9SmR8n2HeL6+4f7OX94jA8JAPmSgZnvEcbIMcV1JTobm/8zJv+pa3d8h
	7QKf43OpSYlhNO9xW0widKeUcMHv57Mg6g8/oOIj5E12Y59TSTT2JUqYQzXi35xf5zMSTy2hbl2
	nmScz
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr187829885e9.16.1793092867260;
        Tue, 27 Oct 2026 02:21:07 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 32/61] python3-pytz: Upgrade 2026.4 -> 2026.5
Date: Tue, 27 Oct 2026 11:19:59 +0200
Message-ID: <20261027092028.782979-32-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131496
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.5:

- Add Python 3.14 to test suite
- IANA 2026e
- Add Order in Council for Manitoba’s change
- Fix misuse of America/Edmonton in example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pytz_2026.4.bb => python3-pytz_2026.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2026.4.bb => python3-pytz_2026.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2026.4.bb b/meta-python/recipes-devtools/python/python3-pytz_2026.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pytz_2026.4.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2026.5.bb
index 4a2eda07a6..4e210050df 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2026.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2026.5.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63"
+SRC_URI[sha256sum] = "fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.3

