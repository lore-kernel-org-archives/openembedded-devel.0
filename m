Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNkDS-0006U4-IB
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 10:42:47 +0100
Received: by pzk30 with SMTP id 30so5538173pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4HT3J/Z9T+PilmBhod6n1O4hepRX+Op2yPr8vwJbzRg=;
	b=bHCWiWOVT4HUCFZQRdNJEjCX/n8MIlFZ0Z5ukjLwYGvAc+Vt8Vl/bD5bb5CKzu/hhj
	avuWEfd3Mql6fBPdD5nMOgxY5Q/lBCFeIkI9E1b5sFjAUott9IZc33icQp355TmEaTwx
	teO0AyQbsrdsgQ16fVUgr7Z/5whB7J7H9zyXs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JCDt6cw6vjZogQ1c9QUs3FmJNKCv/N7EBdU9VMVBcVcembPri9Mjmby3aX20H+kkLS
	1A9wPxxUGNlriszysSnGwB38HX5pItm6v4Slc9yJvNDxtGNKN/G+ZGibbOmNaGtMBVmN
	Patc2/YGz21JJdCHt/fBovrKevAIaLw0kX/0U=
Received: by 10.141.89.4 with SMTP id r4mr7916554rvl.217.1261647648208;
	Thu, 24 Dec 2009 01:40:48 -0800 (PST)
Received: from localhost ([123.162.69.101])
	by mx.google.com with ESMTPS id 22sm7626217pzk.6.2009.12.24.01.40.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 01:40:47 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2009 17:40:39 +0800
Message-Id: <1261647639-12424-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Remove ANGSTROM_FEED_CONFIGS reference in base-image.bb
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
X-List-Received-Date: Thu, 24 Dec 2009 09:42:47 -0000

Rmove ANGSTROM_FEED_CONFIGS reference in recipes/images/base-image.bb, so that it is distro-independent.
---
 recipes/images/base-image.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/images/base-image.bb b/recipes/images/base-image.bb
index 295e0ed..8b1ed23 100644
--- a/recipes/images/base-image.bb
+++ b/recipes/images/base-image.bb
@@ -22,10 +22,9 @@ DISTRO_SSH_DAEMON ?= "dropbear"
 
 DISTRO_PACKAGE_MANAGER ?= "ipkg ipkg-collateral"
 
-# FIXME: We need a distro-indendent way of specifying feed configs.
 # Once the RFC for the DISTRO_FEED_CONFIGS variable name is approved,
 # we can remove this default definition and set it in the distro config.
-DISTRO_FEED_CONFIGS ?= "${ANGSTROM_FEED_CONFIGS}"
+DISTRO_FEED_CONFIGS ?= ""
 
 DEPENDS = "\
 	task-boot \
-- 
1.5.4.3



