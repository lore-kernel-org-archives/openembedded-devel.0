Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6CA460E23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 07:10:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2014 00:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,885,1392192000"; d="scan'208";a="543176830"
Received: from mcomyns-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.122])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2014 00:10:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Cagley <rcagley@gmail.com>
Date: Thu, 22 May 2014 08:10 +0100
Message-ID: <1584812.c16lcQ9U8e@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CAN-NoH1coG9-Go6qqOQU_-vu3QqhdE30znM-PCgMPZtAd5To+Q@mail.gmail.com>
References: <CAN-NoH3tU4wfadSOS4F78DQrqar9sHz_3Ecf49ENEog=P06=MQ@mail.gmail.com>
	<537D0D26.8070505@balister.org>
	<CAN-NoH1coG9-Go6qqOQU_-vu3QqhdE30znM-PCgMPZtAd5To+Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 May 2014 07:10:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 May 2014 13:58:07 Richard Cagley wrote:
> On Wed, May 21, 2014 at 1:31 PM, Philip Balister <philip@balister.org>
> wrote:
> > On 05/21/2014 04:05 PM, Richard Cagley wrote:
> >> On Wed, May 21, 2014 at 12:26 PM, Robert Calhoun
> >> <rcalhoun@shotspotter.com> wrote:
> >>> On 5/21/14 2:26 PM, "Richard Cagley" <rcagley@gmail.com> wrote:
> >> 2.) Do I need to change the machine name? If so, how to I inherit
> >> zedboard-zynq7?
> > 
> > Make a conf/machine/me.conf.
> > 
> > You can use one of the zynq machines as a starting point.
> > 
> > You'll need a conf/layer.conf also.
> 
> 1.) copied meta-xilinx/conf/machine/zedboard-zynq7.conf to
> meta-me/conf/machine/me.conf
> 2.) changed MACHINE in my build/conf/local.conf to "me"
> 3.) copied meta-xilinx/conf/layer.conf to meta-me/conf/layer.conf
> 
> Now:
> 1.) in layer.conf should I change "xilinx" to "me"?

Yes

> 2.) What about the new machine file me.conf? Do I need to edit it or
> by not editing it does it just inherit everything from the other meta
> layer?

Since you copied an existing configuration file, all that was in it
previously will still apply. You can change it if you want some values to
be different, of course (I would assume that you would want to edit
it since there wouldn't be much point in going through this exercise if you
didn't.)

One other thing to note - if there are overrides for the previous machine
(e.g. in bbappends you may see _zedboard-zynq7) you should change
these to _me so that they still apply.

You may also find this useful:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#understanding-and-creating-layers 

Cheers

-- 

Paul Eggleton
Intel Open Source Technology Centre

