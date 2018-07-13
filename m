Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id C626778685
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 14:13:10 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id r16-v6so62488727oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xQklUpoZnPXSPEBpmjYk/2pjiO3BVRlceWogmUy4CH8=;
	b=leXQBq2sOCfZcwQZ606yuamKyfAV2Amd1FCdL1thVXyiKV8j0DXSce88TeXchnmsEd
	hX4250aU6i2Iu4x7e4vlYjkROLH9khqgPbCBXP7zHq64GbMi+HsFyF3kCNj/jlzVBgal
	GtrQ77KLRzrdGwGQvTJJr0vHyT+gP5CiPnck5kePwBS5CVPepVzHGz45kVld+OrOKBel
	+d+Gipor9CMWdH+ccVsAYq+h9HGfDkGYe12flTA1N5uU4zB3CWelQiM3KtGDqC6BUIgc
	1Xk4AkzbM4/mFId0f4CWCAv3vVOSwm0IauZ3uvtqkdQo/i6PWhVeyBcmMmqOHhquA9zr
	7bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xQklUpoZnPXSPEBpmjYk/2pjiO3BVRlceWogmUy4CH8=;
	b=P9DqTeJkvao0QckhZz5SO/NfV10RXlG7JficepgwdkfQD5MmnU354Tb+lcmli1xnxz
	v9p/MfV3yM6EoRPSD5Sn7jgT5PO8m4Ix7GnCnNyCZbWNHNOGLGeBuCYx8uaxKGKyKhm5
	W4TfpJ0kQJOe/8HR6eWPNY77vq1TGbdVBCG3hR918uEfwbIyLKqKy/OzUI3dNjuC9L9c
	eAv4WDOYSisndBcaMRr/TEzFtJcaKTlYZQOu/swMDfKkohgkea09q2S2rbeh+KxlenJA
	Z4LCP0QvAW7UIRjLfWRAD9Ki6Rl5jA6gR4AeY+fqrOF8phzc0N9CWcu0GkQPBxg0iLGT
	RcCg==
X-Gm-Message-State: AOUpUlFsK3xLrndAcv3sRbO9Z66E0S0MpadCn/OiMiGwEnxYZ1l5bP7X
	135k/Y0mcH/Jbv9zDkq/PV/py86pPHNL/9xaUMo=
X-Google-Smtp-Source: AAOMgpeD7Je7nNkdCtBYHJRembNDyanAG9QjvHFfiaS+PeCqfaMv7ikqSYmX58+bJqxnyxypmVRivVrUbDkpWiy60Ks=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr6752746oib.190.1531491191869; 
	Fri, 13 Jul 2018 07:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 07:13:11
	-0700 (PDT)
In-Reply-To: <20180713140616.15664-3-hongzhi.song@windriver.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-3-hongzhi.song@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jul 2018 16:13:11 +0200
Message-ID: <CANNYZj8Doep17N+hmd_WbJr0V91kpHMDH_RdhsOPsCS3ax276A@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core][PATCH] x86: remove "qemu-usermode" from MACHINE_FEATURES_BACKFILL_CONSIDERED
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
X-List-Received-Date: Fri, 13 Jul 2018 14:13:11 -0000
Content-Type: text/plain; charset="UTF-8"

2018-07-13 16:06 GMT+02:00 Hongzhi.Song <hongzhi.song@windriver.com>:
> error information:
> ---
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> If the above error message is about missing .so libraries,
> then setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
> (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
> ---
>
> qemux86 will face the error above.

I believe this error does not happen on the autobuilder, and disabling
qemu-usermode on x86 is an unacceptable reduction in functionality. We
need to address the issue, not disable the feature.

Please provide information about your environment. Which version of
oe-core and qemu are you seeing this with?

Alex

