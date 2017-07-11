Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDC277DBE
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:59:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id h22so4098779lfk.3
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I3kLR/zp0LEUZmMMPET7+QcKtBOTh7QZDAZvXxQhDK0=;
	b=F3gDLST/L+9+ZUhmdbKkBUyO+Uzz78TNZH+zjukuuNnGLpkTOl2EM3PuqYp85ycNrk
	I/Wgo6T25AmdDEXhDC6YV59vZFWCzb9uRoydvdG/CLoUmn181dmtJc+X/95qmkptOtCJ
	lejqBpfdFYWPbOLJNZfdYuj/JJclysw5SnNp75SvAo/5KSfZ8E8Y1ywIIpYkZAG4oMt7
	3kTaST7+9+7in6Nne74A3IoWGuzG48jnedbKA1k9rFRgECSaCHbFZBJfUWfHf2Klwm1F
	TeYKJuHfcqwtBz39cypG59Pe0JJvYjAf49jZb9Ps9Yy1aFg0bFHCitnelMj9dWfrKbR4
	1MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I3kLR/zp0LEUZmMMPET7+QcKtBOTh7QZDAZvXxQhDK0=;
	b=p0zwqOF5ArZwFGQKo/8l3ywRXYeoRjr2Df2UMVzTQ4FJeebU4TX5GXjYCGGAvbHiYc
	evfHU9gEPq872Vx+Qwjqu98CSj0CCoVJtJHREykBFP+etm8Ypmi81pm2ihC83yLQI3CW
	JtJYOfBl92SAlglehurUP5iO9f+XotNkVzu1SENeVAikvRfK/Laem7hARNyoGJb6yTay
	wttvYuzUN/qfYQm62jymWInajsIS5L/QOXu6pAa2cEpQRmO563nwvX9upOfM/ndSBJJC
	jWfjN0lcJphu+tDbeXm6Y3m0u50Gn34znTH+Av9L6ehTFpUY2AS0oL/2tSmyY0Pz6xe2
	+sIQ==
X-Gm-Message-State: AIVw111BtaA0R6HcaE4PAPytlE+k2YDg/ujv5yOJIp8oKx7uNileryK/
	cgFSC2QxSF1I3fZG4MUVPe3l98W/ZQ==
X-Received: by 10.80.145.198 with SMTP id h6mr3017282eda.108.1499788751377;
	Tue, 11 Jul 2017 08:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 08:58:40 -0700 (PDT)
In-Reply-To: <CALbNGRQi_rdechQn35Dv+R9-42cvVahNt=K8MPYkaqhUhF90_A@mail.gmail.com>
References: <CAMKF1squ2QyqpKvUKbz7QP5YsBvd94B6jFaju0hL+qWy6cA7tA@mail.gmail.com>
	<CALbNGRQi_rdechQn35Dv+R9-42cvVahNt=K8MPYkaqhUhF90_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 08:58:40 -0700
Message-ID: <CAMKF1spB+OyV7HLOyTy7NfE88+NQD_9QRADisH-ipdQGm2V_tw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qdbuscpp2xml native Crash
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
X-List-Received-Date: Tue, 11 Jul 2017 15:59:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 12:22 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Jul 11, 2017 at 8:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Andreas
>>
>> This patch was added by you.
>>
>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/0=
012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>>
>> This is actually causing qdbuscpp2xml  tool to segfault just on invocati=
on
>> when I build using on arch linux host.
> Have you tried qdbuscpp2xml without this patch? Although it does not
> solve your problem: I have Fedora 25 on my machines and qdbuscpp2xml
> does not crash.

if I disable this patch then build goes through fine. I have qt5 5.9.x
installed on build machine as part of KDE desktop, I wonder if that
has some influence over native qt5 packages.

>>
>> I tried to debug it, it seems it gets lost in translations.
> Maybe some dependency is missing on your machine?

Could be, but cant understand what that would be.

>>
>> What is status of this patch ? has this been accepted upstream ?
> This patch would not have a chance to be applied upstream.
>>
>> I also tried to apply two patches that were suggested on qt mailing list=
.
>>
>> See, https://github.com/kraj/meta-qt5/commit/df4ca3897b3929f380623629bdf=
d935c335e49b1
> If I remember correct - I had tested at least the first patch during
> discussion [1]
>>
>> while it gets me away with segfault, it ends up with more errors.
>>
>> Ideas ?
>> -Khem
> Hi Khem,
>
> Will get into this further today evening.
>
> [1] http://lists.qt-project.org/pipermail/development/2017-February/02875=
6.html

