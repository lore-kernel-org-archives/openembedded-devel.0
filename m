Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1923.1795113432525800362
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V6WQqTb9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so94872b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113432; x=1795718232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tdxGz9nuzNcbOb/r1gA8JkURN2+uDsgVT7ugsv8OSE=;
        b=V6WQqTb9acYumohimaeK7hlD7bUCvfWOf3rwQQ0hsq+3jhrcZW+DXA52382ROZzXzp
         jzaToGeJTLvvcyTp8lC6hAdrdgPQ3eZzw1BYTZcyZ2OH9Bfn24vE8n+mqDjlwmvq4gOu
         ed6Fb3TN9WmzkkQaJGKbg453YNhtu1zx3zTIZLbzJbB30J67FThQUiSAbcagaXjTpq3Y
         +jRSviyxSBy0qPwfkc8zcfPP/Zz0TpQWjyoohTdwgIgfA4+pcCmluYvMj0N//FyxaEna
         adif6aTbJuRgZC7tdHPzwbXJLqmaL9E0mQEQDcvkZE+y4JdWL6YHYrgy0lcEndvyqvgZ
         w2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113432; x=1795718232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tdxGz9nuzNcbOb/r1gA8JkURN2+uDsgVT7ugsv8OSE=;
        b=Akr14aJA7fX3/C4u9f95RzfkjgzXhGisxPEFmU7E64FcEEy6+bAUKKyGhnFww1insD
         vOF2AnVLHU0oCP5Z/zVsQfHNH7kcdkI4pyS4QWPbITElSA8Y0pCsHTKdSrXIAeOfeD71
         u3ou3CPmUqx0crSYT+gG0X9O9B909M/k0ERZoJ+N8+WCbVVvEamVQL2K+4U4Oz4U3HYa
         4tF8vwCOdB2W9Uls6jUeKuGguFAIMZvEnUoVg2oM0f5kTQDXcAwGWSNzdpTNjuCdvsyj
         D0EjiabNzTiztxJV3U/XNxhm/QIw0UOMkCbqpR+ONlNZq0TFbE047IAhgK/ZWI089oAk
         aXqA==
X-Gm-Message-State: APuU4Z8r8aO8V5oCAzSogNEZqKmnlmAXWfX7I68KI9l/IQiSu1Urwix0
	IwFaWQsKCP3cU/6WrcxjF4OablqWQA++GcuG+MzaG/dtdaHSXesezJnZjMFuKQ==
X-Gm-Gg: AYBFou0pv4cY9SQOPadT5zTG/vcsFcqqdSayD4szjPLkqaIem7M4+1+qDFr/xO3nthe
	jqUxGUO3aLVcUnC0ZeWzbG7PsTbIlBSifZI8kb0K7wvkDJDnbFnDv1y/MxMhC6+8Dvk8GryRwUs
	sroHLW2pRrRNKeITcJmJVvBxrN1kWdXYpgViyJg7QQE12y7HQwJwTeJApOhISucAjqBib4Og8qv
	Mbl8giHZ4WVuPkO0OrszymOqoycEANZEyxztFzA0pQxzUxIapRgcrMacwonq8Djrn/zMQEzf+EP
	+nK9rPAGMDDAWqyiAJ2SW7+JnEx5FBM+usD2cHwStAT/a8KTHEoVbn22swaPuDIjni408GCz/Gp
	+Pxyj/t3NsZKo5HysJC6+xANp0r6FtIU15WJVP0pcs/9rpxDz0alm5+YbVkaAIhb4g/HEff+IB6
	xUFe4j+s9LgUaFpHe7M843HsOWzCOO/7TRuEOuffnjfFSAv/y7Mv10Oh+1Cn4nnd+7flq+AhBqK
	Oa0PzkiJMGYDtCH75E3U4rpiBJpTgFYWqgxpSXw+6HnncQswzwaPN6bx6GJJDnyK268P4oT6dwP
	HOMLyICDZJ/tUZUuIU6fb+YDAdc7FY/WXhbAGl6kURdZ6VAstDn+s03D3FaSBKh1m2Z2t8bXW4c
	IlEhbinQ=
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:13e9:fbdf with SMTP id adf61e73a8af0-4014d4587ddmr469234637.35.1795113431795;
        Thu, 19 Nov 2026 10:37:11 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 30/64] python3-django: upgrade 5.2.18 -> 5.2.19
Date: Fri, 20 Nov 2026 07:32:58 +1300
Message-ID: <dfaec30751fc2f01dd0fe18d64458cf345edb3ca.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132720
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.19/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.18.bb => python3-django_5.2.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.18.bb => python3-django_5.2.19.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb b/meta-python/recipes-devtools/python/python3-django_5.2.19.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.18.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.19.bb
index eb84122116..9cbf0243ed 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.19.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"
+SRC_URI[sha256sum] = "ad03d8abc51dbff95ebf34b27123cf0c26a3b62db7ba0cd520783686362533d1"
