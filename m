Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZQJv-0008W6-2Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:25:57 +0200
Received: by fxm12 with SMTP id 12so507292fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=cDYe60lcr5O2ZNEiM68a8J2ms5qBjwfUPQRg5Ov/Br8=;
	b=LGhoVUPg8QMy5v0eJOS4QXfaFoUgetzBvbnJtkSitMYyeCNmUbjz0zrRUEjnWyBbWp
	86UlFScAQjrt+rP0ojU4I8ZXv7CT0AK+J448PwplPRrtHtZbnVG1pC5FYDEVPjMc7tMZ
	d9kntZXLnDU4ipAxAiWuFedV5iJRzZAqyPK0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=crQHD/bxqSSaxI7pBrhqFlcYbQPxX8ry1EPeuw1/UvTt2gUAXmOpdXJO/k4PhiOw+D
	P5iD5Gr01hBAWzkGKwFyUZYDkiAUhMTnzhoFA17L9kWf7TLnqihze1mfqwNY56pXiQFg
	wLnfBwV4n6cHAchF99V0Hl8LCgfHJ1j06JeCY=
Received: by 10.223.103.148 with SMTP id k20mr790353fao.101.1279207550791;
	Thu, 15 Jul 2010 08:25:50 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id r27sm361393faa.0.2010.07.15.08.25.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 08:25:49 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZQJj-0001P0-CD; Thu, 15 Jul 2010 17:25:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 17:25:40 +0200
Message-Id: <1279207542-5277-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
References: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] minimal: commentary typo fix
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
X-List-Received-Date: Thu, 15 Jul 2010 15:25:58 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/minimal-uclibc.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 44805cf..3347811 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -42,5 +42,5 @@ DISTRO_FEATURES += "eabi"
 DISTRO_FEATURES += "pam"
 # large file support is needed for libsndfile
 DISTRO_FEATURES += "largefile"
-# glib-2.0 nneds ipv6 and there is no knob to control it
+# glib-2.0 needs ipv6 and there is no knob to control it
 DISTRO_FEATURES += "ipv4 ipv6"
-- 
1.7.1



