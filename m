Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte2c-00061e-R0
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:35:29 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c5INK0vcUoxPl84NnrLIiIs1xsXkRy@postini.com;
	Mon, 22 Mar 2010 02:32:17 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip05.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:16 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:32:15 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:30 +0000
Message-ID: <20100322093530.27540.47429.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/12] Modify location of debianutils executables
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
X-List-Received-Date: Mon, 22 Mar 2010 09:35:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Modify where the debianutils executables are put so that they conform more
to what we believe to be their standard location.
---

 recipes/debianutils/debianutils.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/debianutils/debianutils.inc b/recipes/debianutils/debianutils.inc
index 35ef03d..0b4f2bf 100644
--- a/recipes/debianutils/debianutils.inc
+++ b/recipes/debianutils/debianutils.inc
@@ -14,10 +14,14 @@ do_install_append() {
 
 pkg_postinst_${PN} () {
 #!/bin/sh
-for app in add-shell  installkernel  mkboot  remove-shell ; do
+for app in add-shell  mkboot  remove-shell ; do
     update-alternatives --install ${sbindir}/$app $app $app.${PN} 100
 done
 
+for app in installkernel ; do
+    update-alternatives --install ${base_sbindir}/$app $app $app.${PN} 100
+done
+
 for app in run-parts  savelog  sensible-browser  sensible-editor  sensible-pager  tempfile  which ; do
     update-alternatives --install ${bindir}/$app $app $app.${PN} 100
 done


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


