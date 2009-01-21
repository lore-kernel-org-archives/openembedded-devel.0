Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LPcft-0004dq-Sf
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 13:59:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LPcZ3-0001Wd-Qm
	for openembedded-devel@openembedded.org; Wed, 21 Jan 2009 12:52:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 12:52:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Jan 2009 12:52:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Jan 2009 13:52:01 +0100
Message-ID: <gl75ph$br9$1@ger.gmane.org>
References: <20090121111008.GB3726@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090114 Shredder/3.0b2pre
In-Reply-To: <20090121111008.GB3726@excalibur.local>
Sender: news <news@ger.gmane.org>
Subject: Re: Where to put a check if my tmp is a symlink?
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
X-List-Received-Date: Wed, 21 Jan 2009 12:59:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-01-09 12:10, Stefan Schmidt wrote:
> Hello.
>
> I spent at least 2 hours yesterday to understand why lintool-native breaks on a
> build from scratch for me now.
>
> Finally I found this bugreport:
> http://bugs.openembedded.org/show_bug.cgi?id=4904
>
> And yes I thought symlinking between different tmp dirs would be a neat idea.
> Without symlink it works fine again. This leads me to the question if we should
> check for this and bail out instead of letting the first 150 tasks go through
> and then fail in libtool with "already configured use make distclean"

binutils will fail as well

> Anything I missed?

It *is* mentioned in 
http://wiki.openembedded.net/index.php/Getting_Started, but it does that 
a small mental leap to apply the symlink warning to directories below 
/stuff as well :)

Anyway, checking for a symlink in sanity.bbclass would be a good idea.

regards,

Koen





