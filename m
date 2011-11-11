Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1ROlyR-0007dM-SU
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 08:56:32 +0100
Received: by faat2 with SMTP id t2so3925576faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 23:50:14 -0800 (PST)
Received: by 10.223.7.20 with SMTP id b20mr17475049fab.21.1320997814175;
	Thu, 10 Nov 2011 23:50:14 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id k26sm14601363fab.8.2011.11.10.23.50.12
	(version=SSLv3 cipher=OTHER); Thu, 10 Nov 2011 23:50:13 -0800 (PST)
Message-ID: <4EBCD3B3.3020202@dresearch-fe.de>
Date: Fri, 11 Nov 2011 08:50:11 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <4EB79325.80107@dresearch-fe.de>
	<1320660702.22985.636.camel@phil-desktop>
	<4EB7B383.10106@dresearch-fe.de>
	<1320663454.22985.643.camel@phil-desktop>
In-Reply-To: <1320663454.22985.643.camel@phil-desktop>
Cc: Tim Riker <Tim@Rikers.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: default route handling of udhcpc
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
X-List-Received-Date: Fri, 11 Nov 2011 07:56:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.11.2011 11:57, Phil Blundell wrote:
> If it's the case that interfaces always do go down and then up again
> when changing configuration then you're right, it would be a non-issue.
> I guess maybe the best thing to do is to make sure that this is true and
> then we could avoid the unconditional route squashing as you suggest.
>
>> On the contrary. As i mentioned above we really hit a problem with current setting.
>>
>> * Interface ethA (static config with default route) comes up and sets this default route.
>> * Interface ethB (in our case a USB-NIC for diagnostic purposes, DHCP with default route) comes up and *replaces* the former default route.
>>
>> scenario a)
>> * Interface ethB goes down and removes its default route.
>> * There does not exist a default route any longer. :(
>>
>> scenario b)
>> * Interface ethA tries to go down.
>> * This fails because removing the not-existing default route of config ethA fails. :(
>
> That latter scenario sounds like a separate scripting bug: failing to
> remove a route shouldn't prevent the interface going down.

It seems that we can't find a general solution for the default route handling for the moment. So i like to fix this bug at first. Can someone give a hint which scripts are involved here?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


