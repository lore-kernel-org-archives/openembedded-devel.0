Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A145A7D697
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 03:30:09 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id f24so644197qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5ESgiVkKwKR+Ar6JggUoQKOLZRNtrux2rcUcy5w0kZA=;
	b=MsoNmgfPqB1mKq/Zv+5z2nZo94awgbtDG3LdMutHop4sGbsMRFlKXrHgljnpP7NhjR
	ltLZIoQ+6Yi9ovAyZkFLHdWZ38T6KAjnVfXpZdNOj14zGNCHBcej9ZSL857MGPRqsjaD
	7czNjkuvTPx7d2ZU69NscX2O1uuhOjq7QXjHAg0Rfb44C6pOFIU38QYtzUum58sUqDuH
	IORSMgIiqq2qBitmU8uURD8euAtUfgF/UNeHlddhzVPxdNym5zN3uQ0dNLsxVYCE2Soh
	wMAoE8dT5PQkw594LcbIutbBwlTYHxDr4YCAnwc0S6XNClqM/SNAqoONA9zY0ji+WtMS
	PI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5ESgiVkKwKR+Ar6JggUoQKOLZRNtrux2rcUcy5w0kZA=;
	b=D1EV9W+oIdsCbdSVm1bITiwHvGdjI09qcw/ANY9EZLhk3oSy3/GmOFjfcCFlludS4N
	nn3GjJZpiEY0NTzgbj8V6qeQgOzxb3MbfoL5O+aTLnDw55ZontUKa42eMkRkReuu9/E/
	Cd4arq2WpTrkqgtQwx4N3du5kOi+RimeU5AxoGBznkRerTw7v9YQ2udUdEPsj9VmiWRr
	TcreFIKBGrV9pIMT7bmZcDMo7qIbt4kX73y3bY7gkL7MTDzcLmFZ/w2+YcyUvsXdscYT
	R1xWtCJzzLoKAWPjiqPBIP2F7bmuNCGujFkofHfFgDCuPRyw4bXIY+vXCUdattRrSF5y
	o8+Q==
X-Gm-Message-State: APjAAAXedNDXqBJh6WpAP5r6rtkGD7Z+OhErI7wYNNHsKBx7CdMarYaS
	WzIO4sUw1su+ZeS68axlNYu1S7vUN5fqFKYdl05q0xJB6s4=
X-Google-Smtp-Source: APXvYqyjCabFVOs1Dywr8kB/l1ONatpgUlc0buLIR4MJJCj1i9hsG9noLfzVUAs28B50mKJl5k0kJLuz39SbO8ssIWE=
X-Received: by 2002:ac8:2a0b:: with SMTP id k11mr7479186qtk.29.1557459010233; 
	Thu, 09 May 2019 20:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190507222212.1808-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190507222212.1808-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 May 2019 20:29:44 -0700
Message-ID: <CAMKF1so9YYSGVFzLD-9tt-UmRi-x6n3HtK3XiVXo0gQKe0FOXA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] libnetfilter-conntrack: update to 1.0.7
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
X-List-Received-Date: Fri, 10 May 2019 03:30:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Oleksandr

this is breaking conntrack-tools I believe see

https://errors.yoctoproject.org/Errors/Details/239969/

On Tue, May 7, 2019 at 3:22 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.6.bb => libnetfilter-conntrack_1.0.7.bb} (63%)
>
> diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
> similarity index 63%
> rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
> rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
> index e4e186bdb..5c8150156 100644
> --- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
> +++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
> @@ -6,10 +6,9 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  DEPENDS = "libnfnetlink libmnl"
>
> -SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar \
> -"
> -SRC_URI[tar.md5sum] = "7139c5f408dd9606ffecfd5dcda8175b"
> -SRC_URI[tar.sha256sum] = "efcc08021284e75f4d96d3581c5155a11f08fd63316b1938cbcb269c87f37feb"
> +SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "013d182c2df716fcb5eb2a1fb7febd1f"
> +SRC_URI[sha256sum] = "33685351e29dff93cc21f5344b6e628e41e32b9f9e567f4bec0478eb41f989b6"
>
>  S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

