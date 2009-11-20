Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBPgh-00012x-Re
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:21:59 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBPfI-0000zg-Sx for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 04:20:29 -0500
Date: Fri, 20 Nov 2009 04:20:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911200415360.22257@localhost>
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
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: FYI, non-fatal fetch errors for ffmpeg
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
X-List-Received-Date: Fri, 20 Nov 2009 09:21:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  in the midst of a bb-demo-image build:

NOTE: Running task 5661 of 10078 (ID: 6173,
/home/rpjday/oe/openembedded/recipes/ffmpeg/ffmpeg_svn.bb, do_fetch)
NOTE: Running task 5662 of 10078 (ID: 9997,
/home/rpjday/oe/openembedded/recipes/xscrnsaverh/xscrnsaverh_1.0.bb,
do_populate_staging)
--2009-11-20 03:36:38--
http://www.angstrom-distribution.org/unstable/sources/trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
Resolving www.angstrom-distribution.org... 188.40.83.200
Connecting to www.angstrom-distribution.org|188.40.83.200|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-20 03:36:46 ERROR 404: Not Found.

--2009-11-20 03:36:46--
http://mirrors.openembedded.org//trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
Resolving mirrors.openembedded.org... 82.197.159.157
Connecting to mirrors.openembedded.org|82.197.159.157|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-20 03:36:46 ERROR 404: Not Found.

--2009-11-20 03:36:46--
http://sources.openembedded.org//trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-20 03:36:47 ERROR 404: Not Found.

NOTE: Legacy staging mode for
/home/rpjday/oe/openembedded/recipes/xscrnsaverh/xscrnsaverh_1.0.bb
NOTE: Running task 5663 of 10078 (ID: 10000,
/home/rpjday/oe/openembedded/recipes/xscrnsaverh/xscrnsaverh_1.0.bb,
do_package)
cp: cannot stat
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xscrnsaverh-1.0-r0/image/*':
No such file or directory
NOTE: fetch
http://www.angstrom-distribution.org/unstable/sources/trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
NOTE: fetch
http://mirrors.openembedded.org//trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
NOTE: fetch
http://sources.openembedded.org//trunk_svn.ffmpeg.org_.ffmpeg._20551_.tar.gz
NOTE: Fetch svn://svn.ffmpeg.org/ffmpeg/;module=trunk
A    trunk/configure
A    trunk/Doxyfile
A    trunk/ffmpeg.c
...


  obviously, the fetch of ffmpeg eventually works, but any value in
cleaning up the initial fetch errors?

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


