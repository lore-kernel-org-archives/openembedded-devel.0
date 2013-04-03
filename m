Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UNUF1-00063T-NP
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 22:25:07 +0200
Received: (qmail 15244 invoked by uid 1003); 3 Apr 2013 20:07:55 -0000
Received: from unknown (HELO ?192.168.1.125?)
	(philip@opensdr.com@96.240.165.43)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Apr 2013 20:07:53 -0000
Message-ID: <515C8C04.3040904@balister.org>
Date: Wed, 03 Apr 2013 16:07:32 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
In-Reply-To: <FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
X-Enigmail-Version: 1.5.1
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 20:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/03/2013 03:57 PM, Koen Kooi wrote:
> 
> 
> Op 3 apr. 2013 om 21:34 heeft Philip Balister <philip@balister.org> het volgende geschreven:
> 
>> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>>
>>> Just like https://github.com/naguirre/meta-cubox you're mixing
>>> DISTRO policy in the machine files by setting the tuning to
>>> hardfloat. Don't do that. If you want hardfloat, set that in your
>>> distro config, not in your machine config.
>>
>> This keeps coming up, but I do not see an answer that works for people
>> creating BSP's that work with just oe-core and a BSP layer.
>>
>> How are we supposed to set TUNE parameters for this case? And yes,
>> this case *must* produce useful output.
> 
> Local.conf

Fail. This means BSP providers are depending on users to do the right thing.

The BSP should be able to say what it wants and a distro layer needs to
override the BSP choice for distributions providing binaries for
multiple machines.

Philip


> 
> 
> 
>>
>> Philip
>>
>>
>>>
>>>
>>> _______________________________________________ Openembedded-devel
>>> mailing list Openembedded-devel@lists.openembedded.org 
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>>>
> 
> 


