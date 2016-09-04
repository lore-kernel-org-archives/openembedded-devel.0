Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6051077245
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:15:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c133so10457917wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OZzFpslGJoMCC13Fe6To4srWlZG3PF962tnZCW31d58=;
	b=GNrRK5F8goXLywiHRF0gFM7sIXnUXHSOopoRX/7BnxwZCndtYRmcon0tPXrl11wKp6
	8sPg33c6ro07vEyrrDpvmLIi5WX9N/GLwLVabRC+LgRlzzSxcVq2AKDWeEeVtjXOygWV
	lEfJV1CxojEXXRoKuQ0L7mDEWFZ9EZ/gsKpHAMQXdTAnY/AjJHxaUtYe1TTS/0zpibjg
	d+TJfvmCdgQNe1w+s1/aeeM6uAxlmtfGJss/6OnBKTSLKlIei8zJnRn2qLMl1rlZuNKh
	53GFHDz4P0ssGPPsj/DziEwl68nQzQV4eOR2urxgjxt8c0FGElVsS/Iz207Isu3tAQgb
	dg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OZzFpslGJoMCC13Fe6To4srWlZG3PF962tnZCW31d58=;
	b=Jx2fgIHH+8N1Or5M0Mxxq10mL/uBaWu0KGcli8fOWLpugLJXjJlUMFCG2ZvVp+yz1K
	oxFBpmchbRvIH7Wc+A80WOGMFMQ2gkffGQo7U35dQ/aTJAmr1vqJAF/UMd/g82wdr4X2
	oi2RyrPvs89929pp2rr1GG7d9NFsJnXILcFTc6H6xN3HJfSjP3qNMv2bi1Pnl245MRBR
	vmKTTOQB3e8memF4Msbr7ClSrwNMGeNEyOlbXChab+fXDxhQdhL2ZWMnYmyV8z8giENB
	trVjQywqNLLXXDskLYbUUMSDj+Mhz58Bm+zQZbJsxF8v3QM1f3ZAwZ74OMXgsptvLbmp
	jwxA==
X-Gm-Message-State: AE9vXwNreuHLkjh3yATf+poC1NkePHjz7fjsvHxQjqyFmezNOo2blrYhWCeFo7D4zJC2fg==
X-Received: by 10.194.95.36 with SMTP id dh4mr2490995wjb.156.1473020139245;
	Sun, 04 Sep 2016 13:15:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3967.dip0.t-ipconnect.de.
	[91.10.57.103]) by smtp.googlemail.com with ESMTPSA id
	v137sm10708151wmf.3.2016.09.04.13.15.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Sep 2016 13:15:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2016 22:15:12 +0200
Message-Id: <1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] samba: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Sun, 04 Sep 2016 20:15:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use this workaround as long as there is no better (upstream) fix

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e35d527..3205c5d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -88,7 +88,7 @@ EXTRA_OECONF += "--enable-fhs \
                 "
 DISABLE_STATIC = ""
 
-LDFLAGS += "-Wl,-z,relro,-z,now"
+LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-- 
2.5.5


