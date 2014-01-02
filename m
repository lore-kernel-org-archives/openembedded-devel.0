Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 96D3C610CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2014 23:18:14 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so18502694wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2014 15:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0ezP5OGafLbM1bPlqPhkSDfUcaWfdxArfQXuNQIOYnw=;
	b=kPApDH5opaYRYDpnWR7KpBAR72auuqbj8ydoxMK4VW1VAyDo45vMzVxjHCThhSRt17
	kFxVDiJ59/VQMgs9X8eRRNeDBLrwhVhvPFfmLU7/NVXOh9QXPsWbk+Bb0EUOlTVYMcMz
	TSi+C99eZaKsj4f5ofkcLGPUY8vbofqtL9nc5SpUuGoezScCirJWDA0EjzWbRa8UZtVE
	lO2Roe2ZE8SQeU3kKU53vnulept46GZmQB7ztGSvOaS6PLWkNoW1+Hg1TCAscPvHqKvf
	5H24XADpUxEZOIpHTGzS0d5gJgRgIck/l2NYL36GabwcIgDiYz9uvy8gSi00PZ4ZpZ5A
	Fihg==
X-Gm-Message-State: ALoCoQlfl5U9I/DdliZOzD4XQdZQsILGwWIpyWyuTDo8Y4IDTMjQAPHLftLHJB/mMnvPMqbIpVxt
X-Received: by 10.180.97.39 with SMTP id dx7mr7740728wib.10.1388704694736;
	Thu, 02 Jan 2014 15:18:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Thu, 2 Jan 2014 15:17:54 -0800 (PST)
X-Originating-IP: [5.13.221.193]
In-Reply-To: <1387298509-20865-2-git-send-email-andrei@gherzan.ro>
References: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
	<1387298509-20865-2-git-send-email-andrei@gherzan.ro>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 3 Jan 2014 01:17:54 +0200
Message-ID: <CAK18fxG_hv1GJegCQg=Q=S8tMtm2DkD5RmubZ_pey0CFDkcFyA@mail.gmail.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] libsdl-image: Add support for libsdl-image-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jan 2014 23:18:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 17, 2013 at 6:41 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> From: Alexandru Niculita <alexnick87@gmail.com>
>
> Change-Id: If4a11d3e0d7aa800081ac3361cf2662bb979dd7c
> Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/libsdl-image/
> libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/
> libsdl-image_1.2.12.bb
> index 459bf12..19dd4a4 100644
> --- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> +++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
> @@ -29,3 +29,5 @@ do_configure_prepend() {
>      rm -f acinclude/ltsugar.m4
>      rm -f acinclude/ltversion.m4
>  }
> +
> +BBCLASSEXTEND = "native"
> --
> 1.8.1.4
>
>
PING?

-- 
*ag*

