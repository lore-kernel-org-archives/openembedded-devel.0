Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A65E160851
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:40:49 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n184so135864309wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=X8vAF9dWvtxAaapyydv7Ttg/VAtEzz3dm9WT+/Ze6zY=;
	b=gMsZzyw7GBTn1Hw6FwNUDdbx+PpzWTcPipcm35UvJ0AJO/7R6OyOTbEQOjWd7oWI3w
	UACALHy6T5uGtGTcfj7o78jg+SRyseYQHUsLA7FUZuy5O0GYgyGOFOGcnJ7rL4iNaxgE
	v+STMCxTMX0EtFNO+MOI6AtnVxWieBO1udKHKLJz2H0dY41Jk3miinhPqk/vFrx69yhK
	ihkuff0NKqEirESALr7kYCX/7X0KKGLqemzlLnc/w+cNay7p24Mra3FtL2nX23mLAj2v
	eXn22Ei3EtvTBFB42UHSEDypXmZhjU09F2DwlfQlSLwltcZv4e2PMRL+1E8QaXMxNFL9
	xgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=X8vAF9dWvtxAaapyydv7Ttg/VAtEzz3dm9WT+/Ze6zY=;
	b=MspKghPc1hSX/edz3t1ylInffOcG9cJfZZX69g8qU27xa0hbxb1bAKRmi0iOvjkrgp
	HWWnOcPJg4ecY3QttrjUFqd9kAS+JAeqzaXhdaEfLon9DvMTdFXaonhu9mD0PP6bMRa8
	W/sYbtp5ZX+x7q38Gnbj7wUzK5PgbnutzvE8MuYVhURBEViVDnQAO8dD500sbFOGxrpS
	6IT8UMQOCkfGFQBJRVlKo90T5EQ3kX40FRe/b9fPyAAtepcFCU2EKkBc/P6ei0HDq6fH
	lPyBs8hwecSLdUUXgOLZdx3yfEDq/xDAneScO0FeJ7R1829niMx9BoGL0SyumJSKUojz
	1lGg==
X-Gm-Message-State: ALyK8tJ7ScI86wLluS0PaKxBwwqpyuF8WoUqoItNfOpV+L96lHd8I9V4bwNqSGdud8rMrjN4qaC0DC3S89GSkA==
X-Received: by 10.28.215.139 with SMTP id o133mr7798271wmg.74.1465933249530;
	Tue, 14 Jun 2016 12:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.60.111 with HTTP; Tue, 14 Jun 2016 12:40:48 -0700 (PDT)
In-Reply-To: <CABvT5oW9akWn-X2nTUm+gsZKCX0yoADJ7K1RgLgU=ZXuRRdYng@mail.gmail.com>
References: <1465499198-340-1-git-send-email-henry@pericynthion.org>
	<20160614173311.GB21667@jama>
	<CABvT5oW9akWn-X2nTUm+gsZKCX0yoADJ7K1RgLgU=ZXuRRdYng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jun 2016 21:40:48 +0200
Message-ID: <CA+chaQe1rcKeNpny-bpghrLtz8eOpghos9jBPf95obvbC8ucuw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Tue, 14 Jun 2016 19:40:52 -0000
Content-Type: text/plain; charset=UTF-8

PACKAGECONFIG is preferred solution

On Tue, Jun 14, 2016 at 8:42 PM, Henry Hallam <henry@kittyhawk.aero> wrote:

> On Tue, Jun 14, 2016 at 10:33 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Autodetects some dependencies:
> >
> > WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on nss,
> > but it isn't a build dependency, missing nss in DEPENDS or
> > PACKAGECONFIG? [build-deps]
> > WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on
> > libedit, but it isn't a build dependency, missing libedit in DEPENDS or
> > PACKAGECONFIG? [build-deps]
> >
>
> Thanks Martin. It looks like those didn't show up for me because nss
> and libedit are both optional dependencies which weren't present on my
> system.  They are detected and used by chrony's `configure` script if
> available and unused if not (e.g. chronyc can use either editline or
> readline or neither, and if NSS is unavailable then chronyd gets built
> without secure hash support).  What's the best practice here - should
> I simply specify `configure` options to disable all these features for
> minimal dependencies, or make them all optionally available via
> PACKAGECONFIG?
>
> Henry
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

