Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NtejF-0003JN-0M
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 11:19:30 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6dDcZNwP0U3IBZBhpybwbkDUd8hD4gj@postini.com;
	Mon, 22 Mar 2010 03:16:19 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 22 Mar 2010 06:16:17 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 06:16:17 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 10:19:32 +0000
Message-ID: <20100322101801.29005.76225.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: 201003221105.00862.holger+oe@freyther.de
References: 201003221105.00862.holger+oe@freyther.de
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] Ettercap-ng: Pass location of ncurses
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
X-List-Received-Date: Mon, 22 Mar 2010 10:19:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Ensure that ettercap-ng uses the ncurses libs from the staging include
directory during configuration

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 v2: correction to subject line

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


