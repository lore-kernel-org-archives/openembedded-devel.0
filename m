Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 694BC77D01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 17:46:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KHkpiK026061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 17:46:52 GMT
Message-ID: <1519148811.24236.321.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Feb 2018 17:46:51 +0000
In-Reply-To: <f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Tue, 20 Feb 2018 17:46:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Repositories have reputations. OE-Core is fairly heavily curated and
tested and has certain "guarantees" about what people can expect to
work. The meta-oe repo is a little trickier as the different pieces do
have different 'SLA's (service level agreements). Some pieces like
meta-networking/meta-python likely build well, other pieces like some
of the bitrotting pieces of the meta-oe layer probably don't build in
as many different configurations/architectures and on balance may be
more likely to hit issues.

I think the world may need to change a bit. We should probably change:

* The way people get started with the Yocto Project and Poky
  to move away from the combo repo and into specific layers.
* to have YP testing more layers as part of its builds and testing
* to make it easier for people to establish an SLA type reputation for 
  a layer.

Part of this is a need for a more universal "using OE" later setup
tooling. I've wanted to work on that for a while and I will get there
but if I spend time on it, I want to get it right. I've not had enough
time to get it right (as yet).

Part of this means redefining poky, the YP autobuilders and so on.
Pieces of the autobuilder work are in process and will lead to wider
layer testing.

I have strong influence over the above so I can likely make those
happen, time constraints aside. One piece I need the help of others
with is meta-oe (the repo).

Even just splitting meta-oe out from meta-oe might be enough to
establish the SLA differences, I don't know.

There is a question about what problem would this solve. The move from
OE-Classic was partly about defining maintainership and processes for
recipes which we do with layers. The pieces in the separate layers have
now become the things we set out to create but the catchall of meta-oe
(the layer) remains. I do think we should still be aiming to filter
meta-oe into distinct layers with distinct maintainership. There will
always be some "leftovers" in a catchall but I think it does have a
different personality to the other well separated components and we
need to show to users that they do have different expectations from
them.

I hope I'm managing to convey this concept ok, I'm really trying to
take a step back here and think what will help OE users and the project
and where we need to go with things. I'm not saying we should/shouldn't
do this for 100% certain, I do want people to think about the
alternatives though and what options may be possible.

Cheers,

Richard




