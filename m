Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OqxU5-0007lE-A7
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 02:17:07 +0200
Received: by pvg6 with SMTP id 6so3225313pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=3FXTVRFWHCL8GaF6ZQU/K2gAICI/pMt9barkJ8mjuQM=;
	b=Yk6tKrHp3x7KX1AXbluUwUfU37qHPQQfGjGvtB8fVW4qua+H3HkEmg9dBlbEbRfhz0
	7rDlikJLx73W5rco5qo3l33aT3ffbAQdJ56xrECu2ojNhfuy7Sh9R6Ead9BH9ED46EuF
	Zr8lNXjJDqO0tKLNEwo1uwpjyDfgZ10j+Bk00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=HgN9cinjcIPM1eRG51BBoiZ3X3Uyw4AChHLs9ZUFg5Z+/aUvDAaKlFFm6ZOtEqKge4
	PgXNfanC40ZtHViOTV3qCMlWBDsnJRA9kdcTAjuFfUHjukn+w6mlrGDAliEWN9BVKqNt
	PUZaSmqng+eWYFVH+a9C1FrPllKbTHg8H2np0=
Received: by 10.115.18.12 with SMTP id v12mr9710532wai.114.1283386567646;
	Wed, 01 Sep 2010 17:16:07 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	r37sm12888941wak.23.2010.09.01.17.16.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 17:16:06 -0700 (PDT)
Message-ID: <4C7EECC1.90507@gmail.com>
Date: Thu, 02 Sep 2010 09:46:01 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpe-package_0.4.bb: fix build problems introduced in previous commit.
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
X-List-Received-Date: Thu, 02 Sep 2010 00:17:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

gpe-package really depends on libipkg, not IPKG_VARIANT. It will not build
against a recent opkg.

Also, SRC_URI+=foo must be after inherit gpe or gpe.bbclass overwrites it.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gpe-package/gpe-package_0.4.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/gpe-package/gpe-package_0.4.bb b/recipes/gpe-package/gpe-package_0.4.bb
index 884143d..1188843 100644
--- a/recipes/gpe-package/gpe-package_0.4.bb
+++ b/recipes/gpe-package/gpe-package_0.4.bb
@@ -3,18 +3,17 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPLv2+"
 
-IPKG_VARIANT ?= "opkg"
-DEPENDS = "${IPKG_VARIANT} libpcre libgpewidget"
+DEPENDS = "libipkg libpcre libgpewidget"
 
-PR = "r2"
+PR = "r3"
+
+inherit gpe pkgconfig
 
 SRC_URI += " file://sbin-and-no-suid-install.patch \
                 file://gpe-package"
 SRC_URI[md5sum] = "f131eed187483620916b7e624b9e3367"
 SRC_URI[sha256sum] = "a1fbdb1e8357b0b2362df9ee457c90dcaafbe7a11723117cb0cbee1ea0f6315c"
 
-inherit gpe pkgconfig
-
 CFLAGS += "-DENABLE_PCRE"
 LDFLAGS += "-lpcre"
 
-- 
1.7.1



