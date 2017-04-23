Return-Path: <prvs=279dee253=Richard.Leitner@skidata.com>
X-Greylist: delayed 606 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 23 Apr 2017 07:04:16 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 2838A71D31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 07:04:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.37,237,1488841200"; 
   d="scan'208";a="563602"
To: <openembedded-devel@lists.openembedded.org>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <3fe98b1d-ba99-b625-7a82-9f7ba01fdc1b@skidata.com>
Date: Sun, 23 Apr 2017 08:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
X-Originating-IP: [192.168.24.112]
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
X-List-Received-Date: Sun, 23 Apr 2017 07:04:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2017 12:25 AM, Steven Osborn wrote:
> Is anyone using Java on OE devices right now?

Yep. Me.

>
> meta-java - no release branches.  Seems to only be focused on master.
> I've had trouble even finding a revision that will compile on Morty.

I'm using the current master branch with YP jethro for running OpenJRE 7 
in mixed mode on ARM systems. And I'm currently migrating my platforms 
to master (->pyro).

So it works fine for me. Only problem is that we cannot upgrade OpenJDK 
to the current patch level for ARM because JIT was broken: 
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=2942

>
> meta-oracle-java has a Morty branch, but the URI for the binaries is
> bad so it fails to install.

Haven't tried meta-oracle-java in the last couple of years (due to 
license issues).

>
> Overall it seems like Java is not a very favored or platform at the moment.

That's maybe true. But help in the meta-java layer for fixing problems 
is (if you have some spare time) always appreciated ;-)

regards,
RichardL

