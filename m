Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBF172FBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so2954053wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wia8H/1uIqWR0hdf+PlKBHKju+Wne+C3LBwmG+gbX3Q=;
	b=UqZFhp5ekyLsBOOwTAGguUPJRCIjbQNOq25ypxqyt22O4Yeywp+qHpVfT3tVxBv7FK
	awpgA4LBJzxGRjZneWz5/EZnnTgQPrswOzpjLM+dbjBdv2CrEdfZG/Ygn/QrS8iB0xbN
	/bTcxe4a0iJpaCuuXWcB3dxX5m8vcUauTwQSP++Skl2qchRy6cyImArU+1W1MkUju2cM
	ysuXLqm7J7w/kG98QG2T37Qnn8+tGCW/Tntw9pxSbvPw8dIbYOhQADPLbquv+kh1H5eL
	fnBWCcnrC0aI49n7u0SQAX3jNvhDCa8bGZ361xJ3R0bP8ROb0xmXAJvWF4AX+IE93tdN
	EAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wia8H/1uIqWR0hdf+PlKBHKju+Wne+C3LBwmG+gbX3Q=;
	b=chHtHAGvAc+wnwa5dD4nETIpGDHu77gwRakVjB5mJAI8pXc1YaEeuCCpSb8HGZV2u7
	pXgL7pWsLiGGqN+7T5EX2DK7pn1UQyK31M+t7dN1W9dV2cyH78s4nMORbgpBrJFFH8Od
	JB3YjvESfWr3g+K21hDedENEQjhdsorQlpMaVepoiCbRSbbp1WxyLhRyuvduApDju/Fv
	BSEolnnT6cvQhwmsGPXhBcw6I4Q1npvWEJwsPfrFwed5xv0vPU31mjzApLi/IqNNmfqZ
	G+F7zL/iA8bLvpb8B6ThhvRc/Hea78pk/vWkDsXooTa0xB0uL4iVUZhOfti/v3Zi3KII
	KLdw==
X-Gm-Message-State: AMke39kBt6b+nASs44exs5pU7IPorzYKFNtgJ15zW1PIZadvsVEDazYEbvcYtOG3O3QA9g==
X-Received: by 10.28.181.145 with SMTP id e139mr638292wmf.127.1487804593292;
	Wed, 22 Feb 2017 15:03:13 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:50 +0100
Message-Id: <20170222230250.30288-12-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] libsdl-ttf: fix and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
index 091d6ef..d8b378f 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
@@ -12,7 +12,9 @@ SRC_URI[sha256sum] = "724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248
 
 S = "${WORKDIR}/SDL_ttf-${PV}"
 
-inherit autotools
+inherit autotools pkgconfig
+
+LDFLAGS += "-lm"
 
 do_configure_prepend() {
     # make autoreconf happy
@@ -25,5 +27,3 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
-
-PNBLACKLIST[libsdl-ttf] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130598/"
-- 
2.9.3


