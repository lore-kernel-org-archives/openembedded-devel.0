Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PikYg-0004Wu-M8
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 10:24:04 +0100
Received: by fxm17 with SMTP id 17so3160958fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 01:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+BGPf8Q6d6po5ja4sQJ4job9ccq5Dty/qN5AiVQLWMM=;
	b=J/iTupB93xKdLU6p2W0EFJ2wFqwWisWw9vs0DdQirIMiMu0djrNxji/6xnajZnu7Mk
	/g4ay9u9FxS1kagHNPTPfYNs5wSu4onmHzQknrhCnDg5v3fHFDtRbhbPOnzOPN2wClxk
	ckEyWNPJNj88mE/wJIDi9+aUnFAYQMO+pU64k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eBGhL2gR+vNQML2s9mjcjbcQ3bwzg7u5c3IFszq6jfFdGSiKvN2Td4NYexAxtDZTVl
	yUCUJF6xuG/JkOkXejshRLoemdh8NrFrJa5xRxqPTjLBGZIfSftxh35MRq+qKVIG2LUI
	r206aKrJpYANtWpFAAovnJHe8faMgGrduVSrs=
Received: by 10.223.101.135 with SMTP id c7mr2097792fao.76.1296206585369;
	Fri, 28 Jan 2011 01:23:05 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id e17sm6329217fak.34.2011.01.28.01.23.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Jan 2011 01:23:04 -0800 (PST)
From: "sujak.marek" <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 10:22:53 +0100
Message-Id: <1296206573-12521-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] Barebox: add barebox 2010.10.bb recipe * Used as bootloader for vmx25 module
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
X-List-Received-Date: Fri, 28 Jan 2011 09:24:04 -0000

Signed-off-by: sujak.marek <sujak.marek@gmail.com>
---
 recipes/barebox/barebox_2010.10.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/barebox/barebox_2010.10.bb

diff --git a/recipes/barebox/barebox_2010.10.bb b/recipes/barebox/barebox_2010.10.bb
new file mode 100644
index 0000000..b079a7c
--- /dev/null
+++ b/recipes/barebox/barebox_2010.10.bb
@@ -0,0 +1,25 @@
+require barebox.inc
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_vmx25 = "1"
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
+SRC_URI_append_vmx25 = "\
+	file://barebox_2010.10-vmx25-20110112.patch; \
+	"
+
+SRC_URI[barebox-2010.10.0.md5sum] = "60c208f86333430804d6e2ed40e4ff33"
+SRC_URI[barebox-2010.10.0.sha256sum] = "4ba3b6aa4cb0ad91dcf3c4f15951dc5f642ed86e5297bfd79d842cc1ad0b7841"
-- 
1.7.0.4



