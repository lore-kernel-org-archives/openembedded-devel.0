Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LH0W5-0006RY-LG
	for openembedded-devel@openembedded.org; Sun, 28 Dec 2008 19:37:33 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LH0Qu-0000EY-FL
	for openembedded-devel@openembedded.org; Sun, 28 Dec 2008 18:32:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 28 Dec 2008 18:32:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 28 Dec 2008 18:32:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Dec 2008 19:32:04 +0100
Message-ID: <gj8gn4$e5b$1@ger.gmane.org>
References: <20081227201345.D64E3E8406@amethyst.openembedded.net>
	<200812281344.50648.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081217 Shredder/3.0b2pre
In-Reply-To: <200812281344.50648.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Koen Kooi : gimp: add gdk-pixbuf-csource-native to DEPENDS
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
X-List-Received-Date: Sun, 28 Dec 2008 18:37:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-12-08 13:44, Michael 'Mickey' Lauer wrote:
> Am Saturday 27 December 2008 21:13:45 schrieb GIT User account:
>> +DEPENDS = "gdk-pixbuf-csource-native sed-native gdk-pixbuf-csource-native
> libart-lgpl gtk+ jpeg libpng libexif tiff"
>
> Listed twice now,

I must have been sleeping while making that change

> once should do.

Actually listing it once or twice doesn't do:

http://tinderbox.openembedded.net/packages/294846/

I suspect it needs adjusting for the new staging layout, and I also 
think gtk+ should have it in DEPENDS, since more and more apps expect 
gtk+ to install it.

regards,

Koen





