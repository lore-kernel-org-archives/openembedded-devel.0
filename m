Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1882D6A95B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 17:07:43 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e10so1474430qcy.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Lgo/PlED2rRuhwExMpgx8emwLZxdgAWKzL5WfaCqUJ4=;
	b=ju2Ixj21Uxg7sMDbcy6JLeFSS+DqQXsw81CbRyuCc0LW31EoMQTrOOYnZUUMVlB90J
	hhjvwgFekevylfY5ZJDGxf8oCHlrXlePc2xtkQ6A4M5DpNfxcDZsDAfdCVuH1WWKuCJs
	eHZKLFfuEg83o9EN/ILq0Fsu6bCLpaWrq59u2hbuukAgySsayY3cW6nj+Ch3Psp1rkET
	ZWQRsfmPz3JZkamNljQ62tlI4uQ0lVWdgHxIvWkPERs7JrkdB3TKo2yvBOkbnbWtiaOo
	MuhBei8Eq0Hsyj4K6n8FavN/AUiOaECHxYvrkZKygatTboljBKBorLUax2wztZlr9Wo1
	i9KQ==
MIME-Version: 1.0
X-Received: by 10.49.24.198 with SMTP id w6mr11586947qef.58.1370884063899;
	Mon, 10 Jun 2013 10:07:43 -0700 (PDT)
Received: by 10.224.36.17 with HTTP; Mon, 10 Jun 2013 10:07:43 -0700 (PDT)
In-Reply-To: <1370883990-5569-1-git-send-email-cazfi74@gmail.com>
References: <1370883990-5569-1-git-send-email-cazfi74@gmail.com>
Date: Mon, 10 Jun 2013 20:07:43 +0300
Message-ID: <CAF6bG8fEUCPMp1RYrEZCvfrYsco3Wp6CZwmf52mFy=UuAxXn2w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libungif: add native build
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
X-List-Received-Date: Mon, 10 Jun 2013 17:07:43 -0000
Content-Type: text/plain; charset=UTF-8

 Motivation for this patch: newer versions of liberation-fonts need
fontforge to build, and fontforge depends on libungif.


 - ML


On 10 June 2013 20:06, Marko Lindqvist <cazfi74@gmail.com> wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  meta-oe/recipes-extended/libungif/libungif_4.1.3.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> index 0e9bf9b..3e4b78b 100644
> --- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> +++ b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
> @@ -12,3 +12,5 @@ inherit autotools lib_package
>  PACKAGES =+ "${PN}-utils"
>
>  FILES_${PN}-utils = "${bindir}/*"
> +
> +BBCLASSEXTEND = "native"
> --
> 1.7.10.4
>

