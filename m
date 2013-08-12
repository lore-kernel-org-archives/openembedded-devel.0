Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 71A6A6B582
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 11:45:56 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz10so5554441veb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nyIr0KEagpQ0Bc0ei+pdDCMtMhEMPVsjPQ/Fi77HGQk=;
	b=zJis1Jod+5KepQXw6sTA6KsnyXso+pghqlwS6SNo1ugOifoujSfM0jMeTcMgOQiamG
	r/uG0in9AEQoihg2ove6P/IghJQJExQySg80u2rElR/PfmS+8YAf2A2Iz855geOowTUo
	PMKd6CfLbRBqGp8BbDh7o+i6oh7WvM1cvcmI9gOUPBJTeRVQiP/4x4hNSkWBNTaDbKti
	Q/elaA4P44ZFcYszihR5C6ccqLLhYVbtay1nSgVEY068bVraExU9KatDZrOun5MBHQvg
	iUgB/RYgBA9stHeQzOUnLLHggqsi7OIiWnEBdv+XzhAK60HkmVhwP4mROVVMWr18B8Nu
	wX9w==
MIME-Version: 1.0
X-Received: by 10.52.73.135 with SMTP id l7mr5285071vdv.9.1376307956354; Mon,
	12 Aug 2013 04:45:56 -0700 (PDT)
Received: by 10.52.236.133 with HTTP; Mon, 12 Aug 2013 04:45:56 -0700 (PDT)
In-Reply-To: <1376038471-32202-9-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
	<1376038471-32202-9-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 12 Aug 2013 13:45:56 +0200
Message-ID: <CALbNGRSr1GJY84hvnhuJ657SrVpTdV=Svk=1DOWxTaKKOQFvrA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 09/12] tumbler: add dependency on xfce4-dev-tools
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
X-List-Received-Date: Mon, 12 Aug 2013 11:45:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 9, 2013 at 10:54 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * tumbler configure needs XDT_I18N macro provided by xfce4-dev-tools
>   | tumbler-0.1.29/configure: line 13752: syntax error near unexpected token `$linguas'
>   | tumbler-0.1.29/configure: line 13752: `XDT_I18N($linguas)'
>   | Configure failed. The contents of all config.log files follows to aid debugging
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
> index fd28e84..286dad2 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
> @@ -2,7 +2,7 @@ DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus speci
>  SECTION = "x11/libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl"
> +DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools"
>
>  inherit xfce
>
> --
> 1.8.3.2
>
I think xfce4-dev-tools-native would be the better depends

Andreas

