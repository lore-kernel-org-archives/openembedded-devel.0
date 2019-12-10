Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43B187D3CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:25:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so448815wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 13:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=fzgws9RChf9vtBixnBCNmgW+ARz5vvKIJIfAyyfZeaY=;
	b=mWpccnrLGUntJjoL1pwMxoRk5u6CfmbgegYb7zoUZ1Lc/zvQWFp2kZJ8+jqMQhX4/t
	Ayiyb7K3CvBAbgwWo3Nwzde8JVtOyid5u7Um9K+F8avG22ttZWnOg6Xz7HoGy1zXVOXj
	QTgyYitYRtUIJgccOVFs/pGZtfpzm3xhjMxNBo+azoOpB6v43TvasBZJCU5q8jVxSp12
	tU7gVqfIPUiMAVyFKviP8clCBLpTT1LPUd5eAWfFyfu1CMhA+s6pXJLdhdDzsHVaUHD9
	w9DMGemhcny3s3dijyHZ9CykmMfDMpXFwkIkG8+5loqRTssTRGp24NXPP3rOPnXh3IU2
	fs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=fzgws9RChf9vtBixnBCNmgW+ARz5vvKIJIfAyyfZeaY=;
	b=iTgu6QFErQP1BkFJOx50hxXrPnayTzB9l49+w7IFwGuIWCutqALbPWQsynsS7+BZf9
	lt4N57gJM6T4523Yl1BbDRmVCA7BBps/QHasb4YIZqs/W7SUqU5/AfJIHk+m8fs04iLI
	dMK2wsiPTQ6+u0YAb+ewCkU0U2SVe1Lv1mvQ5Xaj1605zPKxJQxp4ZZTMjmHTOIaErpw
	O5PvfGxR8KQJlcyxmwyUcetgbahFa/orl88Q89juQE7DPWcJs/cZbMBQtFi9CDLaX3fN
	tO7P8VDKIBgVftBY3wLDpNTHJkxHs5M3cKqOUw1B5l13x01MwMcgyUQtBB/jpL/P1Kfr
	Dq1Q==
X-Gm-Message-State: APjAAAVP7YtX0NznH5e6hXAz5SMbISDftZVLTU94Awme6ngHWe04L/IM
	7mB+vWn8BLweUdFl9PBrk8itHyGmoPa/NkCZcVg=
X-Google-Smtp-Source: APXvYqxLjMzdPgwZHoAo3S9mmHOTzK6A0trEQXZEJqvUk41aSNZlwdO6h7cnpreTKDjqGjleHhjUHC9yXSaHvcx9Flc=
X-Received: by 2002:a05:600c:211:: with SMTP id
	17mr7424402wmi.60.1576013144001; 
	Tue, 10 Dec 2019 13:25:44 -0800 (PST)
MIME-Version: 1.0
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
	<CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
	<20191210210406.ndlt2wt7w4rebmzq@vctlabs.com>
In-Reply-To: <20191210210406.ndlt2wt7w4rebmzq@vctlabs.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 10 Dec 2019 22:25:32 +0100
Message-ID: <CAHtQpK5BA4-GVD7OBxWVBX_auZgHhwsanKFHjtG6osidTJSecw@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: Re: Building Linux Error
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
X-List-Received-Date: Tue, 10 Dec 2019 21:25:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 10:01 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
>
> On Tue, Dec 10, 2019 at 09:57:01PM +0100, Kamel Ghalgaoui wrote:
> > For information, I my kernel version is 5.3.11 and I have tar version: 1.26
> > $ which tar
> > /usr/local/bin/tar
>
> Make sure you use system tar instead of whatever is lying in
> /usr/local/bin and try again!

Good catch!

I've just recalled that all those issues I had in the past with
incompatible host tools were on Ubuntu 14.04, which is already long
gone from SANITY_TESTED_DISTROS!

Please discard my question above - looks like it's a user problem and
not the distro problem.

-- 
Regards,
Andrey.

