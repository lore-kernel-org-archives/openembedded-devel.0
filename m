Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 148CE75229
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:13:16 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d3-v6so7154029qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=KykccVVgTZK9jnDR8XTaYH1D7z657nKNdPy7QQfmPPg=;
	b=mCidbQBvw72rdxb2jSa1Fvvmjvrrvq13QmrPnlLK5pBaRhuZog5TWneJX8hFzer6aX
	lDAa8G8kjxkOJCNkw9D7rM9YjInWcKJZ/9UUFN9C5KWldNi+dmMljx84A2Ms6swU4Udo
	obq3Rb50MRWgLup9CVFG+abalTe3aMyFDz98CA6x8k0kvaYmFEsNj82Taju7//H4EbpA
	YVA0DrBhH4z2Lb+NA1ntS6RSQWQ0jguSZFeKp16adgmYJ/IAnYp144sUg/o7zwJ8/mb7
	5fgTY2gJdxo5RdP14SxqOfkjfaZy8DI/1BZcfieNI6g+KMq2t3z4p1+aE+PyZIGswEna
	ETRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=KykccVVgTZK9jnDR8XTaYH1D7z657nKNdPy7QQfmPPg=;
	b=juYyPbAbs1GVuMcu8eMR+qesavH/98trTfzSbzhSbRX6kHpQsBbOlkFI8y7pjiWc4O
	wKSjSNmVDMtx7jfOac5TyioN+6ZSpOF+YTeSyRmrBNV9JbvWwIQ2QxHoan4HLvtGcx+c
	TJBV/DR3TW5+Sdj95NnR6g1FiG5vFAvgEsVL3forsWpfBY2/XSmF+ZvlU3sPYAjuDvBq
	BIz9jMIeLdZKYO+ku1oONwkIODLLkWSC9+IyTnR1p/OksC/XfHFezywtUIidHbFplIdc
	LL4UjQUMrcFM2a8Jag04zJrb7rF4Xjl7HtONUrRr9d1DbOvt3R7/agx6STSBYepg6fA1
	NG1g==
X-Gm-Message-State: APt69E2ypWsR/84efM5JiBkDDYITHm5Q95wvOjHuvQb/smM3LlivgFfV
	0qPKKkKRbHfXr+a1YCpwqyn7fD/o
X-Google-Smtp-Source: ADUXVKJZyzZ/XFC1jSDB9FNbBoEz+dTeHNnLkyTwPhrSMk22ct/RrZ1VvT+1HQgR1hKaMEMVrrohmg==
X-Received: by 2002:aed:3704:: with SMTP id
	i4-v6mr20978076qtb.234.1528135997427; 
	Mon, 04 Jun 2018 11:13:17 -0700 (PDT)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id
	c4-v6sm32565189qtj.49.2018.06.04.11.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 11:13:16 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jun 2018 14:13:13 -0400
Message-Id: <20180604181313.28487-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][rocko][PATCH] protobuf: Fix fetcher failure for rocko.
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
X-List-Received-Date: Mon, 04 Jun 2018 18:13:17 -0000

From: Philip Balister <philip@opensdr.com>

The 3.4.x branch disappered from the github repo. Remviing the branch
entry from SRC_URI allows the fetch to succeed. Rocko is the only release
that has this issue. Sumo and later have 3.5.x.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index fae7c18a1..fe28f475a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
 PV = "3.4.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
+SRC_URI = "git://github.com/google/protobuf.git"
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-- 
2.13.6


