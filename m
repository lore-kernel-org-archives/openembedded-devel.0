Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 22 Apr 2017 07:00:34 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id BCE6160589
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 07:00:34 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1d1onM-0001hS-8F for openembedded-devel@lists.openembedded.org;
	Sat, 22 Apr 2017 08:45:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 22 Apr 2017 08:45:23 +0200
Message-ID: <odeu5s$qr7$1@blaine.gmane.org>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
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
X-List-Received-Date: Sat, 22 Apr 2017 07:00:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 22-04-17 om 00:25 schreef Steven Osborn:
> Is anyone using Java on OE devices right now?

Me!

> meta-java - no release branches.  Seems to only be focused on master. 
> I've had trouble even finding a revision that will compile on Morty.

koen@beast:/build/v2016.12$ cat .repo/manifests/default.xml  | grep java
  <project name="meta-java" path="layers/meta-java" remote="yocto"
revision="a265b31ec7d022be254abdf959360a7624208585" upstream="master"/>

That generates an openjdk-8 good enough to run jenkins on x86-64, no idea
about other archs.

regards,

Koen

> 
> meta-oracle-java has a Morty branch, but the URI for the binaries is bad
> so it fails to install.
> 
> Overall it seems like Java is not a very favored or platform at the
> moment.
> 
> -- Steven Osborn http://lolsborn.com
> 



