Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAkwX-0003ln-Gc
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 13:47:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAksX-000315-0m
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 12:42:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 12:42:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 12:42:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Dec 2008 13:42:40 +0100
Message-ID: <ghr1s1$ebn$1@ger.gmane.org>
References: <20081210234910.GA16050@excalibur.local>	<49405BD7.2010801@gmx.de>	<200812110137.01104.mickey@vanille-media.de>	<4940650B.1000802@dls.net>	<ghqgho$r9j$1@ger.gmane.org>
	<49410819.6040302@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <49410819.6040302@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 12:47:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-12-08 13:31, Mike (mwester) wrote:
> Koen Kooi rudely writes:
>> On 11-12-08 01:55, Mike (mwester) wrote:
>>
>> http://www.angstrom-distribution.org/repo/?pkgname=dbus-1
>> http://www.angstrom-distribution.org/repo/?pkgname=libdbus-1-3
>>
>> Now where do you see it the _packages_ depending on libx11-6? Is dbus
>> going to be the new python where everybody starts screaming about
>> requiring X at runtime, when it's only a buildtime dep to build an
>> *optional* subpackage like python-tk? Please stop with the FUD.
>
> dbus-1 recommends dbus-x11, dbus-x11 depends libx11-6 (and other X libs).
>
> So there you go, opkg install<anything-depending-on-dbus>  blows up your
> flash space by pulling in numerous X libs.  No FUD - very real concern.
>   (But if it's not a concern for Angstrom, then fine -- please ignore
> this issue; if I fix it, I'll make sure that it won't change for Angstrom.)

That rrecommends shouldn't be there specifically for the reasons you 
mentioned. I don't notice it since I looked up the old package name 
'dbus-1' instead of the new one 'dbus', sorry about that.

regards,

Koen

>
> Regards
> Mike (mwester)




