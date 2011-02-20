Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PrCDD-0000e6-Pj
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 17:32:44 +0100
Received: by iyj8 with SMTP id 8so5092624iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 08:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=jSCbEYbwzU3nRlitRooIKOzPxy0oPkPUCprQp6G6GLo=;
	b=ULjAYCqA+ZD9MLedpAyFAWX5gijC1vsUpBUW21KhdHEmAoxb3VbjEeHz8ajfvh/0xw
	oj8LlGT+kFQCV3M6aHOYC5BUxjBxnPw5mlGsWyZ2uxxf4LSPQR3S+kEmY5UuN36mj/7X
	QMceHpqI/xc+/vmm+aKs6ectcEnDCQ5PxUgTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z1NHxMxDM/TU4pRrebLSx6akxySsSIyBXNtHLigCqDyBmGGsy6n2ls4pcKfNdiUnVj
	f7M//fdsUfI9SsM92QPp/6CVXtiCfxy7mm9BMtpMZ+KT8PB60qfLYU+TfrMGCFTSKnCv
	Me8rTuTbD+vmHaf1VTtZ534WzcFYkCsauLuK8=
MIME-Version: 1.0
Received: by 10.42.224.129 with SMTP id io1mr636688icb.433.1298219487052; Sun,
	20 Feb 2011 08:31:27 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 08:31:26 -0800 (PST)
In-Reply-To: <4D612958.70402@mentor.com>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ED835.7040800@eukrea.com>
	<AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
	<201102191252.05388.schnitzeltony@gmx.de>
	<AANLkTinfrqy3eSJajojfDiAJcPcMM9MbTZo94YVGz+ba@mail.gmail.com>
	<4D5FF708.90903@mentor.com>
	<AANLkTim-b=vO2vD5sgTo5bKduF=OYqAczS7f3YYdgPUy@mail.gmail.com>
	<4D612958.70402@mentor.com>
Date: Sun, 20 Feb 2011 17:31:26 +0100
Message-ID: <AANLkTikJOdOdOmDwNwrsT1Jaraoaxj8ofBiDUA-HMAjH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 16:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/20 Tom Rini <tom_rini@mentor.com>:
> On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
>>
>> 2011/2/19 Tom Rini<tom_rini@mentor.com>:
>>>
>>> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
>>>>
>>>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de>
>>>> =A0wrote:
>>>>>
>>>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
>>>>>>
>>>>>> I am fine with the patch, but perhaps a better solution would be to
>>>>>> introduce a var to decide whether it is a fatal or not.
>>>>>> That way people distro's that use libtool 2.4 can decide to make it =
a
>>>>>> fatal. (or individual users in their local.conf)
>>>>>>
>>>>>> Frans
>>>>>
>>>>> How comes that I sometimes feel handled as spammer ;-) ?
>>>>>
>>>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
>>>>> February/029534.html
>>>>>
>>>>> anyway - treating RPATH errors as fatal has lead to many QA fixes and
>>>>> further
>>>>> will follow...
>>>>>
>>>>> my opinion now: keep RPATH errors fatal as developer's =A0whip :-)
>>>>
>>>> I agree about keeping it configurable.
>>>>
>>>> Besides I think that we ought to keep it fatal until quite near of
>>>> release since we'll be "forced" to fix most of many of them.
>>>
>>> I just want to state, again, that most of these just go away with libto=
ol
>>> 2.4. =A0Now, if people are looking for something to work on that won't =
just
>>> go
>>> away with an update to libtool 2.4:
>>> - iscsi-target needs some love again for various kernel versions as tha=
t
>>> looks to be killing calamari and neek for nas-server-image
>>
>> Peeked at iscsi-target for calamari. Some inet fields have changed
>> name in 2.6.32 or so, and apparently this is not handled fully.
>> Instead of trying to fix it, I moved the calamari recipe to 2.6.34
>> (which I'm already using for half a year or so, but apparently never
>> pushed).
>
> Thanks.
>
>> I'll also see if I can update the neek version (probably also by
>> moving the kernel version forward.
>> Tomorrow I'll discuss this with Walter who afaik is the only other neek
>> user.
>
> Note that I also see:
> - uclibc total failure, but I assume unsupported and I'll drop
> - minimal fails everywhere else with:
> ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir) i=
n
> path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image=
/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/li=
b
> ERROR: QA Issue with staging: libstdc++.la failed sanity test (workdir) i=
n
> path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image=
/DISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/li=
b
> ERROR: QA staging was broken by the package built above
>
>
Also mentioned this on irc, I will try patch 719 that is suggested
below, but this could be a toolchain issue (it would not be the
first).
Toolchain for nios is quite old (gcc 4.1.something, binutils 2.18.50.someth=
ing).
It should be able to build minimal-image for distro minimal and micro.
And as far as I know neither uclibc nor eglibc are supported.
THen again it has been a while since I managed to give this attention.

Frans.


