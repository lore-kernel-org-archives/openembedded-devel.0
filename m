Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3oJ-0007dQ-Bq
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:51:15 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so1566881gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=7z69zDFBg8CjwdOf1irqk1zrj/N0g+LbdDXFUSAv9c4=;
	b=LYEh7h8Cd4bdrMHe8Ixii4CwXU/+RzA/qpDa1Zv6dLeFgVCVShzJf7z0FyH3+s01qb
	79ZPtZCvvADxfaYadHibHLKJj7RD1AISFVQxYkqSOddAnmhICRjGZ1xQVHx+sPAHpgBJ
	pZzAUZdahgyfJT/y3BObnHKAf/P6DV7ukpIso=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=BJv4zrTd9aOQyJe0GAyRzELdrryew1wP41sEIRbQYTX315KeNaux8ZUNuqNmocnB2l
	y0a6FjxFo7sCaOX9ehg2GGjk47g6b5G+c1Gi9gQQoI7zyLkqt5H/WzeVlFWi5FqnqOzI
	RAOLlpWz/eCJeNU5FbTJCTk3I+NBwAREBRvyg=
Received: by 10.91.145.6 with SMTP id x6mr4197417agn.152.1306766888953;
	Mon, 30 May 2011 07:48:08 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c21sm3346170ana.50.2011.05.30.07.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:48:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:47:55 +0000
Message-Id: <4b2cadd8890cb648045efa34ff601734486e1b51.1306766797.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306766797.git.otavio@ossystems.com.br>
References: <cover.1306766797.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306766797.git.otavio@ossystems.com.br>
References: <cover.1306766797.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] freerdp-extension-xpunlimited: bump to fix a cache issue SRCREV
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
X-List-Received-Date: Mon, 30 May 2011 14:51:15 -0000

The cache of servers needs to be stored into a directory into user
$HOME and was failing in case it doesn't exist. This revision fixes
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
index 7e67a63..4fc6928 100644
--- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
@@ -14,7 +14,7 @@ PR = "r0"
 
 inherit pkgconfig cmake
 
-SRCREV = "7b3b8538c8cb863f720ba5351aebc220e126a4b7"
+SRCREV = "d27f90a0128c687ce74cc922dba8b7eeb33f0654"
 SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



