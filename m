Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068U-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402463fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=+8uGSTwLciBEAj6wORi1WyacX4MA0N7ASLM1I5LHPJE=;
	b=XHwzfCAPrQ8B/mGey6bkAyh3OQIB+IyzezTD0qC8RbDhCaT37jJes9UfAOWpiPJsld
	wvYAd1ZlINkCAbVJC2LLCOhLi9HU/fmdQvUvExX28fp/6sYjzaXx04hXbVmddBEBUvC9
	P4dU+oXdFR9a42mw+x+L2aqzSBYY9M4/fbUkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rF4ezhxwpKHHq5nKNpat4oAAgDlLAaMJyLvaJH3Gi24ZE7Svy3Wok8Xs/kSHo9mlBp
	C2j9gnQDHrIshWvTU93uHfOTvmQYMXY/UpKGF01uPAf2JuWOkfkELDv3XgLbyfuewtT/
	IxYZ5B3ZffjqMA4zXibF+OB/pzJMv6ZvKhTpY=
Received: by 10.223.77.91 with SMTP id f27mr908922fak.60.1265832654802;
	Wed, 10 Feb 2010 12:10:54 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 2sm2608625fks.43.2010.02.10.12.10.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:52 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CQ-54; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:55 +0100
Message-Id: <1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/8] gmp: set SRC_URI name
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
 recipes/gmp/gmp.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
index 71ea128..67e5c49 100644
--- a/recipes/gmp/gmp.inc
+++ b/recipes/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU multiprecision arithmetic library"
 HOMEPAGE = "http://www.swox.com/gmp/"
 LICENSE = "GPL LGPL"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gmp/gmp-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2;name=gmp \
 	   file://configure.patch;patch=1 \
 	   file://amd64.patch;patch=1"
 
-- 
1.6.5



