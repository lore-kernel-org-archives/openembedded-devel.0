Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DF2EF6017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 21:25:04 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Xllb6-0001To-UI from Joe_MacDonald@mentor.com ;
	Tue, 04 Nov 2014 13:25:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.181.6; Tue, 4 Nov 2014
	13:25:04 -0800
Received: by burninator (Postfix, from userid 1000)	id A1D29581737; Tue,  4
	Nov 2014 16:25:03 -0500 (EST)
Date: Tue, 4 Nov 2014 16:25:03 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20141104212501.GO25009@mentor.com>
References: <1415081369-31169-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1415081369-31169-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] net-snmp: fix for Security Advisory - CVE-2014-3565
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
X-List-Received-Date: Tue, 04 Nov 2014 21:25:11 -0000
X-Groupsio-MsgNum: 52731
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline

--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [PATCH][meta-networking] net-snmp: fix for Security Advisory - CVE-20=
14-3565] On 14.11.04 (Tue 14:09) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> snmplib/mib.c in net-snmp 5.7.0 and earlier, when the -OQ option is used,
> allows remote attackers to cause a denial of service (snmptrapd crash) via
> a crafted SNMP trap message, which triggers a conversion to the variable
> type designated in the MIB file, as demonstrated by a NULL type in an ifM=
tu
> trap message.
>=20
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-3565
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...s-for-printing-variables-with-wrong-types.patch |  455 ++++++++++++++=
++++++
>  .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |    1 +
>  2 files changed, 456 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0=
001-Added-checks-for-printing-variables-with-wrong-types.patch
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add=
ed-checks-for-printing-variables-with-wrong-types.patch b/meta-networking/r=
ecipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables=
-with-wrong-types.patch
> new file mode 100644
> index 0000000..30374cf
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-chec=
ks-for-printing-variables-with-wrong-types.patch
> @@ -0,0 +1,455 @@
> +From 7f4a7b891332899cea26e95be0337aae01648742 Mon Sep 17 00:00:00 2001
> +From: Jan Safranek <jsafranek@users.sourceforge.net>
> +Date: Thu, 31 Jul 2014 13:46:49 +0200
> +Subject: [PATCH] Added checks for printing variables with wrong types.
> +
> +Upstream-Status: Backport
> +
> +When -OQ command line argument is used, variable formatter preffers the =
type
> +of the varible parsed from a MIB file instead of checking type of the va=
riable
> +as parsed from SNMP message.
> +
> +This can lead to crashes when incoming packets contains a variable with
> +NULL type, while the MIB says the variable should be non-NULL, like Inte=
ger.
> +The formatter then tries to interpret the NULL (from packet) as Integer =
(from
> +MIB file).
> +
> +Signed-off-by: Jan Safranek <jsafranek@users.sourceforge.net>
> +---
> + snmplib/mib.c |  270 ++++++++++++++++++++++++++++----------------------=
-------
> + 1 file changed, 135 insertions(+), 135 deletions(-)
> +
> +diff --git a/snmplib/mib.c b/snmplib/mib.c
> +index 9d3ca41..c6e0010 100644
> +--- a/snmplib/mib.c
> ++++ b/snmplib/mib.c
> +@@ -439,17 +439,16 @@ sprint_realloc_octet_string(u_char ** buf, size_t =
* buf_len,
> +     u_char         *cp;
> +     int             output_format, cnt;
> +=20
> +-    if ((var->type !=3D ASN_OCTET_STR) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        const char      str[] =3D "Wrong Type (should be OCTET STRING):=
 ";
> +-        if (snmp_cstrcat
> +-            (buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_OCTET_STR) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                    NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)=
) {
> ++            const char      str[] =3D "Wrong Type (should be OCTET STRI=
NG): ";
> ++            if (!snmp_cstrcat(buf, buf_len, out_len, allow_realloc, str=
))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +=20
> +@@ -702,16 +701,16 @@ sprint_realloc_float(u_char ** buf, size_t * buf_l=
en,
> +                      const struct enum_list *enums,
> +                      const char *hint, const char *units)
> + {
> +-    if ((var->type !=3D ASN_OPAQUE_FLOAT) &&
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc,=20
> +-                         "Wrong Type (should be Float): ")) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_OPAQUE_FLOAT) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Float): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -772,17 +771,16 @@ sprint_realloc_double(u_char ** buf, size_t * buf_=
len,
> +                       const struct enum_list *enums,
> +                       const char *hint, const char *units)
> + {
> +-    if ((var->type !=3D ASN_OPAQUE_DOUBLE) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        if (snmp_cstrcat
> +-            (buf, buf_len, out_len, allow_realloc,=20
> +-             "Wrong Type (should be Double): ")) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_OPAQUE_DOUBLE) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Double): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -847,20 +845,21 @@ sprint_realloc_counter64(u_char ** buf, size_t * b=
uf_len, size_t * out_len,
> + {
> +     char            a64buf[I64CHARSZ + 1];
> +=20
> +-    if ((var->type !=3D ASN_COUNTER64
> ++    if (var->type !=3D ASN_COUNTER64
> + #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
> +         && var->type !=3D ASN_OPAQUE_COUNTER64
> +         && var->type !=3D ASN_OPAQUE_I64 && var->type !=3D ASN_OPAQUE_U=
64
> + #endif
> +-        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS=
_LIB_QUICKE_PRINT))) {
> +-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc,=20
> +-                        "Wrong Type (should be Counter64): ")) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++        ) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Counter64)=
: ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -948,23 +947,25 @@ sprint_realloc_opaque(u_char ** buf, size_t * buf_=
len,
> +                       const struct enum_list *enums,
> +                       const char *hint, const char *units)
> + {
> +-    if ((var->type !=3D ASN_OPAQUE
> ++    if (var->type !=3D ASN_OPAQUE
> + #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
> +         && var->type !=3D ASN_OPAQUE_COUNTER64
> +         && var->type !=3D ASN_OPAQUE_U64
> +         && var->type !=3D ASN_OPAQUE_I64
> +         && var->type !=3D ASN_OPAQUE_FLOAT && var->type !=3D ASN_OPAQUE=
_DOUBLE
> + #endif                          /* NETSNMP_WITH_OPAQUE_SPECIAL_TYPES */
> +-        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS=
_LIB_QUICKE_PRINT))) {
> +-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc,=20
> +-                         "Wrong Type (should be Opaque): ")) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++        ) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Opaque): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> ++
> + #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
> +     switch (var->type) {
> +     case ASN_OPAQUE_COUNTER64:
> +@@ -1040,17 +1041,16 @@ sprint_realloc_object_identifier(u_char ** buf, =
size_t * buf_len,
> + {
> +     int             buf_overflow =3D 0;
> +=20
> +-    if ((var->type !=3D ASN_OBJECT_ID) &&
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D
> +-            "Wrong Type (should be OBJECT IDENTIFIER): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_OBJECT_ID) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be OBJECT IDE=
NTIFIER): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -1110,16 +1110,16 @@ sprint_realloc_timeticks(u_char ** buf, size_t *=
 buf_len, size_t * out_len,
> + {
> +     char            timebuf[40];
> +=20
> +-    if ((var->type !=3D ASN_TIMETICKS) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be Timeticks): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_TIMETICKS) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Timeticks)=
: ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_NU=
MERIC_TIMETICKS)) {
> +@@ -1277,17 +1277,18 @@ sprint_realloc_integer(u_char ** buf, size_t * b=
uf_len, size_t * out_len,
> + {
> +     char           *enum_string =3D NULL;
> +=20
> +-    if ((var->type !=3D ASN_INTEGER) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be INTEGER): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_INTEGER) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be INTEGER): =
";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> ++
> +     for (; enums; enums =3D enums->next) {
> +         if (enums->value =3D=3D *var->val.integer) {
> +             enum_string =3D enums->label;
> +@@ -1380,16 +1381,16 @@ sprint_realloc_uinteger(u_char ** buf, size_t * =
buf_len, size_t * out_len,
> + {
> +     char           *enum_string =3D NULL;
> +=20
> +-    if ((var->type !=3D ASN_UINTEGER) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be UInteger32): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_UINTEGER) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be UInteger32=
): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     for (; enums; enums =3D enums->next) {
> +@@ -1477,17 +1478,16 @@ sprint_realloc_gauge(u_char ** buf, size_t * buf=
_len, size_t * out_len,
> + {
> +     char            tmp[32];
> +=20
> +-    if ((var->type !=3D ASN_GAUGE) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D
> +-            "Wrong Type (should be Gauge32 or Unsigned32): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_GAUGE) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Gauge32 or=
 Unsigned32): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -1550,16 +1550,16 @@ sprint_realloc_counter(u_char ** buf, size_t * b=
uf_len, size_t * out_len,
> + {
> +     char            tmp[32];
> +=20
> +-    if ((var->type !=3D ASN_COUNTER) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be Counter32): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_COUNTER) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be Counter32)=
: ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -1613,16 +1613,16 @@ sprint_realloc_networkaddress(u_char ** buf, siz=
e_t * buf_len,
> + {
> +     size_t          i;
> +=20
> +-    if ((var->type !=3D ASN_IPADDRESS) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be NetworkAddress=
): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_IPADDRESS) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be NetworkAdd=
ress): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -1679,16 +1679,16 @@ sprint_realloc_ipaddress(u_char ** buf, size_t *=
 buf_len, size_t * out_len,
> + {
> +     u_char         *ip =3D var->val.string;
> +=20
> +-    if ((var->type !=3D ASN_IPADDRESS) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be IpAddress): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_IPADDRESS) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be IpAddress)=
: ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +@@ -1737,20 +1737,20 @@ sprint_realloc_null(u_char ** buf, size_t * buf_=
len, size_t * out_len,
> +                     const struct enum_list *enums,
> +                     const char *hint, const char *units)
> + {
> +-    if ((var->type !=3D ASN_NULL) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be NULL): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_NULL) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be NULL): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +-    } else {
> +-        u_char          str[] =3D "NULL";
> +-        return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
> +     }
> ++
> ++    u_char          str[] =3D "NULL";
> ++    return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
> + }
> +=20
> +=20
> +@@ -1785,16 +1785,16 @@ sprint_realloc_bitstring(u_char ** buf, size_t *=
 buf_len, size_t * out_len,
> +     u_char         *cp;
> +     char           *enum_string;
> +=20
> +-    if ((var->type !=3D ASN_BIT_STR && var->type !=3D ASN_OCTET_STR) &&
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be BITS): ";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_BIT_STR && var->type !=3D ASN_OCTET_STR) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be BITS): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QU=
ICK_PRINT)) {
> +@@ -1869,16 +1869,16 @@ sprint_realloc_nsapaddress(u_char ** buf, size_t=
 * buf_len,
> +                            const struct enum_list *enums, const char *h=
int,
> +                            const char *units)
> + {
> +-    if ((var->type !=3D ASN_NSAP) &&=20
> +-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_=
QUICKE_PRINT))) {
> +-        u_char          str[] =3D "Wrong Type (should be NsapAddress): =
";
> +-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
> +-            return sprint_realloc_by_type(buf, buf_len, out_len,
> ++    if (var->type !=3D ASN_NSAP) {
> ++        if (!netsnmp_ds_get_boolean(
> ++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
> ++            u_char          str[] =3D "Wrong Type (should be NsapAddres=
s): ";
> ++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
> ++                return 0;
> ++        }
> ++        return sprint_realloc_by_type(buf, buf_len, out_len,
> +                                           allow_realloc, var, NULL, NUL=
L,
> +                                           NULL);
> +-        } else {
> +-            return 0;
> +-        }
> +     }
> +=20
> +     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_Q=
UICK_PRINT)) {
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> index 9012615..82ce4db 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=
=3D8;md5=3D7f7f00ba639ac8e8deb5
>  DEPENDS =3D "openssl libnl pciutils"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
> +        file://0001-Added-checks-for-printing-variables-with-wrong-types=
=2Epatch \
>          file://init \
>          file://snmpd.conf \
>          file://snmptrapd.conf \
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWUQtAAoJEEn8ffcsOfaW6eQIAIejEkaWtgLQuItb+VkRTtv0
U/8PcJvNWoj+zGa4EX0hcL0vjiar5XOB6CE692MVjWVw/16v5tjxaETDdeYunsnJ
gISCS+m6XBYKgjDRZEv2rGbBj6sphjMyCm669ic/tdsTAQyih4hPdN8AbS2wYWoW
perOBRzubLY2KR1BZV8RpSKkMeFvGMYuCZ8uv0mxLtwDec0DsJ9mKtK4LFudmG1l
WvQDoOcM8zEc7gundc0cZDzRjeCnxFxKrJqsmvTM+rbXmNMxaxc9XAm07NhiyOPS
wX2kjPiVNSwkNcrA8PU9grB2XuLe0aIBOPhsKtPHBmMBJ9KBJQRnN+5piPiA/vI=
=bk7H
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--
