Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36048.1793161479928921830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PyWa/rdV;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so312833a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161479; x=1793766279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=PyWa/rdVnByd6+eDn5yjv5s3IZhNyZNkEJwLVqcw88ChCMCRN5UL8UHmQbdPYVEOu1
         JPN9vSUQCM23dpSp3W6CnvZZ0sGs//6jNIGi7CCXmMPiIO7UM83mkg3aiTen+4EYiixf
         m122YJm8pQeey/rPh6kVThvV6c6R1sQKzCVLaXW3s2mBJSf1nGMwU5v8La4GW/nE9kgd
         aVQbE8iv+dWwlhqDMzL3/i7YsKQVtQqOL6w3ZvkUoII9CQVLnofzvTWTPqXTXAfMqxIg
         L4y4YxacJqnGSPCtukQ6AnR77AXdUZWRnEzjR2yHFF26YSkg8qx00fHW1kNXprU24Shc
         z7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161479; x=1793766279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HOihMnDMJkcXyygoOReELhms2F3rzLvYN/eIk1Nou4=;
        b=uhnI7BHGMJ8hUBwC7xzLNvBUs4DgAhXksc1KkzF6/A+lROPk5IKJT5VdjpQ9mGGrSu
         j2M04CGqUTxqy79YSgqGl6cBBMCoKeV6fuFP7wi0KXqz+dAWbwgjL51DdvPKr4agX5LB
         anYjcSHDWWwZ6j4nNXdguezmJaNfJNBhRT7CC7xTrsHgmb5TvQwZjTt0JLN3bQxOX2c+
         bxuLTy9RyG1F7kTGVaGfFF9DfwRtmG3QXIb1uLsKidIIrORXPNO+STUYUJvBXh8cOdS5
         gQQcDyLfzxGf9Y0+oon38+AXl1QKcgxK3fRi4+/S0w/eJu4koVm8Tiix9aaDE4bJcLlb
         ucBg==
X-Gm-Message-State: AFq9FYLuXWbzkALc+GGumhF7KLQpoioadkfFLLNdK2f86FzpJJ41E6zz
	4iNHOoYQiXEsf4cMKtY5gxxp/7xLmzO8o0FIo4dLgW6q5VfMYRwuPE3fNM7lUg==
X-Gm-Gg: AYBFou3KnPkn2HUcbSpDCuYBOtlyhBAJ4ksi5bkvsIalKk+b28NqVAiRaVQhMTD8No9
	Hgh0Um3ufVqpbpmK9z4WM5Gews7JilGQVfOhh+cTwuf73uXUyRALLNxRxHE7pKLhH1UOewOhDLG
	P5rxGzN+cUhkj7uwLxFaXXo7raQulbAgx9Ud/GU8ig1wUfrP6z1JKDMqxgxqK3ItQZSbpZpePxp
	99USA8fjG9VMmxkB+VkW+QGJxb3VosV85P8od5ushDcVHmHfG8CNgHacHiMdKxOkD26czHBPD4u
	Ie7IMU1JcB9oILo0IPWU6IxIdVnH3AYwlzQp3gM18//5WagcpEOoBg1YgVmQNqzF9LG0/aPZboO
	NEzZ+keQjfWrZElAMb5TmDafKjcQqcxGgOiyiJpsvaUwWyay6cbldMSi84tjz8lXjWBk3HaCXsM
	8Nq+abDnon3/WpSwoPzUTnvAvcwj1alLYL6iqOnA6qVTGa5ie2hNa3OcK4l6+lNelVnFZLjunlS
	S8aBWDezvJLhBRiP7pEbZyOLt+aPMzxbeaVWYhT3a3KBYvSPiXOFhPyBTrVVnwjcRFwkPjuMUnP
	0phTyHyBJw8fsSfyUNGZwQvq9ZAflxnR5OL2mGd8gNIdhURldzEOEaGDbt4ktA==
X-Received: by 2002:a17:90b:3c83:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae58324cc3mr806071a91.65.1793161479220;
        Tue, 27 Oct 2026 21:24:39 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 14/60] python3-cbor2: upgrade 6.1.4 -> 6.1.5
Date: Wed, 28 Oct 2026 17:23:12 +1300
Message-ID: <bc11cbea9e21924bcba8e88cb8de67c7e130d1d8.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131566
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/agronholm/cbor2/releases/tag/6.1.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
index 6a894848d6..94d3f30dbb 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.5.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "01ecc79a28f33d17331943ce508fc1e21f4b06553c73f874f4c77120d72b2ef9"
+SRC_URI[sha256sum] = "6eb06160c42315ac0c4ded461c7d84d92fa18c69d13d17fc1dfc1fae96580c95"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
