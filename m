Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 25E39786DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 02:35:46 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id a11so3797040pgu.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 18:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cx1M8qDpLwnYteInV2jmTub+gFgVQC5goUTpJc4ZIO0=;
	b=ZNLK3Ulz6duyAQEAt1e10uokW1SzfvC3Yi0NRYqj9AmHDtuwwfZVAnDDUhtqD9mBe6
	Ts0pJVBbv/vn2HZjVmvcs4PUi+YssHQDkkSXlyxotx/bQ+0R8Ptr4H/4gg3H3mHD212W
	L5qVPJZPzB6v50CB/rSHuOeL2/M14uF/z7HU58P84ifUEQ6qRlrgpRP80dhcH0LIPtiK
	fynOAM9aiCgE6x04fjdwNARBA85hW8rNI5DSQeS1o9naAtcSuuqEdLGOLJojRFkKsTJf
	32fnDE+g5G8b5+w8UKR/vC8v1YV1/MJAxU6Cs1eoCtHoKL7Lf2piN9FOXFfqlQSw/yMh
	zaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cx1M8qDpLwnYteInV2jmTub+gFgVQC5goUTpJc4ZIO0=;
	b=WY0X8Q2II+B9HXrG0EzMos9okvn4khcWdRu6xi+AP4B817hB86QIR+ND5kIXgg+A+B
	MPVC8H/UlBzIFjb3zLj9Ao5F5kZTZ8eucPnICKcNI9chSv4w/oMDtRyNm5g+ufjsq/Dp
	218eY7BUDy4/CyAFoy94IJ+BlsX6NbpYoSrLyUU2UbtjoYDhrY7tMCa89+XALTYPsMPh
	Wnhi+7rA6PTTv2Jn958X7HWhuc1z9Ma0NaLX+F/IiU91MuIZq0CfzRlBzYOemR0PJdFI
	KvQ51T6Y1pF5K9vhi3R1SXlPtA9XWLnDMFr5TfMXbrDXOrfYtfcTzIBE4BYO7a4n3TAr
	HxwA==
X-Gm-Message-State: APf1xPDYUI7mHQPe9v0eacPcGZeLXQaRcUck61OvtklKnFZlw3ZT1fDL
	fzb6YP2c7fa9Vp3aVbAAnv7x/WUJjX1djznXHiE=
X-Google-Smtp-Source: AH8x226Bv6qDWJZTOAGibkYp8PrA/qJpmpFek4vWZRYY7qECWouTzCCG5xOAEl9X84kg0TIrPjDOpBKeXlCLMlUEz8s=
X-Received: by 10.98.229.21 with SMTP id n21mr6898526pff.158.1518834947937;
	Fri, 16 Feb 2018 18:35:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.207.166 with HTTP; Fri, 16 Feb 2018 18:35:17 -0800 (PST)
In-Reply-To: <20180216230846.GT2786@denix.org>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
	<20180216220142.GS2786@denix.org>
	<CAMKF1spkGJpYTAmQ9gh+af51ya3qkZja8XMmVP5u=Q-ycc5qbw@mail.gmail.com>
	<20180216230846.GT2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Feb 2018 18:35:17 -0800
Message-ID: <CAMKF1spcrZQ34imyqaXtcHRmphyU1Kfo5nNdo6qaaeOVSx51eg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
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
X-List-Received-Date: Sat, 17 Feb 2018 02:35:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 16, 2018 at 3:08 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Feb 16, 2018 at 10:59:39PM +0000, Khem Raj wrote:
>> I am using arch Linux for host distro and security flags enabled May be
>> that is something
>
> Could be... I'm on Ubuntu 16.04.

maybe you can try to enable security flags and see if you see it

