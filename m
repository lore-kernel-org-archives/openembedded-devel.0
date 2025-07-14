Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991E9C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:52:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.78649.1752501133958027857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 06:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ziK7hneM;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55502821bd2so4482073e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752501132; x=1753105932; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw1dWA0/DhICfW5mfZ7ks7dzp5Lp1X9sF0zX/+eeXdI=;
        b=ziK7hneMHxPqeLPt82zx6jD+rgYP4mLBEH7jlx1ciXDMXgznnSN4sAkSYT0KpT7kK7
         NTiqolU9i8Dzt3RdrsPdqpn4RlvSpmWFZzalXU3ZjD5c3B/ezQLlC3b9qVHhLPxflz2j
         pQOmZF31K191H7VUQhJS7xUkcM+bcU8ir9SCaHwxfWrkzV4yHkAcvEgXhgH9JtkUYiIY
         s2l1bEgZmgaysTa4/PhP4l22pDRMJ+URg+r4zwHvOphCjDidu7ZWcvsqKnAiS8WxpyH2
         UYDmjDpOwP0t1ciQKKfFHFQd7mC8MCU8XRr8yUjvW5O7Bvodgzq8S9DPVlJmA8f+f5Xp
         TH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501132; x=1753105932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vw1dWA0/DhICfW5mfZ7ks7dzp5Lp1X9sF0zX/+eeXdI=;
        b=qQbRwLae6tBxroF9hDicfC5+IRGbRNB4z3JAV5Ae0ZbXcxYkRUctr2SZLSbnvrI3qE
         3uCLW9NLdekprt88K3SfzTM+JdSXGCbR1Y6FEgv3b7EylJBNeYTUOR/gt8hd66xb3idu
         7cy7DnI8TYHi0Tqt3GCrn6kbzF99hWjqjjv6AjaosCPVSC0+DJsxnY6YoOtaGHfBznbI
         fiRNS9scIbFUKmIFye+eU01Lq33waXDNrh47EJdajTZRjS2rIDeO7YPCt7is49ul5INo
         ILKPhbxbfFBIjnnAiG5sh88DcqLJv+h8J1qqXswOLWjjYk8DZc/MZ5RnazXsgs+99Z/Z
         wr0w==
X-Gm-Message-State: AOJu0Yw+1LUqUJKdebdr8ymwwum1HxPe7q9zYeqnHsG8QyBBvNTOGuX+
	lQaPfzulQ2nBra3/47erG1kEO/g/6okapC137U4iaGQYkUU9ed39HB/F1iYekk8ieqU=
X-Gm-Gg: ASbGncuvfw1O8av5QHmqNg23F83ogfkpj7Fbd8ze1gESTTwDkKcBzDWjGuMTokwwHhq
	Fbtz72+IUlwF2VmMuydzEwMWICA3HadmFaMxqYNmgWvPv5QUqSsbPOgN4jc5WJVOC7BahERjT+U
	P/wFvCIJcA1uzZvJYSOL4j+2WZmkCNi2B+6Q+ru4aDkH6F0Tu4bqZwcjswM5JxmxIqbx/Ch0iF6
	4SZXloTYTMACVTNih6zqqw5VZdzXQWUjNfkKsS29CJiDPFT33oO8EcA6LRacEHvooedQlqFo7gj
	82ZRwk+klq/fPb/gcKp1EZ0qIIjgTKzxMEXjuKHUWjjWpxVcXnQq89YTcbqsiWcF5cv0f/1nH1+
	C71YKmarvdITZpwVoMnQrPpVghF2vMU3Xp8Ud0uuNgVfkvF73uDy82yqNApERNVs7UA==
X-Google-Smtp-Source: AGHT+IHqDaso58JBj0weswi+qydrVbFdTVrJ0/YlFwhvdVk8PU2u76cFFqNhA8a7RwWYesO9eAQ23A==
X-Received: by 2002:ac2:4c4c:0:b0:553:2868:6361 with SMTP id 2adb3069b0e04-55a044b3ef4mr3959305e87.18.1752501131722;
        Mon, 14 Jul 2025 06:52:11 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b7115dsm1963076e87.190.2025.07.14.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:52:11 -0700 (PDT)
Date: Mon, 14 Jul 2025 16:52:09 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
Message-ID: <aHULieE55wXsyrSf@nuoska>
References: <20250714134657.1620685-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714134657.1620685-1-martin.jansa@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 13:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118533

Hi,

On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.ids but
>   meson is searching the paths on host with:
> 
>   # look for usb.ids in both of the Debian and Fedora locations,
>   # and fall back to the system datadir in case we're building in a venv or prefix
>   vendor_ids_dir = get_option('vendor_ids_dir')
>   if vendor_ids_dir == ''
>     vendor_ids_dir = join_paths(datadir, 'misc')
>     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
>       vendor_ids_dir = join_paths(datadir, 'hwdata')

Isn't this the same as ${datadir}/hwdata ?

Cheers,

-Mikko

>     endif
>     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
>       vendor_ids_dir = '/usr/share/hwdata'
>     endif
>     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
>       vendor_ids_dir = '/usr/share/misc'
>     endif
>     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
>       vendor_ids_dir = '/usr/local/var/homebrew/linked/usb.ids/share/misc'
>     endif
>     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
>       error('could not auto-detect -Dvendor_ids_dir=')
>     endif
>   endif
>   conf.set_quoted ('FWUPD_DATADIR_VENDOR_IDS', vendor_ids_dir)
> 
>   it shouldn't be looking at host's paths and and on hosts without
>   usb.ids in one of these locations it fails with:
> 
>   ../sources/fwupd-2.0.12/meson.build:323:4: ERROR: Problem encountered: could not auto-detect -Dvendor_ids_dir=
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
> index e25fbe1f54..eb43c3d865 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
> @@ -37,6 +37,8 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
>  
> +EXTRA_OEMESON = "-Dvendor_ids_dir=${datadir}/hwdata"
> +
>  PACKAGECONFIG ??= "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \

