Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AC8B9771CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 11:28:54 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so70967051wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:thread-index:content-language;
	bh=l1NRKbggTlSt9nzYmcd9WuQvxfoVMDCf+jlnB6HpiNQ=;
	b=wKJ3tGoEgGHTGhuGXmQfTUUp30iD55SwZPtQL0rghxzCFnyL+JjUL6nhCgpJyk7YYb
	BV2t6pMqNDuzeeRQIEu8tqT6JCdI69ymmQccA88Byiw8DvPljuws1zqJLoMGwuekiLKI
	+CO5H4RkcYxhdsjB1wOzvmOYH+0bjg1WYZmnfBajnRHmkDyUFw1A6eDi32GU+iQUPJou
	/qd5zGihTxBC1fnw09zOhlaM1Vee1xb87IpIn6yGYzBVs0M4cfMDCaBCK2hn1nqQUoNA
	gNOtdZTimQGlUqQ/sxqd2afOjsBrCBeWn1nZHBNGw0WCq1Y/nKtlmeyCxY+wZVLZBb7f
	DqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:thread-index:content-language;
	bh=l1NRKbggTlSt9nzYmcd9WuQvxfoVMDCf+jlnB6HpiNQ=;
	b=dWMAHXSmmVGjvpiL3RAiZ7pLVI++BsdN5iXYApJRdegrh6eNu0DFsAfpRgKAANqSV7
	qQrgwFvflLfG0tMBE1Jq4cXxG7Tr5/8wsjCc11daU6KOLhVPCMKpwv0HrL6OLI/tZEK+
	PbHCc2mMgDqiFhSgQCWfCGFkTPivC/SfxWypKksAf6/8a3ve7tdsSsNVoAFAn8vQduGG
	ff74XO89G8hu6ZUfJ1AdGhdeRzA1EvbnD0kL0kn+wPCg/vWUl3FkSzDRi8EpI7Hhlg89
	gyYlYY6QvuvCYcQ89/r4bLKN/IEUIdIDfBtumHk/WHOruIq0ywfnS2mmDcZhpwgrWz5K
	kXzw==
X-Gm-Message-State: AG10YOSgAig55UEPoELr1xWtw6R4rK/tiY/Ee0JdDCK/qsNz+Rfn5MbyezvB591+LETJ5g==
X-Received: by 10.28.2.68 with SMTP id 65mr8241186wmc.85.1455881335012;
	Fri, 19 Feb 2016 03:28:55 -0800 (PST)
Received: from svenpc ([2001:470:1f0a:1031:5888:9e15:628f:21ea])
	by smtp.gmail.com with ESMTPSA id
	v22sm7225231wmv.12.2016.02.19.03.28.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 03:28:53 -0800 (PST)
From: "Sven Ebenfeld" <sven.ebenfeld@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Feb 2016 12:29:28 +0100
Message-ID: <00e901d16b08$cbe296b0$63a7c410$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdFrCMikUIhdfgiFTSKmsc66MAMomg==
Cc: fabio.berton@ossystems.com.br
Subject: Re: [meta-python] Python Flask recipes + cve-searching during package creation
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
X-List-Received-Date: Fri, 19 Feb 2016 11:28:58 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: de

First I would like to mention why I added these recipes.
Currently I'm working on my Master-Thesis for my studies in Applied IT
Security. The subject is to implement some security scans during image
creation.
This work shall help to prevent rolling out vulnerable firmware images.

One of the tasks I is trying to implement scanning vulnerability databases
during image creation or building packages. To achieve this, I'm going to
use the cve-search project (https://github.com/cve-search/cve-search).
This is a quite large project with a lot of dependencies of
python3-packages. But it gives the opportunity to search through a lot of
databases with quite good performance.

The main work is done in my own layer currently.
(https://github.com/esven/meta-esven) But when it is working, I hope to
include it in meta-security layer or something like that.
Unfortunately I'm unable to get access to the meta-python-flask layer. As
stated in the commit message, I don't know if all dependencies are fulfilled
for the flask recipes are fulfilled when building these recipes into images.
If you have already done these work, I would really like to benefit from
your work and not doing it again.

I'm trying to implement cve-searching like this:
1. build mongodb and redis as native
2. deploy cve-search including mongodb, redis and python3-dependencies in
native-sysroot
3. look for previously set up databases in sstate and use them in mongodb
and redis
4. start mongodb and redis with bitbake build (currently don't know how to
start it with shutting them down on bitbake shutdown) + give ability to use
external mongodb and redis server with configuration in local.conf
5.  for every package creation, search for known vulnerabilities using PV
and PN variables.
5.1. if a CVE fix has been backported, this can be ignored by adding it to a
defineable variable or by searching through local patch commit messages.
6. shutdown local mongodb and redis server on bitbake shutdown
7. save updated databases in sstate

I would really appreciate your feelings about this as I plan to finish this
task until end of march 2016.

Cheers,
Sven

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Tim Orling
> Sent: Friday, February 19, 2016 5:58 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-python] Python Flask recipes
> 
> I agree with Khem on all counts and would welcome the recipes to meta-
> python, if you so choose.
> 
> Regards,
> Tim
> 
> > On Feb 18, 2016, at 7:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >> On Feb 18, 2016, at 10:33 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> >>
> >> Hi all!
> >>
> >> I noticed that a few days ago were added some python-flask recipes.
> >>
> >> I've been maintaining a layer with python-flask recipes, hosted here
> >> http://code.ossystems.com.br/gitweb?p=meta-python-
> flask.git;a=summary
> >>
> >> There are recipes in meta-python-flask that were added to meta-python
> >> and I want to simplify maintenance and avoid duplicate recipes.
> >>
> >> So, do I send recipes from meta-python-flask to meta-python or we
> >> move all python-flask recipes from meta-python to meta-python-flask,
> >> using a layer only for Flask web framework?
> >
> > Here is a hierarchy one can envision
> >
> > 1. Core python runtime support - Oe-core 2. python extended modules
> > and infrastructure - meta-python
> >
> > now if you think this framework is quite commonly used and is kind of
> > core to python world, its fine to have it in meta-python, if you think
> > its too specific then move the common packages to meta-python and
> > maintain it as a separate layer
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


