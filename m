Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8BB7CF3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 12:20:30 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id 188so21029757itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 04:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lYW5mxUc6zj1EXI2lOooof94AAtw9Dpe6ZMIp96+ens=;
	b=bsBn+xz+VxDaTtsBLsx2Joha+2Bue7BNAry0f3GbYRO10Mhvc8maiNeLh9yOnd9rCo
	TJzyFRJTzYdvLc8A2vJUuKFaYRHjZ45wRP34PAb4wd1D0/yD2odZK6L4D4cmF1Tq4qhB
	cc/ZSBL2eNMKqwf84RSTfe8maJDx4r09Et+1G6fVCchIu3SEIru19kOjnFfuiZCOAAWQ
	YH4neq01Ljw+44zLn64+V9M2Jm/h3RlYbaIXQaKox/ORe48zRdK8jHbej4IyTKZL6z2o
	7/+jN8ZZyv16pB7tlnN7fEJH21zXj6dBbowM6CJemLB8L51oJS+IuZEH6j63tHuStn6V
	KWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lYW5mxUc6zj1EXI2lOooof94AAtw9Dpe6ZMIp96+ens=;
	b=GWqLPJSQHLxXULi9R8hS9za2kIdY2z3MaKTY9LuItNfTdPgFDkqPi4iOwKdEIb3bd9
	QlFk0SmpiO1oTaqa26RoVIhO7+91ByUh4wwIy6uezqU+IPafR4I59NbBT3+H8q3ugLGh
	iXyfGzod+BTiiWQ0b+jmgP+nDjlKrVRY6YUpgD1hAkJK0eZKAtvwstuYrCwAmIyr2XRX
	jUIwIOUXxv+/A6cKTgK8ouXuu6HISQQFn/Xng8PrvIIozFRoHyxe/8sNexLsHy7tcxjs
	OsHZJptaYmfQgYGjxADGjRT/No1LldIjRv3Eyyj1sNa39VvBGdWHYxk6eRbz/57H7ICW
	p3og==
X-Gm-Message-State: APjAAAXvhaBKvUFCKtjtYoJknnkc6U4EghRSvTe2T0Ebx9+eX11WQQtW
	X70MzxqtKGUxtjmISu5CT6GWGo1juDDgPI0GOBHpYQ==
X-Google-Smtp-Source: APXvYqyl9B/3qkcOTBalX/4ccac8bbT8WYXq2Re/9tMEWYhyD9c4UqIwkBQSBFqe68s93e1blbvmv+0vaJVyw0QMCCg=
X-Received: by 2002:a24:7294:: with SMTP id x142mr7663650itc.26.1552047631454; 
	Fri, 08 Mar 2019 04:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20190308013237.194105-1-kai.kang@windriver.com>
	<20190308013237.194105-6-kai.kang@windriver.com>
In-Reply-To: <20190308013237.194105-6-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Mar 2019 12:20:20 +0000
Message-ID: <CAJTo0Lb2H4FQjuP1mVx2+VHRvd1jbHevH1aG5ak6mkn6seLfeQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 5/5] libgtop: 2.38.0 -> 2.39.91
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
X-List-Received-Date: Fri, 08 Mar 2019 12:20:30 -0000
Content-Type: text/plain; charset="UTF-8"

Development release, instead add an inherit of upstream-version-is-even.

Ross

On Fri, 8 Mar 2019 at 01:34, <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update libgtop from 2.38.0 to 2.39.91.
>
> * reset LIBGTOP_LIBS to avoid compile-host-path qa issue
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb}       | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb} (60%)
>
> diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
> similarity index 60%
> rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
> rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
> index 494934fe7..fa5a1d394 100644
> --- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
> +++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
> @@ -7,7 +7,9 @@ inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspectio
>  # depends on libxau
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> -SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
> -SRC_URI[archive.sha256sum] = "4f6c0e62bb438abfd16b4559cd2eca0251de19e291c888cdc4dc88e5ffebb612"
> +SRC_URI[archive.md5sum] = "b50a24e8c70af532c5616f42f4ec71b7"
> +SRC_URI[archive.sha256sum] = "3428e3901c80a572d7f7bdf29cc0ecb733cc314038ba3d45093a84f314271f0f"
>
>  DEPENDS = "glib-2.0 libxau"
> +
> +EXTRA_OEMAKE += "LIBGTOP_LIBS="
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

