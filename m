Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OkqXx-0000dj-9B
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 05:39:39 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 19ADF16607CC; Sun, 15 Aug 2010 21:39:06 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8A0FA16607C0;
	Sun, 15 Aug 2010 21:38:45 -0600 (MDT)
Message-ID: <4C68B2C5.5030908@mlbassoc.com>
Date: Sun, 15 Aug 2010 21:38:45 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
In-Reply-To: <AANLkTim_u5O3bLgdLiwE4fPCnbjRoUY1+Pad9iB8qXPW@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
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
X-List-Received-Date: Mon, 16 Aug 2010 03:39:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2010 01:01 PM, Frans Meulenbroeks wrote:
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

The biggest problem (as discussed at great length already) is that the
distance from 'dev' to 'stable' can be measured in years :-(  'stable'
just isn't useful at all for "current" work...

> As far as there are issues:
> Either report them, or better fix them.
> (or as a workaround you could find the commit wthat broke it and
> report that and perhaps temporariy locally revert that commit if you
> cannot fix it).
>
> Having said that:
> I don't really see many issues. Maybe I'm building a different set of
> packages or for a different set of hw or for a different distro.

Turning a blind eye, I would say.  I (and others) have nearly 0%
success building any Angstrom image on an x86_64 based host.  I've tried
the latest Ubuntu and Fedora - neither works, both yield different failures.
At least I have i686 build hosts to fall back on, but there are issues there
as well.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


