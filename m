Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE4CD730B3
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:34:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6780.1775201656839956414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UjiFwkdh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iSqWb1bX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336Eu4E140906
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Apr 2026 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXRnEBY5X3b04yjWP3PGPHZ7qjWWCYwr/k16it4Uxfk=; b=UjiFwkdhfCepisp9
	pEKtOiOnT3I12gfFnPp1GXBF28eJhw1Xk4yrkqEqbB5I9u9/kZC5MhpuiCx1mOpc
	oSftrVVFau73lCTePCo50WMvihHW2U/KtAThcA9/4w6JCv/QdeLqTSAtsu2RVYhM
	zXQ0yaX914nsWnbLoQJ0ilGg/+/2w0qPIb1HZRww1lJlXGETgYNmv2XdOKykNz+g
	OsBPxxs7yRaq6QAqvv4L8N47ZSq9l2BAAf3Iid3ryEfDqNoDSvq4/Rp7fhVy2+ns
	YMYbqOfrMyUS+ppsWDRaEiAOVfxi5exDn7cC4ldmJILSTl0qV3vOeD96vYNk6Bcl
	VHAv6A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y07qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:34:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so60874426d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 00:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775201655; cv=none;
        d=google.com; s=arc-20240605;
        b=B87YmjK36DXohX9swz0ctnZC16rIO7GLt5VjvhoXYaV7L8j4w3uDXZaGUdT32oUnrE
         xeftyVsczV/02SLKS30s52RNgaqdaKz6sGsQ8dXp9kaIhZPF/jegdtZBLME0+ChTF0m/
         hHH/vc4SjFkEywNrSlZcWDgU5fVTSEG4OFkVyJ6y13tbWlX4g74QvMFSmjNoM6BiDrm6
         gtslTZwYZX4Gh8kIddpdo5alVtKH01avJtfKUmBH6PYFNicwDo41AjDSt89s0IVL5g+J
         v5MNSpACG9gByfb+lcDJmqMg7YwSyiNF9xYB+k+pT+cJuxb7RH8HH3+fMdH+khiXNe8e
         LWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XXRnEBY5X3b04yjWP3PGPHZ7qjWWCYwr/k16it4Uxfk=;
        fh=MgOCXLuYPSiEawotpBqjLBUQld1Qo4kpRFPyEGPTWCc=;
        b=eub+i6QuckkNsBG+o4NEHMrklznaAw3wtzJDZoxEeTBZ6GeQ+RvNXtSa6i8vXjPBo+
         Y3oBwQf7p3zxNdABnv4UBg7r9r/Jx13aoLt9FnQgJuKwTWfMkq/877Q7DYmVhypvhiCD
         Dyox3dqsax2BA4Y73MzpGinY59pQGML1E6SrYCDuXVSNbCgepLZpXaaxoVidNhTvo7fO
         XVet+RyCII/iHAKskASkgYuHINFUflxjB71KEJ+7D7X+Q/hsmMavh7Jk3HOaQ+z1FfPm
         rGR9pm1jUJnY7+Mt/cUueu7cnPZcbGD+k+HqDVuiVtWif9tE2A66yvseoEpMvOPy0iK8
         uabQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775201655; x=1775806455; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXRnEBY5X3b04yjWP3PGPHZ7qjWWCYwr/k16it4Uxfk=;
        b=iSqWb1bXKryIcRhkrMbbp7dDbTGHhvOm4WrmL7otdprWj3xKawoFq8oux7uS4vbT8Q
         JAQkZs5juXGP7pkn4tdat8pOGptkEXpoA/vX2A70OqaXE24E4dTq8ey2tgVEruJoFqj5
         sKPqbs1jv9uOyZ6BvYaWcR3+1DyY13KHMwVavhoWNXq1TTY+rSVhTGL1DOVwtDqkcs3w
         Wc6gLiigciIme6NGKAhkc+hj5QBD7xY+bsry93Ef7DW6S90eOWqRmUEXWlfEUZTqu4dQ
         uihre6sKWlcwTsf+h6fJgxWEYnyVVBqaHWMFofh4AV+uL8DmKRLGGyCcOlupe69dLv1q
         zcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201655; x=1775806455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXRnEBY5X3b04yjWP3PGPHZ7qjWWCYwr/k16it4Uxfk=;
        b=crqXz2FJqYWhznFWu+F/PLnOe2FSZZq1IobOWbUdYF8YVMPbv6NqrkwmXbyYad4m+y
         ZIb/D34k+M/4Yyj6jERpudTGHwgIw1f9yEyRfHMeV+JV4eO3e3bXPRAEXOLFC0OEveF7
         lCw2vO0jiUwu3JZJzu1rtPTa+jBo/5CvcatpDgK2TJtHRjSa8E3m5509Xc9o+64iRKKR
         ObkBsi+QcQlMQHo+WpRlV30y8XUdHhtAT8qSreqPtXzoreqepODueZk7Jz0Au9Yh6DNd
         E3HfkZ8hXzq14nPKrE0fzdlYN+w2/D6EzLclbG+xYVQSEBPH70Mwb5IXuqmHMyE1ldqa
         CtQQ==
X-Gm-Message-State: AOJu0Yx8k11qb6ZSjSdx0D/UdZYkuUqWnf44ImQObaQkMvSx/bHeTvm4
	SXymW9rsR5OwiUsBG2kHv9raL4BFCt1uJNwbudLcon6LJY8fExvS4gEo+iLaOJfWtq74rCf+u7W
	DcsTsbW7RfFQ15b8+bOWLT2elhcfBdLwyG/aLFImms/xI4JgB4RZbi/k6nQQCl37j9l/jrn2Wtu
	xjtVH9LvNr6DAvs0PzdHihu03aGM+dLAPT8Xhrxb0eT4gSEai24l4DF7A6Yxo=
X-Gm-Gg: AeBDiev0xO3SVgOO88nzSd143pdkPgu2Od8sfOxKZxwSVBtbW/pq512Uzfe6eFORKym
	lpa3Ak18qhH6MkyQaH/jKsP4U6VJSAkvDNhOjOVWkg6AZkKKSDQEWskTf/0pFkUWO1b7gzrJkPN
	6WdaTBQkAa3zscy6rgt9VCFUrMBranJCj1YbWZW0jPlQYlKGWes6kDysthEn5oX0P4j4rdW16v6
	Gl6
X-Received: by 2002:a05:6214:400b:b0:89c:eabb:f58d with SMTP id 6a1803df08f44-8a704da9f12mr31976686d6.47.1775201654950;
        Fri, 03 Apr 2026 00:34:14 -0700 (PDT)
X-Received: by 2002:a05:6214:400b:b0:89c:eabb:f58d with SMTP id
 6a1803df08f44-8a704da9f12mr31976506d6.47.1775201654501; Fri, 03 Apr 2026
 00:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260331095820.1967914-1-martin.jansa@gmail.com>
In-Reply-To: <20260331095820.1967914-1-martin.jansa@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 15:34:03 +0800
X-Gm-Features: AQROBzBfjIaJLD7Ki_DgYk5SUFRJ9QOif4ddhpE6BrHs66ykR2XkxoFcc5T_MgI
Message-ID: <CA+s=J=wiBcqMjM=CLgnWgOrXLxWvQ83iQvEdGCpHeQnB0jWmGA@mail.gmail.com>
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] flatpak: add PACKAGECONFIG for dconf
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf6d78 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=C9iyfSnS6EAt8pBlwu0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: uKC6A7HfzCedYa0UJEgYxS9WutmC_RnH
X-Proofpoint-GUID: uKC6A7HfzCedYa0UJEgYxS9WutmC_RnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA2NSBTYWx0ZWRfX4kUhQx2oyruy
 cfcrZLVWYW8gVIGcRVmf7N01bS0/up9NsRANs7GOdptALUplD+kyqk314qhsECPHzlWfObN6i8b
 GBEspeBZo/SPxJTDlHoPmtN4+8vxOhPLMpDIoaXQ6/5Qz57h+WFw+KOEScC9w7lTfr8HL460nz4
 gaFwKk9o43kfv8Df3+X3phT4r/ptw+Gd+vFScV9oubf7G2ru+PCkBiOBKocIPouI1CaE9bL6Ar3
 X/EU5HHnuULL8BD/6CRUh44auHXLbrZQypA1MixMyZk5sbgu/btwctqO1xT5hlszRhzhTFvBm/z
 4QQYL11oQuvr/jJ7qCfdE814dFSC3LtZKpaaAf4rZNn2R3wPxUqUXq5rFriSV/6Nx26SrIAN9qT
 PdkRkOoOefzKFX+gJageV8Ua43ek8SkerOCbKfW8Tg7OGLlcwMqeJU4g+ct7USD5Pc44gAtWZFY
 Nw8UyUD9D34odLxxWfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125974

On Tue, Mar 31, 2026 at 5:58=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Markus Volk <f_l_k@t-online.de>
>
> Disable by default to avoid a requirement for meta-gnome
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
> index 639027701b..3a2974294f 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
>  DEPENDS =3D " \
>      appstream \
>      bison-native \
> -    dconf \
>      fuse3 \
>      gdk-pixbuf \
>      glib-2.0 \
> @@ -38,7 +37,6 @@ DEPENDS =3D " \
>
>  RDEPENDS:${PN} =3D " \
>      ca-certificates \
> -    dconf \
>      flatpak-xdg-utils \
>      fuse3-utils \
>  "
> @@ -51,6 +49,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
>
>  PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
> +PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"

This will change the behaviour for this recipe. Why is it needed? Are
there problems if it's left enabled?


>  PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,xmlto-native"
>  PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
>  PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125884): https://lists.openembedded.org/g/openembedde=
d-devel/message/125884
> Mute This Topic: https://lists.openembedded.org/mt/118593820/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

