Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jy48W-00032m-Iv
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 14:06:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jy46H-0002fj-8i
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 12:04:21 +0000
Received: from wlan137171.mobiel.utwente.nl ([130.89.137.171])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 19 May 2008 12:04:21 +0000
Received: from k.kooi by wlan137171.mobiel.utwente.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 19 May 2008 12:04:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 19 May 2008 14:04:11 +0200
Message-ID: <g0rqbs$fa5$1@ger.gmane.org>
References: <c384c5ea0805141505r451510dar128090c7fc3d270@mail.gmail.com>	<200805182355.25777.mickey@vanille-media.de>
	<200805191026.10545.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: wlan137171.mobiel.utwente.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008051303)
In-Reply-To: <200805191026.10545.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: Who is the wrt54oe maintainer?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 19 May 2008 12:06:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia niedziela, 18 maja 2008, Michael 'Mickey' Lauer napisał:
>> On Thursday 15 May 2008 00:05:25 Leon Woestenberg wrote:
>>> who is the wrt54oe distro maintainer?
>> Unfortunately, there's no one. I always had the hope we could get one
>> of the openwrt-fork-maintainers on board. Marcin and me once did some
>> work towards having this popular device in OE, but we both could not
>> find enough time to keep it up.
>
> wrt54 + wrt54oe was working combo to build packages for OpenWRT
> installation. Today we also have distro config to build such ones with
> OpenWRT provided toolchain.
>
>>> It needs love in conf/distro/wrt54oe.conf, as it  isn't up to date
>>> with our external toolchain opt-in, binutils-cross is not locked
>>> down, and the c library was not chosen, nor its version.
>> Indeed. Could I talk you into adding the necessary bits?
>
> It should be uclibc 0.9.27 (or newer if binary compatible), binutils 2.18,
> gcc 3.4.4.

Note that "binary compatible" doesn't mean a lot when using uClibc. If 
you change the defconfig within the same version you can get "binary 
incompatible"[1] results on some or all depending applications.

regards,

Koen

[1] I'm not sure how that effects our site files for autotools.



