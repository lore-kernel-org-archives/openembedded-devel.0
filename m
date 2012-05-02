Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SPW9W-0007B3-9a
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:47:18 +0200
Received: by bkcjm2 with SMTP id jm2so278550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8ck+AS7bGZbIycRGmhRn8GyB/Vl0x7xaWIM6Kn+MbE4=;
	b=b/XLVorMAssg9W9ZeKrp709hgC5UqxXY763XdZhkqOF/Af6lH4T/QrnpU1HeAItPFi
	MN3R7MeopTFLjWnYiAZFDu7+RNstMgqRXxyb0FxlejLASJ8jIhPHwLh5VcDXruyoIiUj
	tRbod+d/SfAM+/KldnPDsXyRO75CcXc6GMg0rDcdMpBbU0odzZuT9/ItK3gwBQwIPTlH
	5amKS1jcO3hRs/66w7CevDuMzxI5Qw+ggS2Ch6v7kzXC86vtuEZyDYOZVKP/2E3o1r0F
	t9fi8xPXkehSzP4BsiebeN1txnB7Jtf55hJukV4ESBMG4r3AU0kS9eO5j4npEm9EhAT2
	zsfA==
Received: by 10.204.148.82 with SMTP id o18mr9597096bkv.108.1335951454212;
	Wed, 02 May 2012 02:37:34 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id e20sm2332384bkv.10.2012.05.02.02.37.31
	(version=SSLv3 cipher=OTHER); Wed, 02 May 2012 02:37:32 -0700 (PDT)
Message-ID: <4FA0FFD5.6080201@gmail.com>
Date: Wed, 02 May 2012 11:35:17 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
In-Reply-To: <CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Wed, 02 May 2012 09:47:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/01/12 14:32, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 11:44 PM, Martin Ertsås <martiert@gmail.com> wrote:
>> On 05/01/12 00:05, Khem Raj wrote:
>>> On Fri, Apr 27, 2012 at 5:38 AM, Martin Ertsås<martiert@gmail.com>  wrote:
>>>> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
>>>> PVR drivers, which conforms to the result that arose from
>>>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>>>
>>>> We have applied the patch at the bottom of that page gcc, and also a
>>>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>>>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>>>> tries to run init.
>>> interesting bits are why kernel panics ?
>>> what error do you get from kernel ?
>>> is it some illegal instruction or something like that ?
>>> Do you have VFP enabled
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> Found out the problem why kernel panics. The patches I posted were the
>> correct ones, but before this I used
>>
>> SYSLIB_PATH or something before "/lib/ld-linux-armhf.so.3", so the output
>> actually was /lib/lib/ld-linux-armhf.so.3
>>
> ok good. I would be interested if you test the patchset i posted
> it will help a lot
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
The patches posted seems to be working fine. I at least didn't have any
problems with them.


