Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9BCC78766
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:52:30 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id g20-v6so6203406plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DEO7B6xAG4BSHySMtYZWHdoK8Znhdc9HlLWiZC3ap9E=;
	b=vPX8b7nrHk95pmICjlmcGaVYh1XU/T0XQo5n511RV/pZpEKW+wFbo3CRya5tatowEH
	hHphkcwhXcMs9c6a7no5daQHZTroSfjs81nMf867MvjYW+lmUalFCgAwdPAoIOWu9QRk
	mc6oTpF0ZanuE/uC8z6e3ibTaWWNQYdQ+SYvvP0R1UDXQ0LhtgVX6J6eOl908RSoa3so
	DHVPvDGJttxSPC1y9yE+1gBmpelQR1GBYwCK3qSka5X4AIWJtC/MLO3RKJSJU4LHYom/
	nXpMFIV3q0clqoLV0Ga5u9i1V94IQvwitw70JsZKthbkaFRr+Y9OlBYiDjMVDHUC85hn
	jVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DEO7B6xAG4BSHySMtYZWHdoK8Znhdc9HlLWiZC3ap9E=;
	b=AHDLc4IlwaQ4qusCVmeVUQw4+pUBtUrbPSIQctKGXoLQn+5kTwAKPAZ+1V3nolstJe
	s0KB9NHg8hta9c5r+q+7w1TYycNN4xxjrio1ZLP+37pIPkAQEB9Ty/AMrpDnOiSmP6yi
	P+29pMDfiJLaokCiWBwM0XleWBirUfv4CMoLs5H8ZJO6JEzeLllmdphtH6QA1/Lxd3rg
	KxsTQ79OT7oQqEMhc17/wyewRlrhWEJ+SjcTXrGE5SxwO5BUZva6J8EHe8awCQrav4Rd
	teYTGHm/d7+SpLezRJXOQYJ8SHUq9N7ntc+nvboopcIXYyPsY/EEZKGRHRg8D9LpxW2g
	9zdg==
X-Gm-Message-State: APt69E0WtRhi2q4QYwTFjhFufb4MqYXnsFj3AuouVFQV6kGYqesM5AJd
	iFENm+xFsXARQ/BC4SXbIMOVRA==
X-Google-Smtp-Source: ADUXVKK8MrWvbxtagZ4+2jB3Eptj3Wa3rEyGw63kldOZD0df3az6kitlncr38R+2Ha6nXZ417pG2kg==
X-Received: by 2002:a17:902:7242:: with SMTP id
	c2-v6mr2068043pll.383.1528379552248; 
	Thu, 07 Jun 2018 06:52:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:143:7168:4d6f:f251])
	by smtp.gmail.com with ESMTPSA id
	t21-v6sm18675481pfi.22.2018.06.07.06.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 06:52:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gamil.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 06:52:19 -0700
Message-Id: <352531015014d1957d6444d114f4451e241c4d23.1528379391.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528379391.git.akuster808@gmail.com>
References: <cover.1528379391.git.akuster808@gmail.com>
Subject: [PATCH 4/4] protobuf: Fix fetcher failure for rocko.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2018 13:52:31 -0000

From: Philip Balister <philip@opensdr.com>

The 3.4.x branch disappered from the github repo. Remviing the branch
entry from SRC_URI allows the fetch to succeed. Rocko is the only release
that has this issue. Sumo and later have 3.5.x.

Signed-off-by: Philip Balister <philip@opensdr.com>
Acked-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index fae7c18..fe28f47 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
 PV = "3.4.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
+SRC_URI = "git://github.com/google/protobuf.git"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-- 
2.7.4


