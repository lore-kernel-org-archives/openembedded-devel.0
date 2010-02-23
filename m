Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nk3QH-0002O0-TT
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 23:40:13 +0100
Received: (qmail 31221 invoked by uid 1003); 23 Feb 2010 22:37:22 -0000
Received: from localhost (HELO ?192.168.1.182?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Feb 2010 22:37:21 -0000
Message-ID: <4B84589E.1060209@balister.org>
Date: Tue, 23 Feb 2010 14:37:18 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>	<4B83DC88.7070705@tycoelectronics.com>
	<hm0qff$9v8$1@dough.gmane.org>
In-Reply-To: <hm0qff$9v8$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: reply to digest mails, was: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 22:40:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/2010 06:58 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> When you receive a digest mail it tells you to change the subject line
> to something non-bogus. Please do so in the future.
>
> If it turns out tha that is too hard for people we can consider turning
> off digests.

I tend to delete emails with the subject only containing digest info. 
I'm sure there are a few people who need the digests and no sense making 
life harder for them because of the actions of a few people.

Philip


>
>
> On 23-02-10 14:47, Jay Snyder wrote:
>>>
>>>
>>> try the following:
>>> TARGET_CC_ARCH += "${LDFLAGS}"
>>> This should resolve your problems if you build your executable from
>>> within your OE buildsystem.
>>> In very rare cases (e.g. when you build some programs outside of OE
>>> but use OE to package all) it could be useful to use the following:
>>> INSANE_SKIP_objc = "True"
>>> AFAIK that sould not be commonly used, but it worked for me.
>>>
>>> majo
>>>
>>
>> Updating my GCC recipe with a "git pull" worked (the INSANE_SKIP_obj
>> line got added sometime recently).
>>
>> The TARGET_CC_ARCH += "${LDFLAGS}"  fix is the first thing that I try
>> when i get this problem, and usually fixes it, although there are some
>> packages that required patching Makefile.ac files throughout the
>> project.     As I just stated in another reply, when I get beyond the
>> current project time crunch (coming up on a release deadline), I will
>> submit my recipe patches for inclusion in the OE git repository.
>>
>> Thanks,
>> Jay
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLg+0vMkyGM64RGpERAoELAKCTgm09I1gjcpAGVfd4CcTpD6WE7wCfdJ/k
> spNEAoXQJqueAMXjoPCgqS8=
> =Kt9W
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


