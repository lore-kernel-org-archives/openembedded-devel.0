Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6FF7324E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 16:30:46 +0000 (UTC)
Received: by qgez61 with SMTP id z61so11309036qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 09:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=8/sd43wmB0xWsRVEG1YsXHfqd9uRAehnVc2IxhgMfU0=;
	b=GCZTbCGM2a09ufHSI/ZaLu9q5PHEmAhK90tgV3cvagvyfmAWqP20PvzFexPDvlFmmP
	vwxtiqdVsWoVP2+mg65N3Mvux2I4Nai5u9DonwlecifDWxEDL90iK3CKfJCPS5Ueo2la
	wfBY6w/sUt5T5OMYuOROa2SuOG2kkzh4l16zFrQ8Eu7/wVqHfLQIybFgcGuEMVWt8J6V
	9IMZfbjNqSAlkBMv6e8hUMN45Qx60AQly6inRKcb3DviPyuQnIMxBy581iBvgMPdLQPF
	Twt9+pxQ7oGyQHLxg09h2nHIp0Mp7TeIeAOsbIaD5fG7duH8xjUw5222c1qZQbTIEJx3
	hi7A==
X-Gm-Message-State: ALoCoQl8EvurJdCPaS4lt8z3C7SP28wfZRf+6PyS8xG4MraprYm/i8zHG7sgWOxi/IWKrcKDniNg
X-Received: by 10.229.183.5 with SMTP id ce5mr12597563qcb.28.1432312247772;
	Fri, 22 May 2015 09:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 09:30:27 -0700 (PDT)
In-Reply-To: <555F5517.5000100@gmail.com>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama> <555F5517.5000100@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 17:30:27 +0100
Message-ID: <CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Fri, 22 May 2015 16:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 17:11, akuster808 <akuster808@gmail.com> wrote:

> I have noticed some breakages when building xfce, (libcanberra DEPENDS =
> 'gstreamer') now needs to be "gstream1.0". I suspect some of it is do to
> gstreamer transitioning. I will give a few days to settle before sending
> patches.
>

libcanberra 0.29 only supports GStreamer 0.10, libcanberra 0.30 depends on
1.0.

I suspect the problem you're hitting is that libcanberra 0.29 depends on
gstreamer which isn't in oe-core anymore, but switching gstreamer to
gstreamer1.0 whilst letting the build run will mean libcanberra doesn't
actually support GStreamer...

Either xfce should keep with GStreamer 0.10 and so depend on
meta-multimedia, or xfce and related recipes migrate to GStreamer 1.x.

Ross

