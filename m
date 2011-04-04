Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q6qcu-0006BF-5b
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 22:43:56 +0200
Received: by mail-ey0-f175.google.com with SMTP id 27so1698916eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7k9WHFKDiVSUeAhwLbPuR0oXT6eBLj5voJv78k1jCxE=;
	b=NVAs26u+pnTDHXVgILcPwY8m8ZRCAAxHziiS23Y35BP7PZdfhnCRm4CSx4vqOO7sam
	eJo8S1KRe/uopY0yDUnzZvpKm4dIjxf4bzKNrK0JG7d6dy63ESReJSwS5GuZ5HBlMai5
	h08hzb/GysBdqTGb/YgF3SF4Uf3zEDyGvHalo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xavmpPimxE9gUUyo0mGs8zTUAYnahWPvIt1NZASNKoqbgLVSaV+Kyf+uk4JMjp0SRu
	YzHo7VGVLHOgbcQYOIfb+65voao1VKqhUyqnYtUrk7UQRAadK7BSWaWorathfLzf7Fp6
	m1yi+WXD5atgWWSHptQ5AbecPCSg70rWdV+cc=
Received: by 10.213.21.206 with SMTP id k14mr3908629ebb.13.1301949713462;
	Mon, 04 Apr 2011 13:41:53 -0700 (PDT)
Received: from localhost.localdomain (80-186-152-89.elisa-mobile.fi
	[80.186.152.89])
	by mx.google.com with ESMTPS id b52sm3542286eei.22.2011.04.04.13.41.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 13:41:52 -0700 (PDT)
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2011 23:40:31 +0300
Message-Id: <1301949631-6761-2-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
References: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
Subject: [PATCH v2] 2/2] ephoto: new svn build recipe
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
X-List-Received-Date: Mon, 04 Apr 2011 20:43:56 -0000

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
---
 recipes/e17/ephoto_svn.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/e17/ephoto_svn.bb

diff --git a/recipes/e17/ephoto_svn.bb b/recipes/e17/ephoto_svn.bb
new file mode 100644
index 0000000..3b6cadf
--- /dev/null
+++ b/recipes/e17/ephoto_svn.bb
@@ -0,0 +1,12 @@
+LICENSE = "MIT Creative Commons Attribution-ShareAlike 2.5"
+PV = "0.1.0+svnr${SRCREV}"
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=df45d9de58df0b48f515eae8d2421257"
+LIC_FILES_CHKSUM = "file://COPYING.icons;md5=d4e4f10748f3146a089aaa23c9ade59b"
+
+require e-module.inc
+
+DEPENDS += "elementary ethumb ecore eio"
+
+SRCNAME = "${PN}"
-- 
1.7.2.5



