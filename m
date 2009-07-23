Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MTvfn-0005YD-Oo
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 12:37:15 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MTvRI-0001VO-FM
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 12:22:16 +0200
Message-ID: <4A683A05.7060204@kernelconcepts.de>
Date: Thu, 23 Jul 2009 12:23:01 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.7
Subject: RFC: eglibc libc6 and tzdata
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
X-List-Received-Date: Thu, 23 Jul 2009 10:37:16 -0000
Content-Type: multipart/mixed; boundary="------------090700080101090401090202"

--------------090700080101090401090202
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

the eglibc libc6 package provides tzdata. The applied patch add this knowledge
to the eglibc-package class.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

--------------090700080101090401090202
Content-Type: text/x-patch;
 name="0001-eglibc-libc6-package-provides-tzdata.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-eglibc-libc6-package-provides-tzdata.patch"

From 30d75e2580414498c86c6c1e023d35631019c370 Mon Sep 17 00:00:00 2001
From: Florian Boor <florian.boor@kernelconcepts.de>
Date: Thu, 23 Jul 2009 12:17:33 +0200
Subject: [PATCH] eglibc: libc6 package provides tzdata
 Avoids conflict with tzdata package.

---
 recipes/eglibc/eglibc-package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index d8ac4f4..11311b6 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -29,7 +29,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
 
-RPROVIDES_eglibc = "glibc"
+RPROVIDES_eglibc = "glibc tzdata"
 RPROVIDES_eglibc-utils = "glibc-utils"
 RPROVIDES_eglibc-dev = "glibc-dev"
 RPROVIDES_eglibc-doc = "glibc-doc"
-- 
1.5.6.5


--------------090700080101090401090202--
