Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8xb3-00083Y-JV
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 15:58:00 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8xZm-0007As-Pu for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 09:56:38 -0500
Date: Fri, 13 Nov 2009 09:56:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911130950150.29445@localhost>
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
Subject: doing a serious "distclean"
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
X-List-Received-Date: Fri, 13 Nov 2009 14:58:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  as one of the posters mentioned earlier, bitbake's distclean doesn't
quite do a full cleaning.  after bitbake'ing xterm, i have:

$ find . -name xterm-251*
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_rm_work
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_install
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_build
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_package_write
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_package_stage_all
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_package_write_ipk
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_unpack
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_compile
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_package
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_qa_staging
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_patch
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_fetch
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_configure
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_qa_configure
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_rm_work_all
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_populate_staging
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_package_stage
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_setscene
./stamps/armv7a-angstrom-linux-gnueabi/xterm-251-r0.do_distribute_sources
./deploy/glibc/sources/MIT-X/xterm/xterm-251.tgz
./deploy/glibc/sources/MIT-X/xterm/xterm-251.tgz.md5
./work/armv7a-angstrom-linux-gnueabi/xterm-251-r0
$

  after "distclean"ing that package, what still remains is:

$ find . -name xterm-251*
./deploy/glibc/sources/MIT-X/xterm/xterm-251.tgz
./deploy/glibc/sources/MIT-X/xterm/xterm-251.tgz.md5
$

  and, predictably, that tarball has been removed from the downloads
directory.

  what would seem to be more useful is a bitbake clean command that
removes every single trace of a build from under the tmp directory,
but *leaves* the tarball in the download directory.  that would
represent the best test for building a package from scratch, without
actually having to drag it down again, no?  (or does such a bitbake
command already exist?  "bitbake -c tmpclean"?)

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


