Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2AAB795CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:39:08 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 93-v6so1787229qks.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ucjW2dyjk/6Od436oYmjJV3qhIP7jOscR/PNxEytIbI=;
	b=P3qYPo7RMs35ojeGlskBLJRFCwlN/p6GfwpI+k5PN87vMyc19IgErgOZHbGo69+jIF
	/HzIKVqVieymVF37HLMZuCWlJeBM4G62jQKnwv+NLrqsrn/3njzvtBgcpi3c4Rv4YnQr
	PheUaPFrLCDPwMqLgn/IRbvfH19iLQ8Nf9ml0/kniOxukN8nEBkONhyYwsLP7YU3uOVY
	z1L1cIwcSAXHbWLZkKr+Re7HfK6g/vBp2JvfydBpt/h7aMVQR8jClHEpDgqwhNDeSM4a
	CRx168+zWop7SvBpznllPWgkkXjDhekcGzkgKUKK0lyTFUL2YjeFk90p17fwuk99A+GQ
	dhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ucjW2dyjk/6Od436oYmjJV3qhIP7jOscR/PNxEytIbI=;
	b=iuyjnbzQtJOB5ylcymG0c3H/hX86l0p1mz59eTZBh9Bw6XsxXqBv7B+ZFf/fcpV2yF
	fXFDPcX3zVdPQ3zzf9EDrspxMXY5+rmNGbC4YiS76v9Jwk0PkRdkFy5cRIBLMQw7+dPO
	Dv3WTnJSPvU+Ku48KGyB+26+XHUXeViz94CPyL2OpNv3mjB8RnPIiscTLqyq72bCRhpT
	cD4VFK+5/uQ11DSqurcxIyaAQjT8qbUW/NIwWvQmhpGIRzk8mkARqPILqznGCs1BSYEZ
	mrsK4KhLFAe73+1LTJopBDJo8xeILQ7Pa12cOFEyVxTxq8ThsC7r+YFRkqLRlHWu0taB
	eegQ==
X-Gm-Message-State: APzg51BBhAhFEiH7xnFZTotQAAGxCBsPVBQv6hSE/PSypSAxqSWekNJ+
	GObYZJf4EzPZQXSm343TRm+QmUOZYdhLZ0lpVaY=
X-Google-Smtp-Source: ANB0VdaVySfdYTDEiEwVqnYzom0Up/OsJIelrMwbNroQJAXWj6RSa52smAsvKKHDkjGUHsz4nCIpO7xdFkaaXPCKEQk=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr15878041qkh.223.1535733549555; 
	Fri, 31 Aug 2018 09:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180831144206.5151-1-ross.burton@intel.com>
In-Reply-To: <20180831144206.5151-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:38:43 -0700
Message-ID: <CAMKF1sq0ncAjsHkmSRrjbnkoFjiiXqK7nZ=x9TLw5r7=0ys=BQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] rygel: remove obsolete ossp-uuid dependency
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
X-List-Received-Date: Fri, 31 Aug 2018 16:39:09 -0000
Content-Type: text/plain; charset="UTF-8"

already in http://git.openembedded.org/meta-openembedded/commit/?id=7c407d7d5a
On Fri, Aug 31, 2018 at 7:42 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Not only was uuid removed as a build dependency of Rygel in 0.27.1, but
> oe-core's ossp-uuid has always renamed the library to libossp-uuid so it was
> never used (as util-linux provides libuuid.so).
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> index f13f5cec06..21331ffcb0 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "http://live.gnome.org/Rygel"
>  LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
> +DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
>  RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
>  RRECOMMENDS_${PN} = "rygel-plugin-media-export"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

