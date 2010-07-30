Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OelGS-0001pp-4O
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:48:27 +0200
Received: by bwz10 with SMTP id 10so657750bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/lqRwyKH/QNJnCNubVXTroRlvxD1BUjlmKTMg/V4dkY=;
	b=Vq5O0+D4dIq2akZTGNWaYcOV0j6o5cNYhHofZ8rrETU1/QalLY+DSQxM2mQGNDxBWp
	29tl2T5AZlkASR1qXM7vBzujnir1K5GmEQlxzd00yupPkxlGtcT/+EanLd3IdODTXobz
	9Ehklzr0XOGf8r254LtpXUTfWqi0EebMRTseg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ylw4auEsswQ0L8HRxq6CJbYeh1ruuK5i7gjqRMqeL91arYzPTU+PnYg8pZ4q1JVb0m
	ObIbeoG0lvJHVkovuYG6XByyhrPPa4sh2owOgd366Rz9xFlFkEV9q6OdRoRRlpNKSG8h
	u7V8bWmlzSPwTTLJfnoqADHzVSLRS06JCeYbI=
MIME-Version: 1.0
Received: by 10.204.70.201 with SMTP id e9mr933285bkj.141.1280479685986; Fri, 
	30 Jul 2010 01:48:05 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 30 Jul 2010 01:48:05 -0700 (PDT)
In-Reply-To: <4C528DC6.9060408@xora.org.uk>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org> <4C528DC6.9060408@xora.org.uk>
Date: Fri, 30 Jul 2010 10:48:05 +0200
Message-ID: <AANLkTi=TVh2WE6zsN3wYUBBy-sN-zvhCKvHem9J1E1CD@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Jul 2010 08:48:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/30 Graeme Gregory <dp@xora.org.uk>

>  On 30/07/10 09:22, Koen Kooi wrote:
> > On 30-07-10 09:21, Esben Haabendal wrote:
> > > On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister
> > <philip@balister.org> wrote:
> > >>
> > >>
> > >> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> > >>>
> > >>> -----BEGIN PGP SIGNED MESSAGE-----
> > >>> Hash: SHA1
> > >>>
> > >>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> > >>>>
> > >>>> Dear all,
> > >>>>
> > >>>> Given the discussions on quality that sometimes pop up (and also
> > >>>> triggered
> > >>>> by Robert's message), I decided to kick off a bitbake -k world.
> > >>>
> > >>> Could you first explain to me why 'bitbake world' is a good way to
> > >>> measure quality?
> > >>>
> > >>> I would think that building something like console-image and
> > looking at
> > >>> the following would be a much better metric:
> > >>>
> > >>> * does it build?
> > >>> * are all the rootfs types working?
> > >>> * does the image do what it is supposed to do?
> > >>> * Are all the licenses of the output packages correct?
> > >>> * Do the output packages have any spurious deps?
> > >>> * Is the content of the output packages correct?
> > >>> * Are there any known CVEs in the resulting packages?
> > >>> * Did packaged-staging do its job?
> > >>> * What kind of QA errors and warnings were raised?
> > >>> * Did all recipes pass recipe_sanity?
> > >>> * Did all recipes conform to oe-stylize.py?
> > >>>
> > >>> etc
> > >>>
> > >>> I would actually advocate removing the 'world' feature from
> bitbake/OE
> > >>> to stop people from wasting time on looking at bitbake world and have
> > >>> them fix actual problems.
> > >>
> > >> bitbake world seems to be the source of pointless listserv
> > discussions. Does
> > >> it serve any purpose?
> >
> > > Pointless or not really depends on how you look at quality.
> >
> > > If you look at it as you, Koen and other OE long-timers, yes, it looks
> > > rather pointless to have bitbake world.
> > > But for those of us who have a different view on what quality is, then
> > > bitbake world serves a purpose.
> >
> > As Thomas points out, as soon as you start blacklisting things (which
> > actually increases quality), bitbake world doesn't work anymore.
> > That alone should be enough to kill it.
> Time to jump in the cage here.
>
> "Quality" is achieved by comparing a set of known specifications against
> a known data set. In the software case this means we need a good set of
> specifications which we are testing against. We also need to know in
> detail what we are testing against this set of specifications.
>
> bitbake world meets neither of these criteria. You have no idea what
> your testing against, you also have no idea what you are submitting for
> test. A random selection of 8500 files in OE. It also doesn't take into
> account known combinations which always fail. Angstrom took care of
> these known failures by creating the concept of a blacklist.
>
> In fact if you tell me bitbake world fails, I would actually suggest
> that is a test pass, it is an expected fail.
>
> Graeme
>
> Actually I expect it to fail, but I am eager to learn which recipes fail.
And yes, it might well be that this is not a good test. If you have
suggestions for a better test that tests all our recipes feel free to speak
up.

The dependency analysis of bitbake world already showed that there are
several issues (as listed above).
E.g. there are apparently dependencies on non existing recipes.
Instead of shooting the messenger and killing the tool it would be better
to  resolve these (by either fixing them as I have seen JaMa did for some
recipes in the past) or by removing the recipes.
Keeping them around as junk does not improve things.

And failure of bitbake -k world is not necessarily bad. At least it will
give some insight in the weak spots.

Frans.

