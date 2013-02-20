Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U8J3E-0001Cn-VY
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 00:26:13 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so3174797pbc.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cmp0iAdFrrbO382ce9i350w8kjj9ZelO43YSo8Mi7QM=;
	b=gBHAPTFbT2MWNwzfXvd+iHNzxOwCwQPiS7Y+/uOTn3Cep0zbAPhPFpHAB8aiMYpNru
	y9018Kx8+mJN8+P4aTJU2KM5wOwz45vDNtwOXqD859QX9iz4LJzBCGGmimOnuHY8GnXZ
	5QG5X9D6upnORUX2wN13hbYnRExlQmZxA/Y6TgwoUOdz/xS+tHkTiWkARIZX5sx23ASp
	v+jsayzNWQ9TjhoFHwhabcyL9F6BqvWrfjkZscWA/ViY6doDfNcMdAX2L7IYQaP8fNs8
	7E7NL7JhxViBvoueG/xTVW6VBmYjrOSddRdoSj0kCH5HBk+0SDQ+ftxiQpVaqB5N3FLZ
	KbXg==
X-Received: by 10.66.158.201 with SMTP id ww9mr5119984pab.102.1361401800924;
	Wed, 20 Feb 2013 15:10:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gg7sm23027620pbc.45.2013.02.20.15.09.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 15:09:59 -0800 (PST)
Date: Thu, 21 Feb 2013 00:10:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130220231002.GW3300@jama>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
	<1359152782-23743-5-git-send-email-schnitzeltony@googlemail.com>
	<20130126115141.GH16904@jama.palm1.palmone.com>
	<CALbNGRQepRvg6+EVXzuSZA4a+JTuknBEHm=PJ0L=0a0hGpoX7w@mail.gmail.com>
	<20130219082744.GT3300@jama>
	<CALbNGRSwt6Sa_hui48k+iMJu4PaespyXcO3kEW4hCgsDL5iP8w@mail.gmail.com>
	<20130219174527.GU3300@jama>
	<CALbNGRRcTwiPWsi6KUoxB6RnpJkh=TjAD8FadX+LP+So1u7KPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRcTwiPWsi6KUoxB6RnpJkh=TjAD8FadX+LP+So1u7KPA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-systemd/V2 4/5] geany: initial add 1.22
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
X-List-Received-Date: Wed, 20 Feb 2013 23:26:13 -0000
X-Groupsio-MsgNum: 43270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XRn4JYqoQBkWL/+i"
Content-Disposition: inline

--XRn4JYqoQBkWL/+i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2013 at 07:00:58PM +0100, Andreas M=FCller wrote:
> On Tue, Feb 19, 2013 at 6:45 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >> > Any news on it?
> >> >
> >> > --
> >> No - I tried to reproduce without success and then decided to come
> >> back later. Suggestion: Let me know if it fails again in world - then
> >> we can think about removing it again.
> >
> > Yes it does, here is log from last build
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130219_043012.log/
> >
> I think I found the culprit. As soon as I can build something which is
> close to current master (at the moment I cannot even parse) I'll send
> out a patch.

True, should I merge khem's patch for PN-systemd -> PN and then revert
it later if discussion on oe-core ML ends with decision to revive
PN-system again?

I'm using that patch to test patches for master on jenkins world build.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XRn4JYqoQBkWL/+i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlElV8oACgkQN1Ujt2V2gBw1MwCeIjqzxMPmqNjydr340U5tB8bc
dE8An1Y0X/Z3oAmSnO8zka+cGIFnb5Oo
=mkWR
-----END PGP SIGNATURE-----

--XRn4JYqoQBkWL/+i--
