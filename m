Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1O6Zxt-0006Kw-JK
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 03:51:58 +0200
Received: by bwz20 with SMTP id 20so2467298bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=VmqYpkXyhTwMpnbIJI2AnNHKPmoGR3u5dO9WGjfkEEU=;
	b=qQWc4cctk55j7c6LrpPX7NA+AvUzhY8GQynhP2pS+DD3yaXSlo/sq2dRBJK1I/BVD1
	kgUVmrvplx2+23TxnESBqlAcLCR0JgHwMckGQRaGYEIUgSRR9r0Y/tGcFC8Vent4J4ru
	mVRXOSVp/KA+ASiz7udLU3j7UAhdiyNI16lxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=anyllJIVADZYoqdZ99lnkX6TYzIZ+zZQKPZ33DQk/1jU0+V8700g9/r0iLtLKMRQfo
	DZyf+I34qxg/NtIC4O63j3cg0iMUMTe3IaxRmi1+1RZI2YYQgfEn6kbQLiRC3ExogSLK
	3WO7E61yIK9ijSUo9xSpix5YjUfz0pzAP2gGU=
MIME-Version: 1.0
Received: by 10.204.140.67 with SMTP id h3mr3154790bku.137.1272332897868; Mon, 
	26 Apr 2010 18:48:17 -0700 (PDT)
Received: by 10.204.84.13 with HTTP; Mon, 26 Apr 2010 18:48:17 -0700 (PDT)
In-Reply-To: <20100426174411.GA22763@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
	<20100426174411.GA22763@denix.org>
Date: Tue, 27 Apr 2010 03:48:17 +0200
Message-ID: <x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: arago-devel@gforge.ti.com
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [arago-devel] dm365 and OE
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
X-List-Received-Date: Tue, 27 Apr 2010 01:51:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/4/26 Denys Dmytriyenko <denis@denix.org>

> On Mon, Apr 26, 2010 at 12:40:17PM +0200, Raffaele Recalcati wrote:
> > I'm a little bit confused about the good direction for developing for
> dm365.
> > Arago overlay seems nice, it works, but uses also arago-oe-dev, that is a
>
> arago-oe-dev is a snapshot of OE's org.openembedded.dev and updated quite
> often - usually no more than few days behind. The time buffer is to ensure
> everything builds in Arago and nothing is broken (the recent example would
> be the base class broken for couple days in OE).
>
>
ok


> > git tree separated from OE (kept merged sometimes), and Code Sourcery
> > toolchain.
> > In OE instead I see many codecs inside recipes/ti directory, but I don't
> > know their status.
>
> Currently, recipes/ti directory is the same between Arago and OE, so it
> doesn't matter much which one you use.
>
>
good


> > Anyone can point me to the right direction?
> >
> > arago + cs
>
> Unlike Koen, I suggest the first option - arago+cs :)
>

The real difference is the toolchain.


>
> > OE + cs
> > OE + its builtin toolchain
>
> So, it's up to you what to use...
>

Yes, I have to choose.


>
> Arago is meant to be very close to Angstrom (we try to keep them in sync),
> but limited to TI platforms (Angstrom supports more). Arago is used as a
> stabilization vehicle for official TI products. While Angstrom is a purely
> community distro, Arago is bound by some legal limitations/requirements and
> can be thought of as a corporate/enterprise distro (OE has
> ENTERPRISE_DISTRO
> for things like this). All the applicable fixes and modifications in Arago
> are
> pushed back to OE/Angstrom, plus Arago itself is in the public git.
>

I'll check "legal limitations/requirements" .
Also I have to check if packages PREFERRED_VERSION are good for my purposes.


>
> Koen is the maintainer for Angstrom, I'm the maintainer for Arago. Both of
> us
> are employed by TI and both of us are also OpenEmbedded developers.
>
> Hope this makes it more clear for you.
>

Yes.
I'll try to go on with both for some weeks.
But, first of all, I need a dvsdk running on dm365 with Arago.
By now, I can't build any ti recipe for dm365 in Arago (arago-next).
I could build dvsdk externally following the readme, but I think it is
better to re-use you work.
Which are the recipes that I can build for dm365?
In case of problem I, and my team, will contribute to the work.

For Koen:
Instead, for OE environment, I have some problems creating the setup.
I supposed to use dev branch (openembedded.org setup instructions) and I'd
like a local.conf file in order to know which angstrom version is better to
choose.

Raffaele

