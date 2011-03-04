Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PvYRq-0002ns-JZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 18:05:50 +0100
Received: by gxk1 with SMTP id 1so866292gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 09:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=wSRluprWH0AJJRuiI2J9OwWZfoTBnVLVCO15EKYtQ5E=;
	b=u1t8NkK3ZiXx1KTq6L6uImCdsUZ6yPzCp4UmwpIADPK+q4GxrVHTCyyQ3HOjq0wpXY
	jFthlNb+2jZ9yhkF4jt939HfQA2xMNDY1UbHy94GLqtBZ7xjdSZbDILIxWZancUP+q0b
	DxGDzKbhcGhd/qHR34ElkDJfKUarogZ4/6vps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=EXAAaSdg0DRkba+/h5Zy4DiTTtvY5rSs/Kn9yr4UwfZS6MZHB61xoicCWk430HbONs
	rVXQ9wnPPLjY+IC9c9cw2jDdvNNC6nUaVkaRDp1WwcdrpamHYPB4Kw00sEFBQpxk9ze0
	EcD6WVaIbYblZLz3OR+6dNCzQYRusVAdymhZc=
Received: by 10.101.24.1 with SMTP id b1mr327275anj.251.1299258260072;
	Fri, 04 Mar 2011 09:04:20 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i10sm1164437anh.12.2011.03.04.09.04.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 09:04:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 17:04:05 +0000
Message-Id: <1299258247-13554-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] freerdp: workaround gcc linking bug forcing -lpthread
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
X-List-Received-Date: Fri, 04 Mar 2011 17:05:50 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/freerdp/freerdp.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/freerdp/freerdp.inc b/recipes/freerdp/freerdp.inc
index 0690d6e..10ce13c 100644
--- a/recipes/freerdp/freerdp.inc
+++ b/recipes/freerdp/freerdp.inc
@@ -8,10 +8,15 @@ RDEPENDS_${PN} += "xprop"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit pkgconfig autotools
 
+do_configure_prepend() {
+	# workaround gcc linking bug
+	find ${S} -name 'Makefile.am' | xargs -n 1 sed 's,-pthread,-lpthread -D_REENTRANT,g' -i
+}
+
 do_install_append() {
 	rm ${D}${libdir}/freerdp/*.a ${D}${libdir}/freerdp/*.la
 }
-- 
1.7.2.3



