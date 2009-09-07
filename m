Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlBg6-0001SO-UQ
	for openembedded-devel@openembedded.org; Wed, 09 Sep 2009 03:08:57 +0200
Received: by bwz6 with SMTP id 6so2922551bwz.12
	for <openembedded-devel@openembedded.org>;
	Tue, 08 Sep 2009 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WnSflRhwHnFK52fW6FOEjS3IgEfICOgTk7MIvpCLLrY=;
	b=uExFVIB2ksql4NWK9WUChI9nTfOwsBICYIyjcCLtF5cKpzCTT/3vyciJvBJDRh/Mc1
	Qx5dW+22lTXSxH6dbpQyRyHoczYEZMNHWu52juLdg203Lq2dHrAwrLJWn+VkAZ4QG7Lr
	I5/7WfQEXhswPH6vM6dHmV0OtgYiYV6BnjkVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LWFeC5bZEDCX2aAHQLN32yulqyHZkeTv909p0aAhWsC5YE6smvCjw4hpSgbmdcJCjk
	tOhj+Bs4IzwFlB9DNZdOukPis/FZny5tm9iDL+yywxVngGYOpdfOJRoDnPhGOKwuPgCE
	TR695xKqrjlRWMA+vuzujPWn9kiYkpqoTvSZ8=
Received: by 10.103.125.37 with SMTP id c37mr6111958mun.69.1252329035700;
	Mon, 07 Sep 2009 06:10:35 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id e8sm14850910muf.31.2009.09.07.06.10.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 06:10:34 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@openembedded.org
Date: Mon,  7 Sep 2009 16:10:15 +0300
Message-Id: <1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.210
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fixed checksum for tda1004x-firmware.
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
X-List-Received-Date: Wed, 09 Sep 2009 01:08:58 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 053a2ad..bb075cc 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -18299,8 +18299,8 @@ md5=7fa369bff1031acbe4ca41f03bee7d02
 sha256=53d2f92c3d14423b49c2ff077855cf3987d38def963c82fd26fba5de379ca540
 
 [http://hauppauge.lightpath.net/de/nova-pci218c.exe]
-md5=139a1ed50a1a12e47b1f7deedf4f40c3
-sha256=4310a3a526ae5461e17f57353fc29f71d13820a215eaa62c629190cc2a026173
+md5=c4c751d8a79f6701fda4a1813c5d5823
+sha256=c5c54c57745cdf2390959e33f2cd44b87370f18b217f12de195d9f2de1c07b22
 
 [http://downloads.pf.itd.nrl.navy.mil/olsr/nrlolsrdv7.8.1.tgz]
 md5=46291de38362acdcd335bcf259055046
-- 
1.5.6.5



