Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BFC0778257
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 04:57:00 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i130so4286290pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qAx8cBwsz+PUO+F3yODPT9/F6VyvDaKs7g8ZdO0yHl8=;
	b=T9pq+Bf4CGBpNitt0Gsgr4nIxqlvwv+v7HD6NmFvDK1TG8NDan2FV3ZVFuVzH69t2z
	5pGVsJndiyq9QLmzwIlgFktnQoBssHZc5mTjXOFBc6lFQnXCwBVkoA65Al9j2rP2/I3Y
	m3CGedz8Qa0XFR8oVS2NowCVlcZNQAsrUqNBNUdPcpJ8dDOvc0J+buRHgOZd+/igjOKq
	R0XCJcatXtfCYyT/Emksl1gmGjQeD2nJkGtC9hUEtVMgExV0k1B8bGZ59h23Z1JmyjuS
	d3qSbB9aAOjS6SWqehbmnt9eAwGIlZ5Ghj3AMQogJxsT2e0ovUQZY68QBq3D6Ox3vIFi
	Kr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qAx8cBwsz+PUO+F3yODPT9/F6VyvDaKs7g8ZdO0yHl8=;
	b=rHSQV3bKk3NFQE8W03F0CFFNrCDNsrU7h70IB0BCDhuStszmtIyOauLchntU64xQjT
	yMw/WZKCqhFpED8D8MPV0e3wrPIBjUNxef86LPdHv7GTIbpAFcEz5O6P1/ALkVzkoVYH
	JQRamliN2lZDab5/fRT5mjBAWMVws5aYOZQ9P4HC26sOOdfpEgLSiiFkN4a6LwByB8YJ
	jZQiPclKbgtOteHoj+faFyieN5ZvPcb3vnqbN1/n+f1qlFTscSbxXn+XwQKqgM/eupGT
	JlLThTpYKv8ttYyg4YG9na1b/al8AkJn1r+dnq2cHOkKz8No2inxdng+rdByFUgEpc1c
	8ErA==
X-Gm-Message-State: AHPjjUhMTlvsjbML80gLP8xcNxkaWx8J18aLMFKrsafU8Aj/vIjSMUwX
	8itnlGXv5/LQnhQSMMYtrue4bQ==
X-Google-Smtp-Source: AOwi7QDWt3QMO8npQ1h/1FuiCYZoLXEavZE11NOj8gZ8gx6+ncNSoM1sCeWBsINlrj3QmvKMwJRJ6A==
X-Received: by 10.98.147.219 with SMTP id r88mr6444667pfk.0.1506315421864;
	Sun, 24 Sep 2017 21:57:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::b736])
	by smtp.gmail.com with ESMTPSA id
	p127sm8863496pfp.168.2017.09.24.21.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Sep 2017 21:57:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Sep 2017 21:56:51 -0700
Message-Id: <20170925045651.32107-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170925045651.32107-1-raj.khem@gmail.com>
References: <20170925045651.32107-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] python-futures: Build native version
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
X-List-Received-Date: Mon, 25 Sep 2017 04:57:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python-futures_3.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb b/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
index 3eb18829f..c85fc56b8 100644
--- a/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
@@ -12,3 +12,5 @@ SRC_URI[sha256sum] = "0542525145d5afc984c88f914a0c85c77527f65946617edb5274f72406
 S = "${WORKDIR}/futures-${PV}"
 
 inherit setuptools
+
+BBCLASSEXTEND = "native"
-- 
2.14.1


