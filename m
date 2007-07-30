Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tom@openhardware.net>) id 1IFZvJ-0000Mw-5K
	for openembedded-devel@openembedded.org; Mon, 30 Jul 2007 20:24:53 +0200
Received: (qmail 6854 invoked from network); 30 Jul 2007 18:23:19 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 30 Jul 2007 18:23:19 -0000
Message-ID: <46AE2C8A.9080400@openhardware.net>
Date: Mon, 30 Jul 2007 14:23:06 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: cups recipe URL broken?
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
X-List-Received-Date: Mon, 30 Jul 2007 18:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In all the OE recipes for cups, the URL does not work.  It seems that it 
specifies a mirror which no longer exists.  When I change:

SRC_URI = "ftp://ftp3.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2

to simply:

SRC_URI = "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar.bz2

everything then works as expected.  Is there a specific reason that ftp3 
was used?  Maybe it is not reachable via my internet segment...

TomW

-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




