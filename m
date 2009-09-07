Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MlHye-0003ae-5h
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 09:52:31 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1039160qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 00:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=UwrlLl2JswHdrxCGX0jxihUmW4z47ykkg0C0a7SrIrE=;
	b=qPGy67QkhxDfQj4wnAF6Wf5At/qusRaWA1r+dEDtNZUPjiFbNIAZRPuLY7qj1FhXoe
	fvkQj9RaJzw8wj0fnQMVaKjDp1AUy20pnVp9hmA4JiRKH7ZF9e0vMdrT9usGLXiQwmXi
	zstvWuoEqKmpaMNrTNcg/KkqP1NedtDQyDMyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=X0owebG8HUSj/PQ0P3f4G+3ZM2Sykq+mlbxgAyR65u484jR4zKr6AIcVoDlWQKZ91M
	BRODo+1kkNtyfGEddY4DyzcYolKS+1TPBliUgQc8w37OYyy/a1zXMx0jn4SOTHYeI87H
	b/qfZ3gAVEl0iNHONepDUFyL3dLOOZ25INGQY=
Received: by 10.224.113.212 with SMTP id b20mr7238123qaq.295.1252350725349;
	Mon, 07 Sep 2009 12:12:05 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 6sm1590008qwd.13.2009.09.07.12.12.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Sep 2009 12:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Sep 2009 12:11:43 -0700
Message-Id: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] tar_1.22.bb: Add recipe for 1.22 release.
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
X-List-Received-Date: Wed, 09 Sep 2009 07:52:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/checksums.ini      |    4 ++++
 recipes/tar/tar_1.22.bb |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tar/tar_1.22.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 053a2ad..e720a28 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23734,6 +23734,10 @@ sha256=44944ee0427c8e0d8dbaa0b8f900073a7456819610cc521c53630c3eb117cf5e
 md5=1a7e17f27abf583b3b0bc059a827e68b
 sha256=be8bf33afb5adc2377e45d94693ffd46b75f267f9b808df0c7006e51211f9deb
 
+[ftp://ftp.gnu.org/gnu/tar/tar-1.22.tar.bz2]
+md5=07fa517027f426bb80f5f5ff91b63585
+sha256=3cefb67f197a3f8f5235999fe749ced0889466a71ddcbc96fddca84e5d53aa4d
+
 [http://downloads.sourceforge.net/subapplet/tasklist-105.tar.gz]
 md5=dc62a061d83cf72d1eca7e8ae2c8e1a6
 sha256=4078c44beebfd298995983b9e2ea189167a1ab081d96a7c485a67b65a974e878
diff --git a/recipes/tar/tar_1.22.bb b/recipes/tar/tar_1.22.bb
new file mode 100644
index 0000000..25163ac
--- /dev/null
+++ b/recipes/tar/tar_1.22.bb
@@ -0,0 +1 @@
+require tar.inc
-- 
1.6.3.3



