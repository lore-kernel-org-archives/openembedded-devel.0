Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 114EA745ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 16:57:38 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id h8-v6so9884159otb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=uHX3SrFLVfFhp9ZRyISRBo52YYe1cebINS4TgedIehY=;
	b=oLMNMPdmVa3qraXHXqGfqALFuKpTN67fcmHSy+w+WD5Un4TaD71OOss3ZsW91zXExu
	Gwe4pN0SMu3PK0Qpaah87P4LY0oHEDe9ksB2pWT9hV6EVTelW+ii56EjaVhr5JCfCycP
	mEVcMNGD/pzy76E/EO6UCYT3xjnpNNNFYF62/B6C+fI1AWdfbWfbnZ4E6TDx1Dvjdx26
	tdmcwa+b+YsfcqFCtBLo3p2YcWRTEIyULxN24EtmDYVkBGqxra2uqhV6RzazPObr7kb0
	JLkWp2hpv6NDMogek2LIi30KaO8nE9XEpRkfTpEMNWVUSzGdY8JMFFBtQc7Qit2c9PHP
	4MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=uHX3SrFLVfFhp9ZRyISRBo52YYe1cebINS4TgedIehY=;
	b=CGQiuKgfG5sjzriRYL1T7GMbajekbygyxNNUH5jXtkh0V9AQ6u7SR1xppwODhP+kxe
	+70n/iCAnQnS+QEEbe9mscnG8BRbjsRIncWwsWIk8yP4y62DgowoHXRN7FLjpE/kNjll
	qpcpWbZOH5BSv21QZbtKGCF4FyaEWvoy491wQfVvL0tWhc1GGJscN6X7MmVBLDGI/40G
	ZEcPdxljoo+o/ZFWC1lkwG5lMNl8rpuKfsbL6pspaa00tt6tkPP+o5Rcqyxn1zMlR+Y2
	J5LyWveBdbfi7YfSwQ/gNUdVoMzCLMhd43jV3FBY/vc/M/30KCHp+BXZ8qFrGsA9uZXX
	69lQ==
X-Gm-Message-State: ALKqPwcgIEm4Yae320MtEY30PH0HB9EasmJ2/UWjDsaanU5q/vRNGz89
	kgxem4IufysVXHldRZ3p6yH2ZPVYOgBTX2d1PfE=
X-Google-Smtp-Source: AB8JxZqBbjUcRMiJK13Yp1VWedhya+W37/wLA5qXWXbiOGExwyPU7jFuMIpg8AYf9PaCXb80a0wITB2eV3HYEShFHY8=
X-Received: by 2002:a9d:3df4:: with SMTP id
	l107-v6mr6630381otc.73.1526662659235; 
	Fri, 18 May 2018 09:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.73.11 with HTTP; Fri, 18 May 2018 09:57:38 -0700 (PDT)
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 18 May 2018 18:57:38 +0200
Message-ID: <CALbNGRQgMSRXq-G4XZT_eY3_+Ab_zrH8bk7KjwgGGAt6RuHZHQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] xfce4-clipman-plugin/DEPENDS: replace deprecated xproto by xorgproto
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
X-List-Received-Date: Fri, 18 May 2018 16:57:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 6:14 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb | =
2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin=
_1.4.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.=
4.2.bb
> index 96bdf0e53..f683f5359 100644
> --- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.=
bb
> +++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.=
bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>
>  inherit xfce-panel-plugin
>
> -DEPENDS +=3D "xfconf xproto libxtst"
> +DEPENDS +=3D "xfconf xorgproto libxtst"
>
>  SRC_URI[md5sum] =3D "9169140af7c9d3fddd8a5c9e0efb5a61"
>  SRC_URI[sha256sum] =3D "cf2b45e327e67cc187dcb99a6ef6d95570463045accd2454=
0e17172f005189b3"
> --
> 2.14.3
>
Something wrong with this - or did it slip through?

Andreas

