Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 581D17FCB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 09:42:57 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id c16so2311816ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=BPr2S42rtpHXrp8f5V0XdbUhrFbzW2U+zFM2VN3JaUU=;
	b=lMkuIprKTtlCkeYcGQE6UhypRH78UAygvTSkpEbsaF5seiBceERPN+WBINqxjtc0uI
	gJNxtYvQYA0VMlK23KD2OMmd9ZJtjY+k0UYAT106wje1Y3TavOKqBgt1jRHOxejVkkUB
	p+t23SsE62AZ8qBt1ZIDDJak57FkaJBhl2jjeX++dHCG2IlxKb47yLY7JB3XkBDVid18
	YctMlLFFoP1vi5ouTIVQyGhVRmjUVtWcV5+8p/hYFx2JDEsysSqeAVuUCJijtbje3Smk
	Tqo/P7TICpeHDB30POsG0OAYnOEOF9gCtuf55L3p2F0R8NaQ46LF/faWkeXVgys4yWWC
	cGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BPr2S42rtpHXrp8f5V0XdbUhrFbzW2U+zFM2VN3JaUU=;
	b=hfpMGAExvxMpZ0hdaUBoKY4aC5el2XowvXxNHCVFlNSOiHyNlVcsyUaiFzUw66XRhI
	eHlu7IbsxdrYWeiv1TVmXEePYOdvbYf0sKRLNKw8wVVI3ld5ykvV0LfYdrZlOpav6PDq
	BLK6fB/NtnZ9G/K4IN7yvJ0niYh1OoK98e2RY7fpJLr3GhEcRmZ/gm7j6g4p9rMBTyco
	ErQfyGBskNiSeneNvvqDkXc2gp202k+kfy9zipgReeNPt8dr+ZNuJ7GpAZc13S7AwBZz
	N+hIUDYI1m4DhDFkfSPPnRch8PpuXN72/AwMYUIVW2UK8fjzMAAaP9DuAxjNWCQOk6tj
	29pA==
X-Gm-Message-State: APjAAAUv2d8ch4jBa1ORb4G8Hgnj8RLzX7dx6FQqJtiT2tihabscbbXB
	36X+HdnKKszBCNwCQtp0s0CiUNZUb2yl05mm1M70YXhw
X-Google-Smtp-Source: APXvYqz/wWTkGaLf1W94dtutA01oPQJVD6UEs0qaSPvVLJHAHxbnaAG4AKtyWSLJ8n1c4qIoRGPM7GvBQrIGiYRWllk=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr10995022ioa.102.1579772578193;
	Thu, 23 Jan 2020 01:42:58 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 23 Jan 2020 09:42:47 +0000
Message-ID: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Thu, 23 Jan 2020 09:42:57 -0000
Content-Type: text/plain; charset="UTF-8"

On the offchance someone's tripped over this already/has pointers:

Around the time python2 dropped out, I'm now seeing boot failures with:

[  612.151548] systemd-journald[543]: Assertion
'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
src/basic/time-util.c:55, function now(). Aborting.

I suspect it's unrelated to py2, but that's delayed me getting to the problem.

The board I'm targetting is AM335x based, but without an RTC (which I
suspect may be relevant).

Anyone seen anything similar?

-- 
Alex Kiernan

