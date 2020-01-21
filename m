Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 29FDB7FD74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579606687; x=1611142687;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=fpIoawYB3k2oxlyiA/FzoW7UbBD5rlqE86ZL4XynsgM=;
	b=YiW2rBKVpRsns4EKy5WwqYURxTmFYl2bThBOV+y2GsPnJKMNhDtzPybV
	1BGnxClzletcepvuX9UV9+YT0ow0uuPVImzoz5XcUduUpYi8RihLJ/Rbg
	EliG1q73VtEJHtkFKTbcmbs8yH33EnjcNpu6CG/jTHDdccieCQNpg+zal
	J5yizNYcsKbfZHtSeOpBDgfpPx41ZzXai7c3NhBh2kOo9rzLrj/hhoKb5
	bkXK6y74rRpDQUCT2jO4IHClXVfw1aTTIIpSCZ5i1a2RFkcNElZ2Ko8sq
	lzSEyzKsWyJvPK54dY3MEJbvVFQw9moTtVPP3TAibRGJ8OMVRgI4VQM99 g==;
IronPort-SDR: PhMT17cXao3mBu0XfVhNxXEZJh9NArQnGdLmRxtqzb2KZ5JBzUaeBnbqUpKk1K2Q30gRatin6B
	mczwTHCYWl4H25VhekQbPDT+19HgxdFQDdDEW02M3gWmiL2ySLPX/GMcas5xxre+8gUcxryqla
	Umr5wgAtlDGF8EZ+4n56bUmX3uvCuIjER1VOQTzfDeFlON7JB2eTIkV5yZNA5cGQfx1LffXZhm
	nPFIT0IHgPHpnAhNB500UyE7TO9/KVA7LAOvVhcpEpbkeXmnxtcRz+ND7yeJtrgET8O0qieAcW
	XK4=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; 
   d="scan'208";a="2495358"
Date: Tue, 21 Jan 2020 12:38:05 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200121113805.GC24847@pcleri>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
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
X-List-Received-Date: Tue, 21 Jan 2020 11:38:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 21, 2020 at 09:01:01AM +0100, Jacob Kroon wrote:
> On 1/21/20 8:12 AM, Richard Leitner wrote:
> > On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:

...

> > > I see the crash both in my custom machine and in qemux86-64. If it makes a
> > > difference, I'm using
> > > 
> > > PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> > > PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
> > > 
> > > since building with jamvm has always been broken for me.
> > > 
> > > Any hints ?
> > 
> > Nothing that comes to my mind directly, but I'll take a look into this.
> > 
> > So your "custom machine" is also x86-64?
> 
> The custom machine .conf file is just:
> ------------------------------------------
> require conf/machine/include/tune-i686.inc
> require conf/machine/include/x86-base.inc
> ------------------------------------------
> 
> So 32bit x86.

Is your JVM crashing in interpreted and mixed mode?

regards;rl

> 
> Cheers,
> Jacob

