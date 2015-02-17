Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5267D72DE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 18:26:11 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 10so13734066ykt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=9bW5i3VI3MM/W6QQAGapqnwrvJPEMxiHQ9ah5Dq2xOU=;
	b=y2GE72mjZ2ud8vPdUZTUejGcHjBqHPycx14HTjS/51cf7sG05IxkJ/XrPx6K6Rwo2o
	S5+BiuNuWs8oI++7Vedrw9VIvZBZbJ5ctj60jOj+c1EX+czHdzK8rVDfzOhlhxVpXII/
	C3h8Pwx//C9E9uZxg2orT9QHYktxvpXk8HgTZyqyunHyBqyHV8WagoWwCpBBhU2dKrG0
	UV/F/CUIhIEVf+Gn8u28IJCTTc5SuibA8VuWe+2dMFqmZWkPZWNWWL+8FYKXnajlzNBn
	30aIHO/4KuVdkOAOywCL8lyAGXJhZLrwd1dA4giUPQf9kXLkqn7wbCGKoWO7WgafAXQS
	lLKw==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr1751747yha.105.1424197573143;
	Tue, 17 Feb 2015 10:26:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 17 Feb 2015 10:26:12 -0800 (PST)
In-Reply-To: <1424197193.2293.9.camel@Saturn.local.all>
References: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
	<1424125658-20285-2-git-send-email-max.oss.09@gmail.com>
	<CAP9ODKq6QKYojHUiO96s9Kpi4-c4qD1UtnLKi88D0MkbitKE=g@mail.gmail.com>
	<1424197193.2293.9.camel@Saturn.local.all>
Date: Tue, 17 Feb 2015 16:26:12 -0200
X-Google-Sender-Auth: 83G6040adMErR55lvKWvkK9Zid0
Message-ID: <CAP9ODKrLhjmwo2w1d4pgfcJTa0p03xws+CjYX=uqn-eqB8RvmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [OE-core][RFC] openjdk-7: enable xawt
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
X-List-Received-Date: Tue, 17 Feb 2015 18:26:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 17, 2015 at 4:19 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Am Dienstag, den 17.02.2015, 10:57 -0200 schrieb Otavio Salvador:
>> On Mon, Feb 16, 2015 at 8:27 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> > The build of xawt has been disabled as its build seemed to fail during a qemu
>> > call to generate a file with information on variable sizes.
>> >
>> > qemu is now called with the relevant path into sysroot and thus works.
>> >
>> > This patch enables xawt again.
>> >
>> > Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
>>
>> I am fine with this change the only remark I may have is force X11
>> dependency. Would be easy to put this in a PACKAGECONFIG?
>
> I thought about this. As it is not simply a configure option it's not
> straight forward using the PACKAGECONFIG system.
>
> On second thought one could probably make it a PACKAGECONFIG option,
> even conditionally set it with DISTRO_FEATURES but then use some python
> magic to conditionally apply a patch removing xawt if headless is
> configured.
>
> I'm a bit loaded with work at the moment, so it will take some weeks to
> come up with a tested v2 of the patch.

Yes. You can take a look how we did in meta-fsl-arm for Chromium
patches. It has some conditional patching.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

