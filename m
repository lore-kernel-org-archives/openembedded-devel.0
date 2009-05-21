Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJQ-0005ca-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:16 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=k5FCUkJyYSjQhyVLZZ+UQNzcbUxbXicKbb9j0M1Upx8=;
	b=SyGbPxHrW0FrCWhLXz2ADm2Mv5JJjn0LSMZQCbERY2JcMLRKlRWJqsmQ0I86yVINCW
	UizfB6HrEgNswH18zwaqbpoUMERaEpAgV7DTNH+ajzq0ZjReH4iG7Jn8+3+oDMGoDlnO
	Nzt6e8fbfhl9mpzHS093vI51qS0bf8Y/ZdyQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=VUiSV2fXf/+ZoksZ+sutrW3tgzgxtuuWawwybc3NKZTYrhTG754dTuckAk1BNLcRqt
	QdxgVOCDV/lf059moDiRypKHMeZM0FMou8qY6CPwTkmgizc3a4xDUsMvqR+/4kSX0iSN
	OpJ4r5z7r5d3hkJ6f11MvYhIa8l9V36xEccpk=
Received: by 10.103.168.12 with SMTP id v12mr1061565muo.130.1242873584658;
	Wed, 20 May 2009 19:39:44 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id e9sm129334muf.32.2009.05.20.19.39.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 725C06103B3; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:21 -0300
Message-Id: <1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/23] checksums.ini: add sun-jdk
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
X-List-Received-Date: Thu, 21 May 2009 02:47:16 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8a8c088..f11436e 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11342,6 +11342,10 @@ sha256=f24ae604a20da87e3716bb1d441c483e56479eaef4e99888f41be06059790bca
 md5=4e979c0dda766ba1dd719905ca975c7b
 sha256=202de62e2f3d0667cc464720d5897d0ccb29767ec24e0a4d4c5bd6c4d37425a4
 
+[http://download.java.net/dlj/binaries/jdk-6u10-dlj-linux-i586.bin]
+md5=b70924c697584ab7955050d7a9b4de57
+sha256=dae79e8c56090ac3fb4ac3fe0df9faf6a0c9694a89ef978dce0ab970557ad264
+
 [http://www.jdom.org/dist/binary/jdom-1.1.tar.gz]
 md5=22745cbaaddb12884ed8ee09083d8fe2
 sha256=a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056
-- 
1.6.3.1.54.g99dd



