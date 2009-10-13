Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1Mxhp5-0005xo-0G
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 15:53:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 7F65D2C02E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:14 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NE++SK8e4ORo
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:08 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 4C02F2C016B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:08 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Oct 2009 14:52:40 +0100
Message-ID: <008201ca4c0c$6fa80000$4ef80000$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpMDG5Lkn16I4nmSSa60t+C2o01XA==
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Upstart: Add version 0.3.11.
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
X-List-Received-Date: Tue, 13 Oct 2009 13:53:58 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

* Adds latest 0.3 series as 0.6 requires a dbus upgrade to OE in order to
work.
* This still needs work to setup as a full SysVInit replacement (update-alts
etc.).

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/upstart/upstart_0.3.11.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100755 recipes/upstart/upstart_0.3.11.bb

diff --git a/recipes/upstart/upstart_0.3.11.bb
b/recipes/upstart/upstart_0.3.11.bb
new file mode 100755
index 0000000..dc6147a
--- /dev/null
+++ b/recipes/upstart/upstart_0.3.11.bb
@@ -0,0 +1,8 @@
+require upstart.inc
+
+SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2 \
+"
+
+RRECOMMENDS_${PN} = "libupstart upstart-sysvcompat"
+
+PR = "r1"
-- 
1.6.3.1





