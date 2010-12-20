Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUp34-0007OW-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 00:21:46 +0100
Received: by ywi6 with SMTP id 6so1591250ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jMn06wae4/JZ3A2Yj8XB0NyXSJQTijx/cEpo81Umwd4=;
	b=WujqeHfHt9ptlEwVKVfjrcI86yCynYz8aRMbHq9cpxai/8sIK1yQ0K2uDS4orwDtiY
	kmATAbHRcZFO0ZiAlsap49XoPjtr99r/thHbpSZTEjMZWMh9wKYPCzRKYGz3vYoZmxJT
	Dvp2JQ39cku7CEWjA+71bseDqQEUYLPoNEaTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=N2Uk28MPaWDJKdfy8b8HnhAPsgoLlMfA5Rt032/j7jJ356zUK6pykboUYifn9TEpo3
	GMNQUAnNStOHUCwycp7eiyVAEo0C4MfgeWTrL538IFW0qkMtZK01mjHCsMXNTUhfPDJ0
	xSODjvhKqwIlEAeuKom8b4CdpfF9IpTczsY4o=
Received: by 10.90.97.19 with SMTP id u19mr6140756agb.166.1292887298568; Mon,
	20 Dec 2010 15:21:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 20 Dec 2010 15:21:18 -0800 (PST)
In-Reply-To: <4D0FE2CC.5050003@gmail.com>
References: <4D0FB245.90008@gmail.com> <20101220213243.GD17904@gmail.com>
	<4D0FE2CC.5050003@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Dec 2010 15:21:18 -0800
Message-ID: <AANLkTim+M3jX41Ryk-wJ4OOyJ6o--Vq89dCS3=aUYC9r@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Mon, 20 Dec 2010 23:21:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2010 at 3:12 PM, Jan Paesmans <jan.paesmans@gmail.com> wrot=
e:
> On 12/20/10 22:32, Khem Raj wrote:
>> On (20/12/10 20:45), Jan Paesmans wrote:
>>> Hi,
>>>
>>> After hacking the problem with openssl-native, the following happens fo=
r
>>> qemu-native.
>>> I found a reference describing the same problem with the new gold linke=
r.
>>> Any advice?
>>>
>>> | =C2=A0 LINK =C2=A0alpha-linux-user/qemu-alpha
>>> | /usr/bin/ld: error: address of section '.tbss' moves backward from
>>> 0x6018e440 to 0x6018e260
>>> | collect2: ld returned 1 exit status
>>> | make[1]: *** [qemu-alpha] Error 1
>>> | make: *** [subdir-alpha-linux-user] Error 2
>>> | FATAL: oe_runmake failed
>>> | ERROR: Function do_compile failed
>>> NOTE: package qemu-native-0.13.0-r2: task do_compile: Failed
>>> ERROR: TaskFailed event exception, aborting
>>> ERROR: Build of
>>> virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.=
bb do_compile
>>> failed
>>> ERROR: Task 947
>>> (virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0=
.bb,
>>> do_compile) failed with 256
>> Well 0.13 has some more issues as it turns out. May be you can DP it to =
-1
>> and use 0.12.5 instead you will end up in better situation.
>>
> Same thing with the 0.12.5 version. Could it be that it is the new
> linker and is there a way in ubuntu to use the old one?
>

which ubuntu version are you using

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


