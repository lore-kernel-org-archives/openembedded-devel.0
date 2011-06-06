Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QTbHn-0001Tl-DI
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 17:00:11 +0200
Received: by gxk3 with SMTP id 3so731269gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=boJUMAjWY9/t47OU/GcgGGlMgiSY3pn4yY5Ovkx4whA=;
	b=sHX1YgVSmgG9MUHZTrdoMQsMOskPF6BpeKXmP8CK7cJuelicq1wszyr28COeHGE48A
	GWgLg0fzIsUbk+9G/6WDTcidJUHRKhdSYeg5HuT/qk/hWZ+mE+bPPwfDM2bXtwOxfWjT
	28UahMBnIBOlFntfig93AkJd5ghHWnuNWk5fM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nTuZgVulPyYKQFScIlQrD87Mekn9M4rrLfcsfDvwKWUdGx4A4hwbWzc8ILz8+j3dsT
	H5MWPYwXxrWTuHrTXIHh0wgg9+MYj5L19w7RA27va0ye9z1o+F/cx8AZyks/Wujv/3ih
	UmmkemxQqSFntPMiu5SOuMlX7F99o2+ZrhsXs=
Received: by 10.150.131.14 with SMTP id e14mr4654350ybd.84.1307372211676;
	Mon, 06 Jun 2011 07:56:51 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w19sm697240ybe.25.2011.06.06.07.56.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 07:56:51 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 18:06:35 +0300
Message-Id: <1307372795-32445-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] crda: fix regulatory domain agent for building with libnl2
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
X-List-Received-Date: Mon, 06 Jun 2011 15:00:11 -0000

This patch allows building the wireless regulatory domain agent with
libnl version 2.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/crda/crda_1.1.1.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
index cc19b90..046a9b7 100644
--- a/recipes/crda/crda_1.1.1.bb
+++ b/recipes/crda/crda_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "ISC"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
 RDEPENDS_${PN} = "udev"
@@ -12,6 +12,8 @@ SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
 	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2009.11.25-regulatory.bin;name=reg \
 	"
 
+CFLAGS += " -DCONFIG_LIBNL20"
+
 do_compile() {
 	oe_runmake all_noverify
 }
-- 
1.7.0.4



