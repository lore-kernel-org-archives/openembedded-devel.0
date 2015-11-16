Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC427665F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:24:52 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so175237674pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=xXzXN7akNh5D90ijby1iimT+War9zMUwft3XU5Y5MhU=;
	b=Wl7oBptxMFvBhy4M+ZOhZEb9VB9knl+1qWMsMXEZ4arlR4we0ULcBoV+/48dxBqfVL
	06WeuVUQhlsKDjjAI2ppMconhNugKtL78SYXa1CQXtS7hHYpmV9kvVQNb26pfxKDbx/9
	z+iD+Rjcu8qbXKa+QRMaSykKErGx4W1/Jixoi3b2sFCQ2Ikfvky8gN9U5t6rxpzwxMHS
	mGqeQ/bknn+FkiN+p9OwyOgkwvbhLBUqdDE8ULZoR7b9CsmMwTMdn6cNEC/tAFwVnHMo
	8C+2aj0T06if+L/QXQHFbVaMbhs9sZWHJ9ymLqe5Ue46PUYhvYLvtQJHYBF6s+daw1ea
	PWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=xXzXN7akNh5D90ijby1iimT+War9zMUwft3XU5Y5MhU=;
	b=amSL71na7n9BlOu9061Q50BwjZTMNXL1WWp1VCqqMMjRisF12WskIRz3YQU7bx9dMK
	PGita0bBIJzh+/zHqs4Sq1KZKUXZ1pUbSwvOmi2fl4i9ooHSqLAQQzKJbHVYjTJ78zKZ
	Zv/krC+nkXILGo5WcjA3Kn+su6nhyuCB+6rn8DKMSuUTlNmBhCuL9QYwH2O5rDIKduaS
	YwF1gIrSbdTXd+pZwhPpgs139y1WjRcWG1qro61BfGsg8R07GoHGmmcLno5EsVlgogSG
	J4XqsQ3/PfzTPuyoPKNCSh/cErJv3bQ2XmO6xVNcT1Bgpb5b8SOVxVkEN9iVC+UB8J4E
	PKvA==
X-Gm-Message-State: ALoCoQnWfPx7lPlLxgubg2uxnqdG/nfENqC+IjaGt9beAtliL2xMhHZMVNz8HP6aXq9mfFOfHVmn
X-Received: by 10.68.231.168 with SMTP id th8mr34114065pbc.22.1447673092680;
	Mon, 16 Nov 2015 03:24:52 -0800 (PST)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	sg4sm36137546pac.48.2015.11.16.03.24.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 03:24:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padhx2 with SMTP id hx2so172828977pad.1;
	Mon, 16 Nov 2015 03:24:50 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.66.166 with SMTP id g6mr52702680pat.152.1447673090697;
	Mon, 16 Nov 2015 03:24:50 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 16 Nov 2015 03:24:50 -0800 (PST)
In-Reply-To: <5649BCB9.4090708@linux.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
	<CAP9ODKpU_6sVy6iidiCem8Sb+EWAgNCVrvOPmOhr4_uMt174Hw@mail.gmail.com>
	<5649BCB9.4090708@linux.intel.com>
Date: Mon, 16 Nov 2015 09:24:50 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqCbYMqfhHY2p8yPsu7Pp4Pb+U-DrG7SbjN2Xh4e=FA7Q@mail.gmail.com>
Message-ID: <CAP9ODKqCbYMqfhHY2p8yPsu7Pp4Pb+U-DrG7SbjN2Xh4e=FA7Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 11:24:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 9:23 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/16/2015 01:20 PM, Otavio Salvador wrote:
>
>>> Making a separate repository with this layer is even more disruptive, and
>>> complicates administration and maintenance. I'm not going to handle
>>> those.
>>> So I'll make a meta-qt4 layer under meta-oe, and it's fine if there is no
>>> official maintainer or ongoing build testing for it at least until
>>> someone
>>> volunteers to pick it up.
>>
>>
>> I will nack the patch to include it onto meta-oe; I also guess that
>> Martin will also nack it.
>>
>> Make it another layer as suggested, please.
>
>
> A separate layer under meta-openembedded or a separate repository with the
> layer? Please be clear.

Another repository.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

