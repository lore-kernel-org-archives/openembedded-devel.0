Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nm64G-0003g6-H4
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 14:53:56 +0100
Received: (qmail 28753 invoked by uid 1003); 1 Mar 2010 13:51:01 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Mar 2010 13:51:01 -0000
Message-ID: <4B8BC644.9090801@balister.org>
Date: Mon, 01 Mar 2010 08:51:00 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1266605268-5957-1-git-send-email-clarson@kergoth.com>
	<hmg0mh$ou0$1@dough.gmane.org> <hmg1p8$suj$1@dough.gmane.org>
	<20100301094515.GI30145@xora-desktop.xora.org.uk>	<hmg2f8$usj$1@dough.gmane.org>
	<b6ebd0a51003010542r136a7572n1a947161c196fff8@mail.gmail.com>
In-Reply-To: <b6ebd0a51003010542r136a7572n1a947161c196fff8@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: when running 'file', be explicit 	about the path to the magic
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
X-List-Received-Date: Mon, 01 Mar 2010 13:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2010 08:42 AM, Chris Larson wrote:
> Ugh, lovely.  Okay, I'll take care of it today, sorry for the hassle.

It is Monday after all :)

Philip

>
> On Mon, Mar 1, 2010 at 2:47 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-03-10 10:45, Graeme Gregory wrote:
>>> On Mon, Mar 01, 2010 at 10:35:36AM +0100, Koen Kooi wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> I think I know what's happening.
>>>>
>>>> On my (debian) buildhost I have file 4.26. (Re)building file-native 5.04
>>>> gives me:
>>>>
>>>> ./staging/x86_64-linux/usr/share/misc/magic.mgc
>>>>
>>>> Graeme has file 5.03 on his buildhost and has
>>>>
>>>> ./staging/x86_64-linux/usr/share/file/magic
>>>>
>>>> So it seems that the buildhost contamination also affects file-native :(
>>>>
>>> Its not contamination, its just simply that file 5.XX moved its magic
>>> file to /usr/share/misc/
>>>
>>> Im still building 4.21 for some reason so dont see this.
>>
>> Bitbake 1.8.x? I'm using bitbake master from git, that has a different
>> sorting algo AIUI.
>>
>> regards,
>>
>> Koen
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFLi40oMkyGM64RGpERAjEIAJ4+rW+07FQBjx9std0w7ZE1tYcdtQCgtgI6
>> X6RRtXw6ttRVlMSfzyUAUBk=
>> =QSlm
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>


