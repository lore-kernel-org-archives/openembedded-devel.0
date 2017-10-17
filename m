Return-Path: <danwalkes@trellis-logic.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 333B47833B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 23:02:14 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id k7so3249098wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=trellis-logic-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MHjCIfeVe3755YjPwqz9rKV2jHStnEmmixhLcZ+uGN8=;
	b=b3NegsHPCfxUEwsWk3bK9HFw+EGGR5rQrE4aQH6G3J5gNRmQ7BztqTFhOgGs3J4wQB
	e7UzK4dp48BeLhcjM8RUBkht4luRTVfqcMKiTmPcpUOnpdsntqGnSxaQBvnpJPajPHVs
	iiFhMtnzKZX5d9UoR7bubf73eQ64EAI+jrgxmlfPMCKl14lGqhkjOUj8ZjsFAxNssTDh
	+ZYHgjdO0SlKF7WGBGGAcHH79dPaZzSO2/za3FYW9bUapFinKNMETA50vdD8AC8oyFqg
	lbtCOmAEF8DSCdVcW2XAdR3GQyaFrIpab+QEFdvOGcJxh8jua0ZechV8GcB0zpwjIoB8
	ybYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MHjCIfeVe3755YjPwqz9rKV2jHStnEmmixhLcZ+uGN8=;
	b=gHIsSQViqYWSTZgj7jDPub03ADDJsA+GbhWevjaLrfo1hxdB6er+ShKwgZwgm2yWcd
	VIvTSphfUaA92s2ZULiIe1uzlvt5T0MMtG7M2kq6Cmxqnt4qF/r2/o+wD1xwU/wpJATt
	IUWEAB0M09MgVkYDfZFkiTJT7cMZoJJa8JyPzPtZiNK9ErLxpmvCJeNWEXQGgvJ9erYH
	b+DuFP43w8/YszEpYTj8QZXx/zgaFfITlBCTP/BiVoqRQU9hiTeXMeIFd7y7FK1401Tx
	+Sc7CEchEkhe8AJGBWAWbrk4GOiqvVSR3LBwh5k1tIEVTwYIt4RIVWV0JG2YgihCzPHT
	CWRA==
X-Gm-Message-State: AMCzsaXDAfTakGujb6GV7eGLx/UE/Kwq3sZSr6HzxHHT43MGBnL1sZFN
	tADPy7z+TMwV/VDxg804tNv35dP7D6rFnHxWuMsU3g==
X-Google-Smtp-Source: ABhQp+TrtienTJfHByUKgMwGVAYfSx9Tvc6K+oxfX3x2VYGsti+tGio8xW04eL4f21XkykSjRjBUB7i1vp7OMdlmtxo=
X-Received: by 10.223.153.45 with SMTP id x42mr4925242wrb.212.1508281335899;
	Tue, 17 Oct 2017 16:02:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.195.139 with HTTP; Tue, 17 Oct 2017 16:02:15 -0700 (PDT)
In-Reply-To: <aa238651-2c5e-4407-4d62-58bdf6e5dd26@gmail.com>
References: <1507489523-13556-1-git-send-email-danwalkes@trellis-logic.com>
	<aa238651-2c5e-4407-4d62-58bdf6e5dd26@gmail.com>
From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Tue, 17 Oct 2017 17:02:15 -0600
Message-ID: <CAAhKrJ3At_1DyTGpLD19jUzXjam0aCtGXzg=PFnET=1hSzEoxA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Fix gpsd Yocto pyro build for read only rootfs
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
X-List-Received-Date: Tue, 17 Oct 2017 23:02:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 3:50 PM, akuster808 <akuster808@gmail.com> wrote:
> Dan,
>
>
> On 10/08/2017 12:05 PM, Dan Walkes wrote:
>> Attempting to include gpsd on Yocto pyro with IMAGE_FEATURES including
>> read-only-rootfs results in an error:
>
> The subject has "pyro" in it. Is this meat for the stable branch "Pyro"
> too. It is in Rocko now.
>
> BTW, 3.16 is not in Pyro. looking for clarification.
>
Hi Armin,
I noticed this problem originally on pyro and noticed the same issues
with the .bb file on the master branch.  I haven't actually tried to
build on Rocko and I'm not currently setup to build the current
project on rocko, only on pyro, apologies if I submitted this for the
wrong branch.  Please let me know what I should do to fix.

Thanks
Dan

