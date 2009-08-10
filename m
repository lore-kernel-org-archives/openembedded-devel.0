Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <manuel.pietschmann@googlemail.com>)
	id 1MaPmW-0006jb-E3 for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 09:59:00 +0200
Received: by an-out-0708.google.com with SMTP id c5so919825anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=mnAl94PcWXRSjpem2LjCy6eB3SIimSIspF9vO0zd2lM=;
	b=eJNN/kfihxXraCpEqEs8o7Y8ugkELYsDqSWDYs29jzbukmjdU/aJbfWzNSSGyYq/gO
	jpmV1seIvjh5PCj8fUaDm26bbrnqiwUY239uNYLDePxlSYfSm++eapEd6GGXkbtQ5Jn9
	zRhlsEnTMEWoXnmrm1GmVKLOfuQoH3H/BGx6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VUfl8aUTk0p0bs8bgRPArm0qWGDbvD0RpnFO4TOgmwVH7zvkCLcY3clDGKGwuXyxJE
	yzqRvLCQ1joFgqe+b64/mJyoaCPnLEXUdWGT2LV2ey3Vdf4IN4eY6LNJJc0hi4u8yWcd
	G+qXGRCwHzyJN0Cr5XRAy3B52E07DfJw1720k=
MIME-Version: 1.0
Received: by 10.100.212.16 with SMTP id k16mr3081848ang.184.1249890170259; 
	Mon, 10 Aug 2009 00:42:50 -0700 (PDT)
Date: Mon, 10 Aug 2009 09:42:49 +0200
Message-ID: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
From: Manuel Pietschmann <manuel.pietschmann@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python-sip: update 4.7.9 -> 4.8.2
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
X-List-Received-Date: Mon, 10 Aug 2009 07:59:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff --git a/conf/checksums.ini b/conf/checksums.ini
index dd18af3..11ccb29 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -28538,3 +28538,7 @@
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.8.2.tar.gz]
+md5=7ae60712aa6b4095a8cdab11b437f8f0
+sha256=2ebb29deb2bbcdb99f47866e59deea7c6d98be0c835547b043eefd151516d9a9
+
diff --git a/recipes/python/python-sip_4.7.9.bb
b/recipes/python/python-sip_4.7.9.bb
deleted file mode 100644
index db88ba9..0000000
--- a/recipes/python/python-sip_4.7.9.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-sip.inc
-PR = "ml0"
diff --git a/recipes/python/python-sip_4.8.2.bb
b/recipes/python/python-sip_4.8.2.bb
new file mode 100644
index 0000000..db88ba9
--- /dev/null
+++ b/recipes/python/python-sip_4.8.2.bb
@@ -0,0 +1,2 @@
+require python-sip.inc
+PR = "ml0"
-- 
1.5.6.3


