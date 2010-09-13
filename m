Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OvGVi-0006Au-3n
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 23:24:23 +0200
Received: (qmail 8025 invoked by uid 1003); 13 Sep 2010 21:23:34 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Sep 2010 21:23:34 -0000
Message-ID: <4C8E9653.2020601@balister.org>
Date: Mon, 13 Sep 2010 17:23:31 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
In-Reply-To: <AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Mon, 13 Sep 2010 21:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2010 04:42 PM, Khem Raj wrote:
> On Mon, Sep 13, 2010 at 1:20 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com>  wrote:
>> As I don't really see progress on this, I am planning to take action
>> in a few days.
>> Since Khem expressed a preference to keep the files accessible, I'm
>> planning not to remove the unneeded patches, but instead move the to
>> the obsolete dir.
>> (alternate could be to move them to a dir called unused in the recipe dir).
>> Removal will be tested by verifying that bitbake -c patch remains
>> working on all dirs where unused files are removed.
>>
>
> sometimes same names patches exist in different dirs and if you remove
> one then it will start picking the other one
> silently so make sure such cases are not there. In general I am wary
> of mass changes which could creep in some bugs like that
> Ideally I would suggest that you look at each and every change before its final.

I agree with Khem. please do this a directory of recipes at a time.

Philip

>
>> Frans.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>


