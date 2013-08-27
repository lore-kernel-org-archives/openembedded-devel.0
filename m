Return-Path: <erik.boto@pelagicore.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 65F4661F47
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 13:56:40 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id n12so2695610oag.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 06:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=K1sSASmCnuL+Fkaepx4c9omJfy/Hl8+fhVjqV0Ynvek=;
	b=VlGsSDfG83Nx0MbUKdNmnIq1cDxFqMDXhGQHw83QXtOm1koniybNRdOr1EAo+0EEYv
	tjRRvFCktDSCmhuZQ8oM1QPmAi84WNBkwodHTg7OT6jIeHydnkprEjlFezBEpztrQF68
	gvZFPWpZ7DPlYrOvFO7aMwtfiUV45CyeLhgtylAixf9M+9C3maYQJDVb12C7EbwwCcLY
	i3xE2mLLVYYhdAjs6nQGpGGqJslYF4pzHAH4uk6oHiCcqLIvi4BCEUPOLUwyXLolXI03
	0hWb1vxAVqZYihTwx7NEwOHeOIeDBN+du0V52SYpaicOgujxIgeZMNOIivuRtLrT/ta+
	xR4A==
X-Gm-Message-State: ALoCoQlVQwuEVnYHZDL40oBJq0R0yLG5hgc4hfwts75TORn6/FlcMvpPlsyFfOkswdPp4Yd5U7Ni
MIME-Version: 1.0
X-Received: by 10.182.215.133 with SMTP id oi5mr2024769obc.83.1377611800366;
	Tue, 27 Aug 2013 06:56:40 -0700 (PDT)
Received: by 10.76.174.6 with HTTP; Tue, 27 Aug 2013 06:56:40 -0700 (PDT)
In-Reply-To: <20130827075443.GW3544@jama>
References: <521C514F.1000405@pseudoterminal.org> <20130827075443.GW3544@jama>
Date: Tue, 27 Aug 2013 15:56:40 +0200
Message-ID: <CA+AhUGwh7dX=6Cw98xzdmgr=W9=J2h7y7iuQjmDTM_HOW1hUCw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How can I make recipes conditionally enabled?
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
X-List-Received-Date: Tue, 27 Aug 2013 13:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 27, 2013 at 9:54 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Aug 27, 2013 at 09:12:15AM +0200, Carlos Rafael Giani wrote:
>> Hello,
>>
>> I have a question about a problem I've had several times in the past:
>>
>> if I write a layer, and add .bbappends, then the layers with the
>> corresponding .bb files become hard dependencies.
>> But lets say I want to write a BSP layer, and I add some machine
>> specific Qt5 patches. Now everybody who wants to use
>> my layer must also include meta-qt5, even when they don't really want to
>> use Qt5 anywhere. This is made even worse
>> if I have a dependency on meta-oe, which itself brings in a lot of
>> modifications.
>>
>> In short, I'd like to be able to make .bbappends and .bb files dependend
>> on whether or not a layer is available. The hard
>> dependency is fine if it concerns things that are essential in my layer.
>> But if its about optional things, it shouldn't cause
>> a build failure.
>
> BB_DANGLINGAPPENDS_WARNONLY is the magic word.

I also saw some nice use of inspecting BBFILE_COLLECTIONS in the layer
configuration done by Mentor, see
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/conf/layer.conf#=
n9

Then you would place the files you only want to enable for e.g.
meta-qt5 in a qt5-layer directory in your layer. Those files would
then just be used if BBFILE_COLLECTIONS contains qt5-layer, which is
only the case if you have added meta-qt5.

I know meta-fsl-arm uses this for meta-qt5 bbappends.

Cheers,
Erik Bot=F6

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

