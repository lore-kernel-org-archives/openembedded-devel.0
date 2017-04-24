Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 51D0E779C9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:54:45 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c45so117223243qtb.1
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lMahNAxLvL2TYgy0fW6XJxtIUkOicu+q92hldmsbRco=;
	b=mDZigjGapeGcRtPOFCPu1+fJI0EKoSiQoe3KbqKHeIPM/dkahdrbxsxhKedA7ckkiP
	3Tm4OzaLRcK/HEAwCrHlZLiv6raa/FEWNIoXS/qkPguOeec1gmKjQM4pRT57WVXY4vo7
	WuGUUsC2Q5vwpVdWsS3KYDBpoV12EuJvthcbkx+Fe6gdMkJ7X+dTXnzC6MUKjdJhQ9mZ
	TmoYuApa84SK2npNcpXoofsyjVbSRI4BePrHuKNUAk0m3LDQFULmJfINuTS5SzreuPc+
	ybRb81Fie9qeYy6fnqQtM8T5vvFovXTnWjLi18jKRiCDIcOpBcPXD/LOuWPnV9C7Ct5c
	45ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lMahNAxLvL2TYgy0fW6XJxtIUkOicu+q92hldmsbRco=;
	b=pcNa2x8quxYkfTANM8MG4JaEQD3B0g/+dfjJ6VrYaAlIcqI30h2i08l3e2+dWKKbLu
	vjMZewPrgPMOwqKCact0CD4Pvq85LWY3FhzYBNIpT1VSHuhdY//EG6KmNEMo82J3Rtrk
	nWLMUK910ICO/d1i3W2bZxXmMm3TH+nQx9weTNPiaB3DS8k7W2euFy8bAjWPt9kdrcds
	k/xMBE+xMw6L1aIYbzGTYLBROBJ2ebS67XPPeCxi4IkLBeurfjN/9UErRBG7Di1BbUAg
	r0Nmz98fzC6gDqzJnf0pAjeJccA+267TnFzHqsqciho5j0ZHx41xvp3HQqQVR46xM0tN
	7dKA==
X-Gm-Message-State: AN3rC/7UXG7dqKHz8+WyQr1jA2TUvc5YJiJ+1nH4dU4vSnAe0RnMS/E4
	SDXqQtqSAfDESB42e3bOJ2JEhqcwoEip
X-Received: by 10.200.34.242 with SMTP id g47mr25803914qta.109.1493049287100; 
	Mon, 24 Apr 2017 08:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 08:54:26 -0700 (PDT)
In-Reply-To: <CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 16:54:26 +0100
Message-ID: <CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 15:54:46 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:47, Burton, Ross <ross.burton@intel.com> wrote:

> The updated glibc recipe doesn't appear to be very happy:
> https://autobuilder.yocto.io/builders/buildtools/
> builds/240/steps/BuildImages/logs/stdio
>

Note that every nativesdk-glibc build is failing like this, so that's SDKs
broken.

Ross

