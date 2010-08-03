Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OgN4x-00023u-Q1
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 21:23:24 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Tue, 3 Aug 2010 15:23:02 -0400
Message-ID: <4C586C9D.9060808@tycoelectronics.com>
Date: Tue, 3 Aug 2010 15:23:09 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.47.1280852515.3621.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.47.1280852515.3621.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gs-8.64 -- cups-gs broken (by cups-config output)
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
X-List-Received-Date: Tue, 03 Aug 2010 19:23:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

The problem seems to be caused by the cups-config program.

With my old build:
$/home/oe/build/tmp/staging/x86_64-linux/usr/bin/i686-angstrom-linux/cups-config 
--serverbin
/usr/lib/cups


With my current build:
$/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/i686-angstrom-linux/cups-config 
--serverbin
/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/cups


It is the extra /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux

on the beginning of the path that breaks things.

I am using the cups 1.4.3 recipe, and had been using cups 1.4.2 with my 
old build that was based on a git pull from 2009-dec-04.

Thanks,
Jay


