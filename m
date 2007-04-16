Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HdZH3-0005iG-TF
	for openembedded-devel@openembedded.org; Tue, 17 Apr 2007 00:02:16 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3GM25Lr024698 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2007 00:02:08 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HdZGt-0003JG-Oo
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2007 00:02:03 +0200
Received: from 12.44.170.10 ([12.44.170.10]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Tue, 17 Apr 2007 00:02:03 +0200
Message-ID: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
Date: Tue, 17 Apr 2007 00:02:03 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 12.44.170.10
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2007 22:02:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs for
almost all machines, which wipes /var/lib at boot, which will break bluez and
dpkg.

What would be the best way to preserve /var/lib (and maybe others) across boots?

regards,

Koen

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


