Return-Path: <prvs=829e7dfac=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id F01B971C54
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 13:09:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,424,1534802400"; d="scan'208";a="13066398"
To: <openembedded-devel@lists.openembedded.org>
References: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <ba624040-6e9d-3fc2-d239-9eea5e15273e@skidata.com>
Date: Thu, 25 Oct 2018 15:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: meta-java configuration
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
X-List-Received-Date: Thu, 25 Oct 2018 13:09:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 7bit

Hi Kyle,

On 10/24/18 11:15 PM, Kyle Russell wrote:
> It looks like the only javac that meta-java exposes through its bbclasses
> comes from libecj-bootstrap-native 3.6.2.  
That's definitely true.

> A few years ago, it looked like
> there was an attempt to allow openjdk-8-native to provide
> virtual/javac-native, but it has since been reverted.

As I'm not into the meta-java stuff that long I do not know anything 
about it... Do you have any pointers to ML discussions?

> 
> I think I understand libecj is needed as part of the bootstrap process to
> build openjdk, but if other layers want to build newer java code using
> javac from openjdk 8 once available after bootstrap, does meta-java provide
> support for using javac from openjdk-8-native, or is the expectation that
> other layers would depend directly on openjdk-8-native and setup
> EXTRANATIVEPATH as needed to reach its tools?

Yeah, ecj is needed for bootstrapping the jdk. For more details please 
take a look at docs/bootstrap-flow.txt.

AFAIK currently using openjdk-8-native seems like the only solution. 
Nonetheless I'm open for any patches to enhance this behaviour ;-)

> 
> Maybe this is planned future work, but I wanted to make sure I was
> configuring the layer correctly and using it as intended.

Currently (at least) I'm not having any future plans in this direction, 
but as mentioned above I'm open for discussions and/or patches!

> 
> Thanks!
> 
> Kyle
> 

hope that helps...

regards;Richard.L

