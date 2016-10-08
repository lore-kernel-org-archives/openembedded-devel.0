Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4834719A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:03:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b201so6409543wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rd7XnnGY2EeQGAUcAN5wyqnwE7rIw+yHlWg9ef70Q50=;
	b=tPd3It2Y5DUDbLmFq9HCiIaVSaoEsI9Q+kTRoXDpcqX6yyNAv5/BRTAaFKkr0MFrsJ
	mcFe9bGIa6DepLIjidS1EamhvpOA5vNcbDw3oCg1jtGZb3nVlwWGDk6BPMgHkISHGgTb
	/D34kkYyoZADqnCRwIpOwLUh2WaDeWinwsOlF7XxImRGMBXqckt8BGHKX9fmnMhaHQsx
	y0qUjSk6omQPoJQ6ellhdqdxUnR0014VZMIbzVaPoeitAU1kkBW3Z96Qo11YXuD3nm8N
	ytfmIiKIoXVUy4CKxpl1UXzLOWIqTsiG6qm/OWEI7tMhS9FvganPo7TtnWwJBOQQ+9HC
	hwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rd7XnnGY2EeQGAUcAN5wyqnwE7rIw+yHlWg9ef70Q50=;
	b=VTWYG4Gkv+Q7ClzQVU8qLs6+pgY0lY6NBrVqrtZvgzR/WW1x9GYv+7QrIL6xcCkOuL
	X6Jnzu15D3MbsKSZj0n+EP+4GInJR9vHhMQmdaRQmNrl5qVGPFGLtYoKg4phIhe8CAw7
	RsfXumZemZQaimLZkPMa3C51JIL/hPsQrXRFQy7O5usxAcjgVloH8HmylMXQMQgMFAAl
	r/jOEyj/XETSMeNwaYJ0AX6YJop6YSGIJh0geFUSCLEM6dmZ9n5RWe0ivZYb/N6uaWdx
	s6EcjEFxEyHOqRUU/8av5L91DiVIBNX0RNp1gyKrwfF2bDdSRBaaUzYShilSSv9o21Pa
	NICQ==
X-Gm-Message-State: AA6/9RnIeq09EVtU7TTcpi95U+ocTF7ABuxCbuaBjqXJEOkwz8+YlXR7aLaS0N/l8+dROA==
X-Received: by 10.194.172.41 with SMTP id az9mr19941972wjc.105.1475921030269; 
	Sat, 08 Oct 2016 03:03:50 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EC6.dip0.t-ipconnect.de.
	[79.223.14.198]) by smtp.googlemail.com with ESMTPSA id
	n7sm7509219wmf.18.2016.10.08.03.03.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:03:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:03:33 +0200
Message-Id: <1475921015-7131-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/4] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Sat, 08 Oct 2016 10:03:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

portaudio backend is only available for windows builds - see README

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 34615b4..66cec0a 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -23,7 +23,9 @@ inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
 PACKAGECONFIG[alsa] = "--alsa=yes,alsa=no,alsa-lib"
-PACKAGECONFIG[portaudio] = "--portaudio=yes,--portaudio=no,portaudio"
+
+# portaudio is for windows builds only
+EXTRA_OECONF = "--portaudio=no"
 
 PACKAGES =+ "libjack jack-server jack-utils"
 
-- 
2.5.5


