Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id EE9BE73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:07:38 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125968411wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=knfQ6T8L/gVe16vSyX8EXT4vmrFzH5nSZsf2gCUgm2g=;
	b=jLMXLZzQVRT7GFTrAzfmDOukAXqyK07DnmQ/86zsQK9qnol3MOHLLqon86NnCmliAn
	bcTms7UpQ14wZekAodZqD/t0gI2HW15KS81Zyd0hOW6GT376DopaskhJuGuEA7bPksTs
	8xEc8Re/yjR2N2ITr2soktz0paG6vFYd57ET7phTfwQtso4He7Kdr9kO1IWxFV+Fl40x
	3TciYTwJZOjFHYkMRtt+tE5VZUpnlaTNoCWK9wRcXTgM8fzbIjW9kgerhhsRDhsr/BGb
	unlYii3+7HA76Y9tSZd3otrxc8aNvanM9ASRXJJuR3ARLrrZSv3EKm5fUveVhhp8LVcc
	+gnw==
X-Received: by 10.194.81.137 with SMTP id a9mr28165253wjy.155.1442225258728;
	Mon, 14 Sep 2015 03:07:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y15sm13515851wib.7.2015.09.14.03.07.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 03:07:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Sep 2015 12:07:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150914100742.GA2380@jama>
References: <1442216248-8695-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1442216248-8695-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-networking] net-snmp: make it be able to be compiled by gcc5 with "-O0"
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
X-List-Received-Date: Mon, 14 Sep 2015 10:07:40 -0000
X-Groupsio-MsgNum: 57326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2015 at 03:37:28PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>

Upgrade to 5.7.2 was merged few days ago:

t 858d7a83cbad77eb6d0b2edadcf2269a3c85e234
Author:     Li xin <lixin.fnst@cn.fujitsu.com>
AuthorDate: Fri Aug 21 18:08:04 2015 +0800
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Fri Sep 11 11:52:15 2015 -0400

    net-snmp: upgrade 5.7.2.1 -> 5.7.3

Check if this is still needed and next time please always rebase the patche=
s before sending them.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...-functions-work-with-both-gnu11-and-gnu89.patch | 85 ++++++++++++++++=
++++++
>  .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  1 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get=
-inline-functions-work-with-both-gnu11-and-gnu89.patch b/meta-networking/re=
cipes-protocols/net-snmp/net-snmp/0001-get-inline-functions-work-with-both-=
gnu11-and-gnu89.patch
> new file mode 100644
> index 0000000..2d7ba57
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get-inline=
-functions-work-with-both-gnu11-and-gnu89.patch
> @@ -0,0 +1,85 @@
> +From 6f319d981ee190c7e858a4b0382617c469cfa77a Mon Sep 17 00:00:00 2001
> +From: Roy Li <rongqing.li@windriver.com>
> +Date: Mon, 14 Sep 2015 13:52:12 +0800
> +Subject: [PATCH] get inline functions work with both gnu11 and gnu89
> +
> +Upstream-status: Pending
> +
> +After gcc upgraded to gcc5, and if the codes are compiled without optimi=
zation(-O0),
> +and the below error will happen:
> +
> +./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_subtree_chan=
ge_prev'
> +./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_table_datase=
t_delete_data'
> +./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_subtree_chan=
ge_next'
> +collect2: error: ld returned 1 exit status
> +
> +gcc5 defaults to -std=3Dgnu11 instead of -std=3Dgnu89, and it requires t=
hat exactly one C
> +source file has the callable copy of the inline function. Consider the f=
ollowing
> +program:
> +
> +  inline int
> +  foo (void)
> +  {
> +    return 42;
> +  }
> +
> +  int
> +  main (void)
> +  {
> +    return foo ();
> +  }
> +
> +The program above will not link with the C99 inline semantics, because n=
o out-of-line
> +function foo is generated. To fix this, either mark the function foo as =
static, or
> +add the following declaration:
> +  static inline int foo (void);
> +
> +more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
> +
> +but the use of "extern inline" will lead to the compilation issue if gcc=
 is not
> +gcc5, so replace inline with "static inline"
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + agent/agent_registry.c        | 4 ++--
> + agent/helpers/table_dataset.c | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/agent/agent_registry.c b/agent/agent_registry.c
> +index 1e2482a..3f0aa12 100644
> +--- a/agent/agent_registry.c
> ++++ b/agent/agent_registry.c
> +@@ -528,7 +528,7 @@ netsnmp_subtree_deepcopy(netsnmp_subtree *a)
> + /** @private
> +  *  Replaces next subtree pointer in given subtree.
> +  */
> +-NETSNMP_INLINE void
> ++NETSNMP_STATIC_INLINE void
> + netsnmp_subtree_change_next(netsnmp_subtree *ptr, netsnmp_subtree *then=
ext)
> + {
> +     ptr->next =3D thenext;
> +@@ -543,7 +543,7 @@ netsnmp_subtree_change_next(netsnmp_subtree *ptr, ne=
tsnmp_subtree *thenext)
> + /** @private
> +  *  Replaces previous subtree pointer in given subtree.
> +  */
> +-NETSNMP_INLINE void
> ++NETSNMP_STATIC_INLINE void
> + netsnmp_subtree_change_prev(netsnmp_subtree *ptr, netsnmp_subtree *thep=
rev)
> + {
> +     ptr->prev =3D theprev;
> +diff --git a/agent/helpers/table_dataset.c b/agent/helpers/table_dataset=
=2Ec
> +index 0949a8a..d993993 100644
> +--- a/agent/helpers/table_dataset.c
> ++++ b/agent/helpers/table_dataset.c
> +@@ -107,7 +107,7 @@ netsnmp_init_table_dataset(void) {
> + /** deletes a single dataset table data.
> +  *  returns the (possibly still good) next pointer of the deleted data =
object.
> +  */
> +-NETSNMP_INLINE netsnmp_table_data_set_storage *
> ++NETSNMP_STATIC_INLINE netsnmp_table_data_set_storage *
> + netsnmp_table_dataset_delete_data(netsnmp_table_data_set_storage *data)
> + {
> +     netsnmp_table_data_set_storage *nextPtr =3D NULL;
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> index 464473e..f3fa3ba 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${=
PV}.zip \
>          file://0001-Fix-CVE-2014-2285.patch \
>          file://dont-return-incompletely-parsed-varbinds.patch \
>          file://net-snmp-5.7.2-fix-mib-timeout-values.patch \
> +        file://0001-get-inline-functions-work-with-both-gnu11-and-gnu89.=
patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "a2c83518648b0f2a5d378625e45c0e18"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX2nG0ACgkQN1Ujt2V2gByZxACdFCREZoYYGfILLZ5cF4SLnpTl
R08AnRsvbSijhP4Z+gr1OtuOcN/zYWVk
=3h0S
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
