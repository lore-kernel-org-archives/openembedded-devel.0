Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oel3g-0003xL-HW
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:36:55 +0200
Received: by bwz10 with SMTP id 10so652496bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=vgdMq+Uyh+WYqwtSQ0CKweuR3RPbkrfKapwVnoG7/Y8=;
	b=EyVNbhx5WI7XHr0f0i4MjYYBB47SNZjNeDuj+RQHNhrnH/RLvEHOwxVvhenyOEdBQQ
	2A/ESfJuMe8iGuX5WvOmnyVr2Ia4oJFkIXPFMY5bi/M5XlTRCVtN7or2Ve+KYZxgOWi1
	TpmPm5bd7ysk8aedF37DAsfoLcAEeBiNz8qso=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sFPueprzWZz4JVTdINDe+oA4VniFVFc8zFJ6mEwDETL4EoQtyJulFuvoI8UBzF4BWh
	vyo+2JJZX1oUL7V6k3oDmNiKAxEUSgg1aT2fHX2wuxjrVn5W0ZQDgc3T/FEOt7SmiOgV
	unlhI9Ji7XEvHKA10+N2JM5lbQn/S1RW+71PY=
MIME-Version: 1.0
Received: by 10.204.148.71 with SMTP id o7mr928352bkv.96.1280478889643; Fri, 
	30 Jul 2010 01:34:49 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 30 Jul 2010 01:34:49 -0700 (PDT)
In-Reply-To: <i2u23e$97d$1@dough.gmane.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org>
Date: Fri, 30 Jul 2010 10:34:49 +0200
Message-ID: <AANLkTimUYuJBUa5Hz=N_dM-DOe6qPoCDbqCEs2LHTpab@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 08:37:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/30 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-07-10 09:21, Esben Haabendal wrote:
> > On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister <philip@balister.org>
> wrote:
> >>
> >>
> >> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> >>>
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> >>>>
> >>>> Dear all,
> >>>>
> >>>> Given the discussions on quality that sometimes pop up (and also
> >>>> triggered
> >>>> by Robert's message), I decided to kick off a bitbake -k world.
> >>>
> >>> Could you first explain to me why 'bitbake world' is a good way to
> >>> measure quality?
> >>>
> >>> I would think that building something like console-image and looking at
> >>> the following would be a much better metric:
> >>>
> >>> * does it build?
> >>> * are all the rootfs types working?
> >>> * does the image do what it is supposed to do?
> >>> * Are all the licenses of the output packages correct?
> >>> * Do the output packages have any spurious deps?
> >>> * Is the content of the output packages correct?
> >>> * Are there any known CVEs in the resulting packages?
> >>> * Did packaged-staging do its job?
> >>> * What kind of QA errors and warnings were raised?
> >>> * Did all recipes pass recipe_sanity?
> >>> * Did all recipes conform to oe-stylize.py?
> >>>
> >>> etc
> >>>
> >>> I would actually advocate removing the 'world' feature from bitbake/OE
> >>> to stop people from wasting time on looking at bitbake world and have
> >>> them fix actual problems.
> >>
> >> bitbake world seems to be the source of pointless listserv discussions.
> Does
> >> it serve any purpose?
> >
> > Pointless or not really depends on how you look at quality.
> >
> > If you look at it as you, Koen and other OE long-timers, yes, it looks
> > rather pointless to have bitbake world.
> > But for those of us who have a different view on what quality is, then
> > bitbake world serves a purpose.
>
> As Thomas points out, as soon as you start blacklisting things (which
> actually increases quality), bitbake world doesn't work anymore.
>

Blacklisting does *NOT* increase quality. It just hides the problem and as
such it is ostrich behaviour.

Instead of masking the problem, better fix things. That is what improves
quality!

For me a non building recipe is a sign of poor quality.

BTW: to avoid the blacklisting issue, I've restarted my test with minimal
distro.
Results will probably be available after the weekend.

Frans.



> That alone should be enough to kill it.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMUouuMkyGM64RGpERAl42AKCE62tZc4ZGAH5WiLMPFNwn/YY0cACfTmMz
> /YBK4XU/u1PuqmzoyXbF1f8=
> =TNJJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

