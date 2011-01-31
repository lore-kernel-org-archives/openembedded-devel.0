Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pjpsm-0003IO-LN
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:17:12 +0100
Received: by fxm17 with SMTP id 17so5440051fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=OV9YMP8G3stCLcADWnI/Nl2ySIXECPPh9Fdahv8X4zk=;
	b=l+lXhbnkHkRUMXAK5krrrAtsTahzK+YJRajLKKNFguD3TLm+11UA4Vj/uLcZM26c0E
	6/EFU1c5iZTpLEQ/sMm8VMyWwuE01xmJU67zoBwePdbTjHneoiRgKwFf4sJXnezgCWKj
	nFlDyVfYrnrA7+3xP+7AzZhf5U5dzVFlwyD4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RA7nLHTrCYcRxKFFXK3ixF+QLZFX+l33CcFOLZ4c+qbU6+EbaymruomxzdlAwFo1bT
	AQY7KP+HWPb9MLtCIbPBTACFs3CPqdQkjCTl3/CVne/A1w6q73YaYDU5np+liw4ZKypx
	MlzF7UF4U8gkB4SlTTZ4yobFn7b1GL8j93K4w=
Received: by 10.223.54.132 with SMTP id q4mr535449fag.117.1296465379389;
	Mon, 31 Jan 2011 01:16:19 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id 5sm7252443fak.47.2011.01.31.01.16.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Jan 2011 01:16:18 -0800 (PST)
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 10:16:06 +0100
Message-Id: <1296465366-19099-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3] barebox: update barebox 2010.10 to support vmx25
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
X-List-Received-Date: Mon, 31 Jan 2011 09:17:12 -0000

Signed-off-by: Marek Sujak <sujak.marek@gmail.com>
---
 recipes/barebox/barebox_2010.10.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/recipes/barebox/barebox_2010.10.bb b/recipes/barebox/barebox_2010.10.bb
index 40d4358..da9d83b 100644
--- a/recipes/barebox/barebox_2010.10.bb
+++ b/recipes/barebox/barebox_2010.10.bb
@@ -3,6 +3,7 @@ require barebox.inc
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_vmx25 = "1"
 
 BAREBOX_REVISION ?= "0"
 
@@ -13,5 +14,9 @@ SRC_URI = "\
 	file://defconfig \
 	"
 
+SRC_URI_append_vmx25 = "\
+	file://barebox_2010.10-vmx25-20110112.patch; \
+	"
+
 SRC_URI[barebox-2010.10.0.md5sum] = "60c208f86333430804d6e2ed40e4ff33"
 SRC_URI[barebox-2010.10.0.sha256sum] = "4ba3b6aa4cb0ad91dcf3c4f15951dc5f642ed86e5297bfd79d842cc1ad0b7841"
-- 
1.7.0.4



