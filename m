Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKb2N-0002Iv-L7
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 22:31:53 +0200
Received: by mail-gg0-f175.google.com with SMTP id p1so820311ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=g8crM94zdF4bDE/Ni0cznECZaKdbYXFlVYnJFUF69ts=;
	b=lv2hTSh15S3CFx34fs5co0D8N+sGPwc95tX/StiKL4Rl+AFePH/xpAZ5N3sdN1+kFm
	Q45o8sXY0wwDSXfbFXr8KtSVjoiXTGP8FFYtwm4c9FFvV5eZwmhxDLl9z/y0lKGJXnOQ
	nIpkXWNlaIEjgpgZEIGPS3lPsPCUhl4bF9JFaIir6sZlXBsMJa5EWpLpwl2d051pcoiT
	9UobS8wzDrdDj1t3jIajtPedyIdcsWCiOP3WeG71tC7C6sNeImK6TVHLf/6lI7tUtEfv
	LgngvozLQHo9B7oHIf12/p5w24M4V0e2UEI5B5QdDXCOH4QblwmahxFXeR9H5wGBQDN7
	5lCg==
Received: by 10.101.106.11 with SMTP id i11mr3650781anm.68.1349554729804;
	Sat, 06 Oct 2012 13:18:49 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h15sm13150353ank.2.2012.10.06.13.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 13:18:49 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 17:18:30 -0300
Message-Id: <1349554710-6693-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
References: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/5] libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Sat, 06 Oct 2012 20:31:53 -0000

Using 'lib*' we end having problem with every other package that
generate libraries dynamically thus we changed it to match the library
prefixes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/libav/libav.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index aa170c5..4a1716f 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -119,4 +119,4 @@ python populate_packages_prepend() {
                       allow_links=True)
 }
 
-PACKAGES_DYNAMIC = "lib*"
+PACKAGES_DYNAMIC = "lib(av(codec|device|filter|format|util)|postproc)*"
-- 
1.7.2.5



