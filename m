Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUaT-0004ra-S5
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:34:54 +0100
Received: by ywg8 with SMTP id 8so1614754ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=wSRluprWH0AJJRuiI2J9OwWZfoTBnVLVCO15EKYtQ5E=;
	b=Y3n+hjQjOgUR0g9XOuudMq0Na/+yzDpjVkHAq4ySTlg/nCYxlO6fSNy4tuPPWp5+Pt
	36dOAI2yizIkw8TrZ8o2Rf3nBXbprTfkU+40MWSBCzvBBL4h/ci/b1DR8MpHBpmvOjt6
	vwWflxFi8Q60vsmObRaWRlZ41JKkZfcxzH+to=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=HufFgdJTrYlTANItUAkPkttSa1+85o1DV0TNgWgdcPmCY0q9vRfkeKWdQhigSxIUgA
	i/rNzRUr7seUyYMxK5FURPoonz61usKVJfJPnoG7W7WiapnyHWRfDo3ITw38u6PHt/ig
	++0CFZC6MzJHMdG7iMYowz0Hhy8oLeDNm1CWY=
Received: by 10.236.27.206 with SMTP id e54mr4525315yha.377.1299958052603;
	Sat, 12 Mar 2011 11:27:32 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:08 +0000
Message-Id: <1299958038-25216-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/11] freerdp: workaround gcc linking bug forcing -lpthread
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
X-List-Received-Date: Sat, 12 Mar 2011 19:34:54 -0000

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



