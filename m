Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSE9E-0007tl-Vh
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 23:10:14 +0200
Received: by wgbdr1 with SMTP id dr1so692266wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wUVEiDhZez11SQLNe9B7wtLtsLqrfVR3GxekuTy+YOg=;
	b=dxVgTbi4PgFFYG4OVe5WzSUNK8M8lWtsqhE4+FcwVCkdWMNDGA0zTzsrhEbW4DmHxp
	8gJSgPsFDnJwrYzvVQ/1WtsKi+vAV58n+Rs2q+S0uB4oOnbVjgmgwhpjDMJVvjM2vzb0
	mKQioCDqp3TK3KP7K0K8HwPj442dVydE0Jd+G9P8ClDfDXTG/2kLD93j5qPTbU+PlPVU
	XuDJbF8e2TkMPTODQb/ONkJ0YLKrWsS1J3Eb1eT0eCtxkTG2C2s6tRC1GEmKXlmNBtDg
	vccIoMo4lEJccSFy5bkzhSSP+vBt7sSBoJT3VxkpppgKWw23q4ulZ/fNs19yJaCqSrmZ
	9Xbg==
Received: by 10.180.98.137 with SMTP id ei9mr3592277wib.0.1336597219993;
	Wed, 09 May 2012 14:00:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ez4sm2162221wid.3.2012.05.09.14.00.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 14:00:19 -0700 (PDT)
Date: Wed, 9 May 2012 23:00:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Apelete Seketeli <apelete@seketeli.net>
Message-ID: <20120509210020.GI12898@jama.jama.net>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
	<20120411125503.GB3637@jama.jama.net>
	<20120412204417.GD3256@hermes>
	<20120412210108.GA3945@jama.jama.net>
	<20120502210040.GB3781@hermes> <20120509191656.GP3781@hermes>
MIME-Version: 1.0
In-Reply-To: <20120509191656.GP3781@hermes>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Wed, 09 May 2012 21:10:14 -0000
X-Groupsio-MsgNum: 38644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Content-Disposition: inline

--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 09, 2012 at 09:16:56PM +0200, Apelete Seketeli wrote:
> Hi,
>=20
> Le 02-May-12, Apelete Seketeli a =E9crit:
> >=20
> > Okay, I finally got some time to works on this.
> > I asked on the yocto ML to get the original patches applied, and they
> > actually got applied (thanks to Richard Purdie).
> >=20
> > Please find attached the patch to get the changes into oe-classic. I
> > don't know if I should create a new thread to submit it, I would
> > gladly do so if asked to.
>=20
> The patch has just been applied in oe-classic, thanks to Kristoffer
> Ericson.
>=20
> http://cgit.openembedded.org/openembedded/commit/?id=3D1ff63aa26e3088ba2d=
30e491d74a31caf25c3d83
>=20
> I am new to the list, so I am not used to the process, but would you
> please tell me what the rule for the author and committer field is ?
> I would have naively expect to see my name there.

You did it almost right and Kristoffer's name should be only in committer=
=20
field and yours in author.

Next time when sending new version use PATCHv2 prefix and don't send
your patch in reply as inline. If you download mbox version from
patchwork
http://patchwork.openembedded.org/patch/26863/
you'll see that e.g. my reply to you get's included in commit message of
such patch which doesn't belong there and committer needs to use=20
git commit --amend  -s
to strip unwanted text..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+q2uQACgkQN1Ujt2V2gBwbigCgieCjmLuThfZbXu1KeaQHgI8M
FI8AoJ7GFH6V49chiAkjiMVtEe6EIM2w
=wkTW
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--
