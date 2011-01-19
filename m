Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfcOe-0008IG-UG
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 19:04:41 +0100
Received: by ywi6 with SMTP id 6so432935ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 10:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=7fsK/5c024FC5BDl8WQoDkJv0KSOE80jyahMm59hzug=;
	b=QspxWj8k9vYyUpldeAWjfb/km+m0iOn8MlIni4I88qJ9tszGHJPdt+SLq17Q6zPeUk
	T3evqu78IpuqqOjL/S8k4yrdb76pM2pQX+dbAd0dIJ+wCPHY5ZX9NL8xzNvsgQaVHOaJ
	mbgcAa6yE5MJNBaVRzlz9xxX/zf75t/W66ibI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SnASB6c9gmrxVteLEQrYPRdMeOg5D5RIoFIi9SSq+VcPTphlRQJK3ol7orFlQCtV3G
	Z0lhH/aLs7ZkjA5nvk9nQ1HMBoJvYooKPa9yGie1to+J5ff0zFkrVkdAi6x31ztqBEIJ
	saeBegNLOPh840hMHKhtfmhY/uH94wE2TOdpw=
Received: by 10.90.104.20 with SMTP id b20mr1252617agc.193.1295460240603; Wed,
	19 Jan 2011 10:04:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 10:03:39 -0800 (PST)
In-Reply-To: <4D36FE98.3070606@mwester.net>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
	<4D36FE98.3070606@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 10:03:39 -0800
Message-ID: <AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 18:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 7:09 AM, Mike Westerhof <mike@mwester.net> wrote:
> As I read this thread, I find that as a distro maintainer, I'm a bit
> unclear on a few points. =C2=A0Pardon me if I've just failed to read/foll=
ow
> this thread...
>
> - So if I wish (or am forced) to use "layers", where do they come from?
> =C2=A0Am I then responsible for finding a git hosting service, arranging =
for
> CIA commit messages, etc? =C2=A0Or will each layer be hosted alongside th=
e
> main OE repo? =C2=A0Or have we not yet considered the added administrativ=
e
> burden of multiple repos?

well if distro is kept in sync with oe-core it should not need many bits.
may be oe-meta will hold all the remaining bits that it might need on top

>
> - Does this not "silo" things even more? =C2=A0For example, I have found =
life
> has gotten much easier now that other autobuilders are building SlugOS
> -- but what incentive do people have if they have to deal with adding
> layers and all that, especially if the "SlugOS layer" ends up with a
> conflict in some fashion with the "Angstrom layer"? =C2=A0And
> correspondingly, if I am struggling with some issue, would it not be
> less likely that I could get assistance and guidance from #OE if I'm
> using some layer?

yes we are learning about layers and certainly there will be issues
there is priority so if you want to override over angstrom-layer you can
and still use angstrom-layer. I think if we do a good job of oe-core then
the possibility of conflicts could be minimised.

>
> - And unless I'm not missing something with the layers proposal (and I
> hope I am), is it not most likely that we'll end up with the following
> scenario:
>
> =C2=A0a) Larger distros eventually fork OE-core and go off on their own a=
s
> they find that their "layer" becomes more and more substantial compared
> to OE-core, especially when "people-originated conflicts" occur rather
> than "technically-originated conflicts" (a single repo tends to force
> resolution of the former).

if we do a lousy work in maintaining oe-core chances of this happening are =
less
IOW we have to keep the distros in mind when we work on oe-core and cater
to their needs absolutely in a portable way

>
> =C2=A0b) Small distros are forced to comply with nothing but OE-core, or
> perish -- the cost of maintaining the extra infrastructure (git, cgit,
> CIA, etc, etc) along with the added complexity of teaching new distro
> developers about this new layer of stuff) is simply too high, not to
> mention that creating a layer for distro-specific stuff might be an
> instant killer in terms of autobuilder and assistance from the OE
> community at large (I ask myself -- do *I* intend to pull the Angstrom
> layer and build it? =C2=A0I've done so in the past, but only because it w=
as
> trivial to kick off such a build... but with layers, it seems it will be
> far harder to do so -- unless I'm missing something).
>

The meta-oe layer will host I think all bits out of oe-core

> =C2=A0c) Obscure/experimental distros simply die off, or find an alternat=
ive
> to OE. =C2=A0The learning curve is quite steep already, and without acces=
s to
> shared knowledge, shared recipes, and the assistance of the community,
> what is there to encourage a newcomer to use OE?

well its just that you will have two or more repos to pull from to
make what you get in one shot
from OE as of today
>
>
> I'm putting on my asbestos skivvies, since I expect this must have
> already been discussed :)
>
> -Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


