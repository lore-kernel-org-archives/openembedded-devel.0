Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPBRs-0008Kq-6r
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 14:45:25 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so5578079wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UMvGkeQ4tD2ub/Ap+qLcX9v07tcVD5dECoFEL4FxGUs=;
	b=svZ3/LKj3NIF5TOfMo3+jf5jX0/To6dpulQm5/sLInqmWmTv/8y5muBYFt+EUKQ2Fp
	cO6Kt2TyI9IE00/v/uD0dV0f5djCl8PGZc3F3h+I9z4w26yLLoR/VbAQukl/hfZ3sZQR
	AiBetvKi+xmjrzVdiVIfy/Tpu9+6c9T+lSJUGLrC9ual0DlLCzPhl50ZGr1jhf9DvhQr
	ZjZiYyW537vM9cEPzM8GgTX5Fl5hKrYtJSlsYhwabB14QARsL9rK+ym/VGI3+qszTtN3
	7NgHvwz+XeoywsRq0DZboH/MTabKoaYB6ClZca/gqueCQ9Mvy7g/FOMkjr2+gCa0qGUG
	AA7g==
X-Received: by 10.180.94.39 with SMTP id cz7mr12637759wib.21.1365424085941;
	Mon, 08 Apr 2013 05:28:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id h10sm21841740wic.8.2013.04.08.05.28.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 05:28:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2013 14:28:04 +0200
Message-Id: <1365424084-20122-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365424084-20122-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365424084-20122-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] e-wm: upgrade to 1.17.2.1 which correctly sets relname
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
X-List-Received-Date: Mon, 08 Apr 2013 12:45:26 -0000

* so all modules end in right subdirectory now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.17.2.bb => e-wm_0.17.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.17.2.bb => e-wm_0.17.2.1.bb} (61%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.2.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
similarity index 61%
rename from meta-efl/recipes-efl/e17/e-wm_0.17.2.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
index 05e9cac..ebd5900 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.2.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
   file://applications.menu \
 "
 
-SRC_URI[md5sum] = "ab15be89ec0ed06271fcca60b221d83b"
-SRC_URI[sha256sum] = "63882b29164497c71b17312cbc5a5c6911475b0ccf989502e179b1e3fee3e3b9"
+SRC_URI[md5sum] = "e78018ba7a4622efbcbebd6d093b7fa4"
+SRC_URI[sha256sum] = "5e7b7f5ec88d0589bb4db8aae2c198dc9fd91049419e2460cbd7631207ebd799"
-- 
1.8.1.5



