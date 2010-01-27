Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1Na9US-0005nS-OY
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 16:07:35 +0100
Received: from [192.168.1.161] (163.241.71.49) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Wed, 27 Jan 2010 10:05:09 -0500
Message-ID: <4B605626.6040302@tycoelectronics.com>
Date: Wed, 27 Jan 2010 10:05:10 -0500
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.1.1264590002.5430.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.1.1264590002.5430.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Problem compiling qt4-x11-free (4.6) for 32-bit x86 on 64-bit x86 host
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
X-List-Received-Date: Wed, 27 Jan 2010 15:07:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

qt4-x11-free fails to build for an i686 (32 bit) target on my x86_64 (64 
bit) host.

The build log files are here:
http://home.comcast.net/~jay.snyder/OE/qt4-x11-free-build/


Specifically, the compile log is here:
http://home.comcast.net/~jay.snyder/OE/qt4-x11-free-build/run.do_compile.8048

The error is occurring during the link of assistant, it can't find the 
library libQtCLucene.so.4.

The recipe that I'm using to build is here:
http://home.comcast.net/~jay.snyder/OE/recipes/qt4.tar.bz2


Also, for those that are interested, I have recipes for the latest 
versions of CUPS, gs, and gutenprint:
http://home.comcast.net/~jay.snyder/OE/recipes/

Has anyone here successful done this build?

Thanks,
Jay Snyder



