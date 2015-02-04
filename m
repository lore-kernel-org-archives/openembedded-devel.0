Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D66D46E62B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 16:10:08 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so30194086wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 08:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hZnBiTPt77BreSLCgYi22NLhG0MVGnaUM3eZ+j0k4p0=;
	b=ArtOhORAXURhCTajWJA5MKHQN9jHJ4nc4+KzDImUj8ngiDUzCj/33D/QC4fBdH0ElJ
	J7FYEQM4vFbNHSKneeSGlynovH5/nril4tf99msFH5T/jZ9OBhCVH/Onl/Rnt/j9Bp4K
	7EkKBjYSSR5/0XXfEnlAwL6Lb9fQqgaHGMYIh1ELBNJLG3DKGJ6arPEc48mMVrj8BVBm
	HqaLF15d8ghtB4zKLl8OOdPtc4H3h2i0sgP3Ctyl98w4HVbze1WH/DZSaM389kD561PJ
	bY2SgZdmB79HYmz/STIbgQXNg9fkCknJp1jYvk2CEj9cqVa6mpUL94+rz/1qPl0YWdZC
	0S/w==
X-Received: by 10.194.239.129 with SMTP id vs1mr94507wjc.158.1423066209732;
	Wed, 04 Feb 2015 08:10:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bv16sm13309760wib.0.2015.02.04.08.10.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 08:10:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Feb 2015 17:10:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150204161024.GA2437@jama>
References: <1422940816-42071-1-git-send-email-biannm@cn.fujitsu.com>
	<3881161.YmyCNY23yg@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3881161.YmyCNY23yg@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] php: update to 5.5.21 to fix some bugs.
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
X-List-Received-Date: Wed, 04 Feb 2015 16:10:13 -0000
X-Groupsio-MsgNum: 54082
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2015 at 12:10:02PM +0000, Paul Eggleton wrote:
> Hi Bian,
>=20
> On Tuesday 03 February 2015 13:20:16 Bian Naimeng wrote:
> > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>=20
> Could you please re-send this with -M as it's very difficult to see what =
you=20
> have changed with the default formatting.

And rebase before re-send, because this version doesn't apply in current
master:

OE @ ~/meta-openembedded $ pwam 87897
2015-02-04 17:08:48 URL:http://patchwork.openembedded.org/patch/87897/mbox/=
 [22043] -> "pw-am-87897.patch" [1]
Applying: php: update to 5.5.21 to fix some bugs.
error: patch failed: meta-oe/recipes-devtools/php/php_5.5.20.bb:1
error: meta-oe/recipes-devtools/php/php_5.5.20.bb: patch does not apply
/OE/meta-openembedded/.git/rebase-apply/patch:491: new blank line at EOF.
+
Patch failed at 0001 php: update to 5.5.21 to fix some bugs.
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

>=20
> Thanks,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTSRHAACgkQN1Ujt2V2gBwAegCffH1JS0VfDfrf6PdaCpJrq04y
udUAmwcBWslBSJx17ztWwinHHjYKgKoa
=90hO
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
