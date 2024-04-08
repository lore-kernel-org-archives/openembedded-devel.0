Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4F9CD128A
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 11:11:21 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.103555.1712574677886102001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 04:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j8yvRj2S;
 spf=pass (domain: mvista.com, ip: 209.85.208.170, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso37127011fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712574676; x=1713179476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ixlhFEliXP/nnX3lBRK02vogwRoU4Qml/9O2bQTbFo=;
        b=j8yvRj2SbgqitQ89/Xak0l8Re68ellN7JYo6WVipLByn5TsIq3IPYWYF579Iu2aUxT
         d13ql7kduSeMB6m8LVFaUBDTAo71uQzoGncJZkPc4ENLtGIg4LVgorB9tTSu1Bxi8ULH
         l3Lnbns7AkLIhzeKYQaY2JLuns8gP2HwI5T7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712574676; x=1713179476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ixlhFEliXP/nnX3lBRK02vogwRoU4Qml/9O2bQTbFo=;
        b=Rcln3dCu6rDdt8r6vIhJxdcbXsbqsJaPv2LdDEwyDRmmMxv9FCP83Z+ZcHf/fOkUbQ
         42M3nr1gOVRaft1/f0NrSPJcgqTs9iNgp+a8KAlfn85NiXx+WPn06tnrvOPY0dBW1f6K
         AdAvH/PqidMIB50yNAOZ4/u9he2tA/TKapQvLuiHdblZ7DIdLXnNUTsX0GJco2lWifof
         gPhYG64pR3W2olNVY+ZR/CKXVeyKT7qJvWCYOxD2IwXvZNnM1LNRLRUoBtb+w3pgqNQM
         7jcwTHm4VwkvkQIFBqUaruDub8BmvZ16n2pxyxOiMLUCbtsAp5TVEOBgsiRtPbRS7gu/
         2PYA==
X-Gm-Message-State: AOJu0YxvWe7b3Hm8gv4CnnYfY2LgiTBkPDv3EaxZtlqxeocsffkuIyRo
	nXxyxWovDJvi4X/SeXAhwFJMu9uJxVpMJ1lokOlYwdskP1aEu0DbFzR9RsEjVzzPkiF4hWPOoUc
	P5BXC3oA2ZriDmiJbDqy8zZl2UkQBonO9sH/psc9ShwSIwf4d
X-Google-Smtp-Source: AGHT+IHaUfOKQ4skn6TbKqdKUkZ9E8kpf6AkVP3ATSIO0nIPeUC9hcyy+1MSS+67voarZV2nq5Ut18WIYrkogLFUxfc=
X-Received: by 2002:a2e:be06:0:b0:2d8:6672:ff01 with SMTP id
 z6-20020a2ebe06000000b002d86672ff01mr3407667ljq.24.1712574675503; Mon, 08 Apr
 2024 04:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240328061902.188059-1-vanusuri@mvista.com>
In-Reply-To: <20240328061902.188059-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 8 Apr 2024 16:41:03 +0530
Message-ID: <CANQUz18jmod-G=s0QJcQi8ZsLj-jwwS7W25OLaBXa91Lb2hp0g@mail.gmail.com>
Subject: Re: [oe][meta-networking][dunfell][PATCH] wireshark: Fix for CVE-2023-4511
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Content-Type: multipart/alternative; boundary="0000000000002f685b061593dd74"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 11:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109863

--0000000000002f685b061593dd74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any Update on this ?


Thanks & Regards,
Vijay

On Thu, Mar 28, 2024 at 11:49=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
> https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b00a63aa8638076=
ec81dc9482972e9
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../wireshark/files/CVE-2023-4511.patch       | 81 +++++++++++++++++++
>  .../wireshark/wireshark_3.2.18.bb             |  1 +
>  2 files changed, 82 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
>
> diff --git
> a/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
> b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
> new file mode 100644
> index 000000000..fbbdf0cfc
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch
> @@ -0,0 +1,81 @@
> +From ef9c79ae81b00a63aa8638076ec81dc9482972e9 Mon Sep 17 00:00:00 2001
> +From: John Thacker <johnthacker@gmail.com>
> +Date: Thu, 10 Aug 2023 05:29:09 -0400
> +Subject: [PATCH] btsdp: Keep offset advancing
> +
> +hf_data_element_value is a FT_NONE, so we can add the item with
> +the expected length and get_hfi_length() will adjust the length
> +without throwing an exception. There's no need to add it with
> +zero length and call proto_item_set_len. Also, don't increment
> +the offset by 0 instead of the real length when there isn't
> +enough data in the packet, as that can lead to failing to advance
> +the offset.
> +
> +When dissecting a sequence type (sequence or alternative) and
> +recursing into the sequence member, instead of using the main
> +packet tvb directly, create a subset using the indicated length
> +of the sequence. That will properly throw an exception if a
> +contained item is larger than the containing sequence, instead of
> +dissecting the same bytes as several different items (inside
> +the sequence recursively, as well in the outer loop.)
> +
> +Fix #19258
> +
> +Upstream-Status: Backport [
> https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b00a63aa8638076=
ec81dc9482972e9
> ]
> +CVE: CVE-2023-4511
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + epan/dissectors/packet-btsdp.c | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/epan/dissectors/packet-btsdp.c
> b/epan/dissectors/packet-btsdp.c
> +index 529bb71..f18d531 100644
> +--- a/epan/dissectors/packet-btsdp.c
> ++++ b/epan/dissectors/packet-btsdp.c
> +@@ -1925,13 +1925,11 @@ dissect_data_element(proto_tree *tree, proto_tre=
e
> **next_tree,
> +         offset +=3D len - length;
> +     }
> +
> +-    pitem =3D proto_tree_add_item(ptree, hf_data_element_value, tvb,
> offset,  0, ENC_NA);
> ++    pitem =3D proto_tree_add_item(ptree, hf_data_element_value, tvb,
> offset,  length, ENC_NA);
> +     if (length > tvb_reported_length_remaining(tvb, offset)) {
> +         expert_add_info(pinfo, pitem, &ei_data_element_value_large);
> +-        length =3D 0;
> +-    }
> +-    proto_item_set_len(pitem, length);
> +-    if (length =3D=3D 0)
> ++      proto_item_append_text(pitem, ": MISSING");
> ++    } else if (length =3D=3D 0)
> +         proto_item_append_text(pitem, ": MISSING");
> +
> +     if (next_tree) *next_tree =3D proto_item_add_subtree(pitem,
> ett_btsdp_data_element_value);
> +@@ -3523,6 +3521,8 @@ dissect_sdp_type(proto_tree *tree, packet_info
> *pinfo, tvbuff_t *tvb,
> +         gint           bytes_to_go =3D size;
> +         gint           first       =3D 1;
> +         wmem_strbuf_t *substr;
> ++        tvbuff_t      *next_tvb =3D tvb_new_subset_length(tvb, offset,
> size);
> ++      gint           next_offset =3D 0;
> +
> +         ti =3D proto_tree_add_item(next_tree, (type =3D=3D 6) ?
> hf_data_element_value_sequence : hf_data_element_value_alternative,
> +                 tvb, offset, size, ENC_NA);
> +@@ -3537,14 +3537,15 @@ dissect_sdp_type(proto_tree *tree, packet_info
> *pinfo, tvbuff_t *tvb,
> +                 first =3D 0;
> +             }
> +
> +-            size =3D dissect_sdp_type(st, pinfo, tvb, offset, attribute=
,
> service_uuid,
> ++            size =3D dissect_sdp_type(st, pinfo, next_tvb, next_offset,
> ++                  attribute, service_uuid,
> +                     service_did_vendor_id, service_did_vendor_id_source=
,
> +                     service_hdp_data_exchange_specification,
> service_info, &substr);
> +             if (size < 1) {
> +                 break;
> +             }
> +             wmem_strbuf_append_printf(info_buf, "%s ",
> wmem_strbuf_get_str(substr));
> +-            offset +=3D size ;
> ++            next_offset +=3D size;
> +             bytes_to_go -=3D size;
> +         }
> +
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.b=
b
> b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> index 8054cbb5a..8af0e6aa5 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "
> https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
>             file://CVE-2022-4345.patch \
>             file://CVE-2024-0208.patch \
>             file://CVE-2023-1992.patch \
> +           file://CVE-2023-4511.patch \
>             "
>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
>
> --
> 2.25.1
>
>

--0000000000002f685b061593dd74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div><div>Any Update on this=
 ?</div><div><br></div><div><br></div><div>Thanks &amp; Regards,</div><div>=
Vijay<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 28, 2024 at 11:49=E2=80=AFAM &lt;<a href=3D"mai=
lto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=
=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&g=
t;<br>
<br>
Upstream-Status: Backport from <a href=3D"https://gitlab.com/wireshark/wire=
shark/-/commit/ef9c79ae81b00a63aa8638076ec81dc9482972e9" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae=
81b00a63aa8638076ec81dc9482972e9</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../wireshark/files/CVE-2023-4511.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 8=
1 +++++++++++++++++++<br>
=C2=A0.../wireshark/<a href=3D"http://wireshark_3.2.18.bb" rel=3D"noreferre=
r" target=3D"_blank">wireshark_3.2.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 82 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/wireshark/files/CV=
E-2023-4511.patch<br>
<br>
diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.=
patch b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch=
<br>
new file mode 100644<br>
index 000000000..fbbdf0cfc<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2023-4511.patch<b=
r>
@@ -0,0 +1,81 @@<br>
+From ef9c79ae81b00a63aa8638076ec81dc9482972e9 Mon Sep 17 00:00:00 2001<br>
+From: John Thacker &lt;<a href=3D"mailto:johnthacker@gmail.com" target=3D"=
_blank">johnthacker@gmail.com</a>&gt;<br>
+Date: Thu, 10 Aug 2023 05:29:09 -0400<br>
+Subject: [PATCH] btsdp: Keep offset advancing<br>
+<br>
+hf_data_element_value is a FT_NONE, so we can add the item with<br>
+the expected length and get_hfi_length() will adjust the length<br>
+without throwing an exception. There&#39;s no need to add it with<br>
+zero length and call proto_item_set_len. Also, don&#39;t increment<br>
+the offset by 0 instead of the real length when there isn&#39;t<br>
+enough data in the packet, as that can lead to failing to advance<br>
+the offset.<br>
+<br>
+When dissecting a sequence type (sequence or alternative) and<br>
+recursing into the sequence member, instead of using the main<br>
+packet tvb directly, create a subset using the indicated length<br>
+of the sequence. That will properly throw an exception if a<br>
+contained item is larger than the containing sequence, instead of<br>
+dissecting the same bytes as several different items (inside<br>
+the sequence recursively, as well in the outer loop.)<br>
+<br>
+Fix #19258<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/wireshark/wiresha=
rk/-/commit/ef9c79ae81b00a63aa8638076ec81dc9482972e9" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.com/wireshark/wireshark/-/commit/ef9c79ae81b=
00a63aa8638076ec81dc9482972e9</a>]<br>
+CVE: CVE-2023-4511<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ epan/dissectors/packet-btsdp.c | 15 ++++++++-------<br>
+ 1 file changed, 8 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/epan/dissectors/packet-btsdp.c b/epan/dissectors/packet-btsdp=
.c<br>
+index 529bb71..f18d531 100644<br>
+--- a/epan/dissectors/packet-btsdp.c<br>
++++ b/epan/dissectors/packet-btsdp.c<br>
+@@ -1925,13 +1925,11 @@ dissect_data_element(proto_tree *tree, proto_tree =
**next_tree,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset +=3D len - length;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 pitem =3D proto_tree_add_item(ptree, hf_data_element_value,=
 tvb, offset,=C2=A0 0, ENC_NA);<br>
++=C2=A0 =C2=A0 pitem =3D proto_tree_add_item(ptree, hf_data_element_value,=
 tvb, offset,=C2=A0 length, ENC_NA);<br>
+=C2=A0 =C2=A0 =C2=A0if (length &gt; tvb_reported_length_remaining(tvb, off=
set)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expert_add_info(pinfo, pitem, &amp;ei_da=
ta_element_value_large);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 length =3D 0;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 proto_item_set_len(pitem, length);<br>
+-=C2=A0 =C2=A0 if (length =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 proto_item_append_text(pitem, &quot;: MISSING&quot;)=
;<br>
++=C2=A0 =C2=A0 } else if (length =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proto_item_append_text(pitem, &quot;: MI=
SSING&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (next_tree) *next_tree =3D proto_item_add_subtree(p=
item, ett_btsdp_data_element_value);<br>
+@@ -3523,6 +3521,8 @@ dissect_sdp_type(proto_tree *tree, packet_info *pinf=
o, tvbuff_t *tvb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bytes_to_go =3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0first=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wmem_strbuf_t *substr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tvbuff_t=C2=A0 =C2=A0 =C2=A0 *next_tvb =3D tv=
b_new_subset_length(tvb, offset, size);<br>
++=C2=A0 =C2=A0 =C2=A0 gint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next_of=
fset =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ti =3D proto_tree_add_item(next_tree, (t=
ype =3D=3D 6) ? hf_data_element_value_sequence : hf_data_element_value_alte=
rnative,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tvb, offset,=
 size, ENC_NA);<br>
+@@ -3537,14 +3537,15 @@ dissect_sdp_type(proto_tree *tree, packet_info *pi=
nfo, tvbuff_t *tvb,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0first =3D 0;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D dissect_sdp_type(st, p=
info, tvb, offset, attribute, service_uuid,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D dissect_sdp_type(st, p=
info, next_tvb, next_offset,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attribute,=
 service_uuid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0service_did_vendor_id, service_did_vendor_id_source,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0service_hdp_data_exchange_specification, service_info, &amp;substr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size &lt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wmem_strbuf_append_printf(=
info_buf, &quot;%s &quot;, wmem_strbuf_get_str(substr));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D size ;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_offset +=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes_to_go -=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-support/wireshark/<a href=3D"http://wi=
reshark_3.2.18.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.18.bb=
</a> b/meta-networking/recipes-support/wireshark/<a href=3D"http://wireshar=
k_3.2.18.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.18.bb</a><b=
r>
index 8054cbb5a..8af0e6aa5 100644<br>
--- a/meta-networking/recipes-support/wireshark/<a href=3D"http://wireshark=
_3.2.18.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.18.bb</a><br=
>
+++ b/meta-networking/recipes-support/wireshark/<a href=3D"http://wireshark=
_3.2.18.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.18.bb</a><br=
>
@@ -23,6 +23,7 @@ SRC_URI =3D &quot;<a href=3D"https://1.eu.dl.wireshark.or=
g/src/all-versions/wireshark-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D=
"_blank">https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar=
.xz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-4345.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-0208.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-1992.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-4511.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://1.as.dl.wireshark.org=
/src" rel=3D"noreferrer" target=3D"_blank">https://1.as.dl.wireshark.org/sr=
c</a>&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000002f685b061593dd74--

