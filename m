Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 714C260053
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 18:04:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m7so3802989lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Oct 2019 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MuZdhj+N1ljqUUVEN12vCbFM5wi6fL+4cTa5PsqdJ7M=;
	b=DwR5M0y0Wt/w/FsC93KcPYhat/DUfbCGRmcYkLwmipNlC1TUXstKx1LMjPGindNJBr
	hn/QYO+QqMex/3jfdmOk+q+YAhsJH6elEk9xNVMrj9CsTrTtC9vrCqF4mBTTsoTZp8ER
	7u1E//VTHqt/PHrJtiiaPN5Pt2P4xn80cdMYMQ0jbYIRnoGeJnoal7cZrJ9HUP6mcZaS
	wssNFOC1SBkMSTb5J3j4tK351PS6eOajiQnKF/pZkZxU5DOG/ln/XhSC++WekeFa+M+V
	Ps53hR5+wS/MS6Q4gqhcWWn6bX9MrDqa8lNUBDM/ATe47C2B3BNgxhx4dkaPy+acC1er
	mDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MuZdhj+N1ljqUUVEN12vCbFM5wi6fL+4cTa5PsqdJ7M=;
	b=fd2BNvfZikQlLzjlr6km1lB9OOoI4U7n8Aysvbe4A85IDMiKLdtNoEB8UcVcshBDE/
	wogDR33eLr/3+2mCz+TWglwfwzTNojGOOuZoNFrPOB5CZp5LqV+mBkZvrSe2PQOalkEW
	TVJbkizML/nVxVz54l3dPCyWtcslByioqVeEVPO4oeuEqWtCqEF43oe0vk57eqfPIesK
	y+w5q91p6AaPBbwp+nzCd4GtP+289UFNdXZjy7ChrkrBTogu7Ps+srKEvbVZY9lyxSMf
	XYy5nlgduaAX8G1k/d8mKN6uWJXOM5MqiQerw7fg+McZvofX9jfUngGhgNCfb3CG2e9q
	iLfw==
X-Gm-Message-State: APjAAAXrf221GM8YagAJ58WpUHIIeWtcUE6WRDfIGR4NNAjogtiA1U7Z
	zIoDT/i9gAVpeqwLFxaOfVokbPqcK1DdnQK5bcM=
X-Google-Smtp-Source: APXvYqzM4zeyerBDRwOgpAD4E388Q14zZtRH4c0Ino91oV1nMkEY6W642/nYRRLO07hiCOhZ283o4Dgp7WZsaWucbuI=
X-Received: by 2002:a05:651c:1ae:: with SMTP id
	c14mr6958325ljn.169.1570125895931; 
	Thu, 03 Oct 2019 11:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWTEWCO=5CvTR8idSAGq=1LQgFpZxTSE3da8M4YgmLzpPA@mail.gmail.com>
	<CADkTA4OLZiHoT8UBrVK+aMa0hkMXUakvQ0ZgOL1icQbjWRHN=A@mail.gmail.com>
	<CAA=hcWQs81DPCv+10XZ9fgcfdpyyMLroxbv47zSbAMXjT_YzNg@mail.gmail.com>
In-Reply-To: <CAA=hcWQs81DPCv+10XZ9fgcfdpyyMLroxbv47zSbAMXjT_YzNg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Oct 2019 14:04:44 -0400
Message-ID: <CADkTA4NXC9eD7ur242Umh4VAMVKy9b0-32Z387Y75durcV0S4A@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel 5.3 fails to compile No rules to make zImage
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
X-List-Received-Date: Thu, 03 Oct 2019 18:04:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 3, 2019 at 8:07 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi Bruce,
>
> On 10/1/19, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Tue, Oct 1, 2019 at 7:22 AM JH <jupiter.hce@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> I am building kernel 5.3 on imx6 but failed in do_compile, is anyone
> >> able to compile kernel 5.3?
> >
> > I don't build for the im6, but linux-yocto-dev has been building and
> > booting for v5.3 throughout the entire -rc and release cycle for that
> > version.
>
> Could you share the SRC_URI for git download, the SRCREV please?

Just clone oe-core. The linux-yocto-dev recipe is there, with all the
details you need.

Bruce

>
> Thank you Bruce.
>
> Kind regards,
>
> - jh



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

