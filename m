Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 566B9779B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:28:12 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170320152809725_0486;
	Mon, 20 Mar 2017 15:28:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26013 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cpzE1-0005gE-JU; Mon, 20 Mar 2017 11:28:01 -0400
Date: Mon, 20 Mar 2017 11:27:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQe7Rj2zH_E5gjO-BCrVUgT6DZD-Ohfp0f2n17z=bu2wgQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703201126460.7124@uk63952.mitel.com>
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
X-List-Received-Date: Mon, 20 Mar 2017 15:28:14 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Mar 2017, Martin Jansa wrote:

> Without "_pn-binutils".

  so i rebuilt a core-image-minimal (for mpc8315e-rdb, don't ask)
after setting:

  DISTRO_FEATURES_append = " ld-is-gold"

then rebuilt accel-ppp and it succeeded. is that considered an
adequate test?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


