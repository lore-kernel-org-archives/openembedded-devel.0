Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PjpI8-00087R-CK
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 09:39:20 +0100
Received: by fxm17 with SMTP id 17so5411425fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 00:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=jsuCH+h4H3xSCib7wq8+7F1A+FuKDrEX4Pz3rlnzlfA=;
	b=HocrkD56YZNDfvucisLnzh+ffbIyKNJoQjK/NXn/61dz7IJ2deOYvU3my/6v50V8hp
	VtVjWiADsN07o3EvSCIeTTqMmr2Yv48NU5x8cZ0l7E+z/6ZZsGQC8uVHf/Pko8Kr2eOt
	bXlK+1bKzaD0uIhL+eTz2KeLfz1LsfpDlEicU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gtf5zDfpj20lSx0piMf57Skntn8RLurw4grfjTUJEtypgsPMdHN6xgQwu0amCPJgIT
	5Nw+l9NmBX/e1rn5qJl/dyxakRJPclyfwHvJ8HvMch6SIRHI0HbH8Lj1ILPUTEfPR6Tu
	Pe1Y5m0ZD6zh/bHNvKyj+2CRSn61uSAweYbUQ=
Received: by 10.223.101.199 with SMTP id d7mr5709991fao.65.1296463103101;
	Mon, 31 Jan 2011 00:38:23 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id k6sm7224109faa.30.2011.01.31.00.38.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Jan 2011 00:38:22 -0800 (PST)
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 09:38:12 +0100
Message-Id: <1296463092-18822-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296206573-12521-1-git-send-email-sujak.marek@gmail.com>
References: <1296206573-12521-1-git-send-email-sujak.marek@gmail.com>
Subject: [PATCH v3] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Mon, 31 Jan 2011 08:39:20 -0000

Signed-off-by: Marek Sujak <sujak.marek@gmail.com>
---
 recipes/barebox/barebox_2010.10.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/barebox/barebox_2010.10.bb

diff --git a/recipes/barebox/barebox_2010.10.bb b/recipes/barebox/barebox_2010.10.bb
new file mode 100644
index 0000000..40d4358
--- /dev/null
+++ b/recipes/barebox/barebox_2010.10.bb
@@ -0,0 +1,17 @@
+require barebox.inc
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+BAREBOX_REVISION ?= "0"
+
+S = "${WORKDIR}/barebox-${PV}.${BAREBOX_REVISION}"
+
+SRC_URI = "\
+	http://barebox.org/download/barebox-${PV}.${BAREBOX_REVISION}.tar.bz2;name=barebox-${PV}.${BAREBOX_REVISION} \
+	file://defconfig \
+	"
+
+SRC_URI[barebox-2010.10.0.md5sum] = "60c208f86333430804d6e2ed40e4ff33"
+SRC_URI[barebox-2010.10.0.sha256sum] = "4ba3b6aa4cb0ad91dcf3c4f15951dc5f642ed86e5297bfd79d842cc1ad0b7841"
-- 
1.7.0.4



