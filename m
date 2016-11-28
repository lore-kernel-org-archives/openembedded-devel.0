Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 15EEA71B59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:58:58 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n204so144116368qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=YIJlmNinqHenPnK2ZMnEws4c0H2+eTwxZDg9JvqhOXM=;
	b=fJf7QtsySbZrRg2BICHxLnC2jBqoaa3hHwVgcNzMEYuzOHQ5g+yV1oNaskUoE3/v0O
	o8u6PZTM1NoXA2vsKm+nHIZyAbmP1QZYbgWHHRyktK88VjAF6Wz0Urx3QLs22o62UBcl
	2na3gir3Bh2fTrYxuJ3ddJp1wfCkK2b/GW8pvVFCzdl0RR7JbJKGX2ffiUetlZSctwwA
	tcfPjAPRFFxkLKLulfMMwd0PMhJZmtJLntyYy83ti8Pddfh+NVMEBUebavMqMR7Pz/kc
	h4NddNObMgRqePDRyDpj2Houjl9pYltxsoET1eyit6UXWCVNcFhPpZsaaadfUfQZnSDo
	+6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=YIJlmNinqHenPnK2ZMnEws4c0H2+eTwxZDg9JvqhOXM=;
	b=TSs+q/Aw8ubZO5j6TfHq8HK1Y0kPkZhlpVXO8VKzdRUvEAU9TCEx64ORGtIgFstwQA
	2St08LTtkUlMHZiCykyJos1sRxaXLqRgxgo+4HZkugT4/SsbD8HtB8ByZVa6pxvBiPK+
	rbZY7ZM0B6HDYhkcckjYd2qI/xycGiAypZ0vN/haXqLl9YqLYLWWU/yqbKWZt80tSUx4
	M1YtmPiJ8s3psPeARdNZNQ9RAzy7+y3gXPEFZ3zCHs9i3uSWIgG3rxOTWepb8fSSiXuf
	HIZCFmavLJok7OI53cuZo02yoI5uNbMtV/maM7x1vLPGRvJ7iwAfG1Q0ts7pqrumx8Oq
	Qx6w==
X-Gm-Message-State: AKaTC01glgUxZVK22WQNGHi8E31tryJOFvvodfm4NSoN3WKTBDZ/VdWPJ8Ro6gTHaMW1jvuKZC8pPdC/yyj/7Hsv
X-Received: by 10.55.5.145 with SMTP id 139mr19466510qkf.77.1480348740082;
	Mon, 28 Nov 2016 07:59:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 28 Nov 2016 07:58:39 -0800 (PST)
In-Reply-To: <20161126001115.GB3271@jama>
References: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
	<1479910421-28750-2-git-send-email-ross.burton@intel.com>
	<20161126001115.GB3271@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Nov 2016 15:58:39 +0000
Message-ID: <CAJTo0LZHj_WNK3OnzK4acokQ2sis7HD=bA1=W-OK361r86Kv-A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/4] meta-oe: add explicit dependencies on gnome-common
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
X-List-Received-Date: Mon, 28 Nov 2016 15:58:59 -0000
Content-Type: text/plain; charset=UTF-8

On 26 November 2016 at 00:11, Martin Jansa <martin.jansa@gmail.com> wrote:

> Doesn't it cause libgxim failure reported here?
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-November/110050.html
>

In a sense, because the configure would have been throwing errors silently
that gnome-comon wasn't present.

Sent a v2 incorporating a change to disable the fatal warnings in gxim.

Ross

