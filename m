Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte2E-0005Xg-6Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:35:03 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c5B8GELOiqYynmpTduR/YNmzA/NDvm@postini.com;
	Mon, 22 Mar 2010 02:31:52 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:51 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:51 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:06 +0000
Message-ID: <20100322093506.27540.52750.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.22
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/12] Add alternatives to patch
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
X-List-Received-Date: Mon, 22 Mar 2010 09:35:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This adds an alternatives link for /bin/sh to the bash package. When
installed this will make bash overide the busybox provided shell for
"/bin/sh". This may or may not be desirable, but including it does allow an
image to be provided without busybox.
---

 recipes/bash/bash.inc    |    6 +++++-
 recipes/bash/bash_3.0.bb |    2 +-
 recipes/bash/bash_3.2.bb |    2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/bash/bash.inc b/recipes/bash/bash.inc
index 4eba689..a4658cf 100644
--- a/recipes/bash/bash.inc
+++ b/recipes/bash/bash.inc
@@ -4,7 +4,7 @@ DEPENDS = "ncurses"
 SECTION = "base/shell"
 LICENSE = "GPL"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
 PARALLEL_MAKE = ""
 
@@ -33,3 +33,7 @@ pkg_postinst () {
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
 	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
 }
+ALTERNATIVE_NAME = "sh"
+ALTERNATIVE_LINK = "${base_bindir}/sh"
+ALTERNATIVE_PATH = "${base_bindir}/bash"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
index 8165d07..ccf0079 100644
--- a/recipes/bash/bash_3.0.bb
+++ b/recipes/bash/bash_3.0.bb
@@ -1,5 +1,5 @@
 require bash.inc
-PR = "r12"
+PR = "r13"
 
 SRC_URI += "\
   file://bash-3.0-fixes.patch;patch=1 \
diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
index e175467..867b42f 100644
--- a/recipes/bash/bash_3.2.bb
+++ b/recipes/bash/bash_3.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "\
            file://builtins.patch;patch=1 \


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


