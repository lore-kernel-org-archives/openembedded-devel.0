Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ark-0000Uf-Df
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:36 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008390ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Q3YFRGlOqLLTbUXFQ70f5Yc8ucOhvkna6/80JohIi2c=;
	b=PbjErOBkqOkTxqgF8RKjwFl9gSDGpAmOCKeTG9Qbdqm5rNdzmMgpLK1TFZJUSGSDsa
	bSahWvJ1O/iXmg4QnUYztGuyaCaKPrIsr3dKlpss0SKUK6cy54WJcQdMoZfp3LnBUfzE
	mbQFnD6cbABQCb4ICqLL5zz0CIcKa1odMGqCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=kU1hVXexT31JrPUBE1BqgXbE0im/IcUsSxW9C0NhTg/iHenYrrrhDQv6WHhqPHQycr
	e8Cu/AZsqrt4IzpB7dKfGYZ8ZIQuO6w1LNlNhAs5Yv6G1AEMGlnl4Nsfz4KlaLRIhy6h
	U2dIvPnEjN1loJVZNLwma+pGYfhtE50Dv13ww=
Received: by 10.100.227.18 with SMTP id z18mr10033026ang.67.1241830220122;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm3652937ywo.16.2009.05.08.17.50.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id EBC3B6101A4; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:31 -0300
Message-Id: <1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 15/23] rt61-firmware: fix installation of binary files
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
X-List-Received-Date: Sat, 09 May 2009 00:56:36 -0000

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
1.6.3.rc1.51.gea0b7



