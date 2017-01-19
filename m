Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1709071A73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d140so10010794wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GYLL/6tz9l2yTB7iLgl1e+qmlzC/1j5VVjW0YkO2vq8=;
	b=YT1ALy4/fjUubg/qFZYgk1kPKYBcwNkVps9QbhTpaLJGZttTPlL/mlCqPQQJ3X0ycu
	5i2wlsHqBTYBAxdchQ+Q3ZU0fSP8d5h8hPIIJw55q/XyeAA9lixe8KUnjHGBTtItu1K2
	fZhz3BO74RxOuP0lbEBjz8tiOgO9n3TqgQPhPqQ7+yk0Jr+Hlgy8/YXewVp7IKkC4wx/
	4YiOYAvz2VvmUbp4SCaPvOeVl6xzUxHHpB6j3iGk5ED0KY6fIkhAHpJhBHeiFmu+0y7z
	78/SlOnEN7mocxYEfV1HrLHrndjTklmm87Rd1jkgENcSt4Q7SgklrmWhSqwzPCnHL0Ld
	PZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GYLL/6tz9l2yTB7iLgl1e+qmlzC/1j5VVjW0YkO2vq8=;
	b=MF/GEeDpgQya1TzeVbo/PgF7vyR8UUm6FZESkZCRN/YL2dw8HIlbQMRFmECMBSxQyw
	NhZxkwscsBsCFCvdXaiy9EVhMUJF10uqgo3w4mFFZ+om6zMqUo84eSwubqp3QEjHEuKf
	BIoKalEmRDEAnZrBaWQ6FG50tnJeLchI1/4R+3/iVa8Km7YNUHNVB9RQSh/LJungq/Cr
	ih9AoZquIPj8GSRMRczE/87m+qFTm1a1+9sEI2hrljwf1KbH+OQgzTnRc6yynoYzHpBd
	BwupJk0+lrHyAdVbIbTB549F1L57PvOPrnIvBUPt/xVjpk3ClLq7MCR++hesVJ7nka+y
	ObAQ==
X-Gm-Message-State: AIkVDXJf6waK5dlf00AQNCq5WcGRix1SoB0ZLy5FUDamXllSmBYEqQDsPQoxfCHXebJrPg==
X-Received: by 10.28.185.77 with SMTP id j74mr6118930wmf.76.1484812426095;
	Wed, 18 Jan 2017 23:53:46 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:30 +0100
Message-Id: <1484812412-26806-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] jack: fix PACKAGECONFIG for alsa
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index ba074ad..2c09f1b 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 inherit waf pkgconfig
 
 PACKAGECONFIG ??= "alsa"
-PACKAGECONFIG[alsa] = "--alsa=yes,alsa=no,alsa-lib"
+PACKAGECONFIG[alsa] = "--alsa=yes,--alsa=no,alsa-lib"
 
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
-- 
2.7.4


