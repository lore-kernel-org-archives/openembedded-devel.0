Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F39E60DBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:05:10 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so2972157obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 18:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=teiF6+gHYa7qRmmVuvnk1Af9q9rn843nkaT4h6xzF3s=;
	b=gSAoKLf0P/o8k1S4dTjyUF1+H8GKbK+lvuy6Noo9XJme2TCyEnn6RCg3EjIbikVF4I
	ZoeiQpBdE3hZPIMnRAukblccSUzEvUsNMTRkgPBP+rEPmTpQEBQZvluensJgksD8uTbM
	ioflMpWnyiwooTqLb8fVV36NJ/i5/N5ChJb1MfucDgjnUHtCiRo6cQGSCTbo08if1c1r
	eHEvm5vbRlApp2ghl8di7VnMOQ3U+9rkxhdosoOsEujuq/Rxn1UpBxVAiNVEzkjENjJs
	KpobNKJDDQXItcIDj3UnDx+shJTuddLqDp20YBY4eshzFXrJOyd0MJy0v70M+q+1nusZ
	IVlA==
MIME-Version: 1.0
X-Received: by 10.60.78.9 with SMTP id x9mr72981oew.72.1390529110824; Thu, 23
	Jan 2014 18:05:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 18:05:10 -0800 (PST)
In-Reply-To: <1390491148-20966-1-git-send-email-koen@dominion.thruhere.net>
References: <1390491148-20966-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 24 Jan 2014 00:05:10 -0200
X-Google-Sender-Auth: vih53Z-ldkdjORooa45yq28MCu8
Message-ID: <CAP9ODKrYit8BbXPD4Ubp=dD3QCoNM1XEfEyXiyrtpJD+tXMhmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>, mporter@linaro.org
Subject: Re: [meta-oe][PATCH] libusbg: add 0.1.0
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
X-List-Received-Date: Fri, 24 Jan 2014 02:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 1:32 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This needs a 3.11.x kernel or newer for the configfs stuff.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-support/libusbg/libusbg_git.bb |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libusbg/libusbg_git.bb
>
> diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
> new file mode 100644
> index 0000000..ed5ac65
> --- /dev/null
> +++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "USB Gadget Configfs Library"
> +
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
> +
> +inherit autotools
> +
> +PV = "0.1.0"
> +SRCREV = "7e2b04363f319e8936a606bdb122dbde249a2f58"
> +SRC_URI = "git://github.com/libusbg/libusbg.git"

Branch value missed. Please add ${SRCPV}.

> +S = "${WORKDIR}/git"
> +

Spurious new line.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

