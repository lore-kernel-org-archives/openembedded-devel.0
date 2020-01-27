Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CECDB7FD93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 05:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580102534; x=1611638534;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=pwkkK4DBWqlBifdEv2aUWoNzIl0qwZ7Oix3RGjmVMRg=;
	b=eZYzkMVvUwFgfVFPOJDj3j97udpbEIZ4itBJxyeyehs9ZpmopPhkv9GG
	yUe+7fVqD/6r0au4sYw81qEM+gjYXp9Ilt7U7ZtriSDCk4jfoiD2dVIHP
	l/v+zPFes5ZQx64w5uXxn+c0nxfMmwcLVoXpGcajc0Kp6aQAHe3C2GrqD
	zQLDpYKFcACpAhzeqv3RkYjEJ9J/7XKCf+R4vxAdlYKHCVJkKPrCbzhhu
	RjlwCjXFqcVya+ge7BacGYUNcDdE2N5ChM9L1HwI6M+Q40WID33638CoH
	pRoN7pr/WfwN52CqMBa2Z5NKkKNMI2A89jyjUliDw6fAoBcS+cwm2Dm4o A==;
IronPort-SDR: bSx0e2M01BCRR7eErubgLbbwB7ZWCwCcYab0XH/fNxtWLF5g+6pa7au4V188CndPcXNpSqliCA
	ikPMQQ6Owj3kdRP/3+dXZ3OYZqbsgi7ThHavcE8mfa8/4Q1D3DweZjYneMVPU7Y1RC0XIShfxI
	7EhD4+bOaBjVtOaBMEzxPw1F4E+j6JgFwBdFnXol/eJ8sj/L2ECp/mbJKWNOVpFQQt9O2XmMbM
	QMg1lHoTzvSILOQgpLkM2D4v+1biRuoroDD8nWwi9e94CmeR82vL32aM+LeASDGp/CUoIji/rJ
	AtQ=
X-IronPort-AV: E=Sophos;i="5.70,368,1574118000"; d="scan'208";a="22267795"
Date: Mon, 27 Jan 2020 06:22:11 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200127052211.GA2138442@pcleri>
References: <20200126111035.273501-1-jacob.kroon@gmail.com>
	<20200126112146.GB2043417@pcleri>
	<80d30f83-b342-cfb7-9114-86ee61198fd7@gmail.com>
	<424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
MIME-Version: 1.0
In-Reply-To: <424d1981-b4f0-de86-f18b-8a216339d3ea@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][g0hl1n/wip-jdk8u242ga][PATCH] Fix building openjre-8 242
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
X-List-Received-Date: Mon, 27 Jan 2020 05:22:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jan 26, 2020 at 09:03:45PM +0100, Jacob Kroon wrote:
> On 1/26/20 12:26 PM, Jacob Kroon wrote:

...

> 
> Btw, as I mentioned my build host is an up2date Fedora 31, x86-64. Any idea
> why these errors aren't showing up on your test builds ?

In my tests I only built the openjdk package, therefore the "find" issue
didn't trigger.

The linker errors were fixed in aarch32 [1] and aarch64 [2] upstream. I
just double-checked my tests and it seems I only built for those two
architectures... Time for me to rework my tests ;-)

So I will adapt and apply your PATCH and push it to the branch. Thanks
for your work!
If you have any further feedback/tests for the 242 update please feel
free to share ;-)

regards;rl

[1] http://hg.openjdk.java.net/aarch32-port/jdk8u/jdk/rev/4a51a4ac7fc2
[2] https://hg.openjdk.java.net/shenandoah/jdk8/jdk/rev/391be061dfc7

> 
> Cheers,
> Jacob

