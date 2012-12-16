Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhq-0005n5-4X
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964771eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=K1Y071oSVo862DDrS+7cOJg7KmoU8grbnWjDsT6tJLQ=;
	b=W559wdWT/8YXiCW3lJaGZlk/6CNuqeimv5GfPvcJEWfJAl/o1cyC04mXkcwgJnX8x1
	RFQlKU5lprmuscEHAxghTmeMUWz96qA0X7mPn4DjDH+9tK28fYQhIuqIo+ARu46CSZ27
	X+THjZJjAUO0U6NlF7o3ejK8hCEKXJN37NdY9/i/9tVygiLiJc1uQd3hQHhDdeGhnGgD
	C5yYJN5QynYWGnUW9F7MUtVeZKjvf1fw9k1O63v/kAKkBqsKQhaScegPSSBpSINZkuJo
	uei34mxLWpFwJC7W8OB8hxFsbp8KXEFjFm+9qg9vcR3MCbGHBC1bomIoGxAV+Zz0x0Hl
	OESA==
Received: by 10.14.219.72 with SMTP id l48mr33562627eep.37.1355680695052;
	Sun, 16 Dec 2012 09:58:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm23880587eep.1.2012.12.16.09.58.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:46 +0100
Message-Id: <622fda55ae931625be2b6206683dfd7d05c59c03.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/26] samba: added gnu-configize for AArch64 support
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 7985199..4750ecb 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -50,6 +50,7 @@ EXTRA_OECONF += "\
 	"
 
 do_configure() {
+	gnu-configize --force
 	oe_runconf
 }
 
-- 
1.8.0.2



