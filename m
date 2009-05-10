Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1M3DCA-0006AL-4N
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 May 2009 19:52:14 +0200
Received: by wa-out-1112.google.com with SMTP id j4so1094867wah.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 May 2009 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=k2S8u5gqwBttGYZiMkzsAuAkRP4X2OAVjkB3n4yiLps=;
	b=SnCIINotIvIGFloXC+9mGc58tJArWFUFMXU4QtJF/FzIwyKKvTXfbpsyperjYHcixv
	PQBbKv0ZyZoz5JcweyF0EZFAmxwlpUlqKddTioWbOER/i0AwfjnVh8Y9J7AHIMyGHN+D
	aYnRTAzsP+YZENvTkIIKaU10ywNb/FearI/cc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=QP4lwYPa4+SRVfWGavxNJMhQYldsdfpVXXskXBFYVtgQ6OynxzSQw8KjNwz1jgRUgr
	J4TCJVLE8kGU+2qnGxRdvEg+c/SDrT3u8kBV1cjlerx24gGNhJsPnFq2/cgNR21caM6y
	rZUxLBj35L+3JAmIO4+m22Z6u9+uClNyFrqHc=
Received: by 10.114.95.12 with SMTP id s12mr5110079wab.223.1241977547362;
	Sun, 10 May 2009 10:45:47 -0700 (PDT)
Received: from localhost.localdomain
	(adsl-71-146-28-0.dsl.pltn13.sbcglobal.net [71.146.28.0])
	by mx.google.com with ESMTPS id k35sm4648386waf.22.2009.05.10.10.45.44
	(version=SSLv3 cipher=RC4-MD5); Sun, 10 May 2009 10:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 May 2009 10:45:41 -0700
Message-Id: <1241977541-6297-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Subject: [PATCH] python-native_2.6.1.bb: Configure with --with-zlib
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
X-List-Received-Date: Sun, 10 May 2009 17:52:14 -0000

Hi 

I have IMAGE_FSTYPES = "tar" in my local.conf

I was getting errors 

Traceback (most recent call last):
|   File "/home/oe/tmp/staging/i686-linux/usr/bin/ipkg-make-index", line 114, in <module>
|     pkg = ipkg.Package(filename)
|   File "/home/oe/tmp/staging/i686-linux/usr/bin/ipkg.py", line 162, in __init__
|     tarf = tarfile.open("control.tar.gz", "r", tarStream)
|   File "/home/oe/tmp/staging/i686-linux/usr/lib/python2.6/tarfile.py", line 1649, in open
|     raise ReadError("file could not be opened successfully")
| tarfile.ReadError: file could not be opened successfully 

I poked into ipkg.py a bit but it seems that tarfile.py is unsable to load gzip
library due to the python in staging area is not built with zlib which is needed
for gzip module to load.

I built python native with --with-zlib option and it worked fine.

Is the below patch ok ?

---
 recipes/python/python-native_2.6.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-native_2.6.1.bb b/recipes/python/python-native_2.6.1.bb
index 3ae4828..febe271 100644
--- a/recipes/python/python-native_2.6.1.bb
+++ b/recipes/python/python-native_2.6.1.bb
@@ -22,6 +22,7 @@ EXTRA_OEMAKE = '\
   STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
+EXTRA_OECONF += "--with-zlib"
 
 do_stage_append() {
 	install -m 0755 Parser/pgen ${STAGING_BINDIR_NATIVE}/pgen
-- 
1.6.0.4



