Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBuf5-0003Fm-4y
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 19:26:22 +0100
Received: (qmail 9666 invoked by uid 1003); 21 Nov 2009 18:24:47 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Nov 2009 18:24:46 -0000
Message-ID: <4B08306C.1000009@balister.org>
Date: Sat, 21 Nov 2009 13:24:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258782956.5424.17.camel@gnutoo-desktop>	<alpine.LFD.2.00.0911210112500.25956@localhost>	<4B07F8F8.3060802@balister.org>
	<4B082733.1060504@gmx.net>
	<ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
In-Reply-To: <ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 18:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2009 01:07 PM, Frans Meulenbroeks wrote:
> 2009/11/21 Bernhard Kaindl<bernhard.kaindl@gmx.net>:
>> Hi,
>>    indeed, the SDL_mixer-1.2.9.tar.gz has changed on
>> http://www.libsdl.org/projects/SDL_net/release,
>> so conf/checksums.ini is outdated, as it stands, and has to be updated:
>>
>> Signed-off-by: Bernhard Kaindl<bernhard.kaindl@gmx.net>
>>
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 784a092..e1aac1f 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -1099,8 +1099,8 @@ md5=0b5b91015d0f3bd9597e094ba67c4d65
>>   sha256=a8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e0b6
>>
>>   [http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz]
>> -md5=a9eb8750e920829ff41dbe7555850156
>> -sha256=557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
>> +md5=09eb4585f46d3527fe7fce8af8f9e591
>> +sha256=7216a89d92327d2f0fe03e78f3c758a52be68c29daf8e971c226f4a3191e9ec0
>>
>>   [http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
>>   md5=e45b1048d2747480dcc65ece4130a920
>>
>> Philip Balister schrieb:
>>>
>>> On 11/21/2009 01:15 AM, Robert P. J. Day wrote:
>>>>
>>>> On Sat, 21 Nov 2009, GNUtoo wrote:
>>>>>
>>>>> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]
>>>>>
>>>>> NOTE: The MD5Sums did not match. Wanted:
>>>>> 'a9eb8750e920829ff41dbe7555850156' and Got:
>>>>> '09eb4585f46d3527fe7fce8af8f9e591'
>>>>
>>>>    that second checksum is, in fact, the correct one for that tarball.
>>>> and the sha256sum in conf/checksums.ini also doesn't match the one for
>>>> that tarball.  if that used to be correct, does that mean someone has
>>>> replaced a tarball with a different but identically-named one?
>
> Before committing this patch I would suggest comparing the new and the
> old version to find out what is actually causing this and what has
> been changed.
> If we just blindly change checksums we might as well abandon them.
> Also note that a change of the checksum means that everyone who has
> the file in his/her download dir will get a checksum error.

http://www.libsdl.org/news.php

Suggests this is a "bugfix".

Regarding the patch, following the commit policy here:

http://wiki.openembedded.net/index.php/Commit_log_example

Well, the commit message policy, makes it much easier to commit patches 
since we do not need to fix up the commit message.

Philip


>
> For now a nack from me.
>
> As this already happened before recently (perl twig) I suggest we
> adapt a policy for this or maybe some automated removal (e.g. if you
> have a file in your downloads dir with a checksum in blacklist.ini
> that version is not used but removed or parked aside or something like
> that).
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


