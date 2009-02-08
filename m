Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LW5MI-0006OZ-LU
	for openembedded-devel@openembedded.org; Sun, 08 Feb 2009 09:49:46 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LW5Lg-00052u-0B
	for openembedded-devel@openembedded.org; Sun, 08 Feb 2009 08:49:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 08 Feb 2009 08:49:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 08 Feb 2009 08:49:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Feb 2009 09:48:52 +0100
Message-ID: <gmm69k$act$1@ger.gmane.org>
References: <3ea34a000902070825j48291819x61976d871da422d@mail.gmail.com>	<gmkdv7$cbc$1@ger.gmane.org>
	<3ea34a000902071827x6e28e053m837c6334ca5939f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <3ea34a000902071827x6e28e053m837c6334ca5939f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: c compiler cannot create executables (do_configure, gettext-native-0.17-r3)
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
X-List-Received-Date: Sun, 08 Feb 2009 08:49:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-02-09 03:27, Christopher Friedt wrote:
> Hi Koen
>
> I determined what the problem was - ccache - I think that because
> ccache existed on my (well, my work's) build machine, that it
> consistently interfered with *-native.
>
> The remote machine I'm building OE on is a CentOS 4.5 box (not my
> preference, but the IT manager's), and my solution was to just remove
> ccache entirely.

CCACHE="" in local.conf. It seems that Red Hat based OS'es don't have a 
ccache that plays nice :(

regards,

Koen



