Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDN8t-0007rv-Dg
	for openembedded-devel@openembedded.org; Sun, 07 Jun 2009 20:30:51 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDMzl-0006gZ-RN
	for openembedded-devel@openembedded.org; Sun, 07 Jun 2009 18:21:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 07 Jun 2009 18:21:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Jun 2009 18:21:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Jun 2009 20:21:09 +0200
Message-ID: <h0h0el$60i$1@ger.gmane.org>
References: <20090607175542.GA26712@fh-wedel.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <20090607175542.GA26712@fh-wedel.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Sun, 07 Jun 2009 18:30:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-06-09 19:55, Martin Dietze wrote:
> Hi,
>
>   just as my build broke again wiht this issue:
> glibc-package.bbclass defines PACKAGES which always contains
> glibc-dbg, however the build is without debug symbols for build
> time reasons. I guess eventually we'd like to configure from
> somewhere whether or not we want debug code and the glibc-dbg
> package.
>
> Do we have any "official" mechanism we can use to accomplish
> this? Since this is something which *always* breaks builds I'd
> think we should do something about this sooner rather than
> later.

What's exactly breaking? It's perfectly legal (and needed for 
depchains!) for -dbg package to be empty.

regards,

Koen



