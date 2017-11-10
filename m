Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96A8F71AB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 19:59:10 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u54so3867697qta.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xQITqZlCNEMLEPvGoS5vRqxWuET5I07H57gNVkpBB5Y=;
	b=TLougJNdOBRbMBRsvrVsJx15ynAyp9DRYK+7zbYMWq7zWPEOcuWl60HcQqfFdT37s1
	Wgbj5dzWy9GmkvqPGFwkg3kVNsw4S9oA5scl3d7wZogzV3z/0Wgibn/qZ6GeZjpn/451
	d3+1g3pyrU2szmjqD4/LteQSpNMxvImCjjkf/ZEw48HxBKn2VQkGogMZQXgBreU++GMm
	U6n/46Anh1TzZ72GBy1R092Bxl2jJHE8SCl1LBqyRn0Ov2ckM5o2jftZ8+CxciU9wYtT
	qv1H25Ic2Lh1E8DM/+t5JQYaW8dFU2ektGzZUdPkGEbNQBH1GUVeGQZ2Lo7sVWtSsCLh
	RhNQ==
X-Gm-Message-State: AJaThX59YdvVy3Dj+OFHx+Lk4s+Svfxvy00Tpx3ezMCN8CnCK+xnsIAD
	Vtee5yneDMcQqmcx64rv6iLamg==
X-Google-Smtp-Source: AGs4zMY9TfunxB6gnYFlCEVwSHL+IXwgKmijFU/khZzjnyCQ+JKO5WMw6Gy5M9Od2fuBCARnDtMIZw==
X-Received: by 10.200.41.90 with SMTP id z26mr2404909qtz.47.1510343951241;
	Fri, 10 Nov 2017 11:59:11 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a189sm6713102qkb.84.2017.11.10.11.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Nov 2017 11:59:10 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 10 Nov 2017 17:59:02 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Nov 2017 17:59:01 -0200
Message-Id: <20171110195901.18783-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] nghttp2: Move to meta-networking
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
X-List-Received-Date: Fri, 10 Nov 2017 19:59:10 -0000

The nghttp2 depends on c-ares which is provided by meta-networking
layer, so it should be moved there as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb (100%)

diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
similarity index 100%
rename from meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
-- 
2.15.0


