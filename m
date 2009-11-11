Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8FDi-0007Hb-FX
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 16:34:57 +0100
Received: by bwz9 with SMTP id 9so1080181bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 07:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Lc/9gcF0SpFPRegy38CenNNh1ohxpLJpX4bGW5Bt6Ko=;
	b=r6Asv1iJ8+o57isLm+nhdXQpvmnZAYPPREgJOvVRfrEnKmv8pOxYxZzVoPf4Wu2pTd
	PmnF37k8Oj3E5Vi9XKHuUMB4efIqx+MOOfRXJov8bqcmC/b0/H0jVpoRvctpTnNx9gFv
	XQUikLJgm6waYmIE2cBTQ+oNJ9LjHd+hDrK24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=N4kWE5Up/NF9fhc5JjkitvYkEX2RhmDpmtfw1qqFIkef+12geo/hHftIzbbguRDWrI
	TMNw0Y3u31EjltBuVsldENPZcHXkEozlBNfe0JDKy8usNrgoOz4V3G/XhxrrVnnqCD9s
	TbbqpBeWF0UynsofZ4wGz8obppRpgALyeWk78=
Received: by 10.204.153.27 with SMTP id i27mr1622860bkw.155.1257953269655;
	Wed, 11 Nov 2009 07:27:49 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm594100fxm.6.2009.11.11.07.27.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Nov 2009 07:27:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 16:27:08 +0100
Message-Id: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 15:34:57 -0000

* Holger Hans Peter Freyther <zecke@openmoko.org> did for the OM git
  tree that was never merged back into OE.
* Taken from xora/angstrom-srcpv branch where it rot for long enough
---
 conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 39a1f27..7c0defe 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -570,7 +570,8 @@ UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P $
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
 SRCDATE = "${DATE}"
 SRCREV = "1"
-AUTOREV = "${@bb.fetch.get_srcrev(d)}"
+SRCPV = "${@bb.fetch.get_srcrev(d)}"
+AUTOREV = "${SRCPV}"
 
 SRC_URI = "file://${FILE}"
 
-- 
1.6.5.2



