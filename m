Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id E52E360780
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 10:01:25 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so9210263oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2013 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=k5KfwJVI1ycvn1zULLEBud4WX4JJ6xfLLXcTlq1bbPg=;
	b=BlrxxVsLvXNrC1L4rdFqmnZtIrJ2gMqeFtIAxzaZG1tLKBD+XCpsGOvrCUnwlEEHPc
	5cisDWDpX2O+jYIdvh/Sv9Rt6CyZr7AKrHCxIM5/Uq5bwGED7GGHGh9ZxIuRh/pE4ARG
	rAl9U/39kQe0AsSCes3h7ehfO4J+23R96HcoK0hyZmgeFu3lBFzkDfwV5pe+oHLa5vxe
	tm5kOjnZT4/bgE5diKSb2aF8PLHi4ifHpo2bdE9VMQOgbIQSOxDIaAXcYOT9pgK6f7gN
	eWPA4kW/TCOoeex3ZU9o7NQzkFaXC/F0DyG4jor0vaquNJb+l7oCvdn0EVLPKnYrvUlp
	w91w==
MIME-Version: 1.0
X-Received: by 10.182.79.165 with SMTP id k5mr27517790obx.31.1373450486277;
	Wed, 10 Jul 2013 03:01:26 -0700 (PDT)
Received: by 10.60.37.65 with HTTP; Wed, 10 Jul 2013 03:01:26 -0700 (PDT)
In-Reply-To: <1373427481-16273-1-git-send-email-B40290@freescale.com>
References: <1373427481-16273-1-git-send-email-B40290@freescale.com>
Date: Wed, 10 Jul 2013 12:01:26 +0200
Message-ID: <CAGiJk9fXAWAojPe+QZorhi5=uNabQ2958JdPWpmweVkYNm09sA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: b40527@freescale.com
Subject: Re: [meta-oe][PATCH] licences: Add iozone3,SMAIL_GPL,NewBSD
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
X-List-Received-Date: Wed, 10 Jul 2013 10:01:26 -0000
Content-Type: text/plain; charset=UTF-8

2013/7/10 Chunrong Guo <B40290@freescale.com>:
>       *fix the fllowing warning
>       |WARNING:debianutils: No generic license file exists for: SMAIL_GPL in any provider
>       |WARNING:iozone3: No generic license file exists for: iozone3 in any provider
>       |WARNING:iperf: No generic license file exists for: NewBSD in any provider
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/conf/layer.conf    |    2 +
>  meta-oe/licenses/NewBSD    |   40 +++++++++++
>  meta-oe/licenses/SMAIL_GPL |  164 ++++++++++++++++++++++++++++++++++++++++++++
>  meta-oe/licenses/iozone3   |   62 +++++++++++++++++
>  4 files changed, 268 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/licenses/NewBSD
>  create mode 100644 meta-oe/licenses/SMAIL_GPL
>  create mode 100644 meta-oe/licenses/iozone3
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 68f7823..bc025bb 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -23,6 +23,8 @@ BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
>
>  BBFILE_PRIORITY_openembedded-layer = "6"
>
> +LICENSE_PATH += "${LAYERDIR}/licenses"
> +
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>    pointercal-xinput \
>    mplayer-common \
> diff --git a/meta-oe/licenses/NewBSD b/meta-oe/licenses/NewBSD
> new file mode 100644
> index 0000000..9a8683d
> --- /dev/null
> +++ b/meta-oe/licenses/NewBSD
> @@ -0,0 +1,40 @@
> +Copyright (c) 1999-2007, The Board of Trustees of the University of Illinois
> +All Rights Reserved.
> +
> +Iperf performance test
> +Mark Gates
> +Ajay Tirumala
> +Jim Ferguson
> +Jon Dugan
> +Feng Qin
> +Kevin Gibbs
> +John Estabrook
> +National Laboratory for Applied Network Research
> +National Center for Supercomputing Applications
> +University of Illinois at Urbana-Champaign
> +http://www.ncsa.uiuc.edu
> +
> +Permission is hereby granted, free of charge, to any person obtaining a copy
> +of this software (Iperf) and associated documentation files (the "Software"),
> +to deal in the Software without restriction, including without limitation the
> +rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> +sell copies of the Software, and to permit persons to whom the Software is
> +furnished to do so, subject to the following conditions:
> +
> +
> +Redistributions of source code must retain the above copyright notice, this
> +list of conditions and the following disclaimers.
> +
> +Redistributions in binary form must reproduce the above copyright notice, this
> +list of conditions and the following disclaimers in the documentation and/or
> +other materials provided with the distribution.
> +
> +Neither the names of the University of Illinois, NCSA, nor the names of its
> +contributors may be used to endorse or promote products derived from this
> +Software without specific prior written permission.  THE SOFTWARE IS PROVIDED
> +"AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
> +LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
> +AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTIBUTORS OR COPYRIGHT HOLDERS BE
> +LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
> +CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> +SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Hi,
this is not a BSD license at all!!

For the actual NewBSD license of Iperf see here:
http://code.google.com/p/iperf/source/browse/LICENSE


--
Regards
Samuel

