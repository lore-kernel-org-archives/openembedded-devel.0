Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0154C73286
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:15 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n63so60379549qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=3itGsB4xUGf/vkeMe08oJKqgncqR2ZrWuaDVmFWG8CE=;
	b=gvTg6nJ2MOzJ4iXzH9oMFg277s75bTf7iEAswtFD2dsnuDVxUcJIhDybuDl9Ss8iDv
	kDxg7ApZnkRQaYO2e03biY6V1L5P/UDBwxJmb3diEfW3dFXqo71kCD6kF8G2xKveroCx
	DzR48N3VPR1mQ08s9wu96grryP+HHq8cOQaxZGEE3/sdUVfAY8Fl0op/Bhu44d/+UpuM
	HoMc1WWXcqz0UpUgQRGOqFuQmRhNOlqSdnCOB0d/abpeuwSzVwOrrXZlgCcuKL8dETUT
	/oy6CID6A4K7zoUdTr316PLdeLLWpFJjAGz/6IPVHntBL/AnLdHCGcAMEbFk6FFbx1c/
	JFog==
X-Gm-Message-State: AOPr4FWl339RC4gq6QK/o/+E22dI6RQJbpdCvAIGNELSUEprgYjEpQBzAjtWhwSyYRiG1A==
X-Received: by 10.233.222.4 with SMTP id s4mr11140295qkf.19.1462543336092;
	Fri, 06 May 2016 07:02:16 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c39sm5781340qgd.33.2016.05.06.07.02.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:14 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:50 -0300
Message-Id: <1462543259-7206-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 13/22] sox: dep on ffmpeg, not libav
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
X-List-Received-Date: Fri, 06 May 2016 14:02:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

The libav recipe no longer exists, in favor of ffmpeg.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 3c688bd..4b73aa3 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -4,7 +4,7 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng libav libsndfile1 libvorbis"
+DEPENDS = "libpng ffmpeg libsndfile1 libvorbis"
 
 PR = "r2"
 
-- 
2.8.2


