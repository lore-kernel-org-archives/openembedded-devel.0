Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NUjdi-0002MG-Vb
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:30:46 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NUjbe-0005eA-CD for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 11:28:34 -0500
Date: Tue, 12 Jan 2010 11:27:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001121117040.24279@localhost>
Message-ID: <alpine.LFD.2.00.1001121126250.32323@localhost>
References: <alpine.LFD.2.00.1001110722550.22930@localhost>
	<4B4B2B0E.8030501@balister.org>
	<alpine.LFD.2.00.1001110856460.28813@localhost>
	<4B4B3301.2090808@balister.org>
	<6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
	<alpine.LFD.2.00.1001111718250.2601@localhost>
	<6ec4247d1001111439m43a8147bk8a614a253563999c@mail.gmail.com>
	<alpine.LFD.2.00.1001111813530.3541@localhost>
	<4B4BBD4C.2080107@gmail.com>
	<alpine.LFD.2.00.1001121117040.24279@localhost>
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
Subject: Re: [PATCH] Add e2fsprogs 1.41.9. [WAS Re: bitbake and e2fsprogs-1.41.9?]
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
X-List-Received-Date: Tue, 12 Jan 2010 16:30:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 12 Jan 2010, Robert P. J. Day wrote:

> On Tue, 12 Jan 2010, Graham Gower wrote:
>
> > FYI, here is the patch that was submitted upstream:
> > http://sourceforge.net/tracker/?func=detail&aid=2813809&group_id=2406&atid=302406
> >
> > The issue with 1.41.5 went away for me when I installed 32bit compatibility
> > libs on my pure 64 bit system.
> >
> > -Graham
> >
> >
> > Signed-off-by: Graham Gower <graham.gower@gmail.com>
> > ---
> > conf/checksums.ini                           |    4 +
> > recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb |   20 ++++
> > recipes/e2fsprogs/e2fsprogs_1.41.9.bb        |  125 ++++++++++++++++++++++++++
> > 3 files changed, 149 insertions(+), 0 deletions(-)
> > create mode 100644 recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb
> > create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb
> >
> > diff --git a/conf/checksums.ini b/conf/checksums.ini
> > index 12c4cf2..ba6b7ba 100644
> > --- a/conf/checksums.ini
> > +++ b/conf/checksums.ini
> > @@ -5438,6 +5438,10 @@
> > sha256=2cc10fee2b29add737e454eb634513135b34a638f7ca2b18364864fe089020dc
> > md5=e218df6c84fc17c1126d31de9472a76c
> > sha256=b3d7d0e1058a3740ddae83d47285bd9dce161eec9e299dde7996ed721da32198
> >
> > +[http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-1.41.9.tar.gz]
> > +md5=52f60a9e19a02f142f5546f1b5681927
> > +sha256=cbf1e34261a16b3d7911b60b91290b19f2010036d6ba628d45b5f0b2af2b66e8
> > +
> > [http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-libs-1.33.tar.gz]
> > md5=c7545bb05e0c2fc59174f0dc455c6519
> > sha256=a65d064bee3e97c164d07a490692db0e73da8da10019ad9a89866706c93ae703
>
> ... snip ...
>
>   i just tried a dry run on that patch and got a failure on patching
> checksums.ini of all files.  i'll look more closely.  are you sure
> that patch applies cleanly to checksums.ini in the dev branch?

  never mind, just me being clueless, although that first patch
snippet needs an offset of about 500 lines.  but e2fsprogs seems to
build, so i'm going after beagleboard-demo-image now.  i'll keep you
posted.

  since that patch seems to solve the problem, could someone apply it?
thanks.  and thanks, graham.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


