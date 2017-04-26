Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id A67C977C98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 09:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.37,253,1488841200"; 
   d="scan'208";a="571788"
To: <openembedded-devel@lists.openembedded.org>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
	<67ed839c-53ba-4b8b-2e9f-a40655e25e98@denx.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <b02ba861-c0cd-c43a-951b-7954ae3e9412@skidata.com>
Date: Wed, 26 Apr 2017 11:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <67ed839c-53ba-4b8b-2e9f-a40655e25e98@denx.de>
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: Re: State of Java on OE
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
X-List-Received-Date: Wed, 26 Apr 2017 09:15:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 04/24/2017 09:02 AM, Stefano Babic wrote:
> On 22/04/2017 00:25, Steven Osborn wrote:
>> Is anyone using Java on OE devices right now?
>>
>> meta-java - no release branches.  Seems to only be focused on master.
>> I've had trouble even finding a revision that will compile on Morty.
>>
>> meta-oracle-java has a Morty branch, but the URI for the binaries is
>> bad so it fails to install.
>>
>> Overall it seems like Java is not a very favored or platform at the moment.
>>
> 
> I have got the same problems - the missing of release branches in
> meta-java is quite confusing. -master does not work with last releases,
> and everybody have to find working commit id for each release. And after
> that, cherry-picking something from -master to fix global issue (it was
> for me dependency's issue with classpath).

fyi: I'm currently working on fixing openjdk-7 to work again with
current master. I think I'll be able to post the patches today, or at
least this week.

regards,
RichardL



