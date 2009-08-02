Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1MXfvI-0005c6-KJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 20:36:44 +0200
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MXfgR-0000NL-DO for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 14:21:23 -0400
Date: Sun, 2 Aug 2009 14:18:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0908021414100.8299@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: "bitbake -c fetch" and bluez4 warnings?
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
X-List-Received-Date: Sun, 02 Aug 2009 18:36:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  probably simple answers to these questions, but ...

1) after setting up for angstrom for beagleboard, i wanted to
pre-fetch all necessary packages so i ran

  $ bitbake -c fetch base-image

didn't notice anything downloaded, but when i ran

  $ bitbake base-image

the build was interrupted several times by a package download.  isn't
"-c fetch" the command option to do pre-fetching of all necessary
packages?


2)

Parsing .bb files, please wait...NOTE: Angstrom DOES NOT support
bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x
has been replaced by bluez4
done.

  i'm not sure what i'm supposed to take away from the above.  i
*have* the bluez4 tarballs in my downloads directory.  is that just a
FYI warning?  a sign of a problem?  what?  it doesn't seem like i need
to do anything about it.  or do i?

  thanks.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================


