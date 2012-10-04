Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrN-0006qR-OB
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:29 +0200
Received: by mail-yh0-f47.google.com with SMTP id g23so9289yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HsXionow3HucB2Gbr/0SC9vCgRHXf7SSH5Sfr+ue+8Q=;
	b=E3v32Cz1VWqPBy25UTEFbLEg5jcAyQpALv2bY6GCGQY+kUQEdekQei1VSLXlNITG69
	aaXbEvRS4n1a0nYdWEWOyl8bRlz/4aET4j2dRI9zo9iADBG0frYjTXhsazpQxMFy1joB
	knVleYGmeKHgDHXZcdpVumomtnbDGlHwDav4Ak8IphFbXTswABqxrEfOHqDDK8xujNhL
	HLSRNOggGcLFLnCec7/0g+dO5ihySkJTH4bQXR4eIMgnAih3t5dg4Ssp7+UA9rwXfTAc
	M7bQw/oHgaJsOZUUG260VG8khOef6Z+HI9OFmmJjrVFrjRL85YLM/kNyjvHLzUxjAC7G
	n6CQ==
Received: by 10.236.161.135 with SMTP id w7mr3952799yhk.15.1349323409075;
	Wed, 03 Oct 2012 21:03:29 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:05 -0300
Message-Id: <1349323389-16520-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/9] sox: bump PR due libav update
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
 .../recipes-multimedia/sox/sox_14.4.0.bb           |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index f7ec1ee..200a3d8 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -6,6 +6,8 @@ SECTION = "audio"
 
 DEPENDS = "libpng libav libsndfile1"
 
+PR = "r1"
+
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
                   "
-- 
1.7.2.5



