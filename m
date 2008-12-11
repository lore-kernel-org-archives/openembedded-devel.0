Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAgN6-0006mG-1z
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 08:54:09 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LAgJ9-0001Wz-11
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 07:50:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 07:50:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 07:50:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Dec 2008 08:48:56 +0100
Message-ID: <ghqgl8$r9j$2@ger.gmane.org>
References: <20081210234910.GA16050@excalibur.local>	<200812110137.01104.mickey@vanille-media.de>	<4940650B.1000802@dls.net>
	<200812110207.39687.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <200812110207.39687.mickey@vanille-media.de>
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
X-List-Received-Date: Thu, 11 Dec 2008 07:54:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-12-08 02:07, Michael 'Mickey' Lauer wrote:
> Am Thursday 11 December 2008 01:55:39 schrieb Mike (mwester):
>> Michael 'Mickey' Lauer wrote:
>>> We can compile it completely without dbus support in a seperate recipe,
>>> if that's what you want -- but given the increasing ubiquity of dbus,
>>> that doesn't make much sense.
>> Which raises a point -- there are still devices out there that don't
>> want the X11 libraries (due to flash space limitations) -- perhaps it is
>> _dbus_ that needs splitting into two separate recipes, one with X and
>> one without?
>
> I'd rather write a patch that tries to dlopen libX11. dbus needs libX11 only
> for setting one property on the root window.

Well, as I said in another mail, dbus-1 and libdbus-1-3 don't require 
x11 *at all*, so no patch needs to be written. For people wanting the 
x11 integration they can install the 'dbus-x11' subpackage. Just like 
python-tk :)

regards,

Koen




