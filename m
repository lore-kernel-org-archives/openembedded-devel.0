Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QCY1T-00008N-HZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:04:51 +0200
Received: by qwh5 with SMTP id 5so406063qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NE78y/wZN8KkRUd+eLEUk7rpLxsEvx4YBbtqamJePHk=;
	b=uil8Kg92gBbloeuXSPBv8eHKeDxfjWczwEyi58JBNBllv8LAqoDUVWdEyk9vZsIE7O
	Xk0kXXcDpawQhBnMdTYbxdUYk3cBXwTO3JI6G97+bl26/lf8eLJWjacsL/eJzBHAv1Og
	h2W/OR+BxycjN+TWcblYhr/4hbeSI5mN6b3m0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=F81PoJQeEgV4yRhqekFJYm+eVqeP8c8GYtL+4ElYhTToSM+iNKbFN5fI/LjO6C5sDq
	/GDz0hS/a3voPBAlQyI5Pfqmf5agh4oFu6qiNWC7KOaJlZ8/Vk+2yY4qPmSbupg/dVuI
	nRCdaHuJcOpfP8M2EKdklb9lGfgMQEFZC0DeQ=
MIME-Version: 1.0
Received: by 10.229.106.5 with SMTP id v5mr5503610qco.12.1303308145097; Wed,
	20 Apr 2011 07:02:25 -0700 (PDT)
Received: by 10.229.70.207 with HTTP; Wed, 20 Apr 2011 07:02:25 -0700 (PDT)
In-Reply-To: <iojvmj$de8$1@dough.gmane.org>
References: <1302727726-9362-1-git-send-email-eyalr@ti.com>
	<iojko1$bte$3@dough.gmane.org>
	<BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
	<iojvmj$de8$1@dough.gmane.org>
Date: Wed, 20 Apr 2011 09:02:25 -0500
Message-ID: <BANLkTi=PX+c_=1ghKQt0131OMtS7YQzR-A@mail.gmail.com>
From: =?UTF-8?B?15DXmdeZ15wg16jXmdeZ15bXqA==?= <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: eyalr@ti.com
Subject: Re: [PATCHv2] wpa-supplicant: Build from git sources
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
X-List-Received-Date: Wed, 20 Apr 2011 14:04:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Koen,

adding such a PV to the recipe causes the files that are located under
recipes/wpa-supplicant-git/ and are part of SRC_URI not to be found as it
appears that it now looks for them under:

recipes/wpa-supplicant-0.7.3+0.8.x/

How do I work around this?

Best Regards,
Eyal

On Tue, Apr 19, 2011 at 7:37 AM, Koen Kooi <koen@dominion.thruhere.net>wrot=
e:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-04-11 14:13, =D7=90=D7=99=D7=99=D7=9C =D7=A8=D7=99=D7=99=D7=96=D7=
=A8 wrote:
> > This naming is used in other recipes building from git.
> > Any suggestions of how it should be called instead?
>
> You are entirely right that the filename usually is foo_git.bb, but
> there would be something like PV =3D "x.y.z+git" inside.
> This is to ensure upgrade paths from e.g. 0.7.3 to the 0.8rc and 0.8
> final release. If I have '0.7.3' installed, upgrading to 'git' is no
> problem, but going from 'git' to '0.8.0' would be, since 'git' will sort
> higher.
> I'm not into wpa-supplicant release versioning, so I don't have the
> right solution, but something like
>
> PV =3D "0.7.3+0.8rc"
> PR_append =3D "gitr${SRCPV}"
>
> should work.
>
> regards,
>
> Koen
>
>
> > =D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A 2011 4 19 12:35, =D7=9E=D7=90=D7=
=AA "Koen Kooi" <koen@dominion.thruhere.net> :
> > On 13-04-11 22:48, Eyal Reizer wrote:
> >>>> * Builds a new version 0.8.x which is not released yet as a zip file=
.
> >>>> This version has new features like WIFI-direct used in new mac80211
> >>>> versions
> >>>>
> >
> > Same thing as with hostap-daemon: 'git' is not a valid PV.
> >
> >>
> >>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNrYISMkyGM64RGpERAlbGAKCZCfCJloSSt8qNx3nclhPuG1KwKwCfYH6o
> dloJiapREwDLoeMUrdgWGu4=3D
> =3D9v/S
>  -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

