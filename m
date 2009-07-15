Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MR9lJ-0002Eo-2C
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 21:03:29 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MR9YI-0005PV-L2
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 18:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Jul 2009 18:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Jul 2009 18:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Jul 2009 20:46:58 +0200
Message-ID: <h3l873$h5m$2@ger.gmane.org>
References: <200907151607.19897.mok@mnet-online.de>	<1247667373.6648.290.camel@mill.internal.reciva.com>
	<200907151924.52172.mok@mnet-online.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <200907151924.52172.mok@mnet-online.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] patch for bluetooth audio.conf
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
X-List-Received-Date: Wed, 15 Jul 2009 19:03:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-07-09 19:24, Klaus 'mrmoku' Kurzmann wrote:
> Am Mittwoch 15 Juli 2009 16:16:13 schrieb Phil Blundell:
>> On Wed, 2009-07-15 at 16:07 +0200, Klaus 'mrmoku' Kurzmann wrote:
>>> to get audio routing for bluetooth headsets correct on OpenMoko phones we
>>> need the attached patch to bluez.inc which changes audio.conf to enables
>>> the SCORouting=PCM option.
>>>
>>> Is this something that can be done globally? Or will it break on other
>>> hardware?
>>
>> It will break on (some) other hardware.  SCORouting is a binary setting:
>> you can send audio over the HCI, or through a dedicated port (PCM) but
>> not both.  This change would lose on machines where the PCM interface
>> isn't connected to anything: in particular that probably means any
>> machine where the bluetooth hardware is on a usb dongle or CF card.
>>
>>> If it cannot be done globally, what is the correct way to do that?
>>> We (SHR distro) could do that with a distro override, but if it has the
>>> possibility to break other hardware we would not want that ;) We would
>>> rather add a machine override then. Right now bluez4 is *not* machine
>>> dependent and the config files are included in the base package. I see
>>> two ways to do that:
>>>
>>> a) make bluez4 machine dependent and add overrides for om-gta01/2
>>> b) extract the config files into some bluez4-config package and provide a
>>> different one for om-gta01/2
>>
>> Option (a) sounds fairly unattractive.  My first preference would be to
>> figure this out at runtime (eg by extending blueprobe to do it) rather
>> than in a static file; if that's impossible or impractical then your
>> option (b) is probably fine.
> As I'm told that making bluez autodetect that is difficult...

Blueprobe can already do autodetection and more, so I don't see what the 
problem is.



