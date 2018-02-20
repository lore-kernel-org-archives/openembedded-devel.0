Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6FB78678
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 23:41:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KNfFR9014013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 23:41:16 GMT
Message-ID: <1519170075.24236.345.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Feb 2018 23:41:15 +0000
In-Reply-To: <CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
	<CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 23:41:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-02-20 at 23:27 +0100, Martin Jansa wrote:
> Richard, I agree with all you said.
> 
> But I still don't see how replacing meta-oe git repository with 10
> different git repositories helps with anything.
> 
> It won't give you more time, it would only cause more work to already
> exhausted and (re)tired meta-oe maintainers.

I'm actually very worried about these (re)tired maintainers. If the
layers were more independent it would allow some of the patch handling
responsibilities and testing responsibilities to move to other people,
reducing the load on those maintainers.

Obviously this can't happen with everything all at once but I think
some pieces of the current repo may not be far away or that difficult
to separate out.

Therefore raising the question doesn't seem unreasonable.

The separate layers and maintainership is the way we designed the new
layered approach to OE to scale.

> It won't make the layers independent.

It won't, but it would give people more of a reason to fix it.

> It won't improve existing tooling.
> 
> It won't improve automated upgrades or testing.
> 
> Yes meta-oe needs to improve and it would be great to have layers as
> those fancy colorful boxes from Yocto documentation, which you can
> willy-nilly add to your BBLAYERS without any dependencies. But that's
> not how it is now and splitting the repository alone won't help with
> that. If there are people willing to make it work better, then they
> can improve it in existing git repository and when it works well and
> there are really independent layers, then we can re-evaluate
> splitting the independent ones to separate repositories for easier
> consumption.

It alone will not change things but it *might* just trigger more people
to get involved, help and take some of the workload from those
maintainers who are overloaded right now. Its a chicken and egg
problem, our difference is we disagree on which step might help. We've
tried the monolithic repo for quite a while, it might be time to try a
different approach maybe with one piece of meta-oe?

Cheers,

Richard
[away tomorrow so further replies may be delayed]

