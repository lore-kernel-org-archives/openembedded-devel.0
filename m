Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id CF1F67F265
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 19:13:29 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id h21so82019367qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J2dqjIdrI23nHfmmiZQmBmqxQB3XqiqmyAp/VThzpqQ=;
	b=O+UjbcedcEPtqyHGPMEdV61wMRSWucayE+QswFvlSaMpHrWqLftANuTbLvc4P1YVM3
	wf3Q1qHzULWHsHRcPMdB2O1b+7MsgHvsP9H/iV9gc+lpFkMUBPcAckq37DH9EBRj0yam
	8jhGAL3T8Wms7N+TwDbcWr9q3mp+hF/hZI2F0rDvJjzG9ITh8n6Xfil81spAvlXZ7jf2
	cDbheeqSbYzLBwyGk/3Bvip3OA2IUCE5rynOjDwXWQ5p26/DPXXJaZ1GpOn/5fwkB8BV
	JokwScHa1O5DwaQRhTDzm+Xfx42qtGRkieSsUBlcI73ullWMrE+axtjNPlI6Hf87xL1Q
	H4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J2dqjIdrI23nHfmmiZQmBmqxQB3XqiqmyAp/VThzpqQ=;
	b=DpiZzbA4QQDc3t3KEU21rSbKKTpL6geMoYQRqH5VWJsmq8ub/1H67JigkpI8lBBesE
	rCKiU4CSI5r36Dr7DimdbOeUqY1Z914x30AhJzjmNVFtStFbdFRPaki8ENuQfr89ZFU/
	vH7lMGVByHWgOjx/lEYPWWO7DG2r9EhquY9gWKOWqk4mFwEiNYK4uWFu5HpYt51tZHmt
	OJpg+MTXIyHXc18gqDs5MZzglzyFI5Ntpzh5qvvSTwWIhuzV1QTPp7QBwDPnTHnJw7Cv
	45GNC5qA0dLkNvYNbgh9sWnhsSSIt7HNHxPBV98ktoZM1OWZ9I3j6+8JXjqWQ92gfV0E
	7GsA==
X-Gm-Message-State: APjAAAUITCKFmrXUaveqmGVah62FbbizxCx5bFwI6E/SdZ4+kftNT/PE
	99nHxCuI8tUxT9Pk9f1R4wcH8LUpEV+XpCO0QjfoCy/Y/VQ=
X-Google-Smtp-Source: APXvYqzUbWmD+4kFUXyBOAeTpzXpkjfjVQCwKQKzwcPr6marJZ3K3D+24WquBL+l6rkPQ/kOkPqcqMhivWFeX29uHTo=
X-Received: by 2002:ac8:525a:: with SMTP id
	y26mr107820238qtn.378.1565032410518; 
	Mon, 05 Aug 2019 12:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190805182453.30420-1-bunk@stusta.de>
In-Reply-To: <20190805182453.30420-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2019 12:13:14 -0700
Message-ID: <CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Mon, 05 Aug 2019 19:13:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 11:25 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> index d442925ee..efcd5e42e 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> @@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
>
>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
>
> -SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
> +SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"

perhaps use BP instead of wireshark-${PV}. Can you make that change as
well while you are here.

>
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

