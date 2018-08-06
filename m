Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 730BD71BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 09:05:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7695GaE022150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 02:05:17 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 6 Aug 2018 02:05:16 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20180806085408.44739-1-kai.kang@windriver.com>
	<20180806085408.44739-2-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <94e0eebc-f76b-5bbc-66d0-f21a721d5086@windriver.com>
Date: Mon, 6 Aug 2018 17:02:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180806085408.44739-2-kai.kang@windriver.com>
Subject: Re: [meta-gnome][PATCH 01/10] libwnck3: 3.20.1 -> 3.24.1
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
X-List-Received-Date: Mon, 06 Aug 2018 09:05:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月06日 16:53, Kai Kang wrote:
> * inherit gettext to fix qa error

Oops. The recipe exists in meta-gnome.

--Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../libwnck/{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb}             | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>   rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb} (70%)
>
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
> similarity index 70%
> rename from meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
> rename to meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
> index 02149fbec..f3103b4d7 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.24.1.bb
> @@ -10,9 +10,10 @@ DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
>   PACKAGECONFIG ??= "startup-notification"
>   PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
>   
> -inherit gnomebase gobject-introspection gtk-doc
> -SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
> -SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
> +inherit gnomebase gobject-introspection gtk-doc gettext
> +
> +SRC_URI[archive.md5sum] = "23df51ec0a1169014fe3a102d572b244"
> +SRC_URI[archive.sha256sum] = "afa6dc283582ffec15c3374790bcbcb5fb422bd38356d72deeef35bf7f9a1f04"
>   
>   inherit distro_features_check
>   # libxres means x11 only


-- 
Regards,
Neil | Kai Kang


