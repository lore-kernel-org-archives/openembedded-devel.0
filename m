Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC66978552
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 17:26:00 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id s12so4279436otc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 09:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3Ou9W2tpCmB5hqZ0MRB072s9QZUBEh0nmB83KLg3jF4=;
	b=hcFZrMAbfgcg3wAg0bFsm/luVEIlUQUSZarPsQ5EbWk4AOhuB02gGa+h2obqPM7kHI
	l2lMZLX6ZRd4eGxE2gG1dl75zgMep4HM4oYgvWzAJ17zFptS6/r5ka/q5o/T8pstexoZ
	BN8byNRclpaWvw28od3+L44lmr8eJ4ELL6LDirMcm+QJSPRMEc5ScEnhS2L7w4Bj9lc9
	WtHsjev3NH0O9qlHTFQ4YNJJB/gSVnoSwsQsUwdMXSZjFLtfMTQ5Xun/znbirrr0U+Gm
	lwAfBefytmEJVGsWnqdEAP6kpdogn/N4/3coNl+xeKhM33uExy05Ij5AnkgnIPYCMNOG
	N7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3Ou9W2tpCmB5hqZ0MRB072s9QZUBEh0nmB83KLg3jF4=;
	b=rlxtHVmd4Ixj4e0UReWJcPxJySwoRyaNZ2iYdVttTMuVoPcW1YEm4JY0RjehVV5Tcj
	APlHOFzYGKYjLVMy+PmOKtWt1E7P/wohpmDEfMJgPUPA3xk6LUijcabcPY4sAnoLXzjf
	U4QEuSNSMmu9SxpLj+EyhXAxEl+6gjgH4sGa3QTyzPJFToHkchpLfBn5wAuUASC8q6GX
	iPm46eRFp8CJ6BVNUz+o2hbNPOLrTK0uOxSiLwP39j9+VcgQ0HiKtZEKripf59ARZw4y
	zFt4b5et9P36e+J9beMHZFN03waC76bULlbDl6wG5OQJjqjOEqNuYFryzAcazxqZtNVS
	98Pw==
X-Gm-Message-State: AJaThX4E3VPk3JLtS3LR/8Bxfk9PkHM/noAUnOvO66/tcpyg5pOgHTue
	Z3e+KU8Y06g2j1Uoeu2LwOjHwdit
X-Google-Smtp-Source: AGs4zMafWeHLrqh5M8ywSrEBvZrEyii6Hb3vnPyiKk83ptiBDvli66zZvLYxVuZfq/LkYYFYUWrSUQ==
X-Received: by 10.157.68.69 with SMTP id f5mr2770329otj.282.1510421161416;
	Sat, 11 Nov 2017 09:26:01 -0800 (PST)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com.
	[74.125.82.175]) by smtp.gmail.com with ESMTPSA id
	b27sm5895227ote.65.2017.11.11.09.26.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 09:26:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f175.google.com with SMTP id v15so1463208ote.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 09:26:00 -0800 (PST)
X-Received: by 10.157.21.59 with SMTP id u56mr2728491otf.215.1510421159668;
	Sat, 11 Nov 2017 09:25:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Sat, 11 Nov 2017 09:25:59 -0800 (PST)
In-Reply-To: <CADseiP=dhrkCrqBnO+g-HZQZaGgf1ywZwFcd-0bpE9K-qhALPQ@mail.gmail.com>
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapRKjZZ=yCYpfrm3CDVZez0JbLeaKHaZg2J3WhjBvRR6jg@mail.gmail.com>
	<CADseiP=dhrkCrqBnO+g-HZQZaGgf1ywZwFcd-0bpE9K-qhALPQ@mail.gmail.com>
Date: Sat, 11 Nov 2017 15:25:59 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqhY9miP9wf0rv_mhtyn9_dV6-Cm3=J6yOhmx-Y6qpGiw@mail.gmail.com>
Message-ID: <CAP9ODKqhY9miP9wf0rv_mhtyn9_dV6-Cm3=J6yOhmx-Y6qpGiw@mail.gmail.com>
To: Ian Coolidge <ian@boundarydevices.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Sat, 11 Nov 2017 17:26:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 10, 2017 at 10:10 PM, Ian Coolidge <ian@boundarydevices.com> wrote:
...
> Are there any obvious flags or compile options I'm missing here? I haven't
> tied debugging into this yet, which is my next step here. Just wanted to
> know if I was missing something obvious.

Maybe this fixes it?

commit 568227133be3f9f015679df3525f6c4f86304fd0
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Nov 7 15:26:52 2017 -0800

    gcc7/gcc6: Fix unaligned STRD issue on ARM

    Backport
    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445

    Fixes [YOCTO 12297]

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Please check if it helps you, otherwise please open a github issue so
we can keep track of it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

