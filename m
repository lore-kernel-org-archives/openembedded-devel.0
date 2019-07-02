Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2313B7D476
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:55:34 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so24852994ior.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 18:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=cOXM2Gy/JFkdw66z843vLKwnnUogPhSOqINhvJF21oM=;
	b=UL6Bqe4sD6Q1qbRYvFw0z4bTGkBcwyeXdt1fTfpWWIS9MRpe3j2c5d+gSZRvS9Cv97
	ae0W9jp8sDWYxQjqOx8sYhtRHLtOrxtGU7vIVePdyP0VmLkixibQpKK6jMfNiTuvcORT
	C7krXQtZCKOy1SczzBNihDIgN2KgeRfjU9RuIgIT+xXztw0vltROFiydxtXh0mqK+3wN
	8yQoFrgKUM1JJa1J2nnd2Ua3i3yt+wQeGgOPrAOQXQywIP5Aw2Vr8haehQ5FF3QmES8/
	IhYsRko1nBrzLjmOLy1TNrD4MbTkA2xp3M+w2SgqGlwAQgEmvymYujKxm9BxNwlinmjp
	B7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=cOXM2Gy/JFkdw66z843vLKwnnUogPhSOqINhvJF21oM=;
	b=oTU4QU+/9V54YsGI2Oc9UDVSBI41590Iz2mk5A97JAcxbKTb6plafR8+Jah+vP7toe
	GexXpQlwgIRIHhUBWG3yy/x7V9eAcTMHJ08oVASWCNhUB9zosHIV/kV1bb+Mda/LiaYj
	Xf1X9kAbRICz1b45JBDk1T3ZSCfVNosjafzbKyypPtt+SCsKHpHgKws9R7ZXqc3BnLHs
	aZJ4Nt5GLKQZtIT2Oy+KGbBzO/iBs77nex/POI47LpI/T0wJueESCZlCjhEuIvxBpUkT
	8C86rIkw7HO4Dx8OyaWZWqLaAcM5Ub6nbrn0fIJuplzpDhMi3+bf6ywpBZVI62VIQS/1
	SvsQ==
X-Gm-Message-State: APjAAAVWEVOiWJVmdiQBS3kVSLQDizv/VdlAcDb6XarDJeRedoYUo0di
	h5zQhkddtQVFajkAU7OBUU9IYbjblz5cSCqZK5NYRCjU
X-Google-Smtp-Source: APXvYqx1rUVCJptvNj0mPxKx7dnywz3mSidVr++FgPrg2JRsz23yfoCF6g1f2C9O6VXNUv5Adiq2KUTstX8Wo5xdP1Q=
X-Received: by 2002:a5e:db02:: with SMTP id q2mr14026820iop.306.1562032535964; 
	Mon, 01 Jul 2019 18:55:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP;
	Mon, 1 Jul 2019 18:55:35 -0700 (PDT)
In-Reply-To: <CAA=hcWS-tgsh2Yyx6oZOjkiSKS0WPh9Z6nrhsiCzWScwWpuGOQ@mail.gmail.com>
References: <CAA=hcWS+-bC8S+90VqbRMW2wpTz2Rfv7umxKSHovQXWD2K6imA@mail.gmail.com>
	<CAA=hcWS-tgsh2Yyx6oZOjkiSKS0WPh9Z6nrhsiCzWScwWpuGOQ@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 2 Jul 2019 11:55:35 +1000
Message-ID: <CAA=hcWTMO58OJmo2hqfMWqHKxB53XYzveKb2mULztW7BLiJYjA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Allow choose of U-Boot config for machine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 01:55:35 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: Unable to start bitbake server (None)
--- Starting bitbake server pid 2673 at 2019-07-02 11:54:24.011086 ---
ERROR: local.conf:34: unparsed line: 'UBOOT_CONFIG=nand'


On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
> Tried to add  UBOOT_CONFIG=nand to local.conf and from command line,
> bitbake does not like it????
>
> On 7/2/19, JH <jupiter.hce@gmail.com> wrote:
>> Hi,
>>
>> I am running BitBake Build Tool Core version 1.40.0, originally I
>> built an image on imx6ullevk booting from SD card, I am building a new
>> image for a customized i.MX6ULL board booting from NAND. The following
>> link commented by Otavio Salvador for a patch to allow user to use
>> UBOOT_CONFIG=nand either in local.conf or command line. Given the
>> patch was many years old, I think that the current version is able to
>> support UBOOT_CONFIG=nand either in local.conf or command line, there
>> is no need to run the patch, is that correct?
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2013-August/082284.html
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - JH
>>
>

