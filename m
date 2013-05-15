Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpw-0006mo-KN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1131847eei.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=m2qVq2vmYnc1NVDKQF8VHXkv7gFS0sQ2MG7cQS6Id/s=;
	b=TKAuRxjXBXOgBrTq8OsIUKPBISBbF62jEhvtBS9pgeM8VbT6DbHRSg3wT4cv4wtflU
	nEkKTfHF/4HX6POPaFVWfjg6wxycFZbdjoqdfyPf1vf+jSHPWTi7t/jFqiwopf3cu7EH
	1LCLjzFDeX4zgXM2BqL4FNjAugHIOE6OjT+2e11I5cWZyClj7hqOMjxpUm8c6gYhvXEb
	IpmVe3r3tML+2cXGN1B65LbIBLSzHphTBvLw9c3QRxh0l8BL/1gcnYn2GrIG97USS25K
	jHxayLle7ApCrJrCpvp6flLMlCDhuBki1R7ilLuXrVMQ48lpZBZlTmv7utOHOgLFJkaT
	dU/w==
X-Received: by 10.15.82.201 with SMTP id a49mr104826976eez.44.1368631420072;
	Wed, 15 May 2013 08:23:40 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:55 +0200
Message-Id: <1368631259-13401-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 10/14] garcon: update to 0.2.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../garcon/{garcon_0.2.0.bb => garcon_0.2.1.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.2.0.bb => garcon_0.2.1.bb} (65%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
similarity index 65%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
index a384889..44a0e68 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.2.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
 
 inherit xfce
 
-SRC_URI[md5sum] = "301e7b8015060dd30407b68dd8c4bdb7"
-SRC_URI[sha256sum] = "02dea3edb9c0039eca4748e964c61b0e1cc10f2d7f9ce0c837287ac5fa9ef76c"
+SRC_URI[md5sum] = "c3cf89c836be0ddb281c81e4808fb68b"
+SRC_URI[sha256sum] = "48b644b8b2ffe597974e2526ca1a5d2d7da6a09c2d434f008dec80e9152701f7"
 
 FILES_${PN} += "${datadir}/desktop-directories"
-- 
1.7.6.5



