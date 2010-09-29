Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P15Jt-0003F3-5g for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 00:40:14 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P15Ji-0001Sl-Ai for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:40:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
Date: Thu, 30 Sep 2010 00:40:00 +0200
Message-ID: <1285800000.27605.46.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 00/18] Patches from opendreambox.org
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
X-List-Received-Date: Wed, 29 Sep 2010 22:40:14 -0000
X-Groupsio-MsgNum: 24194
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-7uCUo+P78SIXDrdZ//+V"

--=-7uCUo+P78SIXDrdZ//+V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Mittwoch, den 29.09.2010, 20:36 +0000 schrieb Andreas Oberritter:

> in order to synchronize our work with upstream, I've prepared some
> patches. More patches will follow. You can cherry-pick or pull them
> from git, if you like:
>=20
> git://git.opendreambox.org/git/obi/openembedded.git for-upstream

thank you for your patches. I took a quick glance and as far as I can
judge it they are of very high quality.

I will build test your changes on minimal-{libc,eglibc,uclibc} and
=C8=A6ngstr=C3=B6m 2008.1 and report back.

> I'm submitting patches to OE for the first time, so please be patient
> if I've missed some guideline or the like.

I have some minor nitpicks and comments.

1. When you add patches please add a short header to the patch files
[1][2]. If you could spend the time to submit patches upstream that
would be great.

I think that applies to the following recipes.

[PATCH 03/18] libmad-0.15.1b: fix compile with gcc-4.4 (mipsel)
http://patchwork.openembedded.org/patch/3110/

[PATCH 04/18] libsigc++-1.2: fix installation
http://patchwork.openembedded.org/patch/3106/

[PATCH 06/18] netkit-base-0.17: fix compile with gcc-4.x
http://patchwork.openembedded.org/patch/3115/

[PATCH 09/18] cdrkit: update from 1.1.9 to 1.1.10
http://patchwork.openembedded.org/patch/3112/

[PATCH 11/18] tremor-20041119: Add pkgconfig file, provide libvorbisidec
http://patchwork.openembedded.org/patch/3103/

[PATCH 17/18] libxmlccwrap-0.0.12: initial recipe
http://patchwork.openembedded.org/patch/3109/

[PATCH 18/18] mjpegtools-1.9.0: initial recipe
http://patchwork.openembedded.org/patch/3108/

2. I do not know if you did this, but for new recipes you can sanitize
them using `oestylize.py` [3].

3. It is not demanded by the commit policy, but if you fix compile or
other errors, I would prefer to see the relevant log of the failed build
in the commit message.

4. You could note in your patches what machines and distributions you
used for building and testing your changes.

5. Please remember to update the patch queue if appropriate [4].

Thanks a lot again for your patches. I am looking forward to more.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Push_patches_upstream
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/eglibc/=
files/eglibc-dont-cache-slibdir.patch
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/oe-styl=
ize.py
[4] http://wiki.openembedded.net/index.php/Patchwork

--=-7uCUo+P78SIXDrdZ//+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjwEAACgkQPX1aK2wOHViR4ACfXqI6tjtwDqe0ZMrz4RKZjyuj
wlEAmgKyO5LneCb1awYtrC3xA1FedlpO
=8br8
-----END PGP SIGNATURE-----

--=-7uCUo+P78SIXDrdZ//+V--
