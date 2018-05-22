Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23AF874853
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 00:55:50 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 131-v6so9874218vkf.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 17:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=1sp+Kn2gm9gAPPo/wAIPcy1+mJiv0xz4te58w1f3HO0=;
	b=fkVYgJS8MnFYMTYu9uPFJLQ+k66F8HOpFLrwMPHZMDk7nKRYiFYJsZLy82zR6jNwla
	yQGEitvQWVlReuBJnd4qbksgUl8BRLF6UWfavtpOe/D1vRF5kPhvov8TRF+M94hyILjS
	5nStN1w66VHohDgCntvGqwjo1uYEOtcc82u7E/fAo48wYvNLjuy1fggg61sySnOoh/Sn
	YaOD8zOsZ+1Oe9tU6l7/joZQkEwROI8STHYxJkUKJt+VRusfj+s2HEbWNjLPlli5pbUH
	7fNz+uHACFxL3hTkydTojiruhv6+S8/ODZQji93TnQzbA9SPw/t2KiWfWUI8oHRCCzDn
	gP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=1sp+Kn2gm9gAPPo/wAIPcy1+mJiv0xz4te58w1f3HO0=;
	b=GOpjp+Xonx/veXIKfmWNC9MctsAx0IY14mbH30DOkI0HR3DcQFhNgR7wdZE3rc+kR/
	ru1RWBh0AlXgdtYWUlZq8d0Oc4jBghGtQeMl8Fph2i27nwz3chYH+hoYQCCMWdei970D
	o57WyTmvRTFrGjXdvqR1AJVLAmffa/Jez/HT/pXGhZE15hdmxfeNYGleMYcHXpPQYhpC
	rHTW9KI7E9JiSZTJfMPJDx5PpRHyo+exDwLktv6IOXE6czBN93BZXoGS8z7xsbwsj6UM
	Tax9iWfL6b1yWUdRcxWilFRLioGC3AcOqWdRn2xERKI19pnElAk62+AzBdzIU9NjArQ7
	FU4Q==
X-Gm-Message-State: ALKqPwcxRNHj2x+6It4lMA4wsLK6/U1+j8GJqys6Z2gtCyBwr/W7RrFB
	VqRMAUlv9xSVu51m+f9ds7oN4DI4vgrbV7htXKE=
X-Google-Smtp-Source: AB8JxZoPN5CGzYICtzXD8CwPP8NFzx+dlTO49lXvxWMsWPlf7SCanuVurrzL1+eVYylrAmJ7mpAxqQ2Z9oCvhKmOR1k=
X-Received: by 2002:a1f:3451:: with SMTP id
	b78-v6mr14595853vka.2.1526950551659; 
	Mon, 21 May 2018 17:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 17:55:51
	-0700 (PDT)
In-Reply-To: <20180520022931.GY31886@vctlabs.com>
References: <20180520022931.GY31886@vctlabs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 17:55:51 -0700
Message-ID: <CAJ86T=XmTQhg1_TKSnMLrLFQMGz4hYzjGaheFA0XUZ=BRPbj7w@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] libev: correct source path
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
X-List-Received-Date: Tue, 22 May 2018 00:55:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 7:29 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> Replace PN with BPN, since source unpacks to the same place
> regardless of building for multilib (or native, though that's
> not enabled here) where PN != BPN
>
> Signed-off-by: S.Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta-oe/recipes-connectivity/libev/libev_4.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> index 5e0f3a5..399fdd9 100644
> --- a/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> +++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> @@ -9,7 +9,7 @@ SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
>  SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
>  SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
>
> -S = "${WORKDIR}/${PN}-${PV}"
> +S = "${WORKDIR}/${BPN}-${PV}"

That's the default (set from bitbake.conf) so you can drop this line entirely.

>  inherit autotools
>
> --
> 1.9.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

