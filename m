Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRfXn-00071C-Uj
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 10:45:31 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so178784wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d7Rm21Sow78Q6WiBweuyT1F+qS77MtlcO6gyM+p1FY8=;
	b=btMJ/4+4E5uM9KZNzR53NvmGqAfLIP2t81x7zlxeClZjgyiuCpS0CNCkM/6D83oc8f
	4aoPIyucXekF+A/jd6IWYYj0ZYoTGkcNTgcuFzVZqy/WmSsoV9tyX+PC/65EppUXhqBS
	+gbNmc8vROGCiOpI11rE7KiZrv5NTeStcNT2wefKWyn5RijNYf2oz6gzHsSUPER1y0dz
	WMo3I9g/i8cvIjV46Rs4rfuNwzxjW729DGxnDfz5EQNoVoNZTWJl4sZ1AiK7BPHsLvtv
	JR4zBKmAoXHC+r9TQEIoz77VqUJl8o5fUYrXYlTqUO5VWwOJFfD8MFkQKLzmgYDeEoq6
	+V+g==
Received: by 10.180.99.97 with SMTP id ep1mr3489466wib.9.1351240322316;
	Fri, 26 Oct 2012 01:32:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dm2sm97339wib.4.2012.10.26.01.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Oct 2012 01:32:01 -0700 (PDT)
Date: Fri, 26 Oct 2012 10:32:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121026083220.GV3269@jama.jama.net>
References: <1351191528-13408-1-git-send-email-martiert@gmail.com>
	<k6dd8v$tj0$1@ger.gmane.org> <20121026080125.GU3269@jama.jama.net>
	<508A426B.8000102@gmail.com>
MIME-Version: 1.0
In-Reply-To: <508A426B.8000102@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 08:45:32 -0000
X-Groupsio-MsgNum: 41303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HPm2I89eDTDbofr6"
Content-Disposition: inline

--HPm2I89eDTDbofr6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2012 at 09:57:31AM +0200, Martin Erts=E5s wrote:
> On 10/26/12 10:01, Martin Jansa wrote:
> > On Fri, Oct 26, 2012 at 09:14:43AM +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Op 25-10-12 20:58, Martin Ertsaas schreef:
> >>> Change version of ntp to match that in meta-networking. Also change
> >>> ntpdate to ntp-date to match the names used in meta-networking.
> >> While you are there, can you also disable the autoactivating for the u=
nit?
> >> It's broken and I'm gettig tired of doing 'systemctl disable' on it for
> >> every system.
> > Cannot we fix it? Last time I've noticed it was using wrong binary (not
> > installed by ntpdate package) from .service file.
> >
> > SHR root@qemux86-64 ~ $ opkg files ntpdate
> > Package ntpdate (4.2.6p3-r7) is installed on root and has the following
> > files:
> > /etc/network/if-up.d/ntpdate
> > /usr/bin/ntpdate
> > SHR root@qemux86-64 ~ $ grep Exec /lib/systemd/system/ntpdate.service
> > ExecStart=3D/usr/bin/ntpd -q -g -x
> >
> > Cheers,
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> So what is happening is that if you just install ntpdate, it still tries
> to use ntpd, which doesn't exist? Sorry for the questions now, but I
> don't have anywhere to test this right now.

Yes, exactly.
ExecStart needs to be changed to use ntpdate in ntpdate.service.=20

-ExecStart=3D/usr/bin/ntpd -q -g -x
+ExecStart=3D/usr/bin/ntpdate pool.ntp.org

Maybe we should also add something like
Requires=3Dnetwork.target
because right now there is only
Before=3Dntpd.service
to prevent already used socket (ntpdate[545]: the NTP socket is in use, exi=
ting)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HPm2I89eDTDbofr6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCKSpQACgkQN1Ujt2V2gBybywCfSMtJia7Xsev/DovjfFY+SCah
AmIAniBY4PctPStEN3D2mNGzxZ2d3xq3
=jFQ6
-----END PGP SIGNATURE-----

--HPm2I89eDTDbofr6--
