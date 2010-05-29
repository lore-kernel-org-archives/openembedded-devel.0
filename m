Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OIIt1-0001wD-OG
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 12:03:24 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OIIp0-00068k-CT for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 05:59:14 -0400
Date: Sat, 29 May 2010 05:59:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1005290556230.11858@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
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
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: abiword build error in OE for beagle/angstrom
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
X-List-Received-Date: Sat, 29 May 2010 10:03:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  trying to build abiword for angstrom on 64-bit ubuntu 10.04, tail
end of log file:

...
/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/lib/libxml2.so:
file not recognized: File format not recognized
collect2: ld returned 1 exit status
arm-angstrom-linux-gnueabi-libtool: install: error: relink
`mathview.la' with the above command before installing it
make[4]: *** [install-pluginLTLIBRARIES] Error 1
make[4]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/abiword-2.8.3-r2/abiword-2.8.3/plugins/mathview'
make[3]: *** [install-am] Error 2
make[3]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/abiword-2.8.3-r2/abiword-2.8.3/plugins/mathview'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/abiword-2.8.3-r2/abiword-2.8.3/plugins/mathview'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/abiword-2.8.3-r2/abiword-2.8.3/plugins'
make: *** [install-recursive] Error 1
FATAL: oe_runmake failed


  the full log file can be seen at http://pastebin.com/hM3UmJ8j.

rday

p.s.  i should have mentioned that the previous error note was also on
a fully-updated 64-bit ubuntu 10.04 system.

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


