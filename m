Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1P5fdE-0006pg-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 16:15:19 +0200
Received: by wwd20 with SMTP id 20so558989wwd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=n0xMUgo3iP2GbokM9W37tiZwdWsEzXt2JRY+VmilQn8=;
	b=SpmRiOtA6luUvodqAh9jxlmLv5b/p/PwtV9n9UlB2LJCLQPWslNeGfZxUADSOOdDTU
	atXNLD0H3/eWtglG0TE5Uet25VFVoBVpi8arJjs5gjH0vIeq0BtJaZwI4uYX3sp3LS58
	xnNp6hmNZVbAjNap92Urjk+RFyxmlc/QBGWGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=IYT6zEPz57WiyHC+gYMJC3Am8FSFuIv+5nl3bZi5EIzd0XnMkuDRV8GMnRyCHm3wkG
	9pFLUhWli9u6FompUzZRZox9n65CrFMFXNkmvuRxs5j7v2Sc1NGUwqozRyyxQ+W/G9m/
	njQfsHfMqx8SANqsidwlHkR586MAzCTJZvJ64=
Received: by 10.216.186.207 with SMTP id w57mr4183509wem.19.1286892868186;
	Tue, 12 Oct 2010 07:14:28 -0700 (PDT)
Received: from [192.168.1.134] (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id x75sm4070149weq.2.2010.10.12.07.14.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Oct 2010 07:14:26 -0700 (PDT)
Message-ID: <4CB46D41.1030903@gmail.com>
Date: Tue, 12 Oct 2010 15:14:25 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CAC8B19.9050502@gmail.com>	<20101006145051.GK3264@jama>
	<AANLkTimJ3fCOZopbAKG7UvszQGNMfnaq1HnAB6mKqmu_@mail.gmail.com>
	<4CB01BED.5030407@gmail.com>
In-Reply-To: <4CB01BED.5030407@gmail.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /usr/bin/fop ???
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
X-List-Received-Date: Tue, 12 Oct 2010 14:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Arigead wrote:
> Martin Jansa wrote:
>> On Wed, Oct 6, 2010 at 4:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Wed, Oct 06, 2010 at 03:43:37PM +0100, Arigead wrote:
>>>> trying to "bitbake tangogps" and getting errors about /usr/bin/fop
>>>>
>>>> I'm searching for a solution but not getting too far with that. I'm not
>>>> sure why and embedded verison of tangogps would require Apache FOP but
>>>> I'm on the wrong end of a learning curve.
>>>>
>>>> Cheers for any pointers which would get me over this hurdle.
>>> what about providing whole log.do_compile and log.do_configure to be
>>> sure which recipe has this problem (I see libx11 in log, but you're
>>> talking about tangogps).
>>>
>>> Regards,
>> In case it fails in libx11 then it's probably because of:
>> http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=e14273f44c1501ab51db4adcb83b18a1073787d8
>> you can force fop disabled with --with-fop=no in EXTRA_OECONF or try
>> to fix XORG_WITH_FOP (to ignore fop on buildhost and look only in
>> sysroots)
>>
>> Regards,
>>
> 
> Been busy and only getting back to this now. Yes that worked buy forcing
> fop out of the libx11 build. Thanks a million for your help. I'm not
> sure why this problem only seems to be effecting my build and nobody
> else seemed to hit that issue. Anyhow back on the road again.
> 
> Thanks again
> 

I spoke to soon when I said that I was on the road again, and I've only
confused myself trying to get to the bottom of this. When I said I was
on the road again bitbake libx11 was working perfect and it still is. My
problem is that even when I've done a sucessfull bitbake of libx11 a
bitbake of tangogps will fail on libx11. That's confusing the hell out
of my and it's the do_install that's the problem. I'm on the wrong end
of a learning curve and can't seem to understand the issue.

NOTE: package libx11-native-1_1.3.99.902-r9.0: task do_install: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/john/programming/openmoko/shr/shr-unstable/openembedded/recipes/xorg-lib/libx11_1.3.99.902.bb
do_install failed

It still seems to be failing on fop even though the libx11.inc file now
specifically forces "--with-fop=no".

Complete log is at:

http://pastebin.com/ScdPb4Dj

Any ideas very gratefully received.


