Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF6A72491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:33:33 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so19464112pdb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gAyzkJIe80sO9wAa2xICyGRGDzEYNEO4/Hz7Kp16iUs=;
	b=TdnRo2NNhfR/Gva7MOL7glTkx5kbDddfMLqK2V909SkCAX8KX4R/KIXmh8oqXiKKSU
	8kijXcos4p42bk2DCLI/FZC1AWtKVb/feNdBkS+voMq4KFGkJgqopWu9JgHy1THtgfRv
	qCEs+gAI3Uqh5E8yzVt6slPr3iuIVMITT/tzAN0xjE56Gbxf7STBUCUhsyuX5wbYSpPQ
	oiO4z+5cM2xgF91EVHd2MTVQMxEmmIGcV2vwU2km030BWWFmdJVm96DoymsrciiH9chG
	FPXI/X1R7Tn1X/3/XFWAhy2boGCHqaDPvzFf42tJeOb90Lnb8LQTM5j62PXHo4IN6Gg4
	0Lpg==
MIME-Version: 1.0
X-Received: by 10.70.132.71 with SMTP id os7mr22415348pdb.94.1425026014914;
	Fri, 27 Feb 2015 00:33:34 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Fri, 27 Feb 2015 00:33:34 -0800 (PST)
In-Reply-To: <20150227065054.GB2309@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<20150227065054.GB2309@jama>
Date: Fri, 27 Feb 2015 09:33:34 +0100
Message-ID: <CALbNGRTRi9hwhVPKmq2t6c8SX9xpRoNR7+z1Q+NGVLB3Ffom5A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Fri, 27 Feb 2015 08:33:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 7:50 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Jan 27, 2015 at 06:53:52AM +0100, Andreas M=C3=BCller wrote:
>> * this is the first version which dropped qt4 support
>> * rename recipe to avoid conflicts with meta-oe's qt-creator
>
> It still conflicts with qt-creator in sysroot on couple files, please try=
 to
> change it to use different datadir or don't stage datadir in sysroot at a=
ll (if
> it works without it).
>
OK - from your last world build I saw it is even worse: qt5-creator
seems to use libs from old qt-creator. Hope to find some time for this
during weekend.

Regarding the other patches in this series (removing sysroot patches):
We have discussed this but do you wish V2 of these patches?

Andreas

