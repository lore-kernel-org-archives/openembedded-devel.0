Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF69601F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:29:34 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1cTVhW-0005mQ-NT from Joe_MacDonald@mentor.com ;
	Tue, 17 Jan 2017 07:29:34 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Jan 2017 07:29:34 -0800
Received: by burninator (Postfix, from userid 1000)	id 3F29D5803FE; Tue, 17
	Jan 2017 10:29:33 -0500 (EST)
Date: Tue, 17 Jan 2017 10:29:33 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <zhe.he@windriver.com>
Message-ID: <20170117152932.GC7248@mentor.com>
References: <1484623661-7017-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1484623661-7017-1-git-send-email-zhe.he@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] iscsitarget: Fix call trace of ahash API calling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2017 15:29:35 -0000
X-Groupsio-MsgNum: 64761
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline

--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] iscsitarget: Fix call trace of ahash API cal=
ling] On 17.01.17 (Tue 11:27) zhe.he@windriver.com wrote:

> From: He Zhe <zhe.he@windriver.com>
>=20
> The orignal patch does not alloc struct ahash_request before using it.
> This will cause the kernel call trace below when calling gen_scsiid on
> kernel 4.8 or later version.

Understood, but please don't modify the patch in place, this makes it
difficult for the original author to track upstream status, if they've
opted to send it along (note the original upstream status was
'Pending').  If you were the original author this approach might make
more sense.

Please just re-send as a standalone patch at the end of the patch list
with your own upstream status line.

Thanks.
-J.

>=20
> This patch normalizes the calling of ahash API according to the example
> in kernel doc Documentation/crypto/api-intro.txt.
>=20
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000020
> IP: [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
> PGD dd77067 PUD dd7c067 PMD 0=20
> Oops: 0000 [#1] PREEMPT SMP
> Modules linked in: iscsi_trgt(O)
> CPU: 0 PID: 350 Comm: ietd Tainted: G           O    4.8.12-yocto-standar=
d #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.3-0-g=
e2fc41e-prebuilt.qemu-project.org 04/01/2014
> task: ffff88000dfe2c00 task.stack: ffff88000de88000
> RIP: 0010:[<ffffffffa0008d45>]  [<ffffffffa0008d45>] volume_add+0x625/0x7=
f0 [iscsi_trgt]
> RSP: 0018:ffff88000de8bd90  EFLAGS: 00000206
> RAX: 000000000000ddfa RBX: ffff88000ddd1d78 RCX: ffffea0000000000
> RDX: 0000000000000600 RSI: 0000000000000000 RDI: ffff88000ddd1c14
> RBP: ffff88000de8be38 R08: ffff88000de44180 R09: ffff88000de8bdd0
> R10: 000000000000002c R11: 0000000000000000 R12: ffff88000ddfa600
> R13: 0000000000000000 R14: 0000000000000000 R15: ffff88000de92200
> FS:  00007f767548b700(0000) GS:ffff88000fc00000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000020 CR3: 000000000dd2d000 CR4: 00000000000006f0
> Stack:
>  ffff88000de8bdd0 ffff88000dc1b3d0 ffff88000ddfa650 ffff88000ddfa660
>  ffff88000df8f000 ffff88000ddd1c00 ffff88000de44180 0000000000000000
>  ffffea0000377440 0000000f00000c14 0000000000000000 0000000000000000
> Call Trace:
>  [<ffffffffa0006547>] ioctl+0x217/0x390 [iscsi_trgt]
>  [<ffffffff81192574>] do_vfs_ioctl+0x94/0x5c0
>  [<ffffffff8117ff73>] ? vfs_read+0xf3/0x120
>  [<ffffffff81192b19>] SyS_ioctl+0x79/0x90
>  [<ffffffff8191a45b>] entry_SYSCALL_64_fastpath+0x13/0x8f
> Code: 4c 01 e0 0f 82 a2 01 00 00 48 b9 00 00 00 80 ff 77 00 00 48 01
> c8 45 31 f6 48 b9 00 00 00 00 00 ea ff ff 89 54 24 68 48 c1 e8 0c <49>
> 8b 56 20 4c 89 44 24 20 4c 89 f7 48 c1 e0 06 c7 44 24 6c 04=20
> RIP  [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
>  RSP <ffff88000de8bd90>
> CR2: 0000000000000020
> end trace cd2016297df21635 ]
> ietd_response_recv 200 0 -5
> Input/output error.
>=20
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...ith_updated_interfaces_of_linux_v4.8_and_above.patch | 17 +++++++++++=
+-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_wit=
h_updated_interfaces_of_linux_v4.8_and_above.patch b/meta-networking/recipe=
s-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_an=
d_above.patch
> index e55c407..c83b080 100644
> --- a/meta-networking/recipes-extended/iscsitarget/files/build_with_updat=
ed_interfaces_of_linux_v4.8_and_above.patch
> +++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updat=
ed_interfaces_of_linux_v4.8_and_above.patch
> @@ -89,6 +89,9 @@ Upstream-Status: Pending
> =20
>  Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> =20
> +Correct and normalize the calling of ahash APIs
> +Signed-off-by: Zhe He <zhe.he@windriver.com>
> +
>  diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarge=
t-1.4.20.3+svn502/kernel/block-io.c
>  --- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-09-25 19:45:0=
1.814641016 +0530
>  +++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-09-25 19:47:59.66=
6474094 +0530
> @@ -477,7 +480,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nt=
hread.c iscsitarget-1.4.20.
>  diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-=
1.4.20.3+svn502/kernel/volume.c
>  --- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2016-09-25 19:45:01.=
734641099 +0530
>  +++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2016-09-25 19:47:59.6664=
74094 +0530
> -@@ -84,12 +84,25 @@ static int set_scsisn(struct iet_volume
> +@@ -84,12 +84,26 @@ static int set_scsisn(struct iet_volume
>   /* Generate a MD5 hash of the target IQN and LUN number */
>   static void gen_scsiid(struct iet_volume *volume)
>   {
> @@ -490,28 +493,32 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/=
volume.c iscsitarget-1.4.20.3
>  =20
>  +#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(4, 8, 0)
>  +	tfm =3D crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
> ++	hash =3D ahash_request_alloc(tfm, GFP_ATOMIC);
>  +#else
>   	hash.tfm =3D crypto_alloc_hash("md5", 0, CRYPTO_ALG_ASYNC);
>   	hash.flags =3D 0;
>  +#endif
>  =20
>  +#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(4, 8, 0)
> -+	if (!IS_ERR(tfm)) {
> ++	if (tfm && !IS_ERR(tfm)) {
>  +#else
>   	if (!IS_ERR(hash.tfm)) {
>  +#endif
>   		struct scatterlist sg[2];
>   		unsigned int nbytes =3D 0;
>  =20
> -@@ -102,11 +115,19 @@ static void gen_scsiid(struct iet_volume
> +@@ -102,11 +115,22 @@ static void gen_scsiid(struct iet_volume
>   		sg_set_buf(&sg[1], &volume->lun, sizeof(volume->lun));
>   		nbytes +=3D sizeof(volume->lun);
>  =20
>  +#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(4, 8, 0)
> -+		crypto_ahash_init(hash);
> ++		ahash_request_set_callback(hash, 0, NULL, NULL);
>  +		ahash_request_set_crypt(hash, sg, volume->scsi_id, nbytes);
> -+		crypto_ahash_update(hash);
>  +		crypto_ahash_digest(hash);
> ++		crypto_ahash_init(hash);
> ++		crypto_ahash_update(hash);
> ++		crypto_ahash_final(hash);
> ++		ahash_request_free(hash);
>  +		crypto_free_ahash(tfm);
>  +#else
>   		crypto_hash_init(&hash);
> --=20
> 2.9.3
>=20
--=20
-Joe MacDonald.
:wq

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYfjhcAAoJEEn8ffcsOfaWqZIH/1ZJhqaL6qkwBg81H0OR3duS
NIWNf9Z0K76t3rK4+DCdCrO6k5t4XakFsED+cjgMmiO3GizIG+MOU4QKhRILG4U/
Qr606I6SIzVC1jA7rCNN4PcxZ2YBsa+/kAgh+CNI+kv0CGxtH2N2JE0SFs7dnamu
0VfwXqIp31Iv1R6qKkOYtVqpKdLpgr5nHmPS6CcJ4Y7wJag4ZuVbmi6ssNV6O8xM
xySF3fAOWq4QZCwkKnUaKAPLEMlLMbvtfkupRU7ZLlpKx1t1gGGbMjNTRRnySehH
f/Api91rfn9K4dM/Ya/4UtDmMCdp8dGspqhAWMTdHT9H9fWb++lAWGLSuhKopEY=
=IgIy
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
