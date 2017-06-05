Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4865A77CDB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:14:26 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id l75so13991665ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NXYMnDCdIqFg2BjnFh+i39ilREqybaTCMon2GkWdHsE=;
	b=Aquqno2QKDETUudmnsgyjGwyYhi1YR6qXbQzJpYremixlq1ANnB0vcGLkEWBXqiOuQ
	6J6yie05mTOX4oqY38tv+JZw5J7AInJ9W8oR03sq6PMJ67ANeRkEMQ4O6uSw8IobbxRH
	TWR1LyArBiOeus3KXecmKUYhd9kkPdRemPJlWABv9nxplUgohcgVU4VRz8oZ7VGgjbDz
	V1g45blHKgmzqI/sXVBlHQp++696TmkfchLCYYgvRM7Pdv8SICNjykYImgp4F1qAL/sI
	/t5nDH6wxYo6b5z2WITA4Nh8ySiLsEjTxPmwgxDf5Hbd5WzzspA9XKWt95wMMPUW3cFG
	6+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NXYMnDCdIqFg2BjnFh+i39ilREqybaTCMon2GkWdHsE=;
	b=gepAdIZ2jUPudRYG4XzI2u/ajlwz9JkDbQ65khuTwJ2TRvkDedvYvk9Fh0OmzmDN06
	xtp9cQR2sLuC32R5Igp28kogI8qdgf1SOhcwuXL1SODcMHQE/RBYofSLrkKouIXhNGXj
	PWB0dM084vXC9fWVexU4BuA77iColGlfg4elOHUN8HZ+shMCYnn0UhERMIgD+DSc1E2D
	fXBMw/V5yPTLBU+6n2kzPWijjRrmCQv1yoijTRvJr+GpP1XniyX9P9rt6Bc1D+3zuAst
	+gL2u2eRvEKAGBDmXfz8UuuBKXG8j8T0jsmZc6luVyoNMdAup5y/L+qsELMaQOh9UeJd
	KllA==
X-Gm-Message-State: AODbwcBXUGRcUMr9nQz1SpWh6iF3HPZ29qrgaHEMH2Lop0/E/eEtzemY
	0pm1OqhNhDZCOJr5qLgYofgCQuw9Yg==
X-Received: by 10.129.55.14 with SMTP id e14mr6378871ywa.33.1496661268166;
	Mon, 05 Jun 2017 04:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Mon, 5 Jun 2017 04:14:27 -0700 (PDT)
In-Reply-To: <545cc9b3-26f9-1a41-1f84-fb6d74a8d097@windriver.com>
References: <20170518020701.2773-1-Randy.MacLeod@windriver.com>
	<2c4c974d-6831-f5c3-bf9a-a9c801192ccb@windriver.com>
	<545cc9b3-26f9-1a41-1f84-fb6d74a8d097@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Jun 2017 13:14:27 +0200
Message-ID: <CA+chaQcxby9yBFVvRqG5ho5RkJyRDre5_Y74+TBF-1PKDn_hkA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][V2 patch] rrdtool: allow configuration to disable nls
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
X-List-Received-Date: Mon, 05 Jun 2017 11:14:27 -0000
Content-Type: text/plain; charset="UTF-8"

This v2 didn't make it to patchwork and it was too late when I've noticed
it and found this e-mail.

So I've merged v1 to master and immediately reverted it.

Resend v2 again, this time patchwork might do its job.

On Mon, May 29, 2017 at 3:14 AM, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2017-05-28 09:12 PM, Randy MacLeod wrote:
>
>>
>> Martin,
>>
>> You've merged v1:
>>     [oe] [meta-oe][PATCH] rrdtool: add gettext-native dependency
>>
>
> err I mean, you've merged v1 to master-next to be clear.
> ../Randy
>
>
> Could you drop that for this fix since it's a somewhat better approach.
>>
>> ../Randy
>>
>> On 2017-05-17 10:07 PM, Randy MacLeod wrote:
>>
>>> When building rrdtool for a 'tiny' distro, that does not have native
>>> language support (NLS) in glibc, configure fails with the error:
>>>     autoreconf: failed to run autopoint: No such file or directory
>>> Autopoint is part of gettext but without NLS support we populate the
>>> sysroot with gettext-minimal-native rather then the full set of
>>> gettext executables. This version does not install autopoint, nor
>>> should it.
>>>
>>> Tell autoreconf to skip the check for the autopoint script
>>> regardless of NLS support and use the USE_NLS varible
>>> to conditionally enable NLS support.
>>>
>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>> ---
>>>   meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>> index db2df28a0..3ccefb995 100644
>>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>>> @@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
>>>   SYSTEMD_PACKAGES = "rrdcached"
>>>   SYSTEMD_SERVICE_rrdcached = "rrdcached.socket rrdcached.service"
>>> -EXTRA_AUTORECONF = "-I m4"
>>> +EXTRA_AUTORECONF = "-I m4 --exclude=autopoint"
>>>   PACKAGECONFIG ??= "python perl ${@bb.utils.filter('DISTRO_FEATURES',
>>> 'systemd', d)}"
>>> @@ -49,6 +49,7 @@ EXTRA_OECONF = " \
>>>       --disable-lua \
>>>       --disable-tcl \
>>>       --disable-rpath \
>>> +    --enable-nls=${USE_NLS} \
>>>   "
>>>   export STAGING_LIBDIR
>>>
>>>
>>
>>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5
>

