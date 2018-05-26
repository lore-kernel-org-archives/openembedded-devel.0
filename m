Return-Path: <twoerner@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id E2B3F74CA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2018 02:49:12 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id j1-v6so12076902wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e2KJ/vE/U6voAuS9EZedGpIEPjFRf/NeYGYzpTuB7wQ=;
	b=gebXO40m8TGs+zpfynUMq23+cvrOkzO/eOPCgS0MTesVvA/0Sz9A4AJ2nNxuCARioU
	IPmvG0xpmJ8JNUEHit1L7wZD24X19wfuLVcZ7M9KOkxpbhvX5UJItM3O16R1IdjDfeeb
	hoWOhMC5XSxffYL8WvOnsAB9D/Fj+Yg5ncbCBN6N/CLRXzWSnpS4DaeOaW9U6D2w4bHn
	ezQfhBtlGnWNuDbQmVAerstZV5CEbpjXsLGkT6Xj5R2g09pt/n8X0V/rPZnELwqC/vB9
	uGSFQqJsydCm+qXPZr0CM8OB80MJV+CiDX/i3WPqiKBVQj3dB6vkE3mGW/2Tohy/oQFN
	EFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e2KJ/vE/U6voAuS9EZedGpIEPjFRf/NeYGYzpTuB7wQ=;
	b=UHymcN7eAGfoCkLXGy9+DSejZ/bqvTb3xzj6EJX4B//Mpj0seJar+VJ/qfAfA6WwEJ
	UGwY6esTU5IkPmsfqCsh9M+ZUH05zhHKOzc4NcLB+zGCur9Rv7Gzj4dHzKRIQ0U7e3IE
	iH+vUgiaTUtZHzEMTmif2wjUK9kRE5GRUGfzWlhabMZ+hm/rXhroU68ANFlsTnEymkvp
	y/zf0qhUzctz/fTl2JF8jRAR2aq7oHdLDzYxMUJo5qH7YhWiFYSOT4R3GcUkADzOzzBv
	3oxI13TLiXto0DilD3tvnFbS+VvBTQcwln+dbcVLGJKyJdsm0M9h44ERZFJwhEqMrSDu
	MjkA==
X-Gm-Message-State: ALKqPweOzpnsLb0tafvy+ZiSAs++YNH17Sm/n4u2NqmxR6lAT8JJ6BIX
	775jQA7mi8SxjM3Je0BVFQtfntoGRjmSUcaf2WLEug==
X-Google-Smtp-Source: ADUXVKKH6g7NEave6JXZ0yA1PRkP+sNTHWe17XdIRDn8Gs201IYzwn1mJbx1jDKeus4n27u8RYNqoaWuoPqYcTAC6G8=
X-Received: by 2002:a19:1b90:: with SMTP id
	b138-v6mr2734424lfb.17.1527302953431; 
	Fri, 25 May 2018 19:49:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Fri, 25 May 2018 19:49:12
	-0700 (PDT)
In-Reply-To: <CAHUNapRfpD-bB2WWFkyw4FTO5Q0_Mhs+wcwKYx6eEwmfROxN_A@mail.gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-18-twoerner@gmail.com>
	<CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
	<CAJ86T=XbNpLWxCYmOoTRLyvYGZcwD+7tBeg-xi33p1SDZDzEAw@mail.gmail.com>
	<CAHUNapRfpD-bB2WWFkyw4FTO5Q0_Mhs+wcwKYx6eEwmfROxN_A@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 25 May 2018 22:49:12 -0400
Message-ID: <CAHUNapQWM33u460br-Hjd9ZxtAVq0TNr5UZ5PKbA_34SCKk5eA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH v3 17/17] libeigen: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 26 May 2018 02:49:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 25, 2018 at 10:45 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Sounds good; I'll take a look. Thanks!
>

Oops, spoke too soon; looks like someone beat me to it :-)

