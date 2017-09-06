Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6B82377E0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:53:31 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id q29so13158694uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 13:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ETlA0OisIsyPoIIYbEQZqWm6Ae9+XUn05LgenaA0E6U=;
	b=OGb/7rALTyN4iBCv4r4nCt0Ww0LZpVdyUdKaJwXoFFVPsXtbsmPSXJvBRNJ+YhU704
	efhVL0vblCMwZEjmxTQxgtdDaxRM16Bfs7ki1eN0ufgTMlojsF+epak2SuuIcriCsPxW
	IQKg8Fk+mD+P1d1V49ErSlzqxxr3QUxbP6Oqrth1COl44j0moB4Sodv5+R1vylJWAv+l
	KYq7f5x8VkFRv0wDquoXVzPAe1fF1pDmIi2zu0PH71a0XN3aMGodARIiMiFCpWT7QBFI
	hRyKagPcw+uJBviK4zahVE/brptNm6Ts01kUgiMXrsoGZX1cEPKWu7P+05vzuhhB+UI8
	Xuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ETlA0OisIsyPoIIYbEQZqWm6Ae9+XUn05LgenaA0E6U=;
	b=Zta/IVq/JtpWt8z4Vd3sV5V/e0zVAnfKQKol7cMFReXsNlg034LKxEtikSKudnVLR2
	4bMrxe2OcfBeR71a9W9dumlZ+mOvmfW5XByagTexpYuM1CfDFsIH1UrPo2IH6eF+CJuG
	J7mOJj+Zs+NkPgWNhYvo07psjQWLlXjF6evdD/cxcCbqIpwbw+T9NvpzQtwTxkKhKy2l
	88M1k5VdRnfCUXUFRVvJ92RDtdMtbpkI3FNBqmVkF1uFH/qEKxOdrYIgutXkfaRknbbD
	Y+t4+ddW6+TZvkVcMB6nx8/SEibnSlX+Vf/D0y9+BOpLqL5vEp+oeOJFZvS7E7dFirHX
	07cQ==
X-Gm-Message-State: AHPjjUj9Pnxw+cHwL4Ipg0wYBGUOiMW86z4fCbVAOmuqWim3C+rG3k0g
	yZQq2GGgwHfGR2C2GgGMrba/hu9rCw==
X-Google-Smtp-Source: ADKCNb72puh8XPX15ORID+fkSmbeXqWBIRiUli7S17xuWUs8+kywdtwDSuH/3p6mtez66EM83hMXzqG98/9ryzRtB6w=
X-Received: by 10.176.67.35 with SMTP id k32mr289074uak.203.1504731212360;
	Wed, 06 Sep 2017 13:53:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 13:53:31 -0700 (PDT)
In-Reply-To: <c1bf1c61-de6e-6f5c-9130-7808c77666e5@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
	<9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
	<CALbNGRRQAKUNR-X1U=vdc4dEzpobc5k+b_F8cS=u2VOi04s7MA@mail.gmail.com>
	<65cc49bb-5a7e-c3f6-1e08-09a6bcb8ccab@windriver.com>
	<CALbNGRS260modGqY+bkNV+R5XiONyVcdSQpE-eYLoR47VxqsRg@mail.gmail.com>
	<c1bf1c61-de6e-6f5c-9130-7808c77666e5@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 22:53:31 +0200
Message-ID: <CALbNGRQgzpBr5WywUZN9e1aFc0+Kj8RThJp-qNL89s4WN3=gEQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 20:53:31 -0000
Content-Type: text/plain; charset="UTF-8"

>> I am sure that I miss the point again but fedora - for me
>> reference/inspiration many times - has no problem with xfce4-mixer
>> [1].
>>
>> [1] http://pkgs.fedoraproject.org/cgit/rpms/xfce4-mixer.git/tree/xfce4-mixer.spec
>
> arch - https://bbs.archlinux.org/viewtopic.php?id=222294
> debian - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785846
> mageia - https://forums.mageia.org/en/viewtopic.php?f=15&t=10018
> Fedora - https://bugzilla.redhat.com/show_bug.cgi?id=1355763
^ Yes you should look into this - that is exactly the problem I have.
>
> etc...  This is what I based the original commit message on.
>
> Just an FYI, the first part of my test WITHOUT the xfce4-mixer and
> gstreamer-0.10 removal just passed.
Passed what exactly?
> I will let it continue and will report on
> the status once the full test is complete.  (full test as in bitbake world)
>
> --Mark
>
Andreas

