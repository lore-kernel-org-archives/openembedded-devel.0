Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PhlhZ-0001OS-IA
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:25:05 +0100
Received: by bwz10 with SMTP id 10so481554bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4B6y2Mao9wsjsN1RmjXvbRZBIPXjMyvJyX46jfjMkE8=;
	b=gBpnVJPTDsiXEleIDB3NweeX0cDpdWTX64j6/3kBzxBHA9SZ+gz6iS9vnt77NNmWtm
	EKgi0EEDLZ05xVG/KdE9NE1DPUhPcxZOfWVoNI18BEBcClGeEHGt7xRWx9Y5/IKaB/lN
	XBZge2kIvmo2lPyUkcBbRRyZHMb/0RSMwm5Do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=A7lUEVSCSsrNARue20xsVM65KTRznQOz9WXXcW/cGRb/uKr1AAmQicCIgVWipgvxcP
	BPN0IOFVdt/Qoa0nxxm751E66jxEDgXPPq7xjoktl7rCkUfdDuS8YfTupkqIwcE3P3Q0
	XgS2Yw1H/GAichGUBjTn486tSWrgoQggDN15c=
Received: by 10.204.32.216 with SMTP id e24mr5264296bkd.204.1295971932796;
	Tue, 25 Jan 2011 08:12:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id rc9sm5502594bkb.2.2011.01.25.08.12.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 08:12:11 -0800 (PST)
Date: Tue, 25 Jan 2011 17:12:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110125161222.GG3616@jama>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> <ihmjum$vdq$2@dough.gmane.org>
	<AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
	<ihmnv8$n3g$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ihmnv8$n3g$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 16:25:05 -0000
X-Groupsio-MsgNum: 28436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline

--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 03:50:16PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 25-01-11 15:40, Frans Meulenbroeks wrote:
> > 2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> > On 20-01-11 08:10, Koen Kooi wrote:
> >>>> On 19-01-11 20:35, Philip Balister wrote:
> >>>>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
> >>>>>> * Having rpath to sysroot is just as bad as one to workdir
> >>>>
> >>>>> When you do a build with this, how many recipes have issues?
> >>>>
> >>>> Console-image is clean now :)
> >=20
> > And angstrom-gnome-image as well, so can I get some Acks or tested-bys
> > please?
> >=20
> >> NAK, I feel other distro's like shr and minimal should be given some
> >> time to test this too.
>=20
> Martin has already Acked it, fwiw

Yes, I think that if it says something it's broken then it's broken and
needs to be fixed, haven't seen any false positives with it, that's why
I Acked it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk0+9mYACgkQN1Ujt2V2gBwzbQCfTFhweoNizSpqF80VjQ4ny/bj
m3gAn3eDD9f0sZN1OjvnOdOwBnNKnHuX
=50aP
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--
