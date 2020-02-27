Return-Path: <ricardo@foundries.io>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9A65B61878
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 17:53:24 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 66so3740199otd.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 09:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xwOruZibVj+6qRtLfEumG/9hXR249URM9SH+xXkDaV0=;
	b=0T5IbLAa8cR8xmdWrLt66btems6rwVgJ5P9RIAFgVuSIq3l09NzLLEbO2tnzD7DAPe
	IK9ECGIR8yiqTNEsuCAjubI/OVRZAd6Gjbk+S3AHvhxHfdiDqhBRKJDurSzPuKHsnnMu
	H2ZbJs0QpQ8aQJ1dv7teeARd7Qnv0J7n+RHctYWMnsXrFUoaUCQmjEkLRyBG3/8QfvaK
	19K4nYj/Yvtbin+noAo/ugvJ4AAa49vaJGRaj+iJF+BHlEBvzOb3ydDQbfj0BrgiII4Q
	FFa4XIXyCfwCYqmhIJjewz19NQXR1XQF6Eu4Ofvj4gIPeSNxaKhH+Ln55iXu1E39SEh/
	7rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xwOruZibVj+6qRtLfEumG/9hXR249URM9SH+xXkDaV0=;
	b=jP6GQXprBTaengMpX+YNaSwCJv6rpGY5gw53wHGGExtuVedHJR682p8whzX9Lh05Dw
	ET1s/Wzdkr8EGIQKO2iWkBZA1x4bGA7YhEF641nUxLD0XJ9joVN4PINZUu019CEqGsf2
	EKYAYOarBWIru9O60CK1/SiXWz27GEG7pbOJVBDnakWDpnQMElQ1qd5AUcF2Zu69qL3m
	It7evMpgKQWK2yU9AsMCgaIN7rHkbupppB9+PzVvxJKiFFRzNuWpugVySKjydY/yXIaE
	TvYGh/uCN5gK8j19rpXOKHv44TwIrBBqQ9P1vUSnLXlqWd/MGe78jrQ8F34rlNxap2AO
	F77w==
X-Gm-Message-State: APjAAAXwiJ8JHdwYMo8PZUByuC4kNTVUDvNedHGJ0mMzQziyhPYbIhh8
	cAkTtbw128lqqNv4HSrkTnbMn89G3hMx0IczjUro
X-Google-Smtp-Source: APXvYqxS+112FuclPZEP6Y/NinMZqWMVBR0VGv4sTZAtJ32iU4fO+Ocuzu+rDaZWFmro7AJIx9Ij+tUEYLNm/dFUsdA=
X-Received: by 2002:a9d:6647:: with SMTP id q7mr73214otm.35.1582826005525;
	Thu, 27 Feb 2020 09:53:25 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-5-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1581723823-21171-5-git-send-email-wangmy@cn.fujitsu.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 27 Feb 2020 14:52:49 -0300
Message-ID: <CAAaKDhE__cs1WdFWSN7_JRDfX_TzyxUr0eQpYWNTRSxvmdoZ7w@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libp11: upgrade 0.4.10 -> 11
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
X-List-Received-Date: Thu, 27 Feb 2020 17:53:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Feb 14, 2020 at 1:12 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libp11/{libp11_0.4.10.bb => libp11_11.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_11.bb
> similarity index 93%
> rename from meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> rename to meta-oe/recipes-support/libp11/libp11_11.bb
> index 655db4907..5a0951df2 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_11.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
>  DEPENDS = "libtool openssl"
>
>  SRC_URI = "git://github.com/OpenSC/libp11.git"
> -SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
> +SRCREV = "e1210903291b1de9eabcad26e740a4b2fbcca692"

Is this change really correct? The latest libp11 upstream release is
0.4.10, as you can see at https://github.com/OpenSC/libp11/releases.
The next one seems that will be 0.4.11, so now sure how it was moved
to 11 directly.

Also, the SRCREV seems incorrect, as it is pointing out to the 0.4.9
release (https://github.com/OpenSC/libp11/commit/e1210903291b1de9eabcad26e740a4b2fbcca6920).

In the end this change is increasing the PV but moving SRCREV to an
even older release.

Thanks,
-- 
Ricardo Salveti

