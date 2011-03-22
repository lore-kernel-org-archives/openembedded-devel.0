Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Q27PD-0006SR-8u
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 20:38:15 +0100
Received: by wwb17 with SMTP id 17so8174238wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=e0/Gm1P1d8w+vUpAKtDpgRGPLVcDGDKR6u4HNLEbj1U=;
	b=Y4q+PIgzzgTMDmboWiDLGZolLzRmmR+F0SEtjJIDiovkLNLTlBnljPBOS0ddN84FB6
	SVpaUQ2krA7JdPfElSqun2Kj0N0wgO2hVxcC4Rl9C1P942Woz08etjezcMMsnF68l16M
	pMVhE40kGiHaWUCnpbIZ9qydXZkZEA6se5ZCM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=TzbOeZd5SVN6DBIEvjDHo/bf0H6y+o7H5/Qwwk87QlhYQEbkG+AA4UdVwQPKMsPwYH
	iGUZG11JIJncSbJzGBkXY+gsptjDkBArB8IhJlsY1KuXuzLoURQuTCvWv3MuzQBICF17
	DGjejoUS/jrKHfJKFQuMT/Pfp1rlusZ8ZYpDY=
Received: by 10.227.203.145 with SMTP id fi17mr5639110wbb.106.1300822584960;
	Tue, 22 Mar 2011 12:36:24 -0700 (PDT)
Received: from [192.168.1.103] (39.121-240-81.adsl-dyn.isp.belgacom.be
	[81.240.121.39])
	by mx.google.com with ESMTPS id b20sm3436610wbb.33.2011.03.22.12.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 12:36:23 -0700 (PDT)
Message-ID: <4D88FA34.1080902@gmail.com>
Date: Tue, 22 Mar 2011 20:36:20 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110321 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D81226B.4060704@gmail.com>
	<4D81331E.2070604@mentor.com>	<4D814E28.6080701@gmail.com>
	<4D84B726.5060302@mentor.com>
	<20110319184403.GB14868@sakrah.homelinux.org>
In-Reply-To: <20110319184403.GB14868@sakrah.homelinux.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: perl-native_5.10.1 fails
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
X-List-Received-Date: Tue, 22 Mar 2011 19:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/19/11 19:44, Khem Raj wrote:
> On (19/03/11 07:01), Tom Rini wrote:
>> On 03/16/2011 04:56 PM, Jan Paesmans wrote:
>>> On 03/16/11 23:01, Tom Rini wrote:
>>>> On 03/16/2011 01:49 PM, Jan Paesmans wrote:
>>>>> Hi all,
>>>>>
>>>>> When trying to build an x11-image for pm9263 with
>>>>> angstrom-2010.x, perl-native fails to build. The error is
>>>>> listed below. As far as I can tell, the problem is that a gcc
>>>>> flag is passed to the linker, -fstack-protector. I tried to
>>>>> find out where this -fstack-protector could come from, but
>>>>> the only trace I could find was in the Configure of
>>>>> perl-native itself. There is no mention that it is set when
>>>>> Configure is called in the configure step, nor in any of the
>>>>> environment variables during the do_configure or do_compile
>>>>> step.
>>>>>
>>>>> I run Ubuntu 10.10 with gold as the linker. I thought that it
>>>>> might be the gold linker but neither gold nor ld seem to have
>>>>> this option when reviewing the man-page.
>>>>
>>>> Can you edit the recipe and add in: EXTRA_OEMAKE =
>>>> 'LD="${CCLD}"'
>>>>
>
> actually when inheriting native it export LD=ld in envronment and
> thats whats used in makefiles
>
> You could try setting
>
> export LD=${CC} just after inherit native in the perl-native recipe
>
> I have a simialr fix lined up for oe-core

sorry for the late reply.
Khem's solution also seems to work. I did a 'bitbake -c clean
perl-native && bitbake perl-native' with the other suggestion and that
succeeded. However the EXTRA_OEMAKE seems cleaner.

Regards,

Jan

>>>> And do a bitbake -c clean perl-native then bitbake perl-native
>>>> Thanks.
>>>>
>>> That did the trick. Now perl-native compiles fine. However when
>>> I checked the output of the log.do_compile I did notice a change
>>> a the behaviour. I was expecting the -fstack-protector flag to be
>>> gone, instead it is still there. However, instead of invoking ld
>>> for the final link, now gcc is invoked. Below you can find the
>>> relevent section of the log file. Also in attachment is a patch
>>> with the change you suggested.
>>
>> OK, thanks. I'll put this into a patch this weekend. What's
>> going on is that while I'm not sure where -fstack-protector is
>> coming from (but it's a useful flag), as you saw, 'ld' chokes on
>> it. But for linking you shouldn't really ever invoke ld directly
>> but rather via gcc, so passing LD=${CCLD} overrides perl's
>> makefiles and we invoke gcc as the linker and it handles the flag
>> right in this case.
>>
>>>
>>> Thanks for the help. Regards,
>>>
>>> Jan



