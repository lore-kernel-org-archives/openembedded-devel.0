Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3266860E23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 07:11:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2014 00:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,892,1392192000"; d="scan'208";a="545382053"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2014 00:11:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Cagley <rcagley@gmail.com>
Date: Fri, 23 May 2014 08:11:43 +0100
Message-ID: <1521334.KE7mPuYoZb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CAN-NoH0xVXhEAmSx6b8XMqchp4Q_qGe9onC3Gp6wT4HDJNW3xg@mail.gmail.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>
	<CAN-NoH0xVXhEAmSx6b8XMqchp4Q_qGe9onC3Gp6wT4HDJNW3xg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: how to create a new layer
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
X-List-Received-Date: Fri, 23 May 2014 07:11:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 May 2014 15:46:01 Richard Cagley wrote:
> > One other thing to note - if there are overrides for the previous machine
> > (e.g. in bbappends you may see _zedboard-zynq7) you should change
> > these to _me so that they still apply.
> 
> What is the threshold for making a new machine? That is, if I just
> have a .bbappend file I want, that should just involve creating a new
> layer and putting the bbappend file in the correct location. I
> shouldn't have to change anything else correct?
> 
> For instance, if I just want to change the kernel configuration with a
> frag file I can put linux-xlnx_3.8.bbappedn in
> meta-me/recipes-kernel/linux and that's all I need?

Yes, that should be all that is required - no need for your own machine 
configuration in this case.

> I guess I'm just confused at what point I actually need a new machine.

If you want to change the global configuration for the machine substantially 
from that in the original BSP, you may need to create your own machine 
configuration; but for the exact same hardware as the original BSP supports I 
would have thought that in most cases it would not be necessary.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

