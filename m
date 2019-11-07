Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 49AD37F95D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:18:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4787qr50QqzF2;
	Thu,  7 Nov 2019 17:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573143513;
	bh=7e22VcpbM0sOO2DUD744uT9Bh3AC5IcPqU9SYpb2pQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2rte5HhzL7Ow1QVac7dBWkbYclT7h0kY0BMaboiHF/pxz8YM2WMeJkUEVOaaxfF4
	VNVrq7Hi05bo1KpUMiXtKmp4PQqKABotX0xBOC5X+KvA5GSoZCz0UIqJ2aKaPWGgjR
	pvLTEp1WHoEesN+NwW1WeZ+ahyAx5odH20VXb8qgIb7OPKGfPNY5ilIpXWLsat5+/A
	+LlbUgPG1HF4mL4fI71RjobNS7OkS3cpgdlnuKH1dTR5HECyV+JQSCYF9RbHGqHWtP
	xEuGxj43WDvtXCesxu+lO6rVnU0E0bx3lojLgLoVxzkxtIOW+7oumgwr+YaxqmnPhm
	OM/V0Sbgc+dYamfvO8Vk4VzoFum4LW2IHqdesoM6ZCd/k12kJ2TV3iVdy9EFp9IxBa
	LhN9xVSdNA66nH5UwiQBKYUM+4SZxGX1PKROn3JL68UBHyLYFDNCOE5FRjQmIyGg2I
	dO9dSM771mTmYnhFRmLyxgTohBbsdUGv7HV09uKeB8fp8oOSbMTnZPgh2biyPLwkdq
	FJttONda0uRnNbXhQuoVb5GsIbwYcf0x4szNL0ib9KCliZG+1DDqJ0FRTdw4WlA8Te
	tL9mYEA9XZFnvaT4y1cwK1XgtUg6eWNiohzS02TVamUDeR8vgwLeZbno8nYK+qmi0j
	RO1vlWhmeyJYNy7JbyPgpxQ4=
Date: Thu, 7 Nov 2019 18:18:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20191107161829.GA31984@localhost>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
	<620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
MIME-Version: 1.0
In-Reply-To: <620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yuan Chao <yuanc.fnst@cn.fujitsu.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Thu, 07 Nov 2019 16:18:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 06, 2019 at 05:30:29PM +0800, Hongxu Jia wrote:
>...
> Should we clarify that we do not support python2? If yes, we could clean up
> them.
> 
> In this case, if we do not support python2 more-itertools, we should also
> 
> clean up these python2 recipes (python-pytest,python-pluggy,python-zipp)
> 
> that runtime depends on more-itertools.
> 
> 
> As above upstream commits [1] said, the old version 5.0.0 is the last
> version
> 
> to support python2. Two choice: going backwards or cleaning up,
>...

python-more-itertools was added to master less than 2 months ago,
and the inital add was version 7.2.0.

What you write implies that the Python2 version was never working,
and should be removed with all reverse dependencies from both master
and zeus.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


