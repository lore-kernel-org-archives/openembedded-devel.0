Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arl-0000U1-CP
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:37 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008350ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=o/thMdT2dP/qEULQd/dOdf0nlqkrRcCwu9pgIBe5qXI=;
	b=n74JKcmrzwPQLQshvb7supEXRln36KaMOMERooDlwCfQjUT+Mjzng71ryc7DsV0XBS
	cNR60whL2lthhpXWZKsLek2ZKbeOw5fxknnZlzUEHdcjzvDs+G0U2lWwpGjT+xOWIsls
	XUGIqsRVMRTIY9nSTW3QuLQCm3VIvvcvJrABA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=jiWeTGGPbMvxvaX/Mf3qyUxkJB53dNJheX+3OF5rpUho2OfmHrWptI/AfSoncSlwX7
	hyDiwwljwu5e6Pw0OC2xX0upvBpGzKYwRYeOchmKU8IuIGjN5PevXhQCD8H0fLB7w8fo
	NT7cQLbioTb1k+jm2v5B1W+s3SQmLs1RRDLpo=
Received: by 10.100.153.6 with SMTP id a6mr10175141ane.29.1241830222019;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm1237216ywd.25.2009.05.08.17.50.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0DFCE6101A8; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:36 -0300
Message-Id: <1241830239-5594-21-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-20-git-send-email-otavio@ossystems.com.br>
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
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-20-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 20/23] cups: undo mangle of cups_{datadir, serverbin} in cups-config
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
X-List-Received-Date: Sat, 09 May 2009 00:56:37 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cups/cups.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/cups/cups.inc b/recipes/cups/cups.inc
index 074bf83..ba59ab8 100644
--- a/recipes/cups/cups.inc
+++ b/recipes/cups/cups.inc
@@ -62,6 +62,13 @@ python do_package_append() {
 	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
 }
 
+do_stage_append() {
+	# Undo mangle of cups_datadir and cups_serverbin
+	sed -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:g' \
+	    -e 's:cups_serverbin=.*:cups_serverbin=${libdir}/cups:g' \
+	    -i ${STAGING_BINDIR_CROSS}/cups-config
+}
+
 PACKAGES_DYNAMIC += "${PN}-backend-*"
 
 python populate_packages_prepend() {
-- 
1.6.3.rc1.51.gea0b7



