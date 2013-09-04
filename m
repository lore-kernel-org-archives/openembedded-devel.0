Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6E26BEDB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:31:34 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so310211pdi.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 06:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=fqM6o6VOrAcu5vzhpmkR53Ton3InvpqH5uEwo/SADU0=;
	b=kqENIGmg7vdU2bhqz48jiD8gNnPkg+ljPyktunIwYw1N0V+86AuC4P4d5/UoqX3zsc
	0ESzxruljFqkAzl5rboRJMqIqEz2XiRZKDNxO9KctmR1hoi3xq2yk8oBIkBqoPLiKbzy
	qSRNAcajGEze19N3/4kPEsfVrMfS/diVlMYCqyZ0SbgX35CDaNHwquHHlE9Y5Azrsg6Y
	lyy5vyUhvBApJn/p7KFl1KFpAFnQk6HBrtd6ytfmJFnyJu8vBqzzYmGRHiFtQ5lYpSG9
	XqQhN6U81u63qrIUhWj4dNOSTAUX4qUgIIJWCZNxe9tKToS9MU1c7gztbti8PiuNRrSJ
	gWVA==
X-Gm-Message-State: ALoCoQkTeEqiFcJyz2tZatOgeQjPmHNUJqnuYEyiekTdMU3Hp5R7CKd/NBTVvt8y6MtaS4gunYeV
MIME-Version: 1.0
X-Received: by 10.68.224.161 with SMTP id rd1mr3280228pbc.121.1378301496044;
	Wed, 04 Sep 2013 06:31:36 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 4 Sep 2013 06:31:35 -0700 (PDT)
In-Reply-To: <52273204.503@balister.org>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<20130903210803.GD20985@deserted.net>
	<CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
	<CANBf+V2Mp7Q+E0uW6YtoctCUcQa3sCma31Ygmm9f7nejYbUZJg@mail.gmail.com>
	<52273204.503@balister.org>
Date: Wed, 4 Sep 2013 14:31:35 +0100
X-Google-Sender-Auth: r4jZKlWiJ3s6HaARgEsDS_wmKc0
Message-ID: <CAOMwXhNbD4NjVV64S5WCo57Q6s-LYf3DeBxsmTuDPRpgGCZzzQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Wed, 04 Sep 2013 13:31:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 2:13 PM, Philip Balister <philip@balister.org> wrote:

> <snip>
> > The same applies to anyone else working on a layer with clearly
> > networking components that may be reluctant to incorporate it into
> > meta-net.  I'm welcoming submissions of useful components and I'd be
> > really disappointed if we ended up having the same (or similar)
> > recipes in multiple public layers purely due to reticence and
> > (perceived?) extra dependencies.  I'll be other meta-oe maintainers
> > feel the same, too.  Balkanisation benefits no one.
> >
> > Back on topic, then.
>
> I am really late to the game ...
>
> If you are having trouble figuring out what layer a recipe belongs in
> due to it being needed for several layers, maybe the package in question
> belongs in oe-core.


You are not just late, but also quite off IMHO ... ;-)

As written already, and if you had taken the time to look into the software
in question, you would have realized that from more than one point of view
that this standard is definitely a domain specific network material. It is
*far* away from being a core component.

Off-topic: I do not understand why meta-virtualization is this messy. That
seems to cause the whole annoyance in here on top of the "give me the
credit for a few lines which can only be written in one way" other
argument. Anyway, this seems to be an appropriate trigger for
meta-virtualization to get some stabilization. Past mistakes are no excuse
for introducing more, in my book.

