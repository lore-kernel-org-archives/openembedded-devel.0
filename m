Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxguR-0007CH-I0
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:32:40 +0100
Received: by ywg8 with SMTP id 8so683982ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 06:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=wSRluprWH0AJJRuiI2J9OwWZfoTBnVLVCO15EKYtQ5E=;
	b=lY0tC0WFwDPHFawro8TOJqAhdbnjFfEydp9ChLJX1veWfs8eK+kaOFcrOMe+Q2B4c8
	nTaH0cFMKIfA2ZBunKs3OsmkyuFlRMhcz15opcCIf4INnEKT4cT2LjfhlsSUU459tpxU
	We4L8lVfK+tEKUannvbRPHpCJ3kkOpLuyr8jw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=h4mQCwckTtuyQDoBz+oK3cg/vI10N3MT8uh0IZH2rR28DfvpcMbOs7rDP3fDuoG01M
	hSAyijutg0Hn6I9ZKY5cbBQnJrozpMmFr7lZ0lF3DVszRq1VcSZYe6Hcw2kU1IFDnteH
	qvEFLhSO6UBYHAVZnZXMEc69nb6uJtqu9bpDQ=
Received: by 10.150.132.4 with SMTP id f4mr1122510ybd.199.1299767424901;
	Thu, 10 Mar 2011 06:30:24 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w6sm3962040anf.26.2011.03.10.06.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2011 06:30:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:30:03 +0000
Message-Id: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/8] freerdp: workaround gcc linking bug forcing -lpthread
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
X-List-Received-Date: Thu, 10 Mar 2011 14:32:43 -0000

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



