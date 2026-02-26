Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C40FCE09F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71418.1772117188590971065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQaOfpbl;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4807068eacbso8062955e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117187; x=1772721987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA0JRYuKqwyWmc+kv0k0d3A6gXgzxIXCPYgcbyiyu2Q=;
        b=BQaOfpblrvVhy4zMLiXCYDfCbFsqtZ/6Hl9VvXRkvetu9wHiyvP5aB9kc4swLC8nwA
         ww0tkifuuFOjhFtlDvKzuPycdjvLPr0er/NIA2DSQh/fac/5kRgKMCouM/oRgVfHtvB6
         YCD2iCfhpCi/yE+o9TvK4k0vi3tE2PfrWDhfBCVsGXmynOmo6yqcYL6PQqCTGk3jt+ag
         0ghu7ZImsXhbnaT4GbGzQ51tBr85zO1NCcwb1GnqKREiNtdme7uq2Jsk6Z1vsdK2ceDk
         yFgmE9Kop3sFX4HwuQvANwj1+hcp0jpjSTS4uHm51K+5xIGWwZBBG2+vu6gbs5GRZUN5
         vIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117187; x=1772721987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bA0JRYuKqwyWmc+kv0k0d3A6gXgzxIXCPYgcbyiyu2Q=;
        b=S6I9RoiwZOJmiuVFMvxajZhk9oueSROzRr1bssVHZ2W+Ab0EOBY7Vz35RizHO+vTPd
         b/cKV34FX0m6uF7n2T65la2tt7SIGaBGFRot2wZjQd81uRNUedxepjlfbiPEFVfyWqrU
         Q/l+1vMxHs5EjjndHzTTtehK8+2AaIYsTbzjPUtY9nqX3W80dYxArt5IkZ+qi3kN7Oxw
         5jTKKEJ4UkVtHnboZKYt54lE3j6Npc6MjXdDIxaprbNL0E6FXXfsc+JQg57cAuJ4fxzm
         G3PoV4crbhjcnIZSWpfCBnQgGxc/pL6/DWxN26wKMxFaT0GrztGAdmAM51zP5PSSISxL
         FmOg==
X-Gm-Message-State: AOJu0YzDXpflUgfjKUDbjwRlgjHd7SVxdB+sfD922QEg7eBqBiKA7iOq
	dBuYdcorD6Bl/sg3GGOORuN7bBpM9s5Ab4jKLcpp6t1nkMSOOf4gY4UJDw0yrg==
X-Gm-Gg: ATEYQzyqFtud8sJkc5od0h92qNyE+8q3AEz1b/BjxmNlw4/4MF8Sd/eOLZbkkJ1E6Zc
	us+koll6ZJAnlxG1/qpl9bCTjDNBsM1gLWwF7GeOS8YZKdzArazte2P7XFdvnBdSvaOUcu037/Y
	hbjqTHSZBstWqxP6odUunydeDBLPircxO8T4YWod3QSZGvBS2O6q1OEq168G1aCTBZGYlF7QyHX
	yM6p9nAirEnKLXHUKxlvgpFXTlsNw2fIKj74+UDZ+oSlw9MioC3eKVWGlOkWrL1sx1gh610R6Mk
	pukQL+nB1k8mtolt1SaJES5Q9ED9xJpZ52LEEk+HykQ9dW4gH7pFbYVdLlS7V0fWUqrSkF6GiXz
	RiRbD5IOymGFpsQ1gtIWyFEoVrnuISC/FHf8oIue6GbhQTzMoG/bMaFmznDmPMZ/9RL1bpWDZMq
	X5Uu4cnEmMXOx9nv+x6qDV7dY+nx4v2j0=
X-Received: by 2002:a05:600c:4451:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-483c3df7281mr34647225e9.32.1772117186852;
        Thu, 26 Feb 2026 06:46:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/7] protobuf: ignore CVE-2026-0994
Date: Thu, 26 Feb 2026 15:46:20 +0100
Message-ID: <20260226144624.3743168-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124680

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

The vulnerability impacts only the python bindings of protobuf, which
is in a separate recipe (python3-protobuf, where it is patched).

Ignore this CVE in this recipe due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
index 95a76514a5..4cab00fc4d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
@@ -37,6 +37,9 @@ EXTRA_OECONF += "--with-protoc=echo"
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
+# the vulnerability is in python3-protobuf recipe, not in this one
+CVE_CHECK_IGNORE += "CVE-2026-0994"
+
 do_compile_ptest() {
 	mkdir -p "${B}/${TEST_SRC_DIR}"
 

