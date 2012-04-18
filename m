Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SKd4x-0004xX-Uk
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 00:10:24 +0200
Received: by lagw12 with SMTP id w12so5736929lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vxSFsNhWptrqaf94qgmzBMf3u0RpNi86edqkuLk+r7k=;
	b=nLSLrWNBqJzQcW20VCyCxmPKbIyzGpFkylrf/nQ/GljQ3zGxtiXg1ep0MZ+cLPoBK7
	rEgpE+XR5n+04au0EXh0WopcDCOKCrBDz9TUmWPC5rMuHP9tSluPCX0TdorddQJtKJhm
	4ZJUAfxra1btpp5kObkA4qlmqsGC79YSOgJZT1xv4hB/ByqyaoCOEe8KUpZf+NMcWKpQ
	+3V8F9XofForlRUjvWljBuT/0Zr55A6AxWYGo+NyYSxkwns1TsRceXUsyF0jVZ0iZ5Pf
	mD9L+KdFcs/v6KvgSic6K/LvHcTFxGIH3SjmDN4UmXbPGPXV10PDwd3nKCRvOOpUOVO1
	PvwA==
Received: by 10.112.103.8 with SMTP id fs8mr1909093lbb.29.1334786456097; Wed,
	18 Apr 2012 15:00:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 18 Apr 2012 15:00:24 -0700 (PDT)
In-Reply-To: <4F8E53DD.6060404@gmail.com>
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com>
	<4F8DCFC4.9010508@gmail.com> <4F8DDDB7.5010605@gmail.com>
	<4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Apr 2012 15:00:24 -0700
Message-ID: <CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Wed, 18 Apr 2012 22:10:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 17, 2012 at 10:40 PM, j <vwyodapink@gmail.com> wrote:
>
> Sorry to sound so dumb but if there is no recipe failing and 2 separate
> systems are segfaulting in similar manners and both result with not fully
> functioning images/packages where else can I look for info? I posted all the
> logs to one of the builds, and the QA log seems to be the only thing really
> spitting out anything. I am open to trying and or sharing any and all
> relevant info to help sort it out or get me on track to sorting it out.

what I am hearing is that your build succeeds despite these ld
segfaults. Am I right ?
but then when you run the resulting images then the images dont
function correctly
on your target

and you also mentioned that its expat package when being built that
causes the ld
segfaults. Are you sure about that ? You could somehow forge ulimit to unlimited
that will dump

on ubuntu edit /etc/security/limits.conf on build host and then add
*         soft    core    unlimited

that should generate core files. After this search for core* files in build tree
and see if there are any then debug them with gdb to diagnose it further

Now I am not sure if those segfaults directly relate to malfunction of image
if thats the case but its likely. You should also try to explore the reasons why
the image fails to behave as expected.


