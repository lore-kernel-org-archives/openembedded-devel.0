Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmR-0000FJ-1Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:19 +0200
Received: by gxk3 with SMTP id 3so853519gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tkTqdhvSBIX/V7cgpgdmsIgawYHgEqehCngL8Tnt62o=;
	b=StvQtoO3qJwJVYFBhhID8zLUCITDMN6rwkSy0pq6FoTxVIuK0oBELXD+UE7oCuiK4g
	sgpNRqTFMItXcTGZN1qUHh6+be8hdpUsflSrw8I0fXx9dj0+odzZa0i9xzCBEgts88lj
	Odk6N+hWJMWB8HY7LEscm0t2aAubJT/siKo6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=RJVpX0buXi0h27Xl3j5EpG1nGjgJBWGH3YoKZiuI2xRZV3wk98bOKgaGdNOdDbYHfI
	NYPG7b+wRHrRWI+kZXG4oUo5HGyvrW/4idE4V240Fh3FUrDiSG3/qJgXsXApKPR4U2Af
	CfwOf1Znd9B0DAvJAhoroB9p1X3RAmVlLgx84=
Received: by 10.236.109.168 with SMTP id s28mr5340384yhg.410.1304806351955;
	Sat, 07 May 2011 15:12:31 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:55 +0000
Message-Id: <1304806316-9716-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-6-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 7/8] libiconv: drop hack since gettext was being inherited
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
X-List-Received-Date: Sat, 07 May 2011 22:15:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index 4db70cb..868314b 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-PR = "r1"
-
-#gettext.class cant be inherit here so use this hack
-DEPENDS = "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+PR = "r2"
 
 EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
 
-- 
1.7.2.5



