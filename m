Return-Path: <prvs=285b569e5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 038837FCC5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579866287; x=1611402287;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=CB9qLhGUI58xSvZBroT+zmzUWsFzkRO1JxTjRR3H+Mk=;
	b=AGK6ftNwXCKMSmpZtzoIyR5kjA/O5IeC/lhUFX8xE6KQ1G6HDHzdPulg
	uXGWEOtp8cNcLkEEYdR0nYJclIBEgFV2Ei5GG243CNtrlFUs1nZ69gsJg
	g9X8HGQiO370PMuBiDwL2rrUExD5NKzQUg8RjC9o2bmy8M/eBf1maUynE
	ZtsEfVgn3aUb4NxiTXB3I02988qGuVGOfVBRUEt5QajTWXHvQdWq40ZeE
	aa0RiqTvOuDrz3rWbd55dRNwzJKEeutvrQiFyOFaOn68NezaQJn/JUoRO
	VcFa/3iDWqAEs5GOep8uBLinKY6LERSrGjwUB5LpXPijivxpHTS2mMU+8 Q==;
IronPort-SDR: OAmX0svr+QhGSnP2iZncq2NmjuwwGezyBRracqbtrDE77gy/GoZ2rkpZTLiXK4a3GuOapM6wa9
	hatsZjRjoBTNzVPMr/VIKStVG52K4fzSFqDEPXicPCOEYj1zfbWBu1F5g4B8NH6lalp+LB7meD
	ma/S7UOPiLbOqYK+rGJuvZTiGrDVxWDYJdU5NSHrn71naP5666zeR8t08ZoGl30ADooqKosTUQ
	aU/a0m+bE90rgmL2UF3QdYEmTcfKUYSoJ2H/ldFcqt8oFwC0QpGnphYdVZ+/eLFnGo2tSyjYBW
	/lA=
X-IronPort-AV: E=Sophos;i="5.70,357,1574118000"; d="scan'208";a="22236601"
Date: Fri, 24 Jan 2020 12:44:46 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200124114446.GB10765@brokenbit>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200124103621.GA10765@brokenbit>
	<538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Fri, 24 Jan 2020 11:44:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 24, 2020 at 12:37:58PM +0100, Jacob Kroon wrote:
> On 1/24/20 11:37 AM, Richard Leitner wrote:

...

> > I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
> > the meta-java repository [1]. It contains (as you might have guessed)
> > the update to openjdk 8u242ga.
> > 
> > Can you please give it a try if it works for you?
> > 
> 
> I tried but I get a linker error during openjre-8_242.bb:do_compile:
> 
> Making adlc
> ...
> /tmp/ramdisk/build/hosttools/ld: cannot find -lstdc++
> collect2: error: ld returned 1 exit status
> 
> This is using MACHINE=qemux86-64.
> 
> Gonna try and fix and get the build going.

Do you have "libstdc++ static" installed on your buildhost as stated in
the README? ...the error let me suggest you don't have it ;-)

regards;rl

> 
> Cheers,
> Jacob

