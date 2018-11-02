Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4786E79FFF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 22:03:22 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id d6so5187635itl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g7kIsO1b2QkADq1poag9qj2ce1d4EnyUcSbmu2HUu2A=;
	b=ckOI32hq75BABVtnMM027ydZPZKgtxjWC8r7yFzW59fPZ5ve/2FYd71VIz7p/n9Pkn
	iCrSFXUcylYMymHL+nhhC7cLRVKxSiW6y8ZTEks7E0vwslFwJFuVEMHPH0lEl9ivuwf7
	EMzMWdylvN3+Qym5cfHTzew/J0QZvq3JEMeY6KuLrxkyuXqz/VQqRIQIBOVVHcRfKqPR
	5MotpKNxfvk3/xtVVvM1kZnhbzCtBCArAEe5fs3kGXkWgqFVUWhk+1QaT5crJp9ezJtT
	Aica0ZJsWqz/AVa7KViq//Hont0rtHOsiZuDVKSsqz9PVwnqheIem7Isgg//38kUGQFg
	63Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g7kIsO1b2QkADq1poag9qj2ce1d4EnyUcSbmu2HUu2A=;
	b=JU3lAbu+J/t6e3wDnXx4uGTKE80VnG1JsJSG6nnf3OPzK4FWHEH9UT6pisNr33WGOt
	p4w1AgEmHMHPgCCLmm79uITJXqdjhznVMrrtiq5KO2greS9B5Kl98i+8cm8Fzzcy7xmJ
	bPTZ6G0RhRohGkhKamRj4ZrH8XfnNASwVOrhNCrQvfkGzz6jqIoMY7xeGrZhRpoqUr9z
	TmkHWSlZNBWz57di5zUFuKC/90nwTzuCliKf4rEjeN6MnBjLocndaR2DDkVJPPz4e7H0
	eBb9k6DJ7p5e7TNzPhNCEszHOSH3CTqTiC1yq0fUrUO2gwDAZ3GXPtBDk9ACJXR6uVy3
	4Ezg==
X-Gm-Message-State: AGRZ1gKpSaFA0G4d82ecSjQf8peSxjJrovTIWfiScfElP6ii1ggQvn6K
	yV4ln3Z2fRL2AOLEoe5TIl45fPJHANgliBxvnx+4GA==
X-Google-Smtp-Source: AJdET5esYsJjWCWKxM6x6cc2C334cvkYQ06skWk5cAnhbX4SDDUvXWYFLuMIV7z8x90ZA+FMhVkLDml4y4Cu0sX8IB0=
X-Received: by 2002:a02:3b2c:: with SMTP id
	c44-v6mr12336114jaa.31.1541196203347; 
	Fri, 02 Nov 2018 15:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20181102193911.784-1-Martin.Jansa@gmail.com>
In-Reply-To: <20181102193911.784-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 22:03:12 +0000
Message-ID: <CAJTo0LapUWEmLVDYvyR+WLrBOK=7m+TDmQ_tYGLQ=RHLtfVPOQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pcsc-lite: fix SRC_URI
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
X-List-Received-Date: Fri, 02 Nov 2018 22:03:22 -0000
Content-Type: text/plain; charset="UTF-8"

Just in case anyone didn't knot, it's not temporarily down, it's dead for good.

Ross
On Fri, 2 Nov 2018 at 19:39, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * alioth.debian.org is down
>   Connecting to alioth.debian.org (alioth.debian.org)|5.153.231.21|:443... failed: No route to host.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> index 90d58b00d9..10f724e6c8 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> @@ -11,7 +11,7 @@ LICENSE_${PN}-spy-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
>  DEPENDS = "udev"
>
> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/4225/pcsc-lite-${PV}.tar.bz2"
> +SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
>  SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

