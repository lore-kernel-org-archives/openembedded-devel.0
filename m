Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id ABF3B75843
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 19:54:16 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so61758802ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IL64qnQi8wJE3w4DRtn0PE8oWy9EyOpmWmyPWpr5lPs=;
	b=Sq1LcfpY/tSfzYt2kNRWYDD6qRm0S5JW14fPsKXv59BHL4PQ/5RrZsjYVfsnn7G+yV
	d9bf1aLySG+qKX7u9/xPFvrFOcxyybMyxJ4NKpYeDxvTS+8ybRPApVZAKTxy66ZKOrQW
	lCJsPSGA5zsq+4zPqEkyZZZSUrOQ8hKCun3LJPg5wvQLRyALBr7Wgcu36Odtf54xA8Nn
	fEE2fiY38XtdDkiA3C1CGBLA9AOdfnCijAQ9V5pIrbC1hnp3niqjTTlqADcRyCOjYqAu
	pMh0izgqgK4zqFeNQFoa5gOixC5hV+L3EHc5HFvaqLCj/VC9Dhbooz/A2sqRLWNU8VmD
	M46g==
X-Received: by 10.50.143.104 with SMTP id sd8mr6342134igb.14.1435262057714;
	Thu, 25 Jun 2015 12:54:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Thu, 25 Jun 2015 12:53:48 -0700 (PDT)
In-Reply-To: <5587CD49.8040704@phoenixsoftware.it>
References: <5587CD49.8040704@phoenixsoftware.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jun 2015 12:53:48 -0700
Message-ID: <CAMKF1sqyFufYA4Z6p=HqPMRT3suDSmb+hRe-nQ2FWCY++8CyFQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] fido meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 19:54:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 22, 2015 at 1:54 AM, Pierluigi Passaro
<pierluigi.passaro@phoenixsoftware.it> wrote:
> Hi all,
> I've compiled a QT5 filesystem for imx28evk machine and QT5 apps runs fine.
> I've also compiled and installed QT5 SDK, however if I try to debug
> applications I get the following error:
>
> Debugging starts
> Listening on port 10000
> Remote debugging from host 192.168.2.173
> Process /root/MyQt5App created; pid = 1181
> /root/MyQt5App: error while loading shared libraries: unexpected PLT reloc


you probably have different dynamic linker on target and in cross SDK,
make sure they are same.

> type 0xf0
>
> Child exited with status 127
> Debugging has finished
>
> Do you have any suggestion on how to investigate the problem?
>
> Thanks
> Regards
> Pierluigi
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

