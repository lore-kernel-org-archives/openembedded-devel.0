Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB4F7017B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:24:41 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t10so74362pgo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=/queBhdymLAC9REvUL8YH867lTGk6X50pGEErymvCWs=;
	b=CcZIEjbSyGxRjEKW+6hhaS0+NoE0xypbG33zkCQYFgw3r2JwMpN/e4fJgMTzetrD6s
	ELwBGAxDbBmpCW0aURYYztCOaV6uxWKSV4W9wpFxtDaONMDBH4U4aX/XA1Ce2ArsdbUU
	ai2UTXqyctm1PfYJQU2l75oF+YSjcpN4FBcVQ72ptZ03PlsV+obC6t+nO1eY3dEm1Ko3
	gJyQqYKZ1AIT3HLMBfEX8okOXji16XUG9rY6JwntHWjQtEbpz6koyj02ZM3ttyqDcaUF
	OzHEdmYWUXvqnYtyVYRkVyD+L1kTaT7BmY9Ef7DiWBHCthtUbCEjCZ6As4yquHuX3SK8
	TWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=/queBhdymLAC9REvUL8YH867lTGk6X50pGEErymvCWs=;
	b=r3ssEfjMzqIHDJvKOqknAoDylJD4BmX73hcG2ncqXsj5CAn8BkhvdADIzhLl2o+r+q
	/Z0Mwt6hLWGbOqHzdDlZyMglsBHL9NqIyJ/kP4S+Pbz1A70ow14MWta3x8RGjF2dFTBO
	re0PTkutBpGZ0hl0Gq4MgUiQ6XNb6RDWcWlK4IHDDk++V9LSG62hMdjEgNuvYepIyAMY
	9lZkbnCCXjbNYode6eOIfsU3xjRb3y7D/DnW2/3j4LkxHUie6lloqg+8CvzFnys1mr3s
	5LhlGwQxDn63X9izn1Xzq9zgENMVZGWwkeUk6XL4Rlr086s3/h0yPr6GFMQE5G41KZhP
	sCMQ==
X-Gm-Message-State: AJaThX5B2rEowVYlTkoTVUROrudqqw/PzQBNh9dlTNv7/qMc4wIPUJtj
	DrkLW/bMSXuP7B6ylhwM3A64LQ==
X-Google-Smtp-Source: AGs4zMbdI/OZDUkdpH/xXVB3T+A/v+dzEY1h07DklhoGdlL5Isz4V/VZhzAFyDz31hKIELX45JvGlw==
X-Received: by 10.99.3.146 with SMTP id 140mr2663809pgd.275.1510860282789;
	Thu, 16 Nov 2017 11:24:42 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0?
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id
	m11sm3453819pfh.35.2017.11.16.11.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 11:24:42 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
	<1510857125-8109-2-git-send-email-akuster808@gmail.com>
	<CA+chaQf0yutP8Tfb8Er65DU0M=k8BQ__EU7pc-E5qn3-BWjqsQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d59e9039-a93c-b0e0-5f83-d2569360e707@gmail.com>
Date: Thu, 16 Nov 2017 11:24:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf0yutP8Tfb8Er65DU0M=k8BQ__EU7pc-E5qn3-BWjqsQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty 2/3] flite-alsa: Fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 19:24:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/16/2017 10:57 AM, Martin Jansa wrote:
> does this issue exist in master as well? IIRC I haven't seen it in
> recent reports.
I have not either. Double checking on my local build system. I still
need to check pyro & rocko.

>
> You might want to use ${PN} as in PACKAGES:
> PACKAGES += "lib${PN} lib${PN}-vox8 lib${PN}-vox16"
thanks for the idea.
- armin
>
>
> On Thu, Nov 16, 2017 at 7:32 PM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in
>     the elf binary:
>     '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa/usr/lib/libflite_cmulex.so.1.3'
>
>     ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in
>     the elf binary:
>     '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3'
>     [ldflags]
>
>     ERROR: flite-alsa-1.3-r1 do_package_qa: QA Issue: No GNU_HASH in
>     the elf binary:
>     '/build/build_artifacts/morty/tmp/work/i586-poky-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3'
>     [ldflags]
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/recipes-support/flite/flite-alsa_1.3.bb
>     <http://flite-alsa_1.3.bb> | 4 ++++
>      1 file changed, 4 insertions(+)
>
>     diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
>     <http://flite-alsa_1.3.bb>
>     b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
>     <http://flite-alsa_1.3.bb>
>     index 51012e6..19d789e 100644
>     --- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
>     <http://flite-alsa_1.3.bb>
>     +++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
>     <http://flite-alsa_1.3.bb>
>     @@ -10,3 +10,7 @@ SRC_URI =
>     "http://www.speech.cs.cmu.edu/flite/packed/flite-${PV}/flite-${PV}-rel
>     <http://www.speech.cs.cmu.edu/flite/packed/flite-$%7BPV%7D/flite-$%7BPV%7D-rel>
>
>      SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
>      SRC_URI[sha256sum] =
>     "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537ab78a8b"
>     +
>     +INSANE_SKIP_libflite-alsa = "ldflags"
>     +INSANE_SKIP_libflite-alsa-vox8 = "ldflags"
>     +INSANE_SKIP_libflite-alsa-vox16 = "ldflags"
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


