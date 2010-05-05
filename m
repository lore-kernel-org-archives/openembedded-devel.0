Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1O9ZHM-0003e1-VM
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 09:44:27 +0200
Received: by qyk11 with SMTP id 11so6597646qyk.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=OH2vRdu2rZt414KZTJAsXPG587C/WO/NXlJPrPYgV1E=;
	b=nWANuCoZhQA5CBhEFBWXHymfRAc2ZR4SMCnmLPfEjRYzHvCiI/zV+5UNpjvHYtLa2d
	mNR77EMJ6iHMNcGESG1EuMZmKeVRlAplM5aVlFFkwJLkXu/Jf49Xp52QGF6aaycKtBBL
	e4AwBNHpufgyfZbkiGnXBj9kh1CvXKicpYrm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tcVGfDm+tTyRSYbzsZ2pKTAIEgox75nqVT+TtmQD9cFov6VVfj6Ffu8CCTz4T1K4F1
	3BM7dgJlJ1MyyH9X7F/i4lpTc/YrakHRe8pD6Yy/K4RfmKxDmkjgRBmFVlZ3A94dMcTk
	6hfgtnndpGPgNfFKADiCYpfrgX8sonONGXsCg=
MIME-Version: 1.0
Received: by 10.229.235.202 with SMTP id kh10mr3967103qcb.78.1273045237110; 
	Wed, 05 May 2010 00:40:37 -0700 (PDT)
Received: by 10.229.24.149 with HTTP; Wed, 5 May 2010 00:40:37 -0700 (PDT)
In-Reply-To: <r2qfca63bcf1005050029wc4a8e1c9l64d6676ab012bd5c@mail.gmail.com>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
	<r2qfca63bcf1005050029wc4a8e1c9l64d6676ab012bd5c@mail.gmail.com>
Date: Wed, 5 May 2010 00:40:37 -0700
Message-ID: <y2ka7f8874a1005050040xeb4266a8me6d28110769237b7@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.181
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 07:44:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 5, 2010 at 12:29 AM, Michael Lippautz <
michael.lippautz@gmail.com> wrote:

> > diff --git a/recipes/libtorrent/libtorrent_0.12.6.bbb/recipes/libtorrent/
> libtorrent_0.12.6.bb
> > new file mode 100644
> > index 0000000..075ce40
> > --- /dev/null
> > +++ b/recipes/libtorrent/libtorrent_0.12.6.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION = "library implementing the bittorrent protocol"
> > +HOMEPAGE = "http://libtorrent.rakshasa.no"
> > +SECTION = "libs/network"
> > +LICENSE = "GPL"
> > +DEPENDS = "libsigc++-2.0 openssl"
> > +
> > +SRC_URI = "
> http://libtorrent.rakshasa.no/downloads/libtorrent-${PV}.tar.gz<http://libtorrent.rakshasa.no/downloads/libtorrent-$%7BPV%7D.tar.gz>
> "
> > +PR = "r0.1"
> > +
> > +inherit autotools pkgconfig
> > +
> > +EXTRA_OECONF = "--enable-aligned"
> > +
> > +FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations
> -frename-registers -O2 -fpermissive -fno-inline"
> > +
> > +do_stage() {
> > +       autotools_stage_all
>
> 1) No need for further dividing PR into subnumbers, r0 is sufficient.
>

Thanks for catching that... left over from testing...

>
> 2) On .dev your do not need to stage (mostly) anymore. If autotools
> installs everything correctly you can just dismiss the do_stage()
> routine. If something is missing, then install it via
> do_install_append in the appropriate folder and OE will determine that
> it needs to be staged. depending on the files' paths.
>

Ok. I just copied the older revisinons. I'll chek on that tomorrow

>
> Regards,
> Michael
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Henry von Tresckow (hvontres)

