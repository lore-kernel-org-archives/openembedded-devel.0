Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 605C173555
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:00:26 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 10so12037049ykt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=x35uSgJcD0WmUdIVvy6V+fGy6ey5+1vzdJQEbUmdrzw=;
	b=SwP/9NvzXIIw4mWiZAFJAno1sYH40BwX+/to2+RcaIEY/Wva6gvMrChYODlagHxQGG
	93toCtqeF6LlDQJ4j/6v61eiN9WeuE3cY077PG5cGLdODFIIm3yW7fEExhu08+Ly/t/I
	WJfKeaPzvBQwTqoINDcGdQ6Z5+ejcx80Vm4pY98dZ1HKbQWyMDRTEH3vcUz2ZWWYP3Jt
	Bv6nmRbYzX4eNt6MjIStUiuP/cUnBsNCpuu1zfpL7pEfL7C/q3hxq+FY/TpsTj9mS0Y3
	Mvd1QDj1mql9dZzhsn1HJXRL+L8X3kNHtaeZrMzgou3Qg7n1ovGhLX5vsWsvUfWFm1dZ
	W9UQ==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr4675630yho.104.1424178027929;
	Tue, 17 Feb 2015 05:00:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 17 Feb 2015 05:00:27 -0800 (PST)
In-Reply-To: <20150213142036.GC7116@saldanha.aker.com.br>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
	<20150213142036.GC7116@saldanha.aker.com.br>
Date: Tue, 17 Feb 2015 11:00:27 -0200
X-Google-Sender-Auth: ebtQsez6t6uaKv2JAtzRYJAP4Cg
Message-ID: <CAP9ODKopq=3zswceRwSDisfaS1WXiJBg8-MT+8rARQ_ncu3QZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 13:00:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 12:20 PM, Hugo Vasconcelos Saldanha
<hugo.saldanha@aker.com.br> wrote:
> On Fri, Feb 13, 2015 at 08:33:55AM -0200, Max Krummenacher wrote:
>> Am Freitag, den 13.02.2015, 10:08 +0000 schrieb MONDON Daniel:
>> > Ok, but my problem is I must not change distribution.
>> > The system is installed on many machines, and moving to and other repo will generate too many work (dev and validation)!
>> In order to fix an error you will have to change something.
>>
>> > I have not enough time to pass on this problem : It was so complicated to build, install and configure Java on angstromv2012.05 environment!
>> >
>> > Is it because Ubuntu 12.04 java was updated ?
>> No.
>>
>> The error you see is because some sources test if now is more than 10 years from 2015 and refuse to compile (and maybe execute later?) if this is the case.
>>
>> This is fixed in meta-java, but as Henning said you have to get the
>> meta-java layer from git://git.yoctoproject.org/meta-java and update to
>> HEAD.
>
> It seems that icedtea7-native was not fixed.

Patches are welcome :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

