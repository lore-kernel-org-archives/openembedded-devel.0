Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NjbPB-0004Sr-N0
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:45:13 +0100
Received: by fxm20 with SMTP id 20so2502508fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=lDgvWHwxP4c/yDOd858oEKvnFR2ywMWmb91gU0Uffg0=;
	b=GzMU9LOndj18T7dMe5CcCTn3EGQiVozlL7K1ucSmzz3SN2pEFWEGM5Zh4PMINn94OY
	l62S0JNDiwHGV9/++6gZaFR1vaOVQDCuoehu1qn/oJ3WbqO0SzTgZ9wmrSJdKyBsH1mf
	3WIbZ+Z8nQIWYJlEA8M9jesuiFhkNr0sNzQzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BBW9btj30ePtz1bzpqvI4oPoKHRZiJobRGbVHVQy8VV2R+lsZCW4ti2oxC+6zr2djF
	fw0y1W90GfeQf/tQ1KyoWeSGAMp+JXg7i/0FO/UqRWThn6eAaxXCMDPxVQUHWauukZDW
	uYbdUlNinKfz96SR7fXuOvO0AbxxVz9aTouYA=
MIME-Version: 1.0
Received: by 10.223.132.202 with SMTP id c10mr4316261fat.47.1266856945607; 
	Mon, 22 Feb 2010 08:42:25 -0800 (PST)
In-Reply-To: <19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
	<19c1b8a91002191026p3b06577ay9375f944daa661c1@mail.gmail.com>
Date: Mon, 22 Feb 2010 10:42:25 -0600
Message-ID: <d1ded4381002220842u273237eaudac13d3ddc460da6@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Mon, 22 Feb 2010 16:45:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

If I omit the inclusion of the target arch `ppc440` in  PACKAGE_EXTRA_ARCHS
the final image build
fails [1], I been looking on bitbake internals to tray to solve this as you
mention but I'm still clueless
on how to handle it;

My local.conf
---------------------
MACHINE = "xilinx-ml507"
TARGET_ARCH = "powerpc"
TARGET_OS = "linux"
DISTRO = "angstrom-2008.1"

[1] http://pastebin.com/m4f649914

Regards.

On Fri, Feb 19, 2010 at 12:26 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Feb 16, 2010 at 8:32 AM, Adrian Alonso <aalonso00@gmail.com>
> wrote:
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > ---
> >  conf/machine/include/tune-ppc440.inc |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/conf/machine/include/tune-ppc440.inc
> b/conf/machine/include/tune-ppc440.inc
> > index feca186..0c41db4 100644
> > --- a/conf/machine/include/tune-ppc440.inc
>


> > +++ b/conf/machine/include/tune-ppc440.inc
> > @@ -1,4 +1,4 @@
> >  TARGET_CC_ARCH = "-mcpu=440"
> >  BASE_PACKAGE_ARCH = "ppc440"
> >  FEED_ARCH = "ppc440"
> > -PACKAGE_EXTRA_ARCHS += "ppc440e"
> > +PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
>
>
> I wonder why this would be needed, I would think that PACKAGE_ARCHS
> consists of PACKAGE_EXTRA_ARCHS and PACKAGE_ARCH (which is default
> arch constructed from  BASE_PACKAGE_ARCH)
> if that was the case then ppc440 would be added to supported archs
> list already but it seems there is a disconnect between PACKAGE_ARCH
> and  PACKAGE_ARCHS I am not sure if it
> is deliberate or an oversight. If it is an oversight then it should be
> fixed in bitbake.conf and that would avoid this patch.
>
> > --
> > 1.6.6
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

