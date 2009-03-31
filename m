Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LoduF-0001jP-HR
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 15:21:31 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lods6-0000q2-Vi
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 13:19:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 13:19:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 13:19:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Mar 2009 15:19:08 +0200
Message-ID: <gqt58c$l2k$1@ger.gmane.org>
References: <49D21128.30201@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <49D21128.30201@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: ugly OE issue with RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Mar 2009 13:21:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-03-09 14:48, Robert Schuster wrote:
> Hi,
> I have this specific issue with with RDEPENDS and no idea how to solve
> it. It affects my Java recipes but in theory it can happen to any other
> recipes too. It is nothing Java specific. The unwanted effect is that OE
> builds to much and as such slows down the time to build a specific
> package considerably.
>
> Ok here is how it goes:
>
> I want to build recipe jamvm (application). This in turn needs recipe
> classpath. classpath puts a lot of useful things into staging which is
> needed by the jamvm build. So far so good.
>
> The problem is. classpath's tar.gz also contains some Java applications
> (the well known jar, javah and so). Via PACKAGE variable I place those
> into the binary package classpath-tools. To make everything as smooth as
> possible for the user I furthermore declare:
>
> RDEPENDS_classpath-tools = "java2-runtime". This means: For this package
> to work correctly a Java runtime needs to be installed. OE in turn
> demands that this java2-runtime dependency is also satisfied during the
> build.
>
> The odd thing that happens here is: jamvm (which I want to build) is a
> provider for java2-runtime but this does not interest OE and it builds
> another provider for java2-runtime instead. In my case this is
> openjdk-6, a recipe takes a very long time to built.

The real issue is that you RDEPEND on a virtual package, but you're not 
giving OE enough info to resolve the virtual to a real provider. I 
suppose you want bitbake to (reverse) check the build target for any 
virtuals it might provide, right?

regards,

Koen



