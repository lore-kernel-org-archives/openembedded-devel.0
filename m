Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SWXI6-0005P8-0I for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 20:25:10 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SWX8J-0001St-0t for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 20:15:03 +0200
Received: from 199-4-vpn.velnet.ru ([213.79.4.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 20:15:03 +0200
Received: from donskoe by 199-4-vpn.velnet.ru with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 20:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: pavel tyutin <donskoe@gmail.com>
Date: Mon, 21 May 2012 18:13:25 +0000 (UTC)
Message-ID: <loom.20120521T200914-456@post.gmane.org>
References: <4F291A06.4000406@gmail.com>
	<CAMKF1so7cMo0qiOPLuJrpk7kNuyk3dYEEZpM8nSGFKXMuUdoGQ@mail.gmail.com>
	<CANLRtZyE_ctYhoJmZd5KUJt70SG=ZU7T1TJCF12viQQgSM063Q@mail.gmail.com>
	<CAMKF1spUMxnuVGb8zw8LM3m5bdUq1tTV74SwjUD8yL0FXysGdg@mail.gmail.com>
	<4F2C4B6A.7000504@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 213.79.4.199 (Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20100101 Firefox/12.0)
Subject: Re: Can't build openembedded: fail in picosam9_git.bb
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
X-List-Received-Date: Mon, 21 May 2012 18:25:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Леонид Титов <leonid.titov <at> gmail.com> writes:

> 
> That's helped. Thanks a lot, Khem!
> 
> 01.02.2012 23:46, Khem Raj пишет:
> > 2012/2/1 Leonid Titov<leonid.titov <at> gmail.com>:
> >> I do have a conf/machine/picosam9.conf. It and recipe are exact as in
> >> repo (http://cgit.openembedded.org/openembedded/tree/conf/machine/picosam9.conf
> >> and
http://cgit.openembedded.org/openembedded/tree/recipes/linux/picosam9_git.bb).
> >>
> > in picosam9_git.bb you have
> >
> >
> > COMPATIBLE_HOST = "arm.*-linux"
> >
> > make it
> >
> > COMPATIBLE_HOST = "arm.*-linux*"
> >
> > that said your problem is with fetching and I have seen
> > problems with fetching from gitorious using bitbake
> > It happens for efikamx kernel which was also hosted on
> > gitorious. Is there any other place this repo is mirrored ?
> > if yes use that.
> >
> >> 2012/2/1, Khem Raj<raj.khem <at> gmail.com>:
> >>> 2012/2/1 Leonid Titov<leonid.titov <at> gmail.com>:
> >>>> I've got a problem with building console-image for MACHINE=picosam9. It
> >>>> fails while processing picosam9_git.bb with these messages:
> >>> do you have machine conf file for picosam9 ?
> >>> recipes and machine confs  are different files.
> >>> you have to show us both files here. That said
> >>> your error is a fetching error which means something
> >>> is wrong with either your SRC_URI or the remote server
> >>> which is feeding the sources of this recipe
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel <at> lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>>
> >>
> >> --
> >> С уважением,
> >>   Леонид.
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel <at> lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel <at> lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel <at> lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

Ok, Mr. Titov, after 2 days of compiling this junk,
i get the same errors. Your answers are incomplete:

I too have both recipie files and local.conf files,
they both have 

# For Angstrom and Android Eclair (for a Android 
Gingerbread compatible kernel use
# branch=minibox-picopc-2.6.32-gingerbread)
SRC_URI = "\
 
git://gitorious.org/picopc-kernel/kernel.git;
protocol=git;branch=
minibox-picopc-2.6.32
\
  file://defconfig \
"

S = "${WORKDIR}/git"

COMPATIBLE_HOST = "arm.*-linux*"
COMPATIBLE_MACHINE = "picosam9"

And it is unable to fetch the kernel image. 
You probably deleted it or
moved it and forgot about it. Fix, please

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 3951 of 5272 (ID: 769,
/home/pasha/picosam9/picopc-angstrom-setup/sources/
openembedded/recipes/linux/picosam9_git.bb,
do_fetch)
--2012-05-21 22:09:12-- 
http://www.angstrom-distribution.org/unstable/
sources/git_gitorious.org.picopc-kernel.kernel.git_5d564f090ee99a0570a
2cc912ebc30b65922f7bb.tar.gz
 Resolving www.angstrom-distribution.org... 
188.40.83.200
 Connecting to www.angstrom-distribution.org
|188.40.83.200|:80... connected.
 HTTP request sent, awaiting response... 
404 Not Found
 2012-05-21 22:09:12 ERROR 404: Not Found.
 
 Cloning into
/home/pasha/picosam9/picopc-angstrom-setup/
sources/downloads/git/gitorious.org.picopc-
kernel.kernel.git...
NOTE: package picosam9-2.6.32+gitr5d564f090
ee99a0570a2cc912ebc30b65922f7bb-r0:
task do_fetch: Started
 fatal: The remote end hung up unexpectedly
 fatal: early EOF
 fatal: index-pack failed
NOTE: package picosam9-2.6.32+gitr5d564f090
ee99a0570a2cc912ebc30b65922f7bb-r0:
task Fetch failed: Unable to fetch URL
git://gitorious.org/picopc-kernel/kernel.gi
t;protocol=git;branch=minibox-picopc-2.6.32
from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL
git://gitorious.org/picopc-kernel/kernel.git;
protocol=git;branch=minibox-picopc-2.6.32
from any source.' failed
ERROR: Task 769
(/home/pasha/picosam9/picopc-angstrom-setup/
sources/openembedded/recipes/linux/picosam9_git.bb,
do_fetch) failed with exit code '1'
ERROR:
'/home/pasha/picosam9/picopc-angstrom-setup/
sources/openembedded/recipes/linux/picosam9_git.bb'
failed








