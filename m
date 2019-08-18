Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A93127D41C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 00:22:10 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b11so10278085qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 17:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=by2MJN9eweAv8Rt/VF3YEn03CVyFk8r8GIQaux0lDcY=;
	b=B0mBVx1p0ZoArlYGeoI5NysnJpKCUENP2mqJscVWM4ZiUNKUgZskMaouXpBRXsb14A
	VHzdiedl4bFlXinzJq8oX1SthpRFym1MXYFRBeyCOR6rkGHf31Cm3K5VJudvLcXx2oNh
	yFWbPfrJieA5emPJNztSkUaKDgZ7xlAo/sAeIdRcpQOdrGnllVIWHS5SuvM1HzDJqj2M
	e7NF2SyYnoLR5GCFtcwcRKnigaE4s3HRAo2KxaqxP1gVslDaxTiZrqPcn4BpgRxsvxvS
	vaPMIpXJ1G+7iF4Ce3AR+BwiyVZvVSOyopOyO7x7OGqlU865hCPVbeL48OkVm9DbIkaO
	jUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=by2MJN9eweAv8Rt/VF3YEn03CVyFk8r8GIQaux0lDcY=;
	b=mQhxEqn3XX6ovBlHrW47ZYNQp9hx2afp0bn5QxoXtXoNq8zJRARWk9QAN8I+L6nKxd
	QFade7MdRXdC3PCQsjgjoO4n0zsa4l7HcU3f17HqsySXHjG6Tg/QcwHDdX3zsWVPGIQW
	AOz5/ypKp343YJGEEEUo9rZS+wuYh9X83BGDHEo4aZcZXJ545am2hVcBEGdrU3DRDpHR
	ZwVIpMyGR3ZZSmBCCX8ONxFgnvRF6RXW2MpY/5DSeJ2erS50x5ob1LvWLClyM0hh5IQn
	4clWYwkbdcV8dK0L3yN/uMb59HpHhjEhpVi4E1vHqgf8Ns1iiQx7yQpt9Xr4+FPGS8Ue
	miPg==
X-Gm-Message-State: APjAAAVIU4DWPzHh3vSfE4XIGNmpf848TbiRguE0bs3Krr2cPF4Ag42L
	6eimNd8vLYtFKDhRgwlZlqMqlTiLvnKpzh3f3YnCSyEZ
X-Google-Smtp-Source: APXvYqxdQ3ibPWmVerqaukkc5xE8nFnS8cvGW1fYiYdumCFmplLeXSH7RnydSC9mn7ixsaoF5iFHEptfzppilzKW8LE=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr14817247qtr.194.1566087731063;
	Sat, 17 Aug 2019 17:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190817220032.6778-1-tworaz@tworaz.net>
	<20190817220032.6778-3-tworaz@tworaz.net>
In-Reply-To: <20190817220032.6778-3-tworaz@tworaz.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Aug 2019 17:21:54 -0700
Message-ID: <CAMKF1sp_4ssTuRNUng2zSMQQ4e-toJ1bH=-h=hyFE5SJHfwAKg@mail.gmail.com>
To: Piotr Tworek <tworaz@tworaz.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 3/3] libgee: Update to version 0.20.2
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
X-List-Received-Date: Sun, 18 Aug 2019 00:22:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 17, 2019 at 3:01 PM Piotr Tworek <tworaz@tworaz.net> wrote:
>
> This is the latest upstream stable version of this package.
>
> While doing the update also switch the package to use gnomebase bbclass
> from oe-core. This bbclass uses much  better SRC_URI pattern that can
> also use GNOME mirrors.
>
> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> ---
>  .../libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb}        | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/libgee/{libgee_0.20.1.bb => libgee_0.20.2.bb} (57%)
>
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
> similarity index 57%
> rename from meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
> rename to meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
> index 190e5dd4e..94ea0a19d 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.1.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.2.bb
> @@ -8,9 +8,8 @@ BBCLASSEXTEND = "native"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>
> -PE = "1"

I think we can not drop PE here

> +inherit gnomebase vala gobject-introspection
>
> -inherit autotools vala pkgconfig gobject-introspection
>  do_configure_prepend() {
>      MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
>      for i in ${MACROS}; do
> @@ -18,7 +17,5 @@ do_configure_prepend() {
>      done
>  }
>
> -SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> -SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "d224dca55bb909f6730f40cc267337be"
> -SRC_URI[sha256sum] = "bb2802d29a518e8c6d2992884691f06ccfcc25792a5686178575c7111fea4630"
> +SRC_URI[archive.md5sum] = "45db478f2b300ada8e039ebc6c9458de"
> +SRC_URI[archive.sha256sum] = "9e035c4b755f46bfae70ba81cdcf8328b03f554373cec8c816e8b5680f85353c"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

