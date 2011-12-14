Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTi-0004B4-JN
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:50 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so267589yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fZR7yzNawndIUb6LfgE03BNjrKR5rlfjQn3OmllTvL8=;
	b=oVoiJpTa8fomSVIemo9Y3dU3PJkRtABm4dfnkMCOuBR/+ttBw3FDNcSCV09byeQAyV
	9gcgTMu0dHiH89ocJnPQXGHAAagqxZm8XEekd4k+5F+PsZhxfYI8YsZ4t+ZbygqazgS1
	DfXKtU8vKKlFxT4ewb3HYXk/WuGhdrwkuWFGo=
Received: by 10.236.174.3 with SMTP id w3mr7787285yhl.117.1323825055485;
	Tue, 13 Dec 2011 17:10:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:31 +0000
Message-Id: <93223e0593fa3d350b59a0f1306fd97a1727fb88.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/8] libav.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:50 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/libav/libav.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 9d3f3b6..c8277f9 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -1,7 +1,6 @@
 DESCRIPTION = "Libav is a complete, cross-platform solution to record, convert and stream audio and video."
 HOMEPAGE = "http://libav.org/"
 SECTION = "libs"
-PRIORITY = "optional"
 LICENSE = "GPLv2+"
 
 # Provides ffmpeg compat, see http://libav.org/about.html
-- 
1.7.2.5



