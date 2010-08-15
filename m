Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkXdd-0006U0-HH
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 09:28:15 +0200
Received: by iwn38 with SMTP id 38so477321iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0nlW2dJisxyyrLhX1TSxX4gDU36xpKBc92pAgKpmiyY=;
	b=PnhEDRPLzy0MCF6YF0HDA6KR92dMFLR05K5h3/T/S/GxTKQtyLX7lllYQ+GLscK2mw
	m2gtazLqbBTapxfz8njbP3vNErhcrIvvuTN3izKCusq+HJzhEvWdvq6wrMLNk0vveELh
	vTIlwExoYIfKPiRGy2FPupsa7iv+62C7OkMbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IYW6LyVnaDGi9DxC6kUj/wlJVo3BuBCBdFhR9XCQ3xmMdeARq7J2KUfjdsgxlC9Xyv
	F3uGvetecuOcvgG18HnpiYY8oDdT6ITL6m4MCubZx09zL0CNOl+yRUDzkUfsmrrXHC3C
	Oyyhwz1C1pmA71Wa7sg7LC+Jh6IQwfGCqBlBg=
MIME-Version: 1.0
Received: by 10.231.160.194 with SMTP id o2mr1289846ibx.18.1281857274131; Sun,
	15 Aug 2010 00:27:54 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 15 Aug 2010 00:27:54 -0700 (PDT)
In-Reply-To: <AANLkTim7NhKpm57xdraj57fhudBfv_5PkNJxry=D7UDi@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
	<AANLkTime6OXahfsppUL5gVvbSVmovWcYSv2OSTceYSBq@mail.gmail.com>
	<AANLkTim7NhKpm57xdraj57fhudBfv_5PkNJxry=D7UDi@mail.gmail.com>
Date: Sun, 15 Aug 2010 09:27:54 +0200
Message-ID: <AANLkTimuAHuq=0y4B7bm-esbR_=fD_=SKVjnqrjsW_QG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sun, 15 Aug 2010 07:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/14 AJ ONeal <coolaj86@gmail.com>:
> How do I enable logging to tenderbox? I'd be happy to do that.
> I googled it to little avail:
> http://www.google.com/search?hl=3Den&q=3Dtinderbox+openembedded

Add this to your local.conf:

INHERIT +=3D "oestats-client"
OESTATS_SERVER =3D "tinderbox.openembedded.net"
OESTATS_BUILDER =3D"YOURNAME GOES HERE!"

>
>
> For reference, here's the process I've been following:
>
>
> rm ~/overo-oe -rf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 # *clean it all out*
>
> mkdir -p ~/overo-oe
> cd ~/overo-oe
>
> git clone git://gitorious.org/gumstix-oe/mainline.git org.openembedded.de=
v
> =A0 =A0 =A0# *get a fresh copy of the repo*

So you are cloning fro a tree that might be a copy of the openembedded
tree. If you want to be sure to have the real openembedded tree clone
from git.openembedded.org/openembedded. we have
repo.or.cz/r/openembedded.git as ro mirror

>
> cd org.openembedded.dev
> git checkout --track -b overo origin/overo

and this pulls the overo branch within that tree.

As it stands I have no idea what is in that tree and branch
And, unless someone donates me an overo, I guess it'll remain like that.
Guess this holds for most of the dev's on this list.

If there is an issue with a recipe that is reproducible in the
org.openembedded.dev branch of the official repository we'll be happy
to look into it, but until then I think you should discuss this with
the gumstix/overo people.

Best regards, Frans

> cd ~/overo-oe
> git clone git://git.openembedded.net/bitbake bitbake
> cd bitbake
> git checkout 1.8.18
> cd ~/overo-oe
> cp -r org.openembedded.dev/contrib/gumstix/build .
> cp ~/.bashrc ~/bashrc.bak
> cat ~/overo-oe/build/profile >> ~/.bashrc
> source ~/overo-oe/build/profile
>
> bitbake omap3-console-image =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #=
 *make the basic image
> from a fresh start*
>
>
> AJ ONeal
>


