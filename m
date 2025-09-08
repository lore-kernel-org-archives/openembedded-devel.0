Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D19CAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 06:35:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.6343.1757313348532642544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Sep 2025 23:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yg8dFe4S;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47173749dbso2685184a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Sep 2025 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757313347; x=1757918147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88NFRUg8JijN3zRf7YmYLVOGUDjZEgdYsKUKOBgZfOY=;
        b=Yg8dFe4SiWvrrSwV6cXvxQ+atOiMt5zCzPuUpD2SgvCl3mFdT3tyc23ryvVzVSrvxs
         /cFFvbpKYqtbObUqae443H4ZB2wD+8vseOQ1q0bWHevsNizIQK1GWDNcmpke498w9Isy
         Mn3yjb9wgTcLqgsFVJyjo3AGegcoQeHep+88M96L5OnKF0rlAsyq3JsBVUYzjlzoHkF4
         +CgmXmUsRzmCM94oOJ6HVOneCnwjNVQ39ymn0tc/zj+rJwN/+rRNCTDrhM82LI8/fEK4
         C0RfJsEIm8ztowO4TiTwAKRm+buymrrH2XbvPkZgSY3qTo7mtXpAUSabnIJS4CAXZRTn
         nCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757313347; x=1757918147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88NFRUg8JijN3zRf7YmYLVOGUDjZEgdYsKUKOBgZfOY=;
        b=U11sYTG//+WpCOpfE9w82DPNsg4PU/kFvurIEfMMMxz1N/tWeNcAuXJAvoluNqwie8
         ph5tDg0bEgMZVgi3g2cM8oEOaLf3OAqdjkSOCboDfv6gWREML5iEkXvEiEL8ug8NWp1W
         5fZ3edNpqPvCPBY2ZtX8h1o3f91CBnxWR+/q2tKpsHvZD3UVIEq21zF+Cknov/gev8en
         dIjwxjTxGoQudyO4SfQIjwpMwfgz4A6xHccHzqyjihaN8zK29IIMmUFS7SjRIYkg9zyJ
         c5oIUP6ejD7JtoeCIi/HsgZP2T5J77MKquMpm4NhJwtqlujKtXt5Z2qCx1CDFTQQzgd5
         oJMQ==
X-Gm-Message-State: AOJu0YyFp8WtA5sarKDEDQDZw+3GFtcdCklnFlHF6sERVEcgyejphIjI
	au7DWh0qZ9xmgKPipSmasFTgC5BdeoGV/JpJYXW9Lia+tZAprS3c6ucaLanvhBKf
X-Gm-Gg: ASbGnctkK8L9GsF096lzfSaq/ZpVPQaXXa0SfTqUI9JPQxvzRpLc1oWP4NH7JqktzWD
	CXh2Krn64ArsG5ZEHo3bwewZUyhAfuLy8zEamODGRa36xfJqmFBnpqxyaPBtSWetsmpdGA1aZX8
	Po5tAto/Q7yNzfSxG1sihIJjzO8y9QNBqjn4ZnOnkXC1wp/JvxWQIOyhm39jQtHfCJ7TCmWhHce
	wQ+MCPkRCT1TCoSAP5bLD5aK10YS4/EhYNxNYgQNfmLpRxOBBLwk7J4OmccOFAWM5luOWPEVAJx
	HfRMV9yBlFQYTA6Xxuzh6RXL680O0Wsf0B/6o6VbnPpF8xo7V+P71uZrLRAQ1TkcUcji8OPYhMz
	cfuzSnTTswTOujbfozDoTO52bgU0ooNQT3mWXnJsIjooojAnh5zIpqefuS2VWPQebmqap2miwHt
	xjw4ZJKDCj+Oi7nQhxTJVQhCbc/w2sl3HinIM/dyL2Dc+P9gTYcqA=
X-Google-Smtp-Source: AGHT+IFTESVgPi7UOXnUKka70Kq2JpNpveFSsFSaQUq2amjfQWhrMK2AW/XtqZoo0J6uiP/K6XnaXg==
X-Received: by 2002:a17:902:d4cb:b0:24a:9105:d020 with SMTP id d9443c01a7336-25172766679mr62525855ad.51.1757313347522;
        Sun, 07 Sep 2025 23:35:47 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b2daec2dbsm154401055ad.124.2025.09.07.23.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:35:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-txws: Switch to pypi for fetching
Date: Sun,  7 Sep 2025 23:35:44 -0700
Message-ID: <20250908063544.2864968-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908063544.2864968-1-raj.khem@gmail.com>
References: <20250908063544.2864968-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 06:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119331

This helps build when using shallow clones for git repos by default

e.g.

| vcversioner: no VCS could be detected in '/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-txws/0.9.1/sources/python3-txws-0.9.1' and '/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-txws/0.9.1/sources/python3-txws-0.9.1/version.txt' isn't present.
| vcversioner: are you installing from a github tarball?

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index 205775ef63..9299539cef 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -11,8 +11,8 @@ RDEPENDS:${PN} += " \
     python3-twisted \
 "
 
-SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
-SRCREV = "88cf6d9b9b685ffa1720644bd53c742afb10a414"
+inherit setuptools3 pypi
 
+PYPI_PACKAGE = "txWS"
 
-inherit setuptools3
+SRC_URI[sha256sum] = "cb93086095d04a5d70f53a75053f7df478ff37e972c3637fb55ca4a9e6b94679"

