Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id F16FB601A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 08:51:15 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so8018302wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fTeJrXSaIS2S8tYRZnzWG8FoKe7Bafg3LkOxtp4445M=;
	b=tpuS96Wx+FB+zQUHaFa2gLXxy13XvsESiBZImt7q9KIGShy9kir6LHF1tegNuxQDjU
	fKUaOsPRwPLhcUgAK7W3T8sLtr+mkuo/p8T7tV58KiGdg9K0uys7wJ5/qB/qx9PKp/4j
	EJb9opxHwP0V/VYF4CTrfJ+utXfrT4/ONqiNFZ9ipNoAzP5OL09VmLb0GegOE8nUOc1A
	0zIyRxtmR9KAD3c/HRdEAzwBqN5s7Q6l8cTClM5n1W1Ew1HZnMhMR8tCR/hEDY/Y0kNZ
	U+nF7enqVd6VdnOc+bX/+c/fhIyuOmEIPQZ9WFmFFES/wel5+cNBqCUjZtkPdOP+r9qM
	spxQ==
X-Received: by 10.180.184.20 with SMTP id eq20mr23298950wic.37.1407747076126; 
	Mon, 11 Aug 2014 01:51:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm38404640wjd.30.2014.08.11.01.51.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 01:51:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Aug 2014 10:51:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140811085150.GV14848@jama>
References: <cover.1407632366.git.chris_larson@mentor.com>
	<df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
	<20140810092431.GP14848@jama>
	<CABcZANma2YyDV34G+9EcZ20n8Uj7cFjKXh2AHG0zSqd2b+f4wg@mail.gmail.com>
	<20140811084647.GU14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140811084647.GU14848@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 08:51:22 -0000
X-Groupsio-MsgNum: 51581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0o4l8DLzmjliL3C4"
Content-Disposition: inline

--0o4l8DLzmjliL3C4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 10:46:47AM +0200, Martin Jansa wrote:
> On Sun, Aug 10, 2014 at 05:36:32PM -0700, Christopher Larson wrote:
> > On Sun, Aug 10, 2014 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >=20
> > > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > Is this v2 of this change which was sent earlier?
> > >
> >=20
> >=20
> > They should be the same, just this one is part of a series with other
> > changes. Either should work fine for that particular issue.
>=20
> There were some smaller differences (like Upstream-Status and SRC_URI
> addition in .inc instead of .bb).
>=20
> I've resolved them as conflicts in next patch.

Hmm, maybe not correctly, can you please check what's wrong in
master-next or resend rebased v2?

NOTE: Running task 16205 of 29186 (ID: 11621, /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.b=
b, do_patch)
NOTE: recipe dnsmasq-2.68-r0: task do_patch: Started
ERROR: Command Error: exit status: 1  Output:
Applying patch lua.patch
patching file Makefile
Hunk #1 FAILED at 57.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch lua.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/dnsmasq/2.68-r0/temp/log.do_patch.24548
NOTE: recipe dnsmasq-2.68-r0: task do_patch: Failed
ERROR: Task 11621 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-n=
etworking/recipes-support/dnsmasq/dnsmasq_2.68.bb, do_patch) failed with ex=
it code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0o4l8DLzmjliL3C4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPohCYACgkQN1Ujt2V2gByvGwCfQg+cLL4DM5o/SrjrCdnf8Xhf
PD0AnAqeOyYWhSYT4G9vZ1ua3fzP5Hbf
=jJeW
-----END PGP SIGNATURE-----

--0o4l8DLzmjliL3C4--
