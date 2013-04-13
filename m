Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQpAO-0002xq-Js
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 03:22:10 +0200
Received: by mail-pd0-f178.google.com with SMTP id w11so1663852pde.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XEr+/a8LmRe3GS6KTUvDEZpRvIXnhvVv2hBV4bKem5Q=;
	b=uPwrNnCTpyITRM7zeduYw+PC3kY6tu7V4mcfJAOTI3TdiT8awojmfLuD36YIO+vdgR
	AAXcRKR19KoH3EjK7OvBzyXVYdFu/fK6MTByGmVWK9tibx2mfwipSDR/PE4EYuUDWXzZ
	xRQ/sI/wbgLJgxz9557ShcODYpQo2nqSxTOvYtaGzGroTIfF5jidEu5vQ5SgIAbZSugV
	PHbgwRVX1SYT1tZBH37euqcReV0viu2dsxyNJ+jiPCsEVSd/dg3mIXgTRKdSRxKVMf3A
	Q5T5fkiNgtblaN/DqZWypmZH8gFxb2hhhfVanSUDyWj/h3g322/hp8+s/DED07sw/vBN
	v6sg==
X-Received: by 10.68.189.137 with SMTP id gi9mr17640691pbc.106.1365815082746; 
	Fri, 12 Apr 2013 18:04:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mm9sm10449382pbc.43.2013.04.12.18.04.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 18:04:41 -0700 (PDT)
Date: Sat, 13 Apr 2013 03:04:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130413010436.GB2477@jama>
References: <20130412225236.GZ2477@jama>
	<CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld] linux-yocto-3.8 failing
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
X-List-Received-Date: Sat, 13 Apr 2013 01:22:20 -0000
X-List-Received-Date: Sat, 13 Apr 2013 01:22:20 -0000
X-Groupsio-MsgNum: 44105
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nG7dHWd/DOCuxGWF"
Content-Disposition: inline

--nG7dHWd/DOCuxGWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 08:44:53PM -0400, Bruce Ashfield wrote:
> On Fri, Apr 12, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Hi Andrea,
> >
> > patches from
> > http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d738e6a6=
dc2971853644b9ed0e0a9a2e
> >
> > don't apply after linux-yocto upgrade in oe-core from today
> > http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec64591=
c4d91933b3a8db875a374a63640b
>=20
> Hmm. Andrea and I debugged another problem with these BSPs just yesterday,
> I sent a fix to RP that is slightly newer than the commit you are referen=
cing
> above.
>=20
> If it still doesn't work with the very tip of oe-core, then I'll help
> Andrea debug more ... unless
> the patches really do need a refresh :)

Maybe it was caused by some other linux-yocto/kern-tools-native change
instead, because I've built linux-yocto-3.8 for spitz earlier today
(with oe-core revision from yesterday). Then I upgraded oe-core again
and it started to fail.

https://github.com/shr-distribution/buildhistory/commit/0e3324cd91d06a36266=
1b4151a298fa2f3f6566e
is my last successful spitz image build and it shows
kernel_3.8.4+git0+27b63fdbd25ad1a37bacc05f49a205c150d21779_11998bd1f44b21cd=
0b8c0ca11cbd36865f14bfdc-r4.0.0_spitz.ipk
(same SRCREVs as now failing build)

Cheers,

> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spit=
z-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a=
205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_pat=
ch.18051 for further information)
> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/spitz=
-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a2=
05c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patc=
h.18051
> > Log data follows:
> > | DEBUG: Executing shell function do_patch
> > | Deleted branch meta-temp (was 37fdb0c).
> > | [INFO] validating against known patches  (spitz-standard-meta)
> > error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
> > | error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
> > | To force apply this patch, use 'guilt push -f'
> > | [ERROR] unable to complete push
> > | pending patches are:
> > | links/linux-yocto-3.8/spitz_pm.patch
> > | links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
> > | links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
> > | ERROR. could not update git tree
> > | ERROR. Could not apply patches for spitz.
> > |        Patch failures can be resolved in the devshell (bitbake -c dev=
shell linux-yocto)
> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/sp=
itz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f4=
9a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_p=
atch.18051 for further information)
> > ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_3.8.bb, do_patch) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to be r=
erun and 1 failed.
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nG7dHWd/DOCuxGWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlForyQACgkQN1Ujt2V2gBxGRwCdF5kvo1h7J5qh91tZ+iEz8W3J
zuQAoJrIX/PeHjDY9MNDYNtKSry3B0ed
=5/b4
-----END PGP SIGNATURE-----

--nG7dHWd/DOCuxGWF--
