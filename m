Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NrXnW-0006J6-7W
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 15:31:11 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5+VdPhMIIM1RFjUr/c55hEOvVKOrUzX@postini.com;
	Tue, 16 Mar 2010 07:28:05 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 16 Mar 2010 10:22:59 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 16 Mar 2010 10:22:59 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 14:26:12 +0000
Message-ID: <20100316142611.31637.63109.stgit@ES-J7S4D2J.amer.consind.ge.com>
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
Subject: [PATCH] Ettercap: Pass location of ncurses
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
X-List-Received-Date: Tue, 16 Mar 2010 14:31:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Ensure that ettercap uses the ncurses libs from the staging include
directory during configuration

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/ettercap/ettercap-ng_0.7.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ettercap/ettercap-ng_0.7.3.bb b/recipes/ettercap/ettercap-ng_0.7.3.bb
index c9e73d9..00bf64d 100644
--- a/recipes/ettercap/ettercap-ng_0.7.3.bb
+++ b/recipes/ettercap/ettercap-ng_0.7.3.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/ettercap-NG-${PV}"
 
 inherit autotools
 
-EXTRA_OECONF += "--disable-gtk"
+EXTRA_OECONF += "--disable-gtk --with-libncurses=${STAGING_INCDIR}"
 
 FILES_${PN} += "${datadir} ${libdir}/ettercap/*.so"
 FILES_${PN}-dbg += "${libdir}/ettercap/.debug"


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


