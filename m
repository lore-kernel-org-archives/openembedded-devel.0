Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 027D26AA07
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:53:55 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id up14so1427381obb.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=yEwvuukiSZ/fl4zvnwTDqbLV5XkXA2fS1WEbcpxrF8E=;
	b=fq5I3uyC6bXPXWDSQLSOtB8MXppX9SxyhbEnR5lxcotI2i0Y/TNGTWDGa6ev1lOJJp
	l880r/rOtSKptoOw/yDP3Zq9ZVUB0xnSyb7GnW8NGkPF6J0+mS5JhRBgu88YNrvm2ApM
	PKwRjucgX+7PRrs1+KfcwuAi4p3EUAUlZ6syn/8hvUUM8YJH7Wa5D/Y1GeligYmfbUPs
	AQxwZbwyrQktVwwOPPpVMD9+urm2PYhe3WhHBviTAKPutQle7sGzg1zdYic1qxHK+2Lx
	P9h5g3DYoMArzEuXGOKfMqGdW6+Y8F/ixIusWD7jutrYVnJVVI4q0B6kltRl9pYQNJ/N
	MoAg==
X-Received: by 10.60.96.9 with SMTP id do9mr5186422oeb.49.1372931636259; Thu,
	04 Jul 2013 02:53:56 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.102.11 with HTTP; Thu, 4 Jul 2013 02:53:15 -0700 (PDT)
In-Reply-To: <49035936.yua4bikce8@helios>
References: <51D42561.8060907@ts.fujitsu.com> <51D52FD8.8060801@ts.fujitsu.com>
	<49035936.yua4bikce8@helios>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 4 Jul 2013 10:53:15 +0100
X-Google-Sender-Auth: qWBVJx08aQf95ZRtWSDvI80gcJI
Message-ID: <CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
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
X-List-Received-Date: Thu, 04 Jul 2013 09:53:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4 July 2013 10:17, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Thursday 04 July 2013 10:18:32 Cestonaro Thilo wrote:
>> hey,
>>
>> found it. The Var "FAKEROOTCMD" wasn't set so bitbake died as executing
>> "None" doesn't work.
>>
>> Added
>> FAKEROOTCMD="fakeroot"
>> to my local.conf and it worked.
>>
>> But anyway, shouldn't this be the default?!
>>
>
> FAKEROOTCMD is set in meta/conf/bitbake.conf, so this is indeed unexpected.
> BTW, "fakeroot" is not correct - it needs to point to pseudo (and that is the
> default if you have a look at meta/conf/bitbake.conf).
>

I stumbled onto this sort of error when I cloned poky at master but
copied my bblayers.conf from a previous build and didn't update the
paths to point to the correct places for the layers. So I was running
latest bitbake with latest poky 'scripts' directory on the path,
against an old version of the 'dylan' branch of poky.

What versions of openembedded/poky/bitbake are you using? If they're
fetched from git I'd recommend updating everything and trying again.
It could just be a mismatch between the bitbake version and the
metadata versions.

Hope this helps,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

