Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJY-0005cb-Pd
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:24 +0200
Received: by mail-bw0-f171.google.com with SMTP id 19so784003bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=IyQuRX9vpE7f3xgeguSYNOzTB2FwHoWD+Vt7hbgfJEk=;
	b=jwqPYveXE/0qRe4ufjW5fYxEjBFoeZl12sIn0gJHGiYXhee3z+njormb1tEFg4uWw4
	VBReCVovErZ1E7hv6yRxxwYLX3Oc0wKKaY/r5M1D8B3nYZshSIri0AJzDH/rTSUTSeMD
	yhU8GVpbqSSK/TnbxmKer1yQZVNUV7MC5P7hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=X2wIuudNXEObhYELbQdCkYiRrxFW82g8Lu2ojmFIT+qdjzW6mXt5sluNJK8NsNZ6uT
	FQxw7E2iz2bxdfZOlPAgzp80mj7jpahj8SkOUrmgbYstsV+3N7oQsxXq2FJOcjqYvm/s
	pIlWEoG7btyCKhxgVPE65sfYNUsCsZ9gISB6w=
Received: by 10.103.121.19 with SMTP id y19mr42251mum.107.1242873591513;
	Wed, 20 May 2009 19:39:51 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id t10sm1724622muh.0.2009.05.20.19.39.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:49 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id EFEC96103BD; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:26 -0300
Message-Id: <1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/23] fixes wrong license value usage for GPLv2
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
X-List-Received-Date: Thu, 21 May 2009 02:47:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/xfce.bbclass                  |    2 +-
 recipes/gnash/gnash-minimal.inc       |    2 +-
 recipes/gnash/gnash.inc               |    2 +-
 recipes/linphone/linphone_1.3.99.8.bb |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/xfce.bbclass b/classes/xfce.bbclass
index 48e012e..b18313f 100644
--- a/classes/xfce.bbclass
+++ b/classes/xfce.bbclass
@@ -5,7 +5,7 @@
 # Global class to make it easier to maintain XFCE packages
 
 HOMEPAGE = "http://www.xfce.org"
-LICENSE = "LGPL-2"
+LICENSE = "LGPLv2"
 DEPENDS += "startup-notification"
 
 XFCE_VERSION = ${PV}
diff --git a/recipes/gnash/gnash-minimal.inc b/recipes/gnash/gnash-minimal.inc
index a8e5229..5a8a91e 100644
--- a/recipes/gnash/gnash-minimal.inc
+++ b/recipes/gnash/gnash-minimal.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 
 DEPENDS = "virtual/libiconv virtual/libintl libtool agg libxml2 zlib boost jpeg pango curl freetype \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
diff --git a/recipes/gnash/gnash.inc b/recipes/gnash/gnash.inc
index 3602f6f..ea20524 100644
--- a/recipes/gnash/gnash.inc
+++ b/recipes/gnash/gnash.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Gnash is a GNU Flash movie player that supports many SWF v7 features"
 HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 DEPENDS = "giflib libtool gtk+ cairo libxml2 libsdl-mixer zlib boost jpeg pango curl freetype \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'ffmpeg libmad', d)}"
           
diff --git a/recipes/linphone/linphone_1.3.99.8.bb b/recipes/linphone/linphone_1.3.99.8.bb
index f96bd66..4e9b130 100644
--- a/recipes/linphone/linphone_1.3.99.8.bb
+++ b/recipes/linphone/linphone_1.3.99.8.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "SIP-based IP phone (Console edition)"
 HOMEPAGE = "http://www.linphone.org/?lang=us"
-LICENSE = "GPL-2"
+LICENSE = "GPLv2"
 DEPENDS = "libosip2 speex libogg alsa-lib readline"
 PR = "r0"
 
-- 
1.6.3.1.54.g99dd



