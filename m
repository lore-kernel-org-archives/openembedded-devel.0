Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PhnND-00042I-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 19:12:11 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id E8E749544014
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 19:11:26 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id kgAbtR31Q+Wo
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 19:11:26 +0100 (CET)
Received: from [192.168.4.106] (e181148074.adsl.alicedsl.de [85.181.148.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 7C4499544005
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 19:11:26 +0100 (CET)
Message-ID: <4D3F1253.7060202@larsmichelsen.com>
Date: Tue, 25 Jan 2011 19:11:31 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>	<ihel1v$tnt$1@dough.gmane.org>	<4D3ADC2C.6070506@larsmichelsen.com>	<ihesdm$v7u$1@dough.gmane.org>
	<4D3B15FB.5000403@larsmichelsen.com>
In-Reply-To: <4D3B15FB.5000403@larsmichelsen.com>
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Tue, 25 Jan 2011 18:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Koen,

On 22/01/11 18:38, Lars Michelsen wrote:
>> Could you try the current recipe and see if it works for you? It works
>> on my omap3 boards quite well, minus a dlopen() buglet in libdvdcss2.
>>
>
> I am not able to build it. Seems to be related to the (annoying!) ffmpeg
> subrepository thing. With that sub-repo there is no control about the
> version to be used. One day it works and one day later it is broken...
>
> Here is the output:
>
> NOTE: Applying patch 'offset.patch' (mplayer/offset.patch)
> FATAL: Execution of 'quilt
> --quiltrc=/media/lm/transfer/oetmp/sysroots/x86_64-linux/usr/bin/quiltrc
> push' failed with exit code 1:
> Applying patch offset.patch
> patching file ffmpeg/libavcodec/arm/asm-offsets.h
> Hunk #1 FAILED at 35.
> 1 out of 1 hunk FAILED -- rejects in file
> ffmpeg/libavcodec/arm/asm-offsets.h
> Patch offset.patch does not apply (enforce with -f)

Do you have any idea how to solve this?

Regards,
Lars


