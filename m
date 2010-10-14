Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6Qnx-0001L2-IE
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:37:27 +0200
Received: by mail-ew0-f47.google.com with SMTP id 1so2516009ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=vhedhgpl8bC/stW19HcY8zZAnpbiouJFXUhf7isfNwA=;
	b=ZGxQq15BYlq9R9sZ6batEUjwGH3rRc24crwD1LqSCwCSBju+3s/LG9HIyhWtm5hiq4
	G5fowL8PtL7ZgR4mMrZ8hpiocvK0BP34DRqpzQbaQkGCJ/rtyaVjfG7R8XDu5CMUB9Tl
	U1I6+vwvskTutw7QvkkEV/dhLY0dIPQw5yKgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=npbMOsr+T5i19ijVAIjYzAZuE0XstZpo6m5FtkhjwHbdDWZGJGVdjUPEN9wiWohCvT
	oiORmyMJenhWS3JFIz10ITQ25ohmy23c42FvkYlv3zD7jVRxjfYkcQNuThldL9wvUiXo
	uOJCcutoxXVAiIvv4OBHedmZVN4ThZ1be2xMU=
Received: by 10.213.34.79 with SMTP id k15mr2125474ebd.26.1287074181112;
	Thu, 14 Oct 2010 09:36:21 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id q51sm2981860eeh.10.2010.10.14.09.36.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 09:36:18 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 18:35:43 +0200
Message-Id: <1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/7] mono-native: remove useless SRC_URI += ""
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
X-List-Received-Date: Thu, 14 Oct 2010 16:37:28 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/mono/mono-native_2.6.3.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/mono/mono-native_2.6.3.bb b/recipes/mono/mono-native_2.6.3.bb
index 03820d3..e08edbb 100644
--- a/recipes/mono/mono-native_2.6.3.bb
+++ b/recipes/mono/mono-native_2.6.3.bb
@@ -3,8 +3,6 @@ DEPENDS = "glib-2.0-native perl-native"
 
 PR = "${INC_PR}.0"
 
-SRC_URI += ""
-
 inherit native
 
 do_fix_libtool_name() {
-- 
1.6.4.2



