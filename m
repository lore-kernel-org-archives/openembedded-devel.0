Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ark-0000UM-Rt
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:36 +0200
Received: by mail-gx0-f206.google.com with SMTP id 2so2089217gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kRVp7v4hdgr8YKlIqR1O7r8etKqwnlaQSkw4BwCuX2I=;
	b=qYmxLugMYuWFGHTJy5Fgb4sEDCpPemeaKufQSxe9+5Xi4711JnAqDWcS81Kdn4e/jA
	Dn5ivHLKBUkTvbVWOh04IZI1AMiwsJAmE7PTAiRSJQcSfhExCsYMn/LNC5EnTxp6P2z+
	7B5D6vw+AcDfsBw24PTxcX4JbZ75n4bXiikKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=hfvUzrmqoSEJl2HzM9yh4vNZZ8KsmBpj6S9Ti7N+zGUlqeuhdi4yVjBNT8OdLkz0bZ
	kvm+OdJFELE3YHjwUYH7lHroOZ1oDt7wNk5O+3lRKgaGuG6iUynlqgo5WeQ3m/3W+MMl
	vPOh8EiOOxX2fzqBbMsp5pVB6CeziJhEhaUas=
Received: by 10.151.147.16 with SMTP id z16mr7753960ybn.92.1241830221768;
	Fri, 08 May 2009 17:50:21 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm1628942ywg.23.2009.05.08.17.50.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0002A6101A2; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:29 -0300
Message-Id: <1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/23] fixes wrong license value usage for GPLv2
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
X-List-Received-Date: Sat, 09 May 2009 00:56:37 -0000

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
1.6.3.rc1.51.gea0b7



