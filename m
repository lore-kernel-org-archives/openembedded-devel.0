Received: from [130.89.2.12] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JZ9oX-0005Ur-VC
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 20:07:57 +0100
Received: from [172.20.1.5] (vpn006106.vpn.utwente.nl [130.89.6.106])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m2BJ4Pbw013454
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 20:04:26 +0100
Message-Id: <89B91472-8AEB-44E5-B09D-60222A4B1322@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Tue, 11 Mar 2008 20:04:25 +0100
X-Mailer: Apple Mail (2.919.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.12
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: DEPENDS, RDEPENDS and package.bbclass shlibs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2008 19:08:11 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi,

Lately I've been seeing a lot of new recipes that do something like:

DEPENDS = "dbus (>= 1.1.1) dbus-glib glib-2.0 sqlite3 opkg intltool"
RDEPENDS = "dbus (>= 1.1.1) dbus-glib glib-2.0 opkg"

Shouldn't our shlibs code pick up everythying that is in RDEPENDS in  
the above example already by itself?

regards,

Koen


