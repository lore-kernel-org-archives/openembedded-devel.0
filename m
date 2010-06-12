Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1ONQhB-0004BH-H3
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 15:24:27 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 57B5016606B5; Sat, 12 Jun 2010 07:19:57 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id B4E8516606A7;
	Sat, 12 Jun 2010 07:19:56 -0600 (MDT)
Message-ID: <4C13897C.3080603@mlbassoc.com>
Date: Sat, 12 Jun 2010 07:19:56 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BFE5402.8030607@mlbassoc.com>	<loom.20100528T112202-923@post.gmane.org>	<4BFFAC85.9000008@mlbassoc.com>
	<loom.20100612T143257-592@post.gmane.org>
In-Reply-To: <loom.20100612T143257-592@post.gmane.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jacinto Alvarez <jacintoa@hotmail.com>
Subject: Re: Problems building Angstrom images
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
X-List-Received-Date: Sat, 12 Jun 2010 13:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2010 06:37 AM, Jacinto Alvarez wrote:
> Gary Thomas<gary<at>  mlbassoc.com>  writes:
>
>
>>>> To be clear, I'm building
>>>>      MACHINE="beagleboard"
>>>>      DISTRO="angstrom-2008.1"
>>>>
>>>
>>> You got any help with this yet Gary?
>>> I just replied here as it was the only
>>> similar error i could find
>>
>> I have seen no replies to this problem, sorry.  I *would*
>> really like to see it fixed
>
> + one more facing the same issue :(
> Still no hints as to how to fix this?

What sort of problem are you seeing?

What I found was that the 'encodings*' packages seem to have been
built (the stamps were there), but there were no .ipk packages
for them.  I simply forced them to rebuild and all started working.
   % bitbake encodings -c clean
   % bitbake encodings
   % bitbake beagleboard-linuxtag2010-demo-image

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


