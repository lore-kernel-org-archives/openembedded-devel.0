Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 395 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jul 2014 00:46:02 UTC
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 52B7465CE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:46:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140715003927387
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:39:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [99.240.204.5] (port=38934 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6qm9-0000Zl-8m for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2014 20:39:21 -0400
Date: Mon, 14 Jul 2014 20:39:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+gsK-rJHEnF_KmNFmq_1KqW7wfLBnMLpKWpFBeQYvAHFZM_cg@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407142038250.8059@localhost>
References: <alpine.LFD.2.11.1407141457150.14590@localhost>
	<CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
	<alpine.LFD.2.11.1407141919070.5707@localhost>
	<CA+gsK-rJHEnF_KmNFmq_1KqW7wfLBnMLpKWpFBeQYvAHFZM_cg@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: defining FEATURE_PACKAGES_* in core-image.bbclass vs image.bbclass
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
X-List-Received-Date: Tue, 15 Jul 2014 00:46:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Rudolf Streif wrote:

> >   is there something special about hwcodecs that suggests it
> > should stay in core-image rather than moving to image as well? i'm
> > just trying to understand the rationale.
> >
> Not necessarily. But I would consider them extended features and
> they belong into core-image in my opinion. Not all embedded systems
> need them. Many don't have video or audio support. I would even
> suggest to move splash to core-image. If a device does not have
> video there is not reason for a splash screen.
>
> I consider debug-tweaks, package-management, and readonly-rootfs the
> basic image features to be in image.

  and i have no problem with that rationale. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


