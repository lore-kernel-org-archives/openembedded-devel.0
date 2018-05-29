Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4807A74B20
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 17:39:22 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id g13-v6so19688615qth.8
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lKh43XCU5XK8f0nhANYvXZmfL6mJMkoeluE8CzNNb2E=;
	b=lNG9w1wj+tR/Y9hSJg/CqXaXCV/9KDbdqoUudkjTnlJL/vhpsPTuRKUQO4MVaDUxil
	z27Mb1WwFtE0RKSfa49F7qJbTyTFbdf4l744uxGxyYBm0mT1jTHhoGa6Yjf0jFTYjaPs
	MHD9qWvBVZt0pi2y2Xu+LPaeHnK+mLlHpPIQFAvKj23fDT9kxQDFijKK/y0vTEtmYcwI
	PFfSgr20Uwu9WzA8A0HsZ6iVvXwzf1GhKvBWqSjDwe1bWgbPzCPW/beLrSxpdk5SkdnF
	ebwotPRnblqYWydB37VXRls5JZUrleVksqnUvhsZWvS4MiWSzc9PC1omofuXiHTqtmr5
	aNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lKh43XCU5XK8f0nhANYvXZmfL6mJMkoeluE8CzNNb2E=;
	b=OwzlzgoOeMhK/dDWiB7ImZXWw/yFKrnpdvFLsA6kK2G3yqAIGTQkRfpaIcEh1SSKmJ
	UeAehz8qJf41uutedwAauHut8eJ6dUFjxhqj80rUJpm3f+M452IM56fs7b/6whH+esSi
	Od93eID/C2+vSFS1axpRN2CW+OqhNJLuHzX1dul4G4hv+wUekYUMwvOIt+pv2r1nlH8+
	Ntn7v3XseqRdtJsLceAdE1lt96wtv2G9c+j0LVI+y5n9DsggKG9jV1hfiJk43rlT4yDS
	rrCDRTTXO1zbndvUb9QAzpXEsTS8qGbV/GhhaiNt8TfPTc71C+BrpIqrVvzfHvLLTv3e
	HHpA==
X-Gm-Message-State: ALKqPwfzrTLdexUQB6RPclREshKpvEjuPGjFkkP+76NalcQgUOa+Lkwq
	aT02gqfWx27LwF1WSPNquv6yBzR2oe23Lv9qEZU=
X-Google-Smtp-Source: ADUXVKLT6H29b1euU4PHWN+KJWBwmDAg+bhv6hH1se/ZM/tQkNEyhqP+C7HLTXVMCz+EOcwFTUFPyBB3YBIRCtJZZX4=
X-Received: by 2002:a0c:f806:: with SMTP id
	r6-v6mr6142032qvn.214.1527615563690; 
	Tue, 29 May 2018 10:39:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:38:53
	-0700 (PDT)
In-Reply-To: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
References: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:38:53 -0700
Message-ID: <CAMKF1sptf0yGevdqvVOLacK=vtj+frGkxeeEu0kwgTU2UBEtOA@mail.gmail.com>
To: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Tue, 29 May 2018 17:39:23 -0000
Content-Type: text/plain; charset="UTF-8"

this belongs to oe-devel list

Please check will latest master, if you can reporduce the issue with master
then we can revive this discussion on the patch.

On Sun, May 27, 2018 at 11:27 PM, Seiichi Ishitsuka
<ishitsuka.sc@ncos.nec.co.jp> wrote:
> Hi all,
>
> I was able to reproduce the old problems shown below with netkit-telnet_0.17.bb.
>
> https://patchwork.openembedded.org/patch/96727/
> https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455
>
> The evaluated environment is,
>  glibc  :2.2
>  kernel :4.4.32
>
> How to reproduce:
>
> Run the script more than once in the background, and
> please adjust CPU usage to 100%.
>
> #!/bin/sh
>
> HOST="host.target"
> USER="root"
> PASS="password"
>
> while :
>   do
>   expect -c "
>   set timeout 10
>   spawn telnet $HOST
>   expect login:\  ; send \"$USER\r\"
>   expect sword:\  ; send \"$PASS\r\"
>   expect \"# \" ; send \"exit\r\"
>   " > /dev/null
>   done
>
>
> Best regards,
> Seiichi Ishitsuka
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

