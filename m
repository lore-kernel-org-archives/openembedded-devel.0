Return-Path: <prvs=3095e736d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B2E8960B0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1581928756; x=1613464756;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=FUwWRv0G4FRiU912tBupCl4GJhw4fzu5tc5YLpobR0A=;
	b=JW1g+8rnKbM7+GTZV1O3+H9J1asT/DtNZMdEzLLEiM4QCUDGGwb4oXXc
	lnFkO8gP6/Xufz7mJUueke+SxgwrpaBc9w7PWQ6SmJ4qlmp7YhJtUrjMG
	8Q/XtUvaJGZINbHSRw20ZT9+BvvrDoPjKMXLU97l+UdHgIy8eKieb0QLe
	dYD1lSZQcbDHYDUCI1tHFSu3S0QdsLh1bVoSDKxnmjsaSUbQDsvCFdP3+
	lbBdBH8YpReVXVgQ2okL3gfaemfslDlmGSFWSnteEruGellZVvrcZKmGf
	TzYAVuiM+8a4k96N0D+/Um6ILAs9jkjYGwV5WqLPSbZiEhdVtauMPO5IK g==;
IronPort-SDR: fK89wUSrhV4JMwItZ1NCQDFT0V3ETYROLpLPZJ9iSo6MYZw4Mhf9eO/zDs5TXKBsM5a7tXEcX9
	Rzo8NUtEhVbhiKWjuVQGXE1F0V3auhs5xDu7ZoQ80RtBAnh/4SwqIIxzxj9FREsGNTgOGmXDeo
	/hGXKZQG6nIWI9a/fUPIMh923Je662d5mnqQVOvHzdaOxnYOiWVVJN0wSpB+oKga9aMMI4LeFi
	eIAb8ugE+BkNMOVyeZ7BJ0O7r1ZEccSDVk1fy+Y7kMQUTSOTMW0EXbpJJz2KELxdeBHOETGs9g
	R3Y=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; d="scan'208";a="22704015"
Date: Mon, 17 Feb 2020 09:39:13 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <20200217083913.GB12279@pcleri>
References: <22639ede-b55a-3e33-3ac3-c462b1e37b62@mvista.com>
MIME-Version: 1.0
In-Reply-To: <22639ede-b55a-3e33-3ac3-c462b1e37b62@mvista.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Cherry pick patches breaking zeus/thud/master.
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
X-List-Received-Date: Mon, 17 Feb 2020 08:39:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jeremy,

On Thu, Feb 13, 2020 at 12:15:07PM -0800, Jeremy A. Puhlman wrote:
> Richard,
> 
> Is it possible to cherry pick
> 
> d0a9fe08be6e1c2e7f7afc79abc292d3bffeb9fe
> Revert "openjdk-8: disable, stringop-overflow compiler errors"
> 
> to zeus/thud/master, since they are breaking for the same reason as warrior?

Have you tried adding "-Wno-unknown-warning" instead of removing
"-Wno-error=stringop-overflow" ?

This would IMHO fix both cases (gcc >=9 and <9).

regards;rl

> 
> TIA
> 
> -- 
> Jeremy A. Puhlman
> jpuhlman@mvista.com
> 

