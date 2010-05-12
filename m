Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OCDHs-0000i6-NG
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 16:51:55 +0200
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS+q/ni4XfSJZr8euHMYM29aII1sziseP@postini.com;
	Wed, 12 May 2010 07:48:00 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 12 May 2010 10:47:59 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 12 May 2010 10:47:57 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 15:47:56 +0100
Message-ID: <20100512144754.31594.99048.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.186
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpm: Patch gpm.c to get struct ucred definition
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
X-List-Received-Date: Wed, 12 May 2010 14:51:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Gpm is currently failing to build because struct ucred is only defined with
"#define __USE_GNU".

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/gpm/gpm-1.20.1/ucred-include.patch |   11 +++++++++++
 recipes/gpm/gpm_1.20.1.bb                  |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/recipes/gpm/gpm-1.20.1/ucred-include.patch b/recipes/gpm/gpm-1.20.1/ucred-include.patch
new file mode 100644
index 0000000..0c79b85
--- /dev/null
+++ b/recipes/gpm/gpm-1.20.1/ucred-include.patch
@@ -0,0 +1,11 @@
+diff -urN gpm-1.20.1/src/gpm.c gpm-1.20.1.new/src/gpm.c
+--- gpm-1.20.1/src/gpm.c	2010-05-12 14:42:01.000000000 +0100
++++ gpm-1.20.1.new/src/gpm.c	2010-05-12 15:31:06.000000000 +0100
+@@ -34,6 +34,7 @@
+ #include <sys/stat.h>      /* mkdir()  */
+ #include <sys/time.h>      /* timeval */
+ #include <sys/types.h>     /* socket() */
++#define __USE_GNU          /* needed for struct ucred in sys/socket.h */
+ #include <sys/socket.h>    /* socket() */
+ #include <sys/un.h>        /* struct sockaddr_un */
+ 
diff --git a/recipes/gpm/gpm_1.20.1.bb b/recipes/gpm/gpm_1.20.1.bb
index 6506c4d..a1a11b3 100644
--- a/recipes/gpm/gpm_1.20.1.bb
+++ b/recipes/gpm/gpm_1.20.1.bb
@@ -5,13 +5,14 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "ncurses"
 
-PR = "r3"
+PR = "r4"
 PARALLEL_MAKE = ""
 
 SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1 \
 	   file://no-docs.patch;patch=1 \
 	   file://gpm-OPEN_MAX.patch;patch=1 \
+	   file://ucred-include.patch;patch=1 \
 	   file://init"
 
 inherit autotools update-rc.d


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


