Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1354E7F285
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h3so4890290pls.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VTqqaFbmr2S9MOz97wXNjgWB8/Xmwzq3jMhe3is8jwQ=;
	b=LeTUND5KUFNoe7udN0JmVtC2UngkTyTDAMhKLxE9mS/P7Mzc5o9Gdm9We7iL7eyslH
	ttZQJvaLpooYPcBUiXcjDxfG0dU9X0L8SgmbP9LTqRDf3fFbNYSa9WKqmUi9rrxX0mcS
	OFvR8Z6XEILje4/xgN6/CZrk3CBKvb7d3qNvx76yKLn5+qSYQolsRDKf0k8DQjW8lWiO
	dh747RAFKgrjeMx4Vyr8Ni1yURkMQ0pzl9YMb3fyhrWCsJXfQUFMUVGiCW8beMnA2Woc
	uAr7pr0QnIXXRDabkPU5WlNWT5Duf/feeDL9zToSbt9bFaGDBkCLjmWkbITbJHiCJERC
	1D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VTqqaFbmr2S9MOz97wXNjgWB8/Xmwzq3jMhe3is8jwQ=;
	b=iABhVllrSkpjLZw/HPpHITZ0Gzsuexbh2qht/wXCHoQTSbJxYYbmst9HJqqZavkDlv
	NGtUsW+USCX0SmiCypHtCp1NywMAZuq28IXJ91b0WrMbEngdIDV7hndvCwrl7jACgnVN
	5Iiu2sclSneWQEuibGU8ho9bW+U6vPpItSYHNaZOuP+arJXsTwp4qE8Ku8pYp6Lggpt4
	kir8o0RbF6FtZrxYMvsE0LJpLZPOJd37Fx6Olv7eitFJkyMaZF2DTu5Je3a51QG7T3FS
	7cPYqMrRfZh6WLqCbqSkwrFSBIWe+T2RIuwIP7o8+xdV7wknHh944ztu1p8Q2qnil4iq
	pJ3A==
X-Gm-Message-State: APjAAAVdGg0UzBB25rYGSWW5tcy3q8YLTtmRRfJqGVfrJQ/j3mEl98ln
	XH3pnrBGbC6VDxL3toQHb2v0diYE
X-Google-Smtp-Source: APXvYqwAawGs+c/avCb22VlMZKyeVCAwnXOgO3JWOB/ZvmIA8EycpLp/dZSVxURiAkqOMZ2eYvfxeg==
X-Received: by 2002:a17:902:9f82:: with SMTP id
	g2mr22813852plq.63.1567287120383; 
	Sat, 31 Aug 2019 14:32:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:35 -0700
Message-Id: <6404de28dbc2189edeae0045bd619b91de54198d.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 14/23] libopus: Limit forcing ARM mode ISA to v5 only
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:00 -0000

From: Khem Raj <raj.khem@gmail.com>

This lets newer armv7+ still use thumb2 ISA

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
index fb9bdc7..1512a1d 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
@@ -50,6 +50,6 @@ python () {
 #| {standard input}:761: Error: selected processor does not support Thumb mode `smull fp,r2,r3,r9'
 #| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
 #| make[2]: *** [celt/celt.lo] Error 1
-ARM_INSTRUCTION_SET = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


