Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 023C961C82
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:35:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d9so4396046plo.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=asxUZrIjYJyWEqsQEQTu3nCbiq+aRHAn3FhoC3/R6+k=;
	b=QVZK9cbSoTLVMVdLQMM/CWACZK91jhapqh5l5v64/4IJ9f0tLFDgTXS4ho+gsbGoGc
	yueArJFG+5pCo+TZ4kPbwvmYYGLgtny/faxRdxYmAfvjiK2PRZ3KbtafEu6qDVc9EKva
	7wwOGHXGJl1+Vnr8wZOhReuAOlBmhtqQd+WUEIqN8dVUbj+y2GH8aHhb5OrITvFkSVUv
	yASMuV88WYajeJgaoO9FiyFQPK/kkUFNiPC9xAwKvK1rvqK0O8lBLBiafa4KAKchNrnm
	KMvjJ2uyVLPrtgc3fBMKfIz+hs4JY6T7QsiETYwsqS5G8v97g4Y+PWMMrjNdeDbUheFc
	VB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language;
	bh=asxUZrIjYJyWEqsQEQTu3nCbiq+aRHAn3FhoC3/R6+k=;
	b=V9Mj9CfX3gKJ6vrbv6Co/1eP09Q+M9lynxQEk4hMMRwMCpHxpZ9gZZHTCAg+gXsJzW
	5pVag7CnaarYBswPL5dmGnKpMS/et60gmaf3z7Hu5fTCMWfzZAb1r+/pkqd/rfU3D+WW
	77pcuLgO0+VWIapETn8aEKa4be1vF17nuwsRtV6RfhZCcL8mapPRm2hAH8vrCZ4P62vL
	1DpzXskkO7QeDPGpWs3tP7rqpIoxURkB8vNBb+ncMqEJu1QwxPvR5kk1xkyffGnA+QbM
	/Hy6PDZfyYsRF17In3HoPtG24QG8CtEqp9yB7WUeo+4ukfyHZYiURQ3TZD6VCnXywC9c
	R4lg==
X-Gm-Message-State: ANhLgQ2oHO2beP5o3vRkXOsruyUBITNtiGXC1PRsSq+8bmounizU4Z5r
	gGsL7ANav16O1UvMfH0VUHp8XwWY
X-Google-Smtp-Source: ADFU+vsciwPTFk3kiLnXHfU4OEn7Gvqn31UTVnqbV4X0mxH/yKrw3xCAJJ5dhNoqKQx6bFEXPUwv0w==
X-Received: by 2002:a17:902:ab95:: with SMTP id
	f21mr12662729plr.188.1584113727561; 
	Fri, 13 Mar 2020 08:35:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id
	r186sm1895908pfc.181.2020.03.13.08.35.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 08:35:26 -0700 (PDT)
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <20200313065841.17365-1-zangrc.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <753761b4-5d17-4453-8a7a-58310b5da746@gmail.com>
Date: Fri, 13 Mar 2020 08:35:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313065841.17365-1-zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [zeus] [meta-networking] [PATCH] wireshark: CVE-2019-19553
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
X-List-Received-Date: Fri, 13 Mar 2020 15:35:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 3/12/20 11:58 PM, Zang Ruochen wrote:
> Security Advisory
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2019-19553
Thanks for the CVE fix.

Wireshark 3.0.x series are bug fix only so updating the 3.0.9 would be
preferred.

3.0.9
wnpa-sec-2020-03 <https://www.wireshark.org/security/wnpa-sec-2020-03>
LTE RRC dissector memory leak. Bug 16341
<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D16341>.
wnpa-sec-2020-04 <https://www.wireshark.org/security/wnpa-sec-2020-04>
WiMax DLMAP dissector crash. Bug 16368
<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D16368>.
wnpa-sec-2020-05 <https://www.wireshark.org/security/wnpa-sec-2020-05>
EAP dissector crash. Bug 16397
<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D16397>.

3.0.8
wnpa-sec-2020-02 <https://www.wireshark.org/security/wnpa-sec-2020-02>
BT ATT dissector crash. Bug 16258
<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D16258>.
CVE-2020-7045
<https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-7045>.
3.0.7
wnpa-sec-2019-22 <https://www.wireshark.org/security/wnpa-sec-2019-22>
CMS dissector crash. Bug 15961
<https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D15961>.
CVE-2019-19553
<https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2019-19553>.


- armin
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ..._identifier_id-after-dissecting-Cont.patch | 204 ++++++++++++++++++=

>  .../wireshark/wireshark_3.0.6.bb              |   3 +-
>  2 files changed, 206 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/wireshark/wireshark=
/0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patch
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark/0001-C=
MS-reset-object_identifier_id-after-dissecting-Cont.patch b/meta-networki=
ng/recipes-support/wireshark/wireshark/0001-CMS-reset-object_identifier_i=
d-after-dissecting-Cont.patch
> new file mode 100644
> index 000000000..08060db04
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark/0001-CMS-rese=
t-object_identifier_id-after-dissecting-Cont.patch
> @@ -0,0 +1,204 @@
> +From e1731e2bc1d2a78b67e18fa66e7440acb9bea563 Mon Sep 17 00:00:00 2001=

> +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +Date: Fri, 13 Mar 2020 13:54:50 +0800
> +Subject: [PATCH] CMS: reset object_identifier_id after dissecting Cont=
entInfo
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dutf8
> +Content-Transfer-Encoding: 8bit
> +
> +Bug: 15961
> +Change-Id: I3d6b3e96103b69f88fcb512da81fa20ff6a1c40e
> +Reviewed-on: https://code.wireshark.org/review/34960
> +Petri-Dish: Pascal Quantin <pascal@wireshark.org>
> +Tested-by: Petri Dish Buildbot
> +Reviewed-by: Stig Bj=C3=83=C2=B8rlykke <stig@bjorlykke.org>
> +Reviewed-by: Roland Knall <rknall@gmail.com>
> +(cherry picked from commit 23850a3342d64b9c9808f14c20bfea6d22b7dc08)
> +Conflicts:
> +	epan/dissectors/packet-cms.c
> +Reviewed-on: https://code.wireshark.org/review/34975
> +Reviewed-by: Pascal Quantin <pascal@wireshark.org>
> +---
> + epan/dissectors/asn1/cms/cms.cnf              |  1 +
> + .../dissectors/asn1/cms/packet-cms-template.c |  2 +-
> + epan/dissectors/packet-cms.c                  | 31 ++++++++++--------=
-
> + 3 files changed, 18 insertions(+), 16 deletions(-)
> +
> +diff --git a/epan/dissectors/asn1/cms/cms.cnf b/epan/dissectors/asn1/c=
ms/cms.cnf
> +index ab94f8c..8feef01 100644
> +--- a/epan/dissectors/asn1/cms/cms.cnf
> ++++ b/epan/dissectors/asn1/cms/cms.cnf
> +@@ -122,6 +122,7 @@ FirmwarePackageLoadError/version		fwErrorVersion
> +   top_tree =3D tree;
> +   %(DEFAULT_BODY)s
> +   content_tvb =3D NULL;
> ++  object_identifier_id =3D NULL;
> +   top_tree =3D NULL;
> +=20
> + #.FN_PARS ContentType
> +diff --git a/epan/dissectors/asn1/cms/packet-cms-template.c b/epan/dis=
sectors/asn1/cms/packet-cms-template.c
> +index 2e803ec..931fd4f 100644
> +--- a/epan/dissectors/asn1/cms/packet-cms-template.c
> ++++ b/epan/dissectors/asn1/cms/packet-cms-template.c
> +@@ -43,7 +43,7 @@ static int hf_cms_ci_contentType =3D -1;
> + static int dissect_cms_OCTET_STRING(gboolean implicit_tag _U_, tvbuff=
_t *tvb, int offset, asn1_ctx_t *actx, proto_tree *tree, int hf_index _U_=
) ; /* XXX kill a compiler warning until asn2wrs stops generating these s=
illy wrappers */
> +=20
> +=20
> +-static const char *object_identifier_id;
> ++static const char *object_identifier_id =3D NULL;
> + static tvbuff_t *content_tvb =3D NULL;
> +=20
> + static proto_tree *top_tree=3DNULL;
> +diff --git a/epan/dissectors/packet-cms.c b/epan/dissectors/packet-cms=
=2Ec
> +index 690513d..2a6942f 100644
> +--- a/epan/dissectors/packet-cms.c
> ++++ b/epan/dissectors/packet-cms.c
> +@@ -311,7 +311,7 @@ static gint ett_cms_FirmwarePackageMessageDigest =3D=
 -1;
> + static int dissect_cms_OCTET_STRING(gboolean implicit_tag _U_, tvbuff=
_t *tvb, int offset, asn1_ctx_t *actx, proto_tree *tree, int hf_index _U_=
) ; /* XXX kill a compiler warning until asn2wrs stops generating these s=
illy wrappers */
> +=20
> +=20
> +-static const char *object_identifier_id;
> ++static const char *object_identifier_id =3D NULL;
> + static tvbuff_t *content_tvb =3D NULL;
> +=20
> + static proto_tree *top_tree=3DNULL;
> +@@ -373,7 +373,7 @@ cms_verify_msg_digest(proto_item *pi, tvbuff_t *co=
ntent, const char *alg, tvbuff
> +=20
> + int
> + dissect_cms_ContentType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_,=
 int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index=
 _U_) {
> +-#line 131 "./asn1/cms/cms.cnf"
> ++#line 132 "./asn1/cms/cms.cnf"
> +   	const char *name =3D NULL;
> +=20
> + 	  offset =3D dissect_ber_object_identifier_str(implicit_tag, actx, t=
ree, tvb, offset, hf_index, &object_identifier_id);
> +@@ -393,7 +393,7 @@ dissect_cms_ContentType(gboolean implicit_tag _U_,=
 tvbuff_t *tvb _U_, int offset
> +=20
> + static int
> + dissect_cms_T_content(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, i=
nt offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _=
U_) {
> +-#line 141 "./asn1/cms/cms.cnf"
> ++#line 142 "./asn1/cms/cms.cnf"
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +=20
> +@@ -417,6 +417,7 @@ dissect_cms_ContentInfo(gboolean implicit_tag _U_,=
 tvbuff_t *tvb _U_, int offset
> +                                    ContentInfo_sequence, hf_index, et=
t_cms_ContentInfo);
> +=20
> +   content_tvb =3D NULL;
> ++  object_identifier_id =3D NULL;
> +   top_tree =3D NULL;
> +=20
> +=20
> +@@ -470,7 +471,7 @@ dissect_cms_DigestAlgorithmIdentifiers(gboolean im=
plicit_tag _U_, tvbuff_t *tvb
> +=20
> + static int
> + dissect_cms_T_eContent(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, =
int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index =
_U_) {
> +-#line 145 "./asn1/cms/cms.cnf"
> ++#line 146 "./asn1/cms/cms.cnf"
> +=20
> +   offset =3D dissect_ber_octet_string(FALSE, actx, tree, tvb, offset,=
 hf_index, &content_tvb);
> +=20
> +@@ -504,7 +505,7 @@ dissect_cms_EncapsulatedContentInfo(gboolean impli=
cit_tag _U_, tvbuff_t *tvb _U_
> +=20
> + static int
> + dissect_cms_T_attrType(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, =
int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index =
_U_) {
> +-#line 175 "./asn1/cms/cms.cnf"
> ++#line 176 "./asn1/cms/cms.cnf"
> +   const char *name =3D NULL;
> +=20
> +     offset =3D dissect_ber_object_identifier_str(implicit_tag, actx, =
tree, tvb, offset, hf_cms_attrType, &object_identifier_id);
> +@@ -524,7 +525,7 @@ dissect_cms_T_attrType(gboolean implicit_tag _U_, =
tvbuff_t *tvb _U_, int offset
> +=20
> + static int
> + dissect_cms_AttributeValue(gboolean implicit_tag _U_, tvbuff_t *tvb _=
U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_in=
dex _U_) {
> +-#line 185 "./asn1/cms/cms.cnf"
> ++#line 186 "./asn1/cms/cms.cnf"
> +=20
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +@@ -786,7 +787,7 @@ dissect_cms_T_otherRevInfoFormat(gboolean implicit=
_tag _U_, tvbuff_t *tvb _U_, i
> +=20
> + static int
> + dissect_cms_T_otherRevInfo(gboolean implicit_tag _U_, tvbuff_t *tvb _=
U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_in=
dex _U_) {
> +-#line 169 "./asn1/cms/cms.cnf"
> ++#line 170 "./asn1/cms/cms.cnf"
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +=20
> +@@ -1123,7 +1124,7 @@ dissect_cms_T_keyAttrId(gboolean implicit_tag _U=
_, tvbuff_t *tvb _U_, int offset
> +=20
> + static int
> + dissect_cms_T_keyAttr(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, i=
nt offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index _=
U_) {
> +-#line 164 "./asn1/cms/cms.cnf"
> ++#line 165 "./asn1/cms/cms.cnf"
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +=20
> +@@ -1311,7 +1312,7 @@ dissect_cms_T_oriType(gboolean implicit_tag _U_,=
 tvbuff_t *tvb _U_, int offset _
> +=20
> + static int
> + dissect_cms_T_oriValue(gboolean implicit_tag _U_, tvbuff_t *tvb _U_, =
int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_index =
_U_) {
> +-#line 158 "./asn1/cms/cms.cnf"
> ++#line 159 "./asn1/cms/cms.cnf"
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +=20
> +@@ -1388,14 +1389,14 @@ dissect_cms_ContentEncryptionAlgorithmIdentifi=
er(gboolean implicit_tag _U_, tvbu
> +=20
> + static int
> + dissect_cms_EncryptedContent(gboolean implicit_tag _U_, tvbuff_t *tvb=
 _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_=
index _U_) {
> +-#line 235 "./asn1/cms/cms.cnf"
> ++#line 236 "./asn1/cms/cms.cnf"
> + 	tvbuff_t *encrypted_tvb;
> + 	proto_item *item;
> +=20
> +   offset =3D dissect_ber_octet_string(implicit_tag, actx, tree, tvb, =
offset, hf_index,
> +                                        &encrypted_tvb);
> +=20
> +-#line 240 "./asn1/cms/cms.cnf"
> ++#line 241 "./asn1/cms/cms.cnf"
> +=20
> + 	item =3D actx->created_item;
> +=20
> +@@ -1553,7 +1554,7 @@ dissect_cms_AuthenticatedData(gboolean implicit_=
tag _U_, tvbuff_t *tvb _U_, int
> +=20
> + static int
> + dissect_cms_MessageDigest(gboolean implicit_tag _U_, tvbuff_t *tvb _U=
_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_ind=
ex _U_) {
> +-#line 189 "./asn1/cms/cms.cnf"
> ++#line 190 "./asn1/cms/cms.cnf"
> +   proto_item *pi;
> +   int old_offset =3D offset;
> +=20
> +@@ -1637,7 +1638,7 @@ dissect_cms_KeyWrapAlgorithm(gboolean implicit_t=
ag _U_, tvbuff_t *tvb _U_, int o
> +=20
> + static int
> + dissect_cms_RC2ParameterVersion(gboolean implicit_tag _U_, tvbuff_t *=
tvb _U_, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int =
hf_index _U_) {
> +-#line 225 "./asn1/cms/cms.cnf"
> ++#line 226 "./asn1/cms/cms.cnf"
> +   guint32 length =3D 0;
> +=20
> +     offset =3D dissect_ber_integer(implicit_tag, actx, tree, tvb, off=
set, hf_index,
> +@@ -1715,7 +1716,7 @@ dissect_cms_DigestInfo(gboolean implicit_tag _U_=
, tvbuff_t *tvb _U_, int offset
> +=20
> + static int
> + dissect_cms_T_capability(gboolean implicit_tag _U_, tvbuff_t *tvb _U_=
, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_inde=
x _U_) {
> +-#line 207 "./asn1/cms/cms.cnf"
> ++#line 208 "./asn1/cms/cms.cnf"
> +   const char *name =3D NULL;
> +=20
> +     offset =3D dissect_ber_object_identifier_str(implicit_tag, actx, =
tree, tvb, offset, hf_cms_attrType, &object_identifier_id);
> +@@ -1736,7 +1737,7 @@ dissect_cms_T_capability(gboolean implicit_tag _=
U_, tvbuff_t *tvb _U_, int offse
> +=20
> + static int
> + dissect_cms_T_parameters(gboolean implicit_tag _U_, tvbuff_t *tvb _U_=
, int offset _U_, asn1_ctx_t *actx _U_, proto_tree *tree _U_, int hf_inde=
x _U_) {
> +-#line 218 "./asn1/cms/cms.cnf"
> ++#line 219 "./asn1/cms/cms.cnf"
> +=20
> +   offset=3Dcall_ber_oid_callback(object_identifier_id, tvb, offset, a=
ctx->pinfo, tree, NULL);
> +=20
> +--=20
> +2.20.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.=
bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
> index ccaa0c94a..9bac5bde4 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
> @@ -8,7 +8,8 @@ DEPENDS =3D "pcre expat glib-2.0 glib-2.0-native libgcr=
ypt libgpg-error libxml2 bi
> =20
>  DEPENDS_append_class-target =3D " wireshark-native chrpath-replacement=
-native "
> =20
> -SRC_URI =3D "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-=
${PV}.tar.xz"
> +SRC_URI =3D "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-=
${PV}.tar.xz \
> +	file://0001-CMS-reset-object_identifier_id-after-dissecting-Cont.patc=
h"
> =20
>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
> =20


