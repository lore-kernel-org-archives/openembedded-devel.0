Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068V-GX
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402464fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=mV4Pi+GvNhNiOM8U02OePlxtrGkC9TSEU6A51q4e4bI=;
	b=wCh86yJY+1QOQv9TUzL72z5WRwaSnaSzstNcRItmv1Hmu1F19jjEkBAi2TCP8440Iz
	jxtqHa9hnvvs605qX6JDOEq6bd4hCn9+Ipq+dZMsE+ypuGcoUX6mxqwfUVUHJz+UzxE2
	AYmmKkQt9vwm6SnLcFAvQOEteun3yyy9iCu00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Yhi+W1Fpn3Dvdb0ONdG48gQBx6idlL8Ab0jRm4KYRyfGI9BHgWMmWdx0c7/zqm9eF2
	mOSY/QylCneHBNxIfBTuF4zl4OSLOQZgPMcR6gzIuu7qSuBby7jqwpd1P2izHRAPW7kJ
	H0Q3fyQKYaaYILF4W+6kcAwscEZfOeaFDa8iI=
Received: by 10.223.132.209 with SMTP id c17mr933044fat.37.1265832656460;
	Wed, 10 Feb 2010 12:10:56 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 22sm2619220fkr.27.2010.02.10.12.10.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CS-5r; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:56 +0100
Message-Id: <1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 4/8] handle xz compressed files and tarballs
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/base.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 9a24272..990e75e 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -794,6 +794,10 @@ def oe_unpack_file(file, data, url = None):
 		cmd = 'gzip -dc %s > %s' % (file, efile)
 	elif file.endswith('.bz2'):
 		cmd = 'bzip2 -dc %s > %s' % (file, efile)
+	elif file.endswith('.tar.xz'):
+		cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
+	elif file.endswith('.xz'):
+		cmd = 'xz -dc %s > %s' % (file, efile)
 	elif file.endswith('.zip') or file.endswith('.jar'):
 		cmd = 'unzip -q -o'
 		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
-- 
1.6.5



