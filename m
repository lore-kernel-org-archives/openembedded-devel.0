Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q4DTS-0004gU-4v
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 16:31:21 +0200
Received: (qmail 2007 invoked by uid 1003); 28 Mar 2011 14:29:20 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.183.40)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Mar 2011 14:29:19 -0000
Message-ID: <4D909B3E.5030201@balister.org>
Date: Mon, 28 Mar 2011 10:29:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problem with qmake2 and native sdk
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
X-List-Received-Date: Mon, 28 Mar 2011 14:31:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I building PyQwt on an omap3 suing the qt native sdk. This leads to the 
following message:

Could not find mkspecs for your QMAKESPEC(linux-g++) after trying:
         /home/balister/oe/tmp/sysroots/x86_64-linux/qt4/mkspecs

I can work around this by editing the PyQwt configure.py file to use the 
full path to the linux-g++ spec file, but it would be nice if this 
worked out of the box.

Does anyone know how to change the default spec file path in qmake2? 
I've looked at the recipe and nothing jumps out at me to try.

Philip


