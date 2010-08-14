Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OkMCP-0008K6-Jn
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 21:15:28 +0200
Received: (qmail 2485 invoked by uid 1003); 14 Aug 2010 19:14:39 -0000
Received: from localhost (HELO ?192.168.1.148?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Aug 2010 19:14:38 -0000
Message-ID: <4C66EB00.7050306@balister.org>
Date: Sat, 14 Aug 2010 12:14:08 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
In-Reply-To: <AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 19:15:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2010 12:01 PM, Frans Meulenbroeks wrote:
> 2010/8/14 AJ ONeal<coolaj86@gmail.com>:
>> This is about the 4th time that I've `rm -rf`-d everything and started from
>> scratch and never yet got a working `bitbake omap3-console-image`
>>
>> Every time I `git pull` it's a different set of problems. It's never the
>> same package twice, but they never all compile for the basic console image
>> anywhere from 4 to 20 hours in.
>>
>> Fortunately, I do have a machine that did build omap3-console-image a few
>> weeks ago at work. But I've never been able to get it on my machine at home
>> (same os) to start playing around with.
>>
>> What needs to happen in order for things to git checked that they work with
>> at least a few common meta-tasks before being pushed out?
>> And is there anything I can do to help? (Donate some machine time to run
>> tests, for example)
>>
>>
>> Obviously, we all have our day jobs and whatnot, but this is becoming really
>> frustrating for me and I'd like to see things improve.
>>
>
> If you are using dev head, you're living on the edge. If you can't
> stand that better use the stable branch.
>
> As far as there are issues:
> Either report them, or better fix them.
> (or as a workaround you could find the commit wthat broke it and
> report that and perhaps temporariy locally revert that commit if you
> cannot fix it).
>
> Having said that:
> I don't really see many issues. Maybe I'm building a different set of
> packages or for a different set of hw or for a different distro.

I think they are building from the gumstix overo repo. We are interested 
in failures (at least failures for recipes that are in .dev), but we 
can't guarantee when our fixes will hit the gumstix repository.

Philip

Philip


