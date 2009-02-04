Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUooh-0005dY-QW
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 21:57:51 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUooV-0003iL-R2
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 20:57:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 20:57:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 20:57:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Feb 2009 21:57:27 +0100
Message-ID: <gmcvfn$ahd$1@ger.gmane.org>
References: <gmcu6b$5r9$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <gmcu6b$5r9$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: python 'platform' module not being built
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
X-List-Received-Date: Wed, 04 Feb 2009 20:57:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-02-09 21:35, Koen Kooi wrote:
> Hi,
>
> Frans and I are trying to get python-coherence working, but we are
> hitting a few snags:
>
> root@beagleboard:~# coherence
> Traceback (most recent call last):
> File "/usr/bin/coherence", line 21, in <module>
> from coherence import __version__
> File "/usr/lib/python2.6/site-packages/coherence/__init__.py", line 1,
> in <module>
> import platform
> ImportError: No module named platform
> root@beagleboard:~#
>
> Some googling brings me to:
>
> http://docs.python.org/library/platform.html
>
> That suggests that it's part of python, but it doesn't seem to get built
> in OE, is there any reason for that? If not, what would be the best way
> to build it?

Ignore more, it's in python-misc (which doesn't get dragged in by 'opkg 
install python-modules')

regards,

Koen



