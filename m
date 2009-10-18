Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MzWVd-0006Qm-Pi
	for openembedded-devel@openembedded.org; Sun, 18 Oct 2009 16:13:24 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9IE9ijF017393; Sun, 18 Oct 2009 15:09:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tV6kdsq6WX+v; Sun, 18 Oct 2009 15:09:44 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9IE9dIO017362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 18 Oct 2009 15:09:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Sun, 18 Oct 2009 15:08:29 +0100
Message-Id: <1255874909.28889.20.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake Roadmap
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
X-List-Received-Date: Sun, 18 Oct 2009 14:13:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'd like to propose some changes to the bitbake repo and actually get
into the habit of regular releases. The big problem is that we want to
make the client/server split and make a 2.0 release which is "clogging"
up master. I'm not sure the client/server split is felt to be ready for
prime time use yet though (shout if you disagree and want to make the
jump now!).

Assuming we can't switch yet I think we need to:

* Continue to plan bitbake 2.0 to be the client/server/ui split.

* Create a bitbake 1.10 branch. This would be designed to replace the
current 1.8 series. The plan here would be to take everything from trunk
that isn't the split into client and server. The code would be
refactored to match the client/server split layout however, particularly
cooker and adding the command layer. This would most likely require
python 2.6 for simplicity. This should not have the slowdown associated
with the xmlrpc and threads which is particularly noticeable on single
core parsing.

* This paves the way for maintenance releases and further 1.x series
releases making more sense of the version number again.

* Aim to quickly roll 1.10.0 and after a suitable delay require it for
OE

* Create a client/server/ui branch which has the changes that are in
master

* Have master track 1.10 instead. 

* Define a release schedule and more automate the release process.

Shout now if you disagree with any of this or have a better plan! :)

Cheers,

Richard




