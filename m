Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NrAhb-0001Iq-Oj
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:51:33 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS546qjfivcSjHE8xMp0N31DsDNt22+tO@postini.com;
	Mon, 15 Mar 2010 06:48:28 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip04.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:32:25 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 15 Mar 2010 09:32:05 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 13:35:17 +0000
Message-ID: <20100315133517.30979.75275.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.24
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Correct SRC_URL for fftw-3.1.2
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
X-List-Received-Date: Mon, 15 Mar 2010 13:51:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The fftw-3.1.2 tarball has been moved to a sub-directory. Over-ride the
SRC_URL provided in the .inc file.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 conf/checksums.ini          |    2 +-
 recipes/fftw/fftw_3.1.2.bb  |    2 ++
 recipes/fftw/fftwf_3.1.2.bb |    2 ++
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 63cf415..b21a35a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6918,7 +6918,7 @@ sha256=16de61d7426b1df7aee54b48c16aa728de1ed82f95db5fc4d8886d5d2702d90a
 md5=e67e1c2eb134d2fba50a524188b6a3b4
 sha256=61ba89c0deaaf324485b2bf480fdb90941b74e2c47b4810e34f530b77005bb8c
 
-[http://www.fftw.org/fftw-3.1.2.tar.gz]
+[ftp://ftp.fftw.org/pub/fftw/old/fftw-3.1.2.tar.gz]
 md5=08f2e21c9fd02f4be2bd53a62592afa4
 sha256=e1b92e97fe27efcbd150212d0d287ac907bd2fef0af32e16284fef5d1c1c26bf
 
diff --git a/recipes/fftw/fftw_3.1.2.bb b/recipes/fftw/fftw_3.1.2.bb
index bb58aac..b170179 100644
--- a/recipes/fftw/fftw_3.1.2.bb
+++ b/recipes/fftw/fftw_3.1.2.bb
@@ -1,5 +1,7 @@
 require fftw.inc
 
+SRC_URI = "ftp://ftp.fftw.org/pub/fftw/old/fftw-${PV}.tar.gz"
+
 EXTRA_OECONF = "--disable-fortran --enable-shared"
 
 
diff --git a/recipes/fftw/fftwf_3.1.2.bb b/recipes/fftw/fftwf_3.1.2.bb
index a0bba2c..83a7f4b 100644
--- a/recipes/fftw/fftwf_3.1.2.bb
+++ b/recipes/fftw/fftwf_3.1.2.bb
@@ -1,4 +1,6 @@
 require fftw.inc
 
+SRC_URI = "ftp://ftp.fftw.org/pub/fftw/old/fftw-${PV}.tar.gz"
+
 EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared"
 


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


