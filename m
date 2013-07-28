Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 27A416065F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2013 14:10:26 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so1512868vcb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2013 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=KZe1hP3s3B7iUCxIlfgH4ir5GKaEUMIVpcLIZg2HtTM=;
	b=ec/Etj4pxmt0pXJ2pNsdw3+zVrJS6LkkyzzUmxhRu2Bj8iwCJ4pxro+WYMs1rWRLcS
	X65hpacNyphEgADDDVzDvZRazMmcwTRdeBXg/ttDcVw1T/eqttsW0qFgjXER5zTVvoA6
	DtGvNquiguVK6tnCVLfKxH/6xxeFC8uzNjD7DFfH3mTbIy2Bpn5FGSxrM6lj6EXw4X7P
	dlW37z23HW4pU2N/mcU1rqWhAsckeDj/H1SOHC2yQugEX3b3W+pzBHLBudTMTENITAJY
	BxUY8eCQchN4CXwTFiZ+YZmVmVJuY936p+828fZGbA8LbIFULQ37s2k3Q6YQ1+qLaDgM
	WkCg==
X-Received: by 10.52.75.162 with SMTP id d2mr14249479vdw.86.1375020626102;
	Sun, 28 Jul 2013 07:10:26 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sun, 28 Jul 2013 07:09:46 -0700 (PDT)
In-Reply-To: <51D6BD77.4050008@ts.fujitsu.com>
References: <51D42561.8060907@ts.fujitsu.com> <49035936.yua4bikce8@helios>
	<CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
	<1721069.SICaQ1bLDa@helios>
	<CANyK_8eNmm_jnpFgn44TwBLhOdSr1vyVouraHnvwz0T9iWfbkQ@mail.gmail.com>
	<51D6BD77.4050008@ts.fujitsu.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 28 Jul 2013 15:09:46 +0100
X-Google-Sender-Auth: rjGxO_BnjDWwdaWL1jDS9abdPPc
Message-ID: <CANyK_8deKJoCUCEnQeqCyBJNy0eKkk2GmJcX6ZDG80A66u52ng@mail.gmail.com>
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
X-List-Received-Date: Sun, 28 Jul 2013 14:10:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've just ran into this again building dylan with the latest version
of bitbake as it doesn't appear that the dylan branch of
openembedded-core sets FAKEROOTCMD in bitbake.conf. I've cherry-picked
the commit below from master onto dylan and it looks like the build is
now going ahead happily.

Bitbake has no dylan branch so I just assumed I was correct using
master. Am I wrong here? If bitbake master is supposed to be able to
build old branches of OpenEmbedded, perhaps this commit needs
backporting to dylan/danny/etc? It looks like it shouldn't cause any
harm if an older bitbake version is used as it simply adds values for
FAKEROOTBASEENV and FAKEROOTCMD.

>> Not got time to try reproducing right now, but I did have a very quick
>> look in git.
>>
>> On the bitbake side:
>>
>> http://git.openembedded.org/bitbake/commit/?id=860ec42b220b7ed3f3bbe52c3546bba66644eac8
>>
>> On the oe-core side:
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=003ea0fd1017dde50ced710179d0dc2e835d5185
>>
>>

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

