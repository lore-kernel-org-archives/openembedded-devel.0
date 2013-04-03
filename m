Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UNWo9-0000Wm-65
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 01:09:33 +0200
Received: (qmail 1893 invoked by uid 1003); 3 Apr 2013 22:52:20 -0000
Received: from unknown (HELO ?192.168.1.125?)
	(philip@opensdr.com@96.240.175.73)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Apr 2013 22:52:20 -0000
Message-ID: <515CB2A3.3080100@balister.org>
Date: Wed, 03 Apr 2013 18:52:19 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
In-Reply-To: <CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 03 Apr 2013 23:09:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/03/2013 05:43 PM, Otavio Salvador wrote:
> On Wed, Apr 3, 2013 at 4:34 PM, Philip Balister <philip@balister.org> wrote:
>> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>>
>>> Just like https://github.com/naguirre/meta-cubox you're mixing
>>> DISTRO policy in the machine files by setting the tuning to
>>> hardfloat. Don't do that. If you want hardfloat, set that in your
>>> distro config, not in your machine config.
>>>
>>
>> This keeps coming up, but I do not see an answer that works for people
>> creating BSP's that work with just oe-core and a BSP layer.
>>
>> How are we supposed to set TUNE parameters for this case? And yes,
>> this case *must* produce useful output.
> 
> I don't think TUNE is a distro thing. It is indeed a board setting and
> I expect every board to have a good know TUNE setting.

The problem is if you are building for several machines, you may want to
force the same tune settings for several machines that are different
from what the BSP owner "declared" the default to be. Otherwise all
packages become per machine.

Philip

> 
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 


