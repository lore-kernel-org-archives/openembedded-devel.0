Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nwxyt-0002OK-Cj
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 15:29:16 +0200
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS7NNaAnBCOkr+mEAcBdUu5QWoFN1j9oz@postini.com;
	Wed, 31 Mar 2010 06:26:01 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 31 Mar 2010 09:25:59 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 31 Mar 2010 09:25:59 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 14:29:29 +0100
Message-ID: <20100331132523.31493.75635.stgit@ES-J7S4D2J.amer.consind.ge.com>
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
Cc: Koen Kooi <koen@openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] dhcp: Correct leases directory location
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
X-List-Received-Date: Wed, 31 Mar 2010 13:29:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The DHCP client currently expects to be able to create a leases file in
"/var/lib/dhcp" as configured in dhcp3.inc. Recipe is currently creating a
directory called "/var/lib/dhcp3", resulting in the following error:

can't create /var/lib/dhcp/dhclient.eth0.leases

Correct directory naming to resolve error.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>

---

 Steve: This seems to be directy reversing a change you made. The commit
  message doesn't give me any idea of why you did it, can you remember?

 recipes/dhcp/dhcp3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/dhcp/dhcp3.inc b/recipes/dhcp/dhcp3.inc
index f099003..5507f1c 100644
--- a/recipes/dhcp/dhcp3.inc
+++ b/recipes/dhcp/dhcp3.inc
@@ -45,7 +45,7 @@ do_install() {
 	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
 	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
 	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-	install -d ${D}/var/lib/dhcp3
+	install -d ${D}/var/lib/dhcp
 }
 
 PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
@@ -53,7 +53,7 @@ FILES_${PN} = ""
 FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
 


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


