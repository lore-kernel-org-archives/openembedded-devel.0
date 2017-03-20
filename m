Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id A04917799C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:46:30 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170320144628547_0484;
	Mon, 20 Mar 2017 14:46:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=34459 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cpyZe-00028g-Bk; Mon, 20 Mar 2017 10:46:18 -0400
Date: Mon, 20 Mar 2017 10:46:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQe7Rj2zH_E5gjO-BCrVUgT6DZD-Ohfp0f2n17z=bu2wgQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703201045540.10815@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
	<CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
	<CA+chaQeVXMSEXuCF7F2jRG4-TBzFWkGMWv=Gz=ksD6Z=tC4C1Q@mail.gmail.com>
	<alpine.LFD.2.20.1703201002240.20418@uk63952.mitel.com>
	<CA+chaQe7Rj2zH_E5gjO-BCrVUgT6DZD-Ohfp0f2n17z=bu2wgQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: blacklisted accel-ppp (under binutils-2.27) seems to compile under binutils-2.28
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
X-List-Received-Date: Mon, 20 Mar 2017 14:46:31 -0000
Content-Type: multipart/mixed;
	BOUNDARY="587868445-2028693752-1490021178=:10815"

--587868445-2028693752-1490021178=:10815
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Mar 2017, Martin Jansa wrote:

> Without "_pn-binutils".
>
> On Mon, Mar 20, 2017 at 3:05 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       On Mon, 20 Mar 2017, Martin Jansa wrote:
>
>       > Yes, sending a patch is OK, but you might want to test it with gold
>       > enabled, most linking errors are usually reproducible only when gold
>       > is enabled.
>
>         just to be clear, need i add just this line to my local.conf?
>
>       DISTRO_FEATURES_append_pn-binutils = " ld-is-gold"

  ah, right, i forgot that it also affects a number of other recipes.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-2028693752-1490021178=:10815--
