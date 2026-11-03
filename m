Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8036.1793701458955811149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PfmZEGzm;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so304588f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701457; x=1794306257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIANyEuENaEaxc6rB06kbqyKYr+CHw82mmPWIzQcrLw=;
        b=PfmZEGzmFuJDrE+WYp3IwU1IjZczdrB6QZBHDFROuFQ8a1Rgkhx+ImH0g3BOCj5ACU
         rzMzD2rLNRxzTiT7CNmJdO7VZxiI3ynI3UCFY6F+XQoLBRzGaX+7HqYmM9tJZLy+iUPV
         sEwoSLfDfdNbVWbaVJ9H6HymuqUmrAupltk/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701457; x=1794306257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIANyEuENaEaxc6rB06kbqyKYr+CHw82mmPWIzQcrLw=;
        b=JZOrzG5SirhFut+hM/IojNWsaHyiF6eeLgXef0ZGdqsrU6KEI8QJUXlp2X937e6wbY
         pJV/kdjCzw0bwkyKcdPPC3SVQ+gZPTxWL4+nECyWa8YvrbtSZuHc5uKL/IkVKJUNScns
         i56JGWNo5BSMo3UeMBwj20WwODrkbc+WuNyl3YycaCzPsEdSRvOYIOPoBR6ScS6BdSSO
         Oasli2U+Jg1weqn51Pz0fRbPIIqv746wOpyFurvBqOleGoZk72dEfntRtGd5e2Zy2vAO
         Mer5Fbu7nhU/j9tmEKrmhSKkw7Mn2sWphQK4r94OBTqit7bZUlPz7QRHi9yhwb7ypxxE
         3NCQ==
X-Gm-Message-State: APuU4Z8YiMGC5+lou6FVJwnRdwawjkibVjWC0mLzmhNNAvjhsB+wchmi
	AnyaVRU08b2Oypzxfedwz1YYAGoZ7+Nl1UUTBYVJJaAlHQmTcgydH4qQ0+p9uG0R0XLSJ0qQb7z
	64BNA
X-Gm-Gg: AYBFou39Dk+E3y9QjnLDk3aBaMRcEyPbr1HdGVgA+8ogkk7MHkuPPXiVwO9C6h+66qT
	axpCvFs2Vj+VahSOWyrlFTwb7TM0ic1ZZXf/dQ6/7zf1e27iuFNdvBrgYapnsVYytAhZPSb7reZ
	otBeAx43tBPe+zPWHsbL024sa3OYm7aSMDRiUkkGYvy6vshY9cBjVkijjeO24g5AlAbDWcTDxYM
	gUz73BGvzP0OszqUTpc3nWQnEuyAis/wevpHNJCvv1guTlDQGgdiNY008RLAOQCPo7zZ9GkfNOx
	ocbSh29Y/YAM/FyZkP+MPRsMVZdsIK2d/U9RKpzDD+lz6ISMAttg8BMXBEo3498trQ8b/9a+GJU
	iUBJ8pkgxsITfSX4wZS9TwB+iC7xXsLhd+cQ+cr2l28waTMJ53LruhHOnqLxqpxqisijLSETszu
	5u2lAFedcEUlrH/14L8dyVocfAKHxIrwVl6bAcjy5xymVSO0cI35i6cpuhevdAF/7ZN9uf3K5GU
	5jSnwFJ6z9wqf1/0JDqgqFcXaXZzSMGObj4sIl49vdwego9NGMBqqMNkhzrmNwKDxNPeaR91kLU
	PPXjiAYuKzDaKowmyTWy6LM4OWUCvg+jZGfTIoHjCDOKeaSaS4puDR8yDWD/GJnHNUoHgMGvj9n
	UDixZxQPvmOKk/VKIQqK09hVyc5h6UMRbo4foiRBfxu6EG6TAPtL1Gg==
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr294514075e9.6.1793701457097;
        Tue, 03 Nov 2026 02:24:17 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/22] python3-nodeenv: Upgrade 1.11.1 -> 1.12.0
Date: Tue,  3 Nov 2026 12:23:40 +0200
Message-ID: <20261103102350.1952237-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131775
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.12.0:

- feat(nodeenv): print shell completion scripts with shtab
- fix(nodeenv): point npm_config_prefix at the env in activate.bat
  and Activate.ps1
- fix(nodeenv): install npm from the registry tarball on Windows
- fix(nodeenv): read quoted config values and mirror credentials
- fix: stop putting ^/dev/null on PATH in activate.fish
- fix(nodeenv): retry broken node downloads and stop hanging on
  stalls
- fix: do not require python2 to build node from source
- fix(nodeenv): do not put the venv bin on PATH twice with -p
- fix(nodeenv): skip node.js pre-releases for latest and ranges
- fix: preserve fish activation environment
- fix(nodeenv): read a config value raw when interpolation fails
- fix(nodeenv): ignore source trees during prebuilt installs
- fix(nodeenv): escape glob characters in prebuilt paths
- fix(nodeenv): raise on bad config references again
- Make tox configuration more flexible
- chore(tests): port the Makefile test targets to pytest
- Align Python support metadata and runtime with Python 3.10+
- perf(nodeenv): unpack the node.js zip archive in parallel
- docs(site): new landing page for ekalinin.github.io/nodeenv
- docs(site): show GitHub stars and PyPI downloads badges
- docs: update isolated installation instructions
- docs(contributing): add contributing guide and templates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nodeenv_1.11.1.bb => python3-nodeenv_1.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nodeenv_1.11.1.bb => python3-nodeenv_1.12.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb b/meta-python/recipes-devtools/python/python3-nodeenv_1.12.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-nodeenv_1.12.0.bb
index 766f734777..76b5e23e2a 100644
--- a/meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.12.0.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a9e238ffae5bb6447dbac6291e1dc3a3"
 
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "d7fa027c1df437bdd974b0502a8dc76fa1b3183e369ac9539602bc6bab9100ba"
+SRC_URI[sha256sum] = "4ea7f88339310afebc3253f2c7a91b94bacf97d73a36a5c108962abdfaca501e"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.47.3

