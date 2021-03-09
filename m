Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.12972.1615312103273393753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=BWhLI5UQ;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 9FAEEAF7;
	Tue,  9 Mar 2021 12:48:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 09 Mar 2021 12:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=mwj1tamf0Lan4
	Za5TD17Rmh7lnkvieMOjf4ZhcZDNFE=; b=BWhLI5UQLe2lDmKDE8hYl0rE+63Kv
	S+Pt+kw76j/oAgGbwzCrPrlvp0jhTFXYuzTBrB2Yg5nQ7TC5U/BSH1rph2lfFb/A
	p8ZitOEkoXPodj4Wogr1p+KRyaeOKROd2h93d5R72iL8VIya2V6Xcg0Nabp8DyQv
	HGPXXWcTYZSJIZAQdA6Ore48ZTmIZhvFkbvTYeZV83Ed5cOrdIHhOPwqD9Wzh916
	PrK8K8SVseLgdBYHo1BidOPROLE0W7ZjrJtJW6V2AC0GuqSGVAn/b2p/gOrTAANJ
	1Dh1JZdhNkt55tNQTR+sf4iITsjslkAErfUltJpkInlgvoHi/tXkaUhlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=mwj1tamf0Lan4Za5TD17Rmh7lnkvieMOjf4ZhcZDNFE=; b=DxB0QItV
	z+rJpSHKhaeBDgkweIsWMjuj1XDBz9DS44NxUDa8A9Qkuq5KueN5NHxrogi/qz9+
	UZCtWydwsVzhfsRXDNdaMfOSfDk6qYV37gL+d3K0kpjS/nKNeK9knwd6j7ihk+bd
	BGs8zRsaiFNJljzhh85CdzCPL0MP29qbsIJfNT0VuYmDnWWEHwv8k8cqjjxhbqbm
	MnKqCcj2zAi3UyTBQ3Lof+Iw7UgzPwonncmBJZ7DeJBCmzMtIB/qcQKj58QKBwKB
	Q4N8UL0N6UxgzI2AjoG9CH/J+uh03entWQJXl6FVQuBbgtVdBTwqr7e2VDocrrPQ
	r4HXVekLqcEWBg==
X-ME-Sender: <xms:5rRHYKIf67k0icrjulW17jLvVgoWm-GK58yM1FlOwMAGtyLCC0EB2w>
    <xme:5rRHYLv7rWmuz2BR93h8gvpzsZmdQ3e3Wt5ehpx3GOf5hzNxhwK2eSSuf3C0hpeDb
    L8dAqoIdFHkEL1-2wI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnheptedtvdfffeekteevkeetie
    evgeegveeiiedujeefieetvdekledvkeehjeelffefnecukfhppedutdelrddugeeirdef
    jedrudekvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:5rRHYGITL2fhmCe2XefZ44W7-Wsut-mhO__ss90LFg7zbAoRwiSMvA>
    <xmx:5rRHYOGNLhTigQekekfAMrhR20ECLNXD8AKZAaRz0WN5W8b1OMUahg>
    <xmx:5rRHYCStt2ShoW5Mxm0H6taeuQ0HQzXeWL13XWXvD1rq_I31kaOW7Q>
    <xmx:5rRHYMeGCokiXves-pb4CqFl0wcr2JWbOH49GDk7nzdiZ2RNDzQpig>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id A4F0C1080054;
	Tue,  9 Mar 2021 12:48:21 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python v4][PATCH 4/6] packagegroup-meta-python: Add new modules (aiohue, ifaddr, pysonos)
Date: Tue,  9 Mar 2021 17:47:26 +0000
Message-Id: <20210309174728.207503-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309174728.207503-1-andrei@gherzan.com>
References: <20210309174728.207503-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee194..6323e17c6 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -21,6 +21,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-aiofiles \
     python3-aiohttp \
     python3-aiohttp-jinja2 \
+    python3-aiohue \
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
@@ -167,6 +168,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-idna \
     python3-idna \
     python3-idna-ssl \
+    python3-ifaddr \
     python3-imageio \
     python3-incremental \
     python3-inflection \
@@ -320,6 +322,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pyscaffold \
     python3-pyserial \
     python3-pysocks \
+    python3-pysonos \
     python3-pystache \
     python3-pystemd \
     python3-pytest-asyncio \
-- 
2.30.1

