Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33EFB70E6E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:36:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T6aSAw026996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Aug 2014 23:36:29 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.165]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 28 Aug 2014 23:36:28 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH] ipsec-tools: Fix pfkey UPDATE
	failure caused by EINTR
Thread-Index: AQHPq8f2Gjd8hHJ8+UqeSILxfiKVApvnTsJw
Date: Fri, 29 Aug 2014 06:36:27 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCB00481@ALA-MBA.corp.ad.wrs.com>
References: <1406534881-17136-1-git-send-email-jackie.huang@windriver.com>
	<20140730072911.GH16445@jama>
In-Reply-To: <20140730072911.GH16445@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] ipsec-tools: Fix pfkey UPDATE failure caused by EINTR
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
X-List-Received-Date: Fri, 29 Aug 2014 06:36:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, July 30, 2014 3:29 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] ipsec-tools: Fix pfkey UPDATE =
failure caused by EINTR
>=20
> On Mon, Jul 28, 2014 at 04:08:01AM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Xufeng Zhang <xufeng.zhang@windriver.com>
> >
> > While kernel is processing the UPDATE message which is sent from
> > racoon, it maybe interrupted by certain system signal and if this case
> > happens, kernel responds with an EINTR message to racoon and kernel
> > fails to establish the corresponding SA.
> > Fix this problem by resend the UPDATE message when EINTR(Interrupted
> > system call) error happens.
>=20
> Is this still needed after:

Sorry I missed this. I checked that this is still needed even after:

commit 4d7e174324d61c8da79152b67c4e8a434bd2d078
Author: Roy Li <rongqing.li@windriver.com>
Date:   Tue Aug 12 15:19:20 2014 +0800

    ipsec-tools: uprev it to 0.8.2
   =20
    Remove 0001-Fix-warning-with-gcc-4.8.patch, it has been in 0.8.2
   =20
    Signed-off-by: Roy Li <rongqing.li@windriver.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

So I will rebase on that and re-send the patch.

Thanks,
Jackie

>=20
> commit 2ea5feedac7ba04417ce95ba0b14a8ce478614f6
> Author: Roy Li <rongqing.li@windriver.com>
> Date:   Thu Jul 24 16:51:23 2014 +0800
>=20
>     ipsec-tools: several fixes
>=20
> Please check and send follow-up change if needed.
>=20
> >
> > Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  ...PDATE-message-when-received-EINTR-message.patch | 220 +++++++++++++=
++++++++
> >  .../ipsec-tools/ipsec-tools_0.8.1.bb               |   1 +
> >  2 files changed, 221 insertions(+)
> >  create mode 100644
> > meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-Resend-
> > UPDATE-message-when-received-EINTR-message.patch
> >
> > diff --git
> > a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-Resen
> > d-UPDATE-message-when-received-EINTR-message.patch
> > b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-Resen
> > d-UPDATE-message-when-received-EINTR-message.patch
> > new file mode 100644
> > index 0000000..1ec5a41
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon-R
> > +++ esend-UPDATE-message-when-received-EINTR-message.patch
> > @@ -0,0 +1,220 @@
> > +racoon: Resend UPDATE message when received EINTR message
> > +
> > +Upstream-Status: Pending
> > +
> > +While kernel is processing the UPDATE message which is sent from
> > +racoon, it maybe interrupted by system signal and if this case
> > +happens, kernel responds with an EINTR message to racoon and kernel
> > +fails to establish the corresponding SA.
> > +Fix this problem by resend the UPDATE message when EINTR(Interrupted
> > +system call) error happens.
> > +
> > +Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > +---
> > +--- a/src/libipsec/libpfkey.h
> > ++++ b/src/libipsec/libpfkey.h
> > +@@ -92,6 +92,12 @@
> > + 	u_int16_t ctxstrlen;		/* length of security context string */
> > + };
> > +
> > ++struct update_msg_info {
> > ++        struct sadb_msg *update_msg;
> > ++        int so;
> > ++        int len;
> > ++};
> > ++
> > + /* The options built into libipsec */  extern int libipsec_opt;
> > + #define LIBIPSEC_OPT_NATT		0x01
> > +--- a/src/libipsec/pfkey.c
> > ++++ b/src/libipsec/pfkey.c
> > +@@ -1219,7 +1219,8 @@
> > + }
> > + #endif
> > +
> > +-
> > ++struct update_msg_info update_msg_send =3D {NULL, 0, 0};
> > ++
> > + /* sending SADB_ADD or SADB_UPDATE message to the kernel */  static
> > +int  pfkey_send_x1(struct pfkey_send_sa_args *sa_parms) @@ -1483,10
> > ++1484,24 @@
> > +
> > + 	/* send message */
> > + 	len =3D pfkey_send(sa_parms->so, newmsg, len);
> > +-	free(newmsg);
> > +
> > +-	if (len < 0)
> > +-		return -1;
> > ++	if (newmsg->sadb_msg_type =3D=3D SADB_UPDATE) {
> > ++		if (update_msg_send.update_msg)
> > ++			free(update_msg_send.update_msg);
> > ++		update_msg_send.update_msg =3D newmsg;
> > ++		update_msg_send.so =3D sa_parms->so;
> > ++		update_msg_send.len =3D len;
> > ++
> > ++		if (len < 0) {
> > ++			free(update_msg_send.update_msg);
> > ++			update_msg_send.update_msg =3D NULL;
> > ++			return -1;
> > ++		}
> > ++	} else {
> > ++		free(newmsg);
> > ++		if (len < 0)
> > ++			return -1;
> > ++	}
> > +
> > + 	__ipsec_errcode =3D EIPSEC_NO_ERROR;
> > + 	return len;
> > +--- a/src/racoon/session.c
> > ++++ b/src/racoon/session.c
> > +@@ -100,6 +100,8 @@
> > +
> > + #include "sainfo.h"
> > +
> > ++extern struct update_msg_info update_msg_send;
> > ++
> > + struct fd_monitor {
> > + 	int (*callback)(void *ctx, int fd);
> > + 	void *ctx;
> > +@@ -348,6 +350,11 @@
> > + 	close_sockets();
> > + 	backupsa_clean();
> > +
> > ++	if (update_msg_send.update_msg) {
> > ++		free(update_msg_send.update_msg);
> > ++		update_msg_send.update_msg =3D NULL;
> > ++	}
> > ++
> > + 	plog(LLV_INFO, LOCATION, NULL, "racoon process %d shutdown\n",
> > + getpid());
> > +
> > + 	exit(0);
> > +--- a/src/racoon/pfkey.c
> > ++++ b/src/racoon/pfkey.c
> > +@@ -103,10 +103,12 @@
> > + #include "crypto_openssl.h"
> > + #include "grabmyaddr.h"
> > ++#include "../libipsec/libpfkey.h"
> > +
> > + #if defined(SADB_X_EALG_RIJNDAELCBC) && !defined(SADB_X_EALG_AESCBC)
> > + #define SADB_X_EALG_AESCBC  SADB_X_EALG_RIJNDAELCBC #endif
> > +
> > ++extern struct update_msg_info update_msg_send;
> > + /* prototype */
> > + static u_int ipsecdoi2pfkey_aalg __P((u_int));  static u_int
> > +ipsecdoi2pfkey_ealg __P((u_int)); @@ -253,6 +255,13 @@
> > + 			s_pfkey_type(msg->sadb_msg_type),
> > + 			strerror(msg->sadb_msg_errno));
> > +
> > ++		if (msg->sadb_msg_errno =3D=3D EINTR &&
> > ++			update_msg_send.update_msg) {
> > ++			plog(LLV_DEBUG, LOCATION, NULL,
> > ++			"pfkey update resend\n");
> > ++			send(update_msg_send.so, (void *)update_msg_send.update_msg,
> (socklen_t)update_msg_send.len, 0);
> > ++		}
> > ++
> > + 		goto end;
> > + 	}
> > +
> > +@@ -498,6 +507,11 @@
> > + {
> > + 	flushsp();
> > +
> > ++	if (update_msg_send.update_msg) {
> > ++		free(update_msg_send.update_msg);
> > ++		update_msg_send.update_msg =3D NULL;
> > ++	}
> > ++
> > + 	if (pfkey_send_spddump(lcconf->sock_pfkey) < 0) {
> > + 		plog(LLV_ERROR, LOCATION, NULL,
> > + 			"libipsec sending spddump failed: %s\n", @@ -1295,6 +1309,8 @@
> > + 	return 0;
> > + }
> > +
> > ++int update_received =3D 0;
> > ++
> > + static int
> > + pk_recvupdate(mhp)
> > + 	caddr_t *mhp;
> > +@@ -1307,6 +1323,13 @@
> > + 	int incomplete =3D 0;
> > + 	struct saproto *pr;
> > +
> > ++	update_received =3D 1;
> > ++
> > ++	if (update_msg_send.update_msg) {
> > ++                free(update_msg_send.update_msg);
> > ++                update_msg_send.update_msg =3D NULL;
> > ++        }
> > ++
> > + 	/* ignore this message because of local test mode. */
> > + 	if (f_local)
> > + 		return 0;
> > +@@ -4163,3 +4186,8 @@
> > +
> > + 	return buf;
> > + }
> > ++
> > ++int receive_from_isakmp()
> > ++{
> > ++	return pfkey_handler(NULL, lcconf->sock_pfkey); }
> > +--- a/src/racoon/pfkey.h
> > ++++ b/src/racoon/pfkey.h
> > +@@ -71,5 +71,6 @@
> > + extern u_int32_t pk_getseq __P((void));  extern const char
> > +*sadbsecas2str
> > + 	__P((struct sockaddr *, struct sockaddr *, int, u_int32_t, int));
> > ++extern int receive_from_isakmp __P((void));
> > +
> > + #endif /* _PFKEY_H */
> > +--- a/src/racoon/isakmp_quick.c
> > ++++ b/src/racoon/isakmp_quick.c
> > +@@ -774,6 +774,8 @@
> > + 	return error;
> > + }
> > +
> > ++extern int update_received;
> > ++
> > + /*
> > +  * send to responder
> > +  * 	HDR*, HASH(3)
> > +@@ -892,6 +894,11 @@
> > + 	}
> > + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> > +
> > ++	while (!update_received)
> > ++		receive_from_isakmp();
> > ++
> > ++	update_received =3D 0;
> > ++
> > + 	/* Do ADD for responder */
> > + 	if (pk_sendadd(iph2) < 0) {
> > + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n"); @@ -1035,6
> > ++1042,11 @@
> > + 	}
> > + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> > +
> > ++	while (!update_received)
> > ++		receive_from_isakmp();
> > ++
> > ++	update_received =3D 0;
> > ++
> > + 	/* Do ADD for responder */
> > + 	if (pk_sendadd(iph2) < 0) {
> > + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n"); @@ -1989,6
> > ++2001,11 @@
> > + 	}
> > + 	plog(LLV_DEBUG, LOCATION, NULL, "pfkey update sent.\n");
> > +
> > ++	while (!update_received)
> > ++		receive_from_isakmp();
> > ++
> > ++	update_received =3D 0;
> > ++
> > + 	/* Do ADD for responder */
> > + 	if (pk_sendadd(iph2) < 0) {
> > + 		plog(LLV_ERROR, LOCATION, NULL, "pfkey add failed.\n");
> > diff --git
> > a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> > b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> > index 2e5c0a4..0332f7f 100644
> > --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> > +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
> > @@ -11,6 +11,7 @@ SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ips=
ec-tools/0.8/ipsec-tools-
> ${PV
> >             file://0001-Fix-warning-with-gcc-4.8.patch \
> >             file://0002-Don-t-link-against-libfl.patch \
> >             file://configure.patch \
> > +
> > + file://racoon-Resend-UPDATE-message-when-received-EINTR-message.patc
> > + h \
> >            "
> >  SRC_URI[md5sum] =3D "d38b39f291ba2962387c3232e7335dd8"
> >  SRC_URI[sha256sum] =3D
> "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
> > --
> > 2.0.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

