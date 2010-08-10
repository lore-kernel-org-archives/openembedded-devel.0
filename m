Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OiqCz-0005aM-Ny
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 16:53:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o7AErV8g011728
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 15:53:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11160-09 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 15:53:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o7AErNDR011720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 15:53:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTin_LwLx3V2C3tYPA03cxrAvu6w+h3VHZDSY0k7F@mail.gmail.com>
References: <1281336254-11566-1-git-send-email-raj.khem@gmail.com>
	<1281352360.16235.525.camel@rex>
	<AANLkTin_LwLx3V2C3tYPA03cxrAvu6w+h3VHZDSY0k7F@mail.gmail.com>
Date: Tue, 10 Aug 2010 15:53:18 +0100
Message-ID: <1281451998.16235.890.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: Override STAGING_* paths to match cross installation
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
X-List-Received-Date: Tue, 10 Aug 2010 14:53:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-08-09 at 08:48 -0700, Khem Raj wrote:
> On Mon, Aug 9, 2010 at 4:12 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > Hi Khem,
> >
> > On Sun, 2010-08-08 at 23:44 -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  classes/cross.bbclass |    8 ++++++++
> >>  1 files changed, 8 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> >> index cf14db1..64f7902 100644
> >> --- a/classes/cross.bbclass
> >> +++ b/classes/cross.bbclass
> >> @@ -50,6 +50,14 @@ exec_prefix = "${prefix}"
> >>  base_sbindir = "${base_prefix}/bin"
> >>  sbindir = "${exec_prefix}/bin"
> >>
> >> +# staging should be special for cross
> >> +STAGING_BINDIR = "${bindir}"
> >> +STAGING_LIBDIR = "${libdir}"
> >> +STAGING_INCDIR = "${includedir}"
> >> +STAGING_ETCDIR = "${sysconfdir}"
> >> +STAGING_DATADIR = "${datadir}"
> >> +STAGING_SBINDIR = "${sbindir}"
> >> +
> >>  do_install () {
> >>       oe_runmake 'DESTDIR=${D}' install
> >>  }
> >
> > Can you explain a bit more about why is this needed?
> 
> yes. for cross packages prefix is set in cross.bbclass to be
> ${base_prefix}${prefix_native}/${BASE_PACKAGE_ARCH}
> which already points into native sysroot and bindir, datadir etc are
> defined based on prefix in bitbake.conf so
> for cross packages datadir already points to where it is in the final
> install location of the cross packages.
> 
> but STAGING_* dirs are then defined like below
> 
> STAGING_DIR_HOST = "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
> STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
> 
> where
> STAGING_DIR_HOST expands to <native sysroot> in the case of cross
> packages because for them BASEPKG_HOST_SYS
> is the build system itself. I think this is a the reason why we have
> NATIVE_STAGING_* vars defined separately.
> probably we should have the same set defined for cross too may be
> something like CROSS_STAGING_* is one solution.
> 
> and now all these STAGING_* defines create another native sysroot
> directory insise the existing one.
> so I get /scratch/oe/sysroot/x86_64-linux/scrarch/oe/sysroot/x86_64-linux/usr/armv5te/shared/
> etc. paths while
> building binutils-cross
> 
> because STAGING_* variables are used in autotools.bbclass
> 
> Thats why this patch

So the problem is empty directory creation?

I'm tempted to suggest a more radical approach of not having all these
directories created by autotools.bbclass...

Cheers,

Richard





