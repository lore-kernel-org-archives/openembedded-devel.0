Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 35E1377041
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:31 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f92so56349984qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=hXIOdrxI259xEvNikaf230PKVqGLVcJ1H19w2XJ9/U0=;
	b=P98ze3PPcNH/W9htp9Wqn1wcgBRfq1YuAiZNnyKhiUqTDP6kmoV9etroZiYy/rw5Hf
	3RptA3x33OvHNGbS168J6xam0HVQempOumGmNXFlqY1H8Bn5BYntSeK5XDA1oO/zzR1L
	ahjppezMfwWd84nOEnAD3eohQ8dH6lsJM+em2GikXtZpKZbGpr490io6jfz5CdBSnpW/
	OSWJAbCpZZWQJFxxjMKFGd6SE0+SXjbk2ACgUVYp+Bkg1ahHAnrEQWaGYky4XqFlsnMm
	FpY/dvecOTCunA4f3bxyPeibSK5sJP6/lJpyQVna8Dj3PFDZoNHY+ooSqBWFxpLmfDFo
	1Fvg==
X-Gm-Message-State: AOPr4FVXQ9dX+wjnksJy4iYFKx6Ezxu+fVKkHRXqi1BhQ5jbylEaoGic3ZAC8Ei0XzYsgA==
X-Received: by 10.140.148.150 with SMTP id 144mr21075549qhu.57.1462543352485; 
	Fri, 06 May 2016 07:02:32 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	f19sm5793250qgd.21.2016.05.06.07.02.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:31 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:53 -0300
Message-Id: <1462543259-7206-16-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 16/22] fluidsynth: set correct portaudio packageconfig dependency
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
X-List-Received-Date: Fri, 06 May 2016 14:02:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 66f0201..54e8697 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulsea
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
-PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
+PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio-v19"
 
 do_configure_prepend () {
     rm -f ${S}/m4/*
-- 
2.8.2


