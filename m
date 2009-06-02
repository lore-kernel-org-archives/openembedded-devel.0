Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBOxw-00065M-ND
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 10:03:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBOpP-0005pQ-DM
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 07:54:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 07:54:35 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 07:54:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Jun 2009 09:54:23 +0200
Message-ID: <h02lrg$qs$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>	<h01g9t$c2a$1@ger.gmane.org>
	<C62896630644CE43BF64B0FF0AC27F0E01C6E7@mail.ad.skymv.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E01C6E7@mail.ad.skymv.com>
Sender: news <news@ger.gmane.org>
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 08:03:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-06-09 07:18, Chuck Kamas wrote:
> :-)
>
> But there is too much bloat in angstrom.  I need a lean mean fighting machine.

That is just bullshit. You said you switched from angstrom to minimal to 
'upgrade', well minimal is just a copy of angstrom with some sed 
s:angstrom:minimal: applied. And if you look real close at micro you'll 
see that the only real differences with angstrom are:

1) different uclibc config
2) more applets in busybox
3) doesn't touch task-base.

And further more, their 'micro-image' is using features of image.bbclass 
that were done by angstrom developers for the angstrom distribution, but 
in such a way that they were generally applicable.

So, knowing all this, please elaborate on the 'bloat' you are talking 
about.

regards,

Koen



