Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 12C4965CE9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:25 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b20-v6so3930620edt.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P3Gn9sgWr24ohszky1DQh+NN7nPBmUFaCAEtyhesoiw=;
	b=HMLe4nz8FfWH5d2S70skMPcyVLRwndidH30LWTTVzu9rVyChq7jRT5Gn8yg6f/jIfn
	klH+Jc/HibUURie7JtdrWLfcYlNgfVUdV89Fk/VGowJIMhZ3c52QVlvB2lmfft/IgnM8
	DhVf2q5+PEjPzspOD9uyCKDfYgtAKnaEbgMDOq1BVBgpw6TA26sF1fiJXU+PG0MUkyr4
	9FpB6RAJ3iiSZaommJMP4vQtvXIeArjQc3uNo8k4H3QqdnwCQyefzgaC0ecYUFOrXr2g
	+imRv9sNLYX8aqsFUbIYLWIZK2YGXbD+pUiafXE3KTGmSJUZJRCkAXGct3qc3JIKuPlH
	OD9A==
X-Gm-Message-State: AOUpUlHYKBhP8MErIl7uixPAP/i+Ytf8raV753snV6dio3KrbJNGWaHq
	0P35UZQZXATps06U+jPUlli59yNo
X-Google-Smtp-Source: AAOMgpdS0sywavCDTJ9875A2qLHO0ivUKyq8/QKkVSKb4k0hFGlaNe8K6Q2N3BaedJ5PgGxz9iLuZQ==
X-Received: by 2002:a50:940b:: with SMTP id
	p11-v6mr7377515eda.107.1532698166435; 
	Fri, 27 Jul 2018 06:29:26 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:18 +0100
Message-Id: <20180727132923.15149-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 2/7] layer.conf: allow multiple Java SDKs & runtimes to co-exist
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Using MULTI_PROVIDER_WHITELIST, we can instruct Bitbake to not complain
if multiple recipes provide or runtime provide the same Java environment.

This is a common use-case, and Java packages don't conflict with each
other as they are typically installed under a different prefix, while still
providing (more or less) the same features.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 3b00f61..8b2978a 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,3 +14,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 SIGGEN_EXCLUDERECIPES_ABISAFE += "\
     ca-certificates-java \
 "
+
+MULTI_PROVIDER_WHITELIST_append = " ${@' '.join('virtual/java'+str(x)+'-sdk-native virtual/java'+str(x)+'-runtime-native' for x in range(5,9))}"
+MULTI_PROVIDER_WHITELIST_append = " ${@' '.join('virtual/java'+str(x)+'-runtime' for x in range(5,9))}"
-- 
2.18.0


