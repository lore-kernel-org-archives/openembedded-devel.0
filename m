Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 90E9F7F849
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 05:25:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i11so6055050iol.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 21:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=69VWZcJN14/hG+Glj8WM/vHP9Mq49RjZ3I8xU4OEq+g=;
	b=RuQbHHuPqxCQhyh4ZBAmWz+vuBLWLt6Hy46MsfL2gu2PgNi1PgeRXkWKGBkNsQIOUT
	vTx7bsaiUO4IWc/NMvs/mXpwDvJkU62ThqjUJTpotHBzVVMTA8Ig/1Qy+jELL2rKU5J1
	BS5kyMB0UR0HZwkghUxvgtezxdGu5Fc29J6/rYifYqhF5JEl866nb7L8wBsaF2FlzD8S
	bJ2IDdSadLf/eeVDlFv4xDW/h5bGjZkklLogLR4OwkfMcZe1Zjh1GHok9tuHuKlWx7CY
	HXmUPsMuY7PKV+4y7PnKBhKgCEjqoDwKt+R8C1kEMFEWIU606WudKTgMjEYqGxyueOdi
	ybEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=69VWZcJN14/hG+Glj8WM/vHP9Mq49RjZ3I8xU4OEq+g=;
	b=kzTz/bVJX6zUimmib8QL3g0WB44fnI7+EWg8zR5Dt7WU9/2Q0q/QK2JNvTwLtEFBWf
	QnZtlVzka/zwosxNm4luRyyPtRrRxX0EqdoAqiO2ZnooxprPqboipSmmQF7FPTkryiJD
	fA1OxmNMsVqCTQ9hhG6/7R3g99qcU1cMyN9FtfON5KnxpVwiYNr3/Q3kPkdSFPEVfeyV
	gYYmf4afOk1DbWwrORRL9+sKV59puRS50Pv1Xp58z7yK3ewfhM+OQR81CH25vGXxo4DJ
	1EsmM6RxPFsUx7K6z6WlAeICjp8MZsZuD/1HqShSGDx72KRy4oIKkKe7R+EnA+kXnkjD
	75hQ==
X-Gm-Message-State: APjAAAWpzYBJIGZNnTVXH3OnJp8yG7Nz/NyV6DKkOz+yIN1I6shH2WXO
	4Y1ahc5b4itI3Kg2eK5HrCqVrwJAlL4=
X-Google-Smtp-Source: APXvYqzHJYFUvKh/ySjW9cw+cUsYly98si2zk+ZV3ip6pzex9VfY4Fd/IB31+w6ABzzcUkL5Vjofdw==
X-Received: by 2002:a5d:89d8:: with SMTP id a24mr9495341iot.70.1575609935592; 
	Thu, 05 Dec 2019 21:25:35 -0800 (PST)
Received: from ?IPv6:2601:646:8500:1c20:f522:3e2a:85ae:c5d2?
	([2601:646:8500:1c20:f522:3e2a:85ae:c5d2])
	by smtp.gmail.com with ESMTPSA id
	o11sm2887809ioo.55.2019.12.05.21.25.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 21:25:34 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-13-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <67cde0e0-152a-ec39-66a6-0940fcfad0e2@gmail.com>
Date: Thu, 5 Dec 2019 21:25:33 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191206000912.19841-13-schnitzeltony@gmail.com>
Subject: Re: [PATCH 12/21] gvfs: upgrade 1.41.2 -> 1.42.1
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
X-List-Received-Date: Fri, 06 Dec 2019 05:25:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/5/19 4:09 PM, Andreas Müller wrote:
> * 1.42.1 is latest stable release (and I don't understand how 1.41.2 got through upstream-version-is-even)
> * @world builders: x11 in DISTRO_FEATURES is requred with gsettings-desktop-schemas added to DEPENDS
> * gconf support was removed ages ago
> 

https://github.com/openembedded/meta-openembedded/commit/9f607e4ba6ea6c6ffb977b1f9a8bb117396aa9ec

and I checked jenkins logs during that time, it does not appear in there 
as well, so I cant remember more, but its an oversight. This also means
that when this commit is in master it should go into zeus too.

> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb}           | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>   rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb} (87%)
> 
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
> similarity index 87%
> rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
> rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
> index 27e3f92cc..6888eff8c 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
> @@ -3,15 +3,16 @@ LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
>   
>   GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase bash-completion gettext upstream-version-is-even
> +inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check
>   
> -DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
> +DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native gsettings-desktop-schemas"
>   
>   SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
> +SRC_URI[archive.md5sum] = "93592535508322548d44fa036b635a0a"
> +SRC_URI[archive.sha256sum] = "9d06071b4a1d83671f76d0e3c32b66631671669d330fe21702f60a8611c37730"
>   
> -SRC_URI[archive.md5sum] = "9a9a97a63bb9e87258d48086a6bdacaa"
> -SRC_URI[archive.sha256sum] = "f311b7c5f855ebe259960c00c7d03c812e040928ecb0ec093b50a4f16b3bcf26"
> -
> +# depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
> +REQUIRED_DISTRO_FEATURES = "x11"
>   
>   EXTRA_OEMESON = " \
>       -Dbluray=false \
> 


