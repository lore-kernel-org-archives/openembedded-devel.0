Received: from exprod5og105.obsmtp.com ([64.18.0.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OORjO-0001VQ-2J
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 10:43:01 +0200
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTBc7/+ltDB6jWF68Z3HCatODhB462U6g@postini.com;
	Tue, 15 Jun 2010 01:38:24 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip05.e2k.ad.ge.com with ESMTP; 15 Jun 2010 04:22:57 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [127.0.0.1])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 15 Jun 2010 04:22:56 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 09:22:56 +0100
Message-ID: <20100615082229.1754.63998.stgit@ES-J7S4D2J>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.180
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Comedilib: Add version 0.8.1
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
X-List-Received-Date: Tue, 15 Jun 2010 08:43:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The Comedi project develops open-source drivers, tools, and libraries for
data acquisition.

Comedilib is a user-space library that provides a developer-friendly
interface to Comedi devices.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>
---

 recipes/comedi/comedilib_0.8.1.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/recipes/comedi/comedilib_0.8.1.bb b/recipes/comedi/comedilib_0.8.1.bb
new file mode 100644
index 0000000..8b08c03
--- /dev/null
+++ b/recipes/comedi/comedilib_0.8.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Open-source tools and libraries for data acquisition"
+HOMEPAGE = "http://www.comedi.org/"
+SECTION = "devel/libs"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://www.comedi.org/download/comedilib-${PV}.tar.gz;name=src"
+SRC_URI[src.md5sum] = "992dbdf14590a7c9ea8dd83752e731b4"
+SRC_URI[src.sha256sum] = "56c5d27b57924778fae6aac3e776dfebcbb9f6eed79c39b6e0b4ad162d86bef8"
+
+inherit autotools
+


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


