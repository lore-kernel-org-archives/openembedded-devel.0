Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax8-0004e9-FL
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137685fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=Rn2PVx4UW17L7TXWnaLaxDQNDdcHc/U3K7glChJTfL4=;
	b=jvyQ41ifEo5lZT9ZgKE949yAlXkdIbmEO8kOpR/GyvP0zJeK0tbmn5x0ZP6NGQSHlM
	J80vwanWUgRbDnv13cyjPh7ANe++dVilZp1khVYdc5QW9JXDyi+7DSUOSTeFRFm/NUBl
	aDEjzPDHc4yPHdYZsQc19MKpYR0PZr5Zwmiyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CexLUGdJNZFliv9OT/PCOhmSGDNobF6fRDSjDbx7pwFf2D7jDgdkhKNw+1WCHOpxlk
	b1KYJZkjAvHoE6B+5wHe1TcwXQw9kqs9suDHZ8Ix/jf7yliQ3qqa+Kk0qhadJdVxWajl
	RLDPLhCpQ9XWyRMAy4K15H7l3mwRcLbs1vm/Q=
Received: by 10.223.3.67 with SMTP id 3mr3138632fam.25.1265663578457;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 19sm47491fkr.18.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GF-F9; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:27 +0100
Message-Id: <1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 06/12] quilt: use builtin date routines
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

quilt tries to use an RFC822 date format which is obsoleted
by rfc2822 since 8 years now.
It has a builtin date handler, so use that and not the date
binary (which may only support rfc2822 by now, as busybox does)

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/quilt/quilt-native.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/quilt/quilt-native.inc b/recipes/quilt/quilt-native.inc
index f815969..cad1b74 100644
--- a/recipes/quilt/quilt-native.inc
+++ b/recipes/quilt/quilt-native.inc
@@ -9,7 +9,7 @@ INHIBIT_AUTOTOOLS_DEPS = "1"
 inherit autotools native
 
 PATCHTOOL = "patch"
-EXTRA_OECONF = "--disable-nls"
+EXTRA_OECONF = "--disable-nls --without-date"
 
 do_configure () {
 	oe_runconf
-- 
1.6.5



