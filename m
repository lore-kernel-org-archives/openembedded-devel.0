Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NR0Jt-0006FL-VK
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 10:30:53 +0100
Received: by pxi13 with SMTP id 13so6335645pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=zbbqy5arb8kYzEIsYGmNU7pvkAbgVUvo+ukeMtP4ANY=;
	b=bEdlnYhGmctMqj7v2isO9JRZCEklnVUEAc/ME2iB9azV0BSrwn9bicvcEhALShfgM8
	/GuMwLxBaSU6lD8X5jVan8WZrn/wpYkKdNnyGTqsR5+meqxHkCTkCUR5Frq5TxrIdUOb
	JrDT3CeBQgj4VwwK7wUpKRFJyDsOQuIj05fLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TTQzQCsDOFszwAdhBs/rR2nIs8WC8X3AQ3aSN1sKnAsWJkYl7FHRiE7tFLj8GtQLSJ
	wwH7RNUnLrw91gkrUGgYe5S4ftaco5W6RAr6ryfSAcbc3/LeJ26hBZ1MAbquvLLwCIfW
	JhdcN9Gtls2KuDAuMuWJa59zS136caSZil3vo=
Received: by 10.142.6.11 with SMTP id 11mr9899957wff.260.1262424528305;
	Sat, 02 Jan 2010 01:28:48 -0800 (PST)
Received: from localhost ([123.54.101.56])
	by mx.google.com with ESMTPS id 23sm16060891pzk.0.2010.01.02.01.28.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 01:28:47 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2010 17:28:37 +0800
Message-Id: <1262424517-21966-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add mips entry for linux-uclibc into package_qa_get_machine_dict of insane.bbclass
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
X-List-Received-Date: Sat, 02 Jan 2010 09:30:53 -0000

* Without it the insance check will fail due to key miss exception.

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 classes/insane.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 495c3a5..804caf0 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -61,6 +61,7 @@ def package_qa_get_machine_dict():
                         "i486":       (   3,     0,    0,          True,          True),
                         "i586":       (   3,     0,    0,          True,          True),
                         "i686":       (   3,     0,    0,          True,          True),
+                        "mips":       (   8,     0,    0,          False,         True),
                         "mipsel":     (   8,     0,    0,          True,          True),
                         "avr32":      (6317,     0,    0,          False,         True),
 			"sh4":        (42,	 0,    0,          True,          True),
-- 
1.5.4.3



