Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWaJi-0004Id-8W
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 21:02:15 +0100
Received: by pzk12 with SMTP id 12so1956962pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=vEw/yU2B0dutOcKOdHK56NiRe4ZimofD5/Tm73zH+6I=;
	b=tUudFE8fbPT46W5IiyyMjtZNyE6vYR7HiY253v421j0TkY18PYot5o1mzcb0ToG27E
	SpYa51JpsrrmdsqJFjojYsT4e0V55T9bnlV2ISQ98XDFae86zvuX/hffpIca0pU3DIIz
	2A1uStWo82Oj0KfJY2zpW70YHJcmkGPOziVQY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=J0mZzPfPyful5acP/5CWSzR6Nv9ScEaPwWpnLqJI0nbnNMR1/HgRUS+jh1EA+yK8Rp
	dFxn1DsKiZUfOONr09RqNujLMnw5bhYemm1ZSL6ZTjBmkkYosFaqUEsuDX3ClEWjiWMX
	YM5Zlah6x7GyDzS11+qnzxzBnyzjNS1SoMdGQ=
Received: by 10.142.211.20 with SMTP id j20mr8433325wfg.408.1293307312890;
	Sat, 25 Dec 2010 12:01:52 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w42sm14608108wfh.3.2010.12.25.12.01.51
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 12:01:52 -0800 (PST)
Message-ID: <4D164DAF.1070604@gmail.com>
Date: Sat, 25 Dec 2010 12:01:51 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>	<4D162876.1000401@gmail.com>
	<201012252144.11796.roman@khimov.ru>
In-Reply-To: <201012252144.11796.roman@khimov.ru>
Subject: Re: [PATCH 1/5] perl: fix PERLCONFIGTARGET for multimach builds, move cpan vars
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
X-List-Received-Date: Sat, 25 Dec 2010 20:02:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/2010 10:44 AM, Roman I Khimov wrote:
> В сообщении от Суббота 25 декабря 2010 20:23:02 автор Khem Raj написал:
>> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
>>> Multimachine builds race staging Config_heavy-target.pl to native
>>> directory. Solve that by changing PERLCONFIGTARGET variable semantics,
>>> now it will contain $TARGET_SYS. Change perl patch and stage functions
>>> accordingly.
>>>
>>> Also, move PERLCONFIGTARGET and other target-specific variable settings
>>> from cpan to cpan-base as I think they're also useful for cpan_build and
>>> anywhere else cpan-base is needed.
>>>
>>> Signed-off-by: Roman I Khimov<khimov@altell.ru>
>>> ---
>>>    classes/cpan-base.bbclass                          |   14
>>> ++++++++++++-- classes/cpan.bbclass                               |   10
>>> ---------- classes/cpan_build.bbclass                         |    4 ++--
>>> .../perl/perl-5.10.1/perl-configpm-switch.patch    |    6 +++---
>>> recipes/perl/perl-5.8.8/perl-configpm-switch.patch |    6 +++---
>>> recipes/perl/perl-native_5.10.1.bb                 |    2 +-
>>>    recipes/perl/perl-native_5.8.8.bb                  |    2 +-
>>>    recipes/perl/perl_5.10.1.bb                        |    4 ++--
>>>    recipes/perl/perl_5.8.8.bb                         |    2 +-
>>>    9 files changed, 25 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
>>> index a04f61c..53621ed 100644
>>> --- a/classes/cpan-base.bbclass
>>> +++ b/classes/cpan-base.bbclass
>>> @@ -32,11 +32,21 @@ def perl_get_libdirs(d):
>>>
>>>    def is_target(d):
>>>        if not bb.data.inherits_class('native', d):
>>> -        return "yes"
>>> -    return "no"
>>> +        return bb.data.expand('${TARGET_SYS}', d)
>>> +    return ""
>>
>> not that its wrong but I think you could also use MULTIMACH_ARCH instead
>> of TARGET_SYS here
>
> MULTIMACH_ARCH = "${PACKAGE_ARCH}"
>
> So if there is a perl lib that is "PACKAGE_ARCH = all" it will use
> Config_heavy-all.sh which won't exist if we don't symlink something there and
> that raises a question of what to symlink. Also, I don't know whether it's
> possible now, but in theory we can have builds with different target C
> libraries reusing same native perl, so complete TARGET_SYS specification is
> more appropriate IMO.
>

OK yes that is right.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



