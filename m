Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHPI8-00027J-Qb
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:09:23 +0100
Received: by bwz9 with SMTP id 9so3047954bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ns6hEJyVfz+F/Ziszv5i+iZPI0icmeAOAPPCzGXiTBI=;
	b=S4d9ahgLt+68i1PMa//bvdl7YZhyzNw6lWMlnYn3pHbij8rcI8FsiBKoBF1zCgapIk
	Uu9/Z9vtVG+H4TAlKW4FtIdiNL/qlT+BhNtz0izoZMAXag6iw00wH8rMDzjWbVIJA4VK
	gyi7j4sTtI/wXt6wEKEuk28piqq6kbe++Xylc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HqPkkUPnenURe0AGKvN1ADnrM0lvhzGaT3anqBwAfzDfZoFqWtJKTENym+57QvT6kb
	4BwDqJZJ0S/BzWqdJ5qISjjY3mLttxs0qkpWZgGaPE0Uxb9e5ZAU1qY+V5qhhk/Yctqb
	BdxW0D/tjIcmXiqeA+iPdyRBgYIcwJKbKFzMA=
Received: by 10.204.153.202 with SMTP id l10mr6284818bkw.92.1260137261659;
	Sun, 06 Dec 2009 14:07:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1757376fxm.0.2009.12.06.14.07.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:07:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:07:39 +0100
Message-Id: <1260137259-11379-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <be7a9f3d0912061401i445276cawe90436e27ca56fe3@mail.gmail.com>
References: <be7a9f3d0912061401i445276cawe90436e27ca56fe3@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] compatibility-providers.conf: comment out 2nd atd provider
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
X-List-Received-Date: Sun, 06 Dec 2009 22:09:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/compatibility-providers.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/compatibility-providers.conf b/conf/compatibility-providers.conf
index d530524..4b7e53a 100644
--- a/conf/compatibility-providers.conf
+++ b/conf/compatibility-providers.conf
@@ -2,7 +2,7 @@
 # DEFAULT PREFERRED PROVIDERS
 # Every distribution should include this file.
 # It will make adding new providers easier.
-PREFERRED_PROVIDER_atd ?= "atd-over-fso"
+#PREFERRED_PROVIDER_atd ?= "atd-over-fso"
 PREFERRED_PROVIDER_atd ?= "atd"
 PREFERRED_PROVIDER_avahi ?= "avahi"
 PREFERRED_PROVIDER_bluez-libs ?= "bluez4"
-- 
1.6.5.4



