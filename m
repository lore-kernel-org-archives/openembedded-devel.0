Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJS-0005cb-Vr
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:19 +0200
Received: by mail-bw0-f171.google.com with SMTP id 19so784003bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Pg2ryhHhNEl3Q3uRdO9JpPixXmU3LGnfoIdxJxbw8nk=;
	b=ogPG/0qtFEaCpPziU6jIrzEDjYyjYjhmEKihfVI4N89aDV0d0vtXboI91k+iqGL4hJ
	M+g0Dtuc8+79xu6AVAcaKzmKR6YYeYP/sW+DdqCD1QQu2MiyfrZZzqUKLJR8MMQnErAa
	4nYm6zQF75Y1TcHBaO1S1yU/H8tH9AoHQrbuo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=NOiAjDiDhyJu2z+QxwYZ/mCmoVaMMcBaFNBtWLY3QdNFXZvn1ZniZlxtwNAlot6tZh
	R/eiPGVsDTQVfmoWM7c882WdVY4y98s8CoW+wex/OKtKa0vGN0FHevQOCODQuVOYGj/j
	N8RnlThsCHZJJFiRsZTeFm9ZSrVGW/m7ZC9jQ=
Received: by 10.103.168.5 with SMTP id v5mr1087451muo.77.1242873587620;
	Wed, 20 May 2009 19:39:47 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id j9sm289771mue.51.2009.05.20.19.39.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id DC2B86103B6; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:28 -0300
Message-Id: <1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/23] rt61-firmware: fix installation of binary files
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
X-List-Received-Date: Thu, 21 May 2009 02:47:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/rt2x00/rt61-firmware_1.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/rt2x00/rt61-firmware_1.2.bb b/recipes/rt2x00/rt61-firmware_1.2.bb
index ae683c8..9fad60d 100644
--- a/recipes/rt2x00/rt61-firmware_1.2.bb
+++ b/recipes/rt2x00/rt61-firmware_1.2.bb
@@ -7,7 +7,7 @@ S = "${WORKDIR}/RT61_Firmware_V${PV}"
 
 do_install() {
 	install -d ${D}/${base_libdir}/firmware
-	install -m 0644 rt61.bin ${D}/${base_libdir}/firmware/
+	install -m 0644 *.bin ${D}/${base_libdir}/firmware/
 }
 
 FILES_${PN} = "${base_libdir}/firmware/"
-- 
1.6.3.1.54.g99dd



