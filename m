Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PtNec-00067F-FN
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Feb 2011 18:10:02 +0100
Received: by fxm8 with SMTP id 8so2468630fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Feb 2011 09:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=AE0ProTPEX7pevsrpWpesSrAVvzcms9PMQgqHk4hFSo=;
	b=J59kMaXS+0u3j1M1qUOmZ/b02DkfwJSyoV168kfXxKBUQ3QxyX2W5njin8k3k9dQ/x
	/JD1u/eqstP++BalvoacO9r/bH0y59eIyvnxVf/3nbrAEnHfEuN/8z8kV3wHnjacAZbp
	GUv+Ha59wKYvyxG17hq0ZLYUgMayzjCGrp7Zo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=eCUwxvtu8nfmQIuG1eczloLPHLZpT/NtqjwrgO7+VT/OiwbO1q/4qJyfAPwb/rEXtp
	Lko7Tr1vaG/ku9F9j+lMPrvlHXCdB62xuJrhrr6jBzrjZSzbZV83Ojr+NhqFGefXTGjs
	Jh7ZANkkBVkky36l/lw8W/rQB49lAhRmP8/WE=
Received: by 10.223.95.199 with SMTP id e7mr4220050fan.39.1298740119271; Sat,
	26 Feb 2011 09:08:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Sat, 26 Feb 2011 09:08:16 -0800 (PST)
In-Reply-To: <4D68F651.80908@opendreambox.org>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
	<4D665D92.7000100@dresearch.de> <4D6671C2.7060604@opendreambox.org>
	<4D675D08.6050301@dresearch.de>
	<AANLkTikv_D9xz3MYHwz0=eoJ+Q_p8TsCJC9k2Ps0SBw7@mail.gmail.com>
	<4D679C54.9060202@opendreambox.org>
	<AANLkTi=7ZpNFo+7+g4ymwHFRwAWx5PGUqOYRHeGN4XD8@mail.gmail.com>
	<4D68F651.80908@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2011 09:08:16 -0800
Message-ID: <AANLkTimkZm9VvXFjMi+QVijztbxYyjwzHJ7mn0vE5nyo@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Sat, 26 Feb 2011 17:10:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 26, 2011 at 4:47 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 02/25/2011 06:28 PM, Khem Raj wrote:
>> On Fri, Feb 25, 2011 at 4:11 AM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>>> On 02/25/2011 08:51 AM, Khem Raj wrote:
>>>> Well one way is to have kernel headers per machine which means you can
>>>> not share target packages anymore since they have to build per machine
>>>> but it would be much integrated solution and we could generate the
>>>> kernel headers from the kernel recipe itself so we are sure that the
>>>> .config of kernel headers match the .config of =C2=A0kernel itself
>>>> downside is it will defeat the multimachine sharing packages a bit.
>>>
>>> The .config does not have any influence on the generated
>>
>> yes thats right
>>
>>> linux-libc-headers by definition. linux-libc-headers must not contain
>>> any CONFIG_* statements, because they are meant to be independent of it=
.
>>> The kernel config is not available to linux-libc-headers after all.
>>>
>>> The point I was trying to make is that feature detection at compile tim=
e
>>> is impossible, if the feature can be disabled by the kernel config
>>> (which is the case for epoll and inotify, which in turn were the
>>> examples discussed on the mailing list in May 2010). You need to do
>>> runtime tests in programs intended to be portable.
>>
>> which may not be easy to do for cross compiled packages unless they are =
patches
>> to make this test dynamic
>
> That doesn't make any sense. Runtime tests aren't affected by any cross
> compilation issues. Runtime tests are dynamic by nature.

I think we are talking different things. I was talking about e.g.
configure relying on
result of a runtime test to enable some feature during compile time

-Khem


