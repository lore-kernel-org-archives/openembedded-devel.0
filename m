Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 22A6C77C9E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 09:09:27 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1d3Iwr-0005ii-Dh for openembedded-devel@lists.openembedded.org;
	Wed, 26 Apr 2017 11:09:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 26 Apr 2017 11:09:19 +0200
Message-ID: <odpo3p$f4m$1@blaine.gmane.org>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
	<67ed839c-53ba-4b8b-2e9f-a40655e25e98@denx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <67ed839c-53ba-4b8b-2e9f-a40655e25e98@denx.de>
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
X-List-Received-Date: Wed, 26 Apr 2017 09:09:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 24-04-17 om 09:02 schreef Stefano Babic:
> On 22/04/2017 00:25, Steven Osborn wrote:
>> Is anyone using Java on OE devices right now?
>> 
>> meta-java - no release branches.  Seems to only be focused on master. 
>> I've had trouble even finding a revision that will compile on Morty.
>> 
>> meta-oracle-java has a Morty branch, but the URI for the binaries is 
>> bad so it fails to install.
>> 
>> Overall it seems like Java is not a very favored or platform at the
>> moment.
>> 
> 
> I have got the same problems - the missing of release branches in 
> meta-java is quite confusing. -master does not work with last releases, 
> and everybody have to find working commit id for each release. And after 
> that, cherry-picking something from -master to fix global issue (it was 
> for me dependency's issue with classpath).
> 
> Maybe we have to try to propose the maintainers to set release branches 
> as usual.

You can add an empty class to make 'master' work with 'morty':

https://github.com/Angstrom-distribution/meta-angstrom/commit/2eca0f1c932f098eb7fd877c5b00225408b2e42d

And I had to do this to make it build:

https://github.com/Angstrom-distribution/meta-angstrom/blob/709abee819ee349dab873f6abb02c404b2c65331/recipes-tweaks/ecj/ecj-initial-native.bbappend

With this I can build 'openjre-8' on debian and fedora hosts for armv7 and
x86_64. It even runs jenkins, but it used 4x the amount of memory openjdk-7
did :(

regards,

Koen


