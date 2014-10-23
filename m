Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2201565CAC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 15:47:14 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so893585qgf.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 08:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=6FkgVSJT3G+CVtrw0qF7JQhD23r+Zb1FNapo4J4J/go=;
	b=CkLd9g7+mlPTtyoK3jijr8CUVJYIzgD8JgZ8wh8OXOKMtS1mESA4ib09/RIjT3HG5b
	IsJiYMU/1MtbVJjYDvNPaP1PPY3IU+/GtAAMBb+KLdIjTiZXMSyRYC7QQk03UHMs5NNG
	qttoY9z/Kgg/vcxQmvWmIsVDQExvOnpC+BOZRgxesGd5GTMk/uJcEWa/bNDdqo7kAtnP
	4YYRE9oY0Km6mmQFJteJfMLrJF8B5Ws6Z8IQWmf1MXraPWBRAwoez/YudxdNmYCnHf41
	VGRe17jPpdR3AvXbJsj2f47hdYGPZIhZE7gvsRsgsHfl2rAaztTK51asRFWGXs1Iy2wd
	6HEg==
X-Gm-Message-State: ALoCoQnvtNB1k3SN5VzC9j4owoAMpuCKuK3h7VLJ3iRZlGGW46OKFGBXbbOvfcuYXHBiLm1sZ9UZ
X-Received: by 10.140.96.101 with SMTP id j92mr8244722qge.87.1414079235069;
	Thu, 23 Oct 2014 08:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 23 Oct 2014 08:46:54 -0700 (PDT)
In-Reply-To: <1414055575-31631-1-git-send-email-rongqing.li@windriver.com>
References: <1414055575-31631-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Oct 2014 16:46:54 +0100
Message-ID: <CAJTo0LYpozrqFzrqHDhs5D0qTwGftmUagdVsJUd3T9hfX1m5fw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-networking][V2]inetutils: Use texinfo-native instead of host command
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
X-List-Received-Date: Thu, 23 Oct 2014 15:47:25 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2014 10:12, <rongqing.li@windriver.com> wrote:

> +DEPENDS = "ncurses netbase readline texinfo-native"
>

There's a texinfo class you should probably use instead.

Ross

