Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrN-0006pJ-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:29 +0200
Received: by mail-gg0-f175.google.com with SMTP id v1so13582ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9YH2uHlnb26WrAjMSsYLwYg1Ad08Oma9yQff4lq5G60=;
	b=ghhz5FP86ZaG+P/kMe7EK522JksnStOyqQ778ogNrBCik2Lj3YzJ+kwEo2hQLquehw
	lMkqgm0DzK5HfR1MQY7jrBydHw8BzpauH8156tsWaGKjmzkjSvBOAVZApPE1c2FY5bd1
	QM6hjwAQoT9wIjW46Yoq0oaB9X3+aQf1WIt7e4CbJfYZZ1bm/4ppBH5q3C6r3ga3kIRs
	hvq31Y5IM8Lru4tO/fu3W3fnh3eH1MxzF7yL+VoZMHB+ofM0iGAc8AOSTTwcbMyGYH37
	6sLC8dISBCw2Sr8lWauVLWvnTjQd1yW8DjrazHeFwx1BpLQF/DRjbMP7gkLFHUctCp4G
	w1Kg==
Received: by 10.236.118.17 with SMTP id k17mr3880283yhh.69.1349323411124;
	Wed, 03 Oct 2012 21:03:31 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:06 -0300
Message-Id: <1349323389-16520-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 6/9] gst-ffmpeg: bump PR due libav update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 04:16:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bbappend          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend b/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
index c5a87cd..c671d9f 100644
--- a/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
+++ b/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
@@ -1,4 +1,4 @@
-PRINC = "1"
+PRINC := "${@int(PRINC) + 2}"
 
 # Build against external libav instead of using the builtin one.
 # On architectures like ARM the libav recipe enables a lot more optimizations
-- 
1.7.2.5



