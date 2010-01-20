Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZhi-0002W3-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:37 +0100
Received: by fg-out-1718.google.com with SMTP id 22so123334fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ukNRbQQboiVS7Ii471q8iw9iTo4WnOLQkmu6TpmSe78=;
	b=jVQcOitNwysKGr2PTS2jGiI/wb/FQtH3FWWZbKyM4qUrdP36eCCxX8iDTiE8n2t9ts
	9peN/q/1pbxS/3EBt2tnQkKH9ovWnZX6QahbCbJ8b0HDv45kVJEu+mEYe3j5KN6GMjjI
	646lJdTFT1yw3JRjU0kD0IvAowoFpIOvsJfl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nc4gmpcUQCICsMJSHuiz79WhNUbs8dJs2pxAfXYqDTMhnJRolKl4S4XEKv+S4mawzf
	nFA96SwR9CDlpS5VqLuUPkb6Y8L0XEPK4m22J69/uaj4dmmDike/7IgKIAKRRaTUL9Fp
	JJwnPGTngowoFkK/sejkvtuayeZsUo4Qqusg0=
Received: by 10.87.56.29 with SMTP id i29mr80604fgk.13.1263990500812;
	Wed, 20 Jan 2010 04:28:20 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3637166fxm.5.2010.01.20.04.28.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:53 +0100
Message-Id: <1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/6] cairo-native: depend on pixman-native instead libpixman-native
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/cairo/cairo-native_1.8.0.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/cairo/cairo-native_1.8.0.bb b/recipes/cairo/cairo-native_1.8.0.bb
index c575cdc..d58e16b 100644
--- a/recipes/cairo/cairo-native_1.8.0.bb
+++ b/recipes/cairo/cairo-native_1.8.0.bb
@@ -3,8 +3,7 @@ require cairo_1.8.0.bb
 
 inherit native
 
-DEPENDS += "glib-2.0-native libpng-native libpixman-native libx11-native fontconfig-native"
+DEPENDS += "glib-2.0-native libpng-native pixman-native libx11-native fontconfig-native"
 PROVIDES = "cairo-native"
 
-PR = "r0"
-
+PR = "r1"
-- 
1.6.6



