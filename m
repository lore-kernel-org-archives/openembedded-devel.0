Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E16079C64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:29:19 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u22so29196991ota.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=29RFPVYji2OlBYOkkwffxRWwylyYZM44D1oOXCxpBGE=;
	b=HhdDlqdF5gvXQOF8S3yPrjIgntPjiyZ5O3GoRBpOiA4dhxinkkA8C8usPlt2AZBF3/
	PRnuSaDJOTc/rcFB/FOx0kygGiuRj4748iUuHt78No6OHrQhhMtRii23ym9LatJGNzy6
	yYzVnOweFXggcAHnbXKPjnKJ6w8MT94U+WGGJCGeaJp8pTsaoMXXMC6uahLAhTXQMwiu
	JjYQ7eC1Ppbze2rjatuesXmEFoTiEZIgQgMuoXG+dh3BCz9VyjF8Od4cBjWX97clhG5c
	cAxghEncgA9GZVwBMOK8mEOnFvO7dvkv22NorHKbaoi2ZTl1Y+xJ597CpKjq8fyeXOYx
	Selw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=29RFPVYji2OlBYOkkwffxRWwylyYZM44D1oOXCxpBGE=;
	b=q/7x0rhOtWH4DpcG26nKNY+moAbMgwhgelBKgbgMJuUUbRDxqLtsaFljIHAP9PgWoP
	h88Vj3s+0xNwTut8PkPHggJmpbtsB8AlQtpP/cJZKMAXg5XiJcPcRQ4/TEx0z9pEUxuC
	snMKYG85oOw3P8lX1zyX/zd4NVIRzrTRRkSCgXLrTJt9GlizwdSJjGTtsdZYuakojW4w
	ClnyLHqytp3eTLmsTc5srJ48byyA3ZC0me72uE0Xnh7kN8p4TJLvOqtWtFXDHgLOxZs+
	5a+gLfUqwF4HSeEkSK3PSSLh7DSKirRhmPk5HDEkqKtqrYZjqOPvFajEnDlYYXocst6p
	f4tA==
X-Gm-Message-State: ABuFfojR66r0ZnH+wxAAcuH4liVMUw1r5cz40Sr5PyeAR7kmoxwluvVF
	yBKevsw9bm5ocplUSqMDaMHwtuN2bKI8SsS8LPQ=
X-Google-Smtp-Source: ACcGV62CgSqN8BMMcb1UZpGDgC9wXUQ8N4ANbJu3CPYleYaSdx8SbIctTSyollyDWfTAm/Y94K7ogzIj931K35S31Vo=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr5709541otj.42.1539858560338;
	Thu, 18 Oct 2018 03:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 18 Oct 2018 11:29:09 +0100
Message-ID: <CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 18 Oct 2018 10:29:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Chen,

regarding this issue:

>On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
>> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen at windriver.com> wrote:
>>> Upgrade systemd to 239.
>>>
>>> 3. update-alternatives changes
>>>    The utilities like shutdown, poweroff, etc. are now created as symlinks
>>>    at do_install. So there's no need to use update-alternatives mechanism
>>>    anymore to create the symlinks now. In addtion, I don't think we now
>>>    support multiple init systems at one running system, so there's really
>>>    no need to use update-alternatives mechanism here.
>> I noticed that reboot stopped working locally as I had busybox
>> installed together with systemd, and the busybox version ended up
>> being used as it was provided via update-alternatives.
>>
>> Looking for possible similar broken links, I found that
>> update-alternatives ended up pointing reboot, halt and poweroff to the
>> busybox binary instead of systemctl. Should we revert the changes and
>> bring back update-alternatives for them?
>>
>> Thanks,
>
>I think the correct direction to fix this problem is to make busybox
>only provide init utilities (reboot, halt, etc) when init manager is set
>to busybox.
>
>We current have in busybox recipe's SRC_URI:
>            ${@["",
>"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') ==
>'busybox')]} \
>
>I think the init utilities should be moved to init.cfg.
>
>Please check my logic to see if you can agree with it.
>We have two facts here.
>1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
>implementation of PID 1.
>2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
>So we can conclude from the above two facts that it does not make much
>sense to have multiple providers of init utilities while we only allow
>one PID 1 provider on image.
>
>After all, we are using update-*alternatives*, things that this
>mechanism manages are supposed to generally serve as alternatives to
>each other.
>
>Best Regards,
>Chen Qi

Can you elaborate more what we need to patch?

because this update break all the systemd based systems...

Also there's a following patch that add back an alternative for busybox

8421aede4fdd5132eb953a59099670f9ab1f7f01  systemd: add ALTERNATIVE for reboot

What's the more correct way to do fix this?

Best Regards

Nicola Lunghi

