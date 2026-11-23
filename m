Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53673.1795440982156290958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kQNX5QXG;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso24473895e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440980; x=1796045780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLSWypChOxSEIRZEi0rEfDyJeKRJpC789h32X7CtahM=;
        b=kQNX5QXGWMx7caTI7c8HxsM6Ci34eGtV+aqpQ6KD8OSKF7Bv5uuD3AV84pYrss5hF9
         mhQdoo54BevKF8ECXWwmsOcYY3FgNCwZCVdzxy7x4d2goMElK3L5ORYc515Ex3t2/xmS
         ui/mikfavLMnCvyN/aBycBddy33oN9D5rIOYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440980; x=1796045780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLSWypChOxSEIRZEi0rEfDyJeKRJpC789h32X7CtahM=;
        b=2AP80vdeR9S8G58mfF2HBajGiYwi7HeWOHwp90hVW+rnztcm/ZFr61TOxi4YW3ad9H
         CJYfEgqwc994b4ZuGOQlXzHqPvbHKzs646eJyysjLXvFYEQadRLnn8UHpN8bS3yH4wyG
         zBLBal0q4ZbAaUTWx7anWUwNLVO8MumNpU5YGXVYXUpHNziSTdnCICrQaMKuJw+xq7El
         en9KwS3QdUO3ei8CIW3NUE3Vu/3s8TBbTLR+aDX3lSr1pVlocsaJ+xxMSQ6CC7R3Naa6
         iu0DnWp+QEwfpSTaGU8I1rZNrtY3dprlJcJKeLM+rlGtfsE7+zWjxygEbS/Q5oZLxFsV
         IMJQ==
X-Gm-Message-State: APuU4Z/4VTGMChUnfgXxP1mv60nzL2k0N78D4Nh3r+tucwXh+EFY+tFn
	7WnmaTL0bFGhLbszh+DAZrkMmF2wurgbcTTgdwZi8/DP3KZcnwy3eF6TLzBaq/19lA3BtH3HL4e
	jjjIE
X-Gm-Gg: AZFdTZfnOB2SklFDQUDh93uXzQxWp62g+XU2dcj9CWW3zX6HGQcM0TfK3d9RQxkPXDT
	5BCuuUM87VPJhSmr5G4ZV7LEocFkVH1fu6iCxcBrV6jiSXc0FnXQNwQ0dnWv3NhYqBGFQ/Vk0zz
	ptr5peJLXQ5jp+2AcyVDMtIDXwluq/kC10QrjMcfQbgEmywKgZYUpR0sQxAuzYpPAicCdnUa9ua
	U9I2rckyQmE7z04b2Bfov49j0gLYhMXZtgofgpoiM0EVLwoGbSVtW8j1zL+OY7TjfvteZ2YfqHq
	qdnOAjxfuhIfZlMo5Uxnr7CMyyeChQ+GiWMfhBhrwbe2fA2ytrszj6J89SWxIyIDRfIOEbrsgKu
	uxaJEwEL+18a/P6GPyMTLyx5U565YQ+3jhiEeLAiI5SpEV5YgAXLQuyVK6niebebKEtWdtRtZO0
	a8+rhUGAHQzcchPz8/6rwcv5IVBTXKlEbOUg1ea06VAoNz7zBdsu6UmKVcR4FTkiKBfU3wrO1mX
	IGmhYQ+D/K7IeURZU9IkJkYgH+EZ1SQK5JV6o/+WU8+gju0VlkHyJTI7oUVG9bqiLJcnabs+SC+
	VS92Td6/HmY7Zm90VkYVjYwVeHHd/Ljy2fsxhHaRSLsIxS3FIYRtV0wU47swDZZbuNMBMfw8+HA
	tTWXewbMvQaq4/B+2S7XrT2cmkcTIQEqK+/xjh5cExHn8/3LYmmCflA==
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr222246025e9.0.1795440980187;
        Mon, 23 Nov 2026 05:36:20 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-argcomplete: Upgrade 3.7.2 -> 3.8.0
Date: Mon, 23 Nov 2026 15:36:12 +0200
Message-ID: <20261123133617.3614096-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132889
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.8.0:

- Improve tilde-prefixed completions
- Complete only the suffix of a mid-word Bash quote
- Exclude directories from extension-filtered file completions
- Fix completion of attached option values with pending positionals
- Avoid IndexError for empty completion suffixes
- Quote PowerShell completions with native escaping
- Expose consumed argument counts to custom completers
- Neutralize IFS byte in zsh completion descriptions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-argcomplete_3.7.2.bb => python3-argcomplete_3.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.7.2.bb => python3-argcomplete_3.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.8.0.bb
index 776d256c16..362aee596a 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00e2a958381b9fc6b9"
+SRC_URI[sha256sum] = "0114d634013e11ac92cc329b3a7d886c3506e98ddc7bb23c99b1782aacc8b8bd"
 
 
 inherit pypi python_hatchling
-- 
2.47.3

