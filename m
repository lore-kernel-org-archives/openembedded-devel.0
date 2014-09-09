Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 869117123A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:08:42 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XRLA4-0007Sr-5R from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 06:08:44 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.2.247.3; Tue, 9 Sep 2014
	06:08:43 -0700
Received: by burninator (Postfix, from userid 1000)	id 362185814C3; Tue,  9
	Sep 2014 09:08:43 -0400 (EDT)
Date: Tue, 9 Sep 2014 09:08:43 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909130842.GE2125@mentor.com>
References: <1409294700-20567-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1409294700-20567-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2] ipsec-tools: Fix pfkey UPDATE failure caused by EINTR
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
X-List-Received-Date: Tue, 09 Sep 2014 13:08:42 -0000
X-Groupsio-MsgNum: 52042
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline

--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, with just a little bit of whitespace cleanup.  Thanks.
-J.

[[oe] [meta-networking][PATCH v2] ipsec-tools: Fix pfkey UPDATE failure cau=
sed by EINTR] On 14.08.29 (Fri 02:45) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> While kernel is processing the UPDATE message which is sent from racoon,
> it maybe interrupted by certain system signal and if this case happens,
> kernel responds with an EINTR message to racoon and kernel fails to
> establish the corresponding SA.
> Fix this problem by resend the UPDATE message when EINTR(Interrupted
> system call) error happens.
>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...PDATE-message-when-received-EINTR-message.patch | 220 +++++++++++++++=
++++++
>  .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
>  2 files changed, 221 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls/racoon-Resend-UPDATE-message-when-received-EINTR-message.patch
>=20
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/raco=
on-Resend-UPDATE-message-when-received-EINTR-message.patch b/meta-networkin=
g/recipes-support/ipsec-tools/ipsec-tools/racoon-Resend-UPDATE-message-when=
-received-EINTR-message.patch
> new file mode 100644
> index 0000000..1ec5a41
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-Rese=
nd-UPDATE-message-when-received-EINTR-message.patch
> @@ -0,0 +1,220 @@
> +racoon: Resend UPDATE message when received EINTR message
> +
> +Upstream-Status: Pending
> +
> +While kernel is processing the UPDATE message which is sent from racoon,
> +it maybe interrupted by system signal and if this case happens,
> +kernel responds with an EINTR message to racoon and kernel fails to
> +establish the corresponding SA.
> +Fix this problem by resend the UPDATE message when EINTR(Interrupted
> +system call) error happens.
> +
> +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> +---
> +--- a/src/libipsec/libpfkey.h
> ++++ b/src/libipsec/libpfkey.h
> +@@ -92,6 +92,12 @@
> + 	u_int16_t ctxstrlen;		/* length of security context string */
> + };
> +=20
> ++struct update_msg_info {
> ++        struct sadb_msg *update_msg;
> ++        int so;
> ++        int len;
> ++};
> ++
> + /* The options built into libipsec */
> + extern int libipsec_opt;
> + #define LIBIPSEC_OPT_NATT		0x01
> +--- a/src/libipsec/pfkey.c
> ++++ b/src/libipsec/pfkey.c
> +@@ -1219,7 +1219,8 @@
> + }
> + #endif
> +=20
> +-
> ++struct update_msg_info update_msg_send =3D {NULL, 0, 0};
> ++=09
> + /* sending SADB_ADD or SADB_UPDATE message to the kernel */
> + static int
> + pfkey_send_x1(struct pfkey_send_sa_args *sa_parms)
> +@@ -1483,10 +1484,24 @@
> +=20
> + 	/* send message */
> + 	len =3D pfkey_send(sa_parms->so, newmsg, len);
> +-	free(newmsg);
> +=20
> +-	if (len < 0)
> +-		return -1;
> ++	if (newmsg->sadb_msg_type =3D=3D SADB_UPDATE) {
> ++		if (update_msg_send.update_msg)
> ++			free(update_msg_send.update_msg);
> ++		update_msg_send.update_msg =3D newmsg;
> ++		update_msg_send.so =3D sa_parms->so;
> ++		update_msg_send.len =3D len;
> ++
> ++		if (len < 0) {
> ++			free(update_msg_send.update_msg);
> ++			update_msg_send.update_msg =3D NULL;=09
> ++			return -1;
> ++		}
> ++	} else {
> ++		free(newmsg);
> ++		if (len < 0)
> ++			return -1;
> ++	}
> +=20
> + 	__ipsec_errcode =3D EIPSEC_NO_ERROR;
> + 	return len;
> +--- a/src/racoon/session.c
> ++++ b/src/racoon/session.c
> +@@ -100,6 +100,8 @@
> +=20
> + #include "sainfo.h"
> +=20
> ++extern struct update_msg_info update_msg_send;
> ++
> + struct fd_monitor {
> + 	int (*callback)(void *ctx, int fd);
> + 	void *ctx;
> +@@ -348,6 +350,11 @@
> + 	close_sockets();
> + 	backupsa_clean();
> +=20
> ++	if (update_msg_send.update_msg) {
> ++		free(update_msg_send.update_msg);
> ++		update_msg_send.update_msg =3D NULL;
> ++	}
> ++
> + 	plog(LLV_INFO, LOCATION, NULL, "racoon process %d shutdown\n", getpid(=
));
> +=20
> + 	exit(0);
> +--- a/src/racoon/pfkey.c
> ++++ b/src/racoon/pfkey.c
> +@@ -103,10 +103,12 @@
> + #include "crypto_openssl.h"
> + #include "grabmyaddr.h"
> ++#include "../libipsec/libpfkey.h"
> +=20
> + #if defined(SADB_X_EALG_RIJNDAELCBC) && !defined(SADB_X_EALG_AESCBC)
> + #define SADB_X_EALG_AESCBC  SADB_X_EALG_RIJNDAELCBC
> + #endif
> +=20
> ++extern struct update_msg_info update_msg_send;
> + /* prototype */
> + static u_int ipsecdoi2pfkey_aalg __P((u_int));
> + static u_int ipsecdoi2pfkey_ealg __P((u_int));
> +@@ -253,6 +255,13 @@
> + 			s_pfkey_type(msg->sadb_msg_type),
> + 			strerror(msg->sadb_msg_errno));
> +=20
> ++		if (msg->sadb_msg_errno =3D=3D EINTR &&
> ++			update_msg_send.update_msg) {
> ++			plog(LLV_DEBUG, LOCATION, NULL,
> ++			"pfkey update resend\n");
> ++			send(update_msg_send.so, (void *)update_msg_send.update_msg, (sockle=
n_t)update_msg_send.len, 0);
> ++		}
> ++
> + 		goto end;
> + 	}
> +=20
> +@@ -498,6 +507,11 @@
> + {
> + 	flushsp();
> +=20
> ++	if (update_msg_send.update_msg) {
> ++		free(update_msg_send.update_msg);
> ++		update_msg_send.update_msg =3D NULL;
> ++	}
> ++
> + 	if (pfkey_send_spddump(lcconf->sock_pfkey) < 0) {
> + 		plog(LLV_ERROR, LOCATION, NULL,
> + 			"libipsec sending spddump failed: %s\n",
> +@@ -1295,6 +1309,8 @@
> + 	return 0;
> + }
> +=20
> ++int update_received =3D 0;
> ++
> + static int
> + pk_recvupdate(mhp)
> + 	caddr_t *mhp;
> +@@ -1307,6 +1323,13 @@
> + 	int incomplete =3D 0;
> + 	struct saproto *pr;
> +=20
> ++	update_received =3D 1;
> ++
> ++	if (update_msg_send.update_msg) {
> ++                free(update_msg_send.update_msg);
> ++                update_msg_send.update_msg =3D NULL;
> ++        }
> ++
> + 	/* ignore this message because of local test mode. */
> + 	if (f_local)
> + 		return 0;
> +@@ -4163,3 +4186,8 @@
> +=20
> + 	return buf;
> + }
> ++
> ++int receive_from_isakmp()
> ++{
> ++	return pfkey_handler(NULL, lcconf->sock_pfkey);
> ++}
> +--- a/src/racoon/pfkey.h
> ++++ b/src/racoon/pfkey.h
> +@@ -71,5 +71,6 @@
> + extern u_int32_t pk_getseq __P((void));
> + extern const char *sadbsecas2str
> + 	__P((struct sockaddr *, struct sockaddr *, int, u_int32_t, int));
> ++extern int receive_from_isakmp __P((void));
> +=20
> + #endif /* _PFKEY_H */
> +--- a/src/racoon/isakmp_quick.c
> ++++ b/src/racoon/isakmp_quick.c
> +@@ -774,6 +774,8 @@
> + 	return error;
> + }
> +=20
> ++extern int update_received;
> ++
> + /*
> +  * send to responder
> +  * 	HDR*, HASH(3)
> +@@ -892,6 +894,11 @@
> + 	}
> + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> +=20
> ++	while (!update_received)
> ++		receive_from_isakmp();
> ++=09
> ++	update_received =3D 0;
> ++
> + 	/* Do ADD for responder */
> + 	if (pk_sendadd(iph2) < 0) {
> + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n");
> +@@ -1035,6 +1042,11 @@
> + 	}
> + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> +=20
> ++	while (!update_received)
> ++		receive_from_isakmp();
> ++
> ++	update_received =3D 0;
> ++
> + 	/* Do ADD for responder */
> + 	if (pk_sendadd(iph2) < 0) {
> + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n");
> +@@ -1989,6 +2001,11 @@
> + 	}
> + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> +=20
> ++	while (!update_received)
> ++		receive_from_isakmp();
> ++
> ++	update_received =3D 0;
> ++
> + 	/* Do ADD for responder */
> + 	if (pk_sendadd(iph2) < 0) {
> + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n");
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> index 208268f..5fb3e4f 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec=
-tools/0.8/ipsec-tools-${PV
>             file://0001-racoon-pfkey-avoid-potential-null-pointer-derefer=
enc.patch \
>             file://racoon-check-invalid-pointers.patch \
>             file://racoon-check-invalid-ivm.patch \
> +           file://racoon-Resend-UPDATE-message-when-received-EINTR-messa=
ge.patch \
>            "
>  SRC_URI[md5sum] =3D "d53ec14a0a3ece64e09e5e34b3350b41"
>  SRC_URI[sha256sum] =3D "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c95367926=
90564c74fe722f2d"
> --=20
> 2.0.0
>=20
--=20
-Joe MacDonald.
:wq

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDvvaAAoJEEn8ffcsOfaW+5AIAKObDY6U7YAdEf5mnYZHt/Wa
oznAFxGmgn49ldGeVlHgROX9zW4pGA6N9ulu0krN5R98QjhJhIO0Cu0ZyOqZxbAU
TJmhOwQ1vP0d20bNhprgXpzmFLSwMQP05MJaqcu7yl4ifzY0LbCB4AZqHj7AZgT7
xSF72Y+QxszP4BaRElpQfZ2gw7H5Ypybhl1lO6ZD0UzIXr7H1czbrH0dASuo1/OC
KSId2TBJM62A7olIQ30ncObrnqhbv4raTp/G15tcR6oypyixZkMW1sVFfORnb1ym
l5hVBtw7k1+xvrkRrCJzMejYvkg2a9e/r0wg23NoVm5PhUJNYPoU0CbJe7piXik=
=ukwW
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
