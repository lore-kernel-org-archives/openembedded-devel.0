Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAhEP-0001Xh-I4
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 09:49:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAhAT-0003Hy-Lx
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 08:45:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 08:45:09 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 08:45:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Dec 2008 09:45:02 +0100
Message-ID: <ghqjue$4fe$1@ger.gmane.org>
References: <20081210234910.GA16050@excalibur.local> <49405BD7.2010801@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <49405BD7.2010801@gmx.de>
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
X-List-Received-Date: Thu, 11 Dec 2008 08:49:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-12-08 01:16, Thomas Kunze wrote:
> Stefan Schmidt schrieb:
>> Hello.
>>
>> While playing to get connman 0.1 running I found that we don't ship
>> two files in
>> the wpa-supplicant that come in handy.
>>
>> /etc/dbus-1/system.d/dbus-wpa_supplicant.conf
>>
>> That one is really needed. Without it a wpa-supplicant -u barks out
>> about wrong
>> security.
>>
>> /usr/share/dbus-1/system-services/dbus-wpa_supplicant.service
>>
>> This one is a nice-to-have. It allows autostart the service with the
>> service
>> activation infrastructure from dbus. If a bus name listed in such a
>> file is
>> called and not available it gets started the way described in this file.
>>
>> The following patch i nstalls the files correctly for me. Never used
>> FILES_${PN}
>> before so I would like to get some review before.
> Maybe its better to create a package wpasupplicant-dbus. IMO we should
> try to split packages if we can and the dbus
> functionallity is clearly separable from wpasupplicant core functions.

If it gets split (I don't have a strong opinion on that), don't forget 
to add an RDEPEND_${PN}-dbus = "dbus-1" to make it drag in dbus.

regards,

Koen

>
> Regards,
> Thomas




