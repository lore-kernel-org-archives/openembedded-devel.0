Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACA3745FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 16:49:24 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j7-v6so2488248qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=POK+gV+ivj2c2+EG5SmmrHWfbyiG08bWf/3xLH55JaY=;
	b=AnvI/T8f5w+ZLcWLYeDjgHnh/uHnpxsCz1wzVd9K+HuLFyl2C1B1kCZkP+4fqSWQLl
	U//M7zkHv7jDq3cdEecWEvoBnlEuiMdtfEbfub0ctttij6XZy18NSbMch/40azfI+Xa7
	HpVdjq9+xMjrVm3mSHiG13gITi/ZJAkOGZ1P+E2wReQSKE9t2ytismWq4L8kdF9nlpZv
	kj/GLJMAKvOeXhnHSIio7Dm45eluy5gqYhli3acAOXRt76yOcPKupWp/Q4KkrwYr3vk1
	BpJ/rb54aGwyFWSoYGue5Azxm1CUKlv4tGbr5xIAq4Nk+6sW/MIS7g8Xl1gYgbln0tTe
	yopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=POK+gV+ivj2c2+EG5SmmrHWfbyiG08bWf/3xLH55JaY=;
	b=mCQfSYtR+JQOLCRWkXtN+WPrSbTybn67QuMkmmB3Mbg7vQfqc8UwG/u706sIn60BEF
	luwoex6sJg5EBxeO2W1eoEB2ROIR8bUNoWINuzj4bV5e+OIadGYwOP7SepOHoqCvgCCV
	vorA8MOVZG9Ypjovgh8J11xig8EakPXGMmmfZSo7HHHcK7faQs6XaxMSC7H0Ow00HI+U
	KPZ/XxLRhqNOyNt3NUsEb0C72EdLVlYLb00a3latD1hFBflwVFEMIc6j+4Vb6Ckqcg2z
	6qjBfpdUstcGJ5n9zZVXt/0Yf2vbPTYORWuQqnTkxbFOERPYfz7Oqd5fXhoLAN4csAtE
	L7BA==
X-Gm-Message-State: APzg51CDAyr1+jcQyJw8T24pwn8QeJ0wAI7zBlTnOt+ArR3mrLXPXK/1
	poOz819rRQ/AEhfCFhFU8SAdeTNaSMEzKjjGPGPnhw==
X-Google-Smtp-Source: ANB0VdZIIp63sFXrwz+B2GdQCzRfMmVUFB2JqE/Evcur9IQWGGW8tc2C3T6QN6E5t2j5eenCCaThYd7BsSFSA1U5Pls=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr2546817qvo.50.1535474964925; 
	Tue, 28 Aug 2018 09:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <1535440532-15992-1-git-send-email-radek.dostal@streamunlimited.com>
In-Reply-To: <1535440532-15992-1-git-send-email-radek.dostal@streamunlimited.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 09:48:59 -0700
Message-ID: <CAMKF1sroJkDr2hLCvyNDMzO7wynymFTHSCQ8G-NqcpPwquuQbg@mail.gmail.com>
To: radek.dostal@streamunlimited.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireless-regdb: make wireless-regdb architecture independent
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
X-List-Received-Date: Tue, 28 Aug 2018 16:49:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 1:05 AM Radek Dost=C3=A1l
<radek.dostal@streamunlimited.com> wrote:
>
> There is no compilation involved in wireless-regdb and package should
> produce  the same results on all architectures =3D> making it allarch sav=
es
> build time.
>
> Additionally this fixes issue: "On machines where ${libdir} equals to
> /usr/lib64/ regulatory.bin is not found by crda". Reason was that
> crda-3.18/crda.c looks only in following paths:
>   "/usr/local/lib/crda/regulatory.bin", /* Users/preloads can override */
>   "/usr/lib/crda/regulatory.bin", /* General distribution package usage *=
/
>   "/lib/crda/regulatory.bin", /* alternative for distributions */
>
> Signed-off-by: Radek Dost=C3=A1l <radek.dostal@streamunlimited.com>
> ---
>  .../wireless-regdb/wireless-regdb_2018.05.31.bb                     | 6 =
+++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> 4MartinJansa: dneska p=C5=99estupuju v =C4=8Cesk=C3=A9 T=C5=99ebov=C3=A9 =
:)
>
seems like a private social media message got mixed

> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless=
-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/=
wireless-regdb_2018.05.31.bb
> index d1c8d56..2b990db 100644
> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_=
2018.05.31.bb
> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_=
2018.05.31.bb
> @@ -8,12 +8,12 @@ SRC_URI =3D "https://www.kernel.org/pub/software/networ=
k/${BPN}/${BP}.tar.xz"
>  SRC_URI[md5sum] =3D "0cbbdc21186c76cf58aba01b03f3dc5b"
>  SRC_URI[sha256sum] =3D "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2=
cfd12c56676fbe7b"
>
> -inherit bin_package
> +inherit bin_package allarch
>
>  do_install() {
> -    install -d -m0755 ${D}${libdir}/crda
> +    install -d -m0755 ${D}${nonarch_libdir}/crda
>      install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
> -    install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
> +    install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory=
.bin
>      install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regd=
b/pubkeys/sforshee.key.pub.pem
>
>      install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware=
/regulatory.db
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

