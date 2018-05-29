Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5FD74A17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 19:55:59 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id h2-v6so20286216qtp.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oXu0K56YmlN/F5Lm1k3iABNI3IO5GjLbOPPcOHTQykc=;
	b=iWExPmcAp30tpsV75K6plTfEm+GLOmG3RreGs0hYSQve4VJJcLApaDrCyjO08itpB3
	FnqOTr7/RvbM4BmrJo3XB8Q8zxGAjUhuQ3Eyu8mmjrlRykpkq0kthbIfW/WY0ynzAnP7
	825CBVkhauRickXFYB0/fgEkNUuYeFiF3lQoJX6/eXiKVpPZ/6OTOLuL3q22mbpc49gf
	mla+/yhD2w1zQ9WjFynL8hBVbrtrny2Xt+CFTqpIPo9W1rMkTR2O8zT2H8WTwmRwb3Gr
	q7E/0F4JM91CEJNVp8cFZWxWmLWpG1KXKKWl/YJqZL/1n0s0rFKbCSlkSp5H39MnGPZp
	KDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oXu0K56YmlN/F5Lm1k3iABNI3IO5GjLbOPPcOHTQykc=;
	b=e7139dOO6YwZwgBwYBPR1WBEPj9wdQLO5ZAsgqOWiiMD+Axc5IRoBvlE0YDtPHcRx9
	SXcPGDL7UouMFA4xxpmjaewjP2rk8y5suQO3t0KBZbNBV+t5CjeMBEYXaSZodnC3C9rT
	NoQrjdgB6AE2y+Bqv762IHvKEtJWs9D4sPiFZbdCyaMqBcNmiZ3Dnkh+2ZKxbJ5xX5/e
	5bj9ZCzKLo8D2SIpmRyttO/vxE5D/D2dXdAVU70k7AQzVDbQ1aMsDIryjBZGFv8YpaxC
	jcRt1ayaLFSiuZWJV/G/ZE8L88RCYiwVACY8KrlE42ZZNu5v+z+EJ3K5qX6b48jPUgJt
	MFsQ==
X-Gm-Message-State: ALKqPwdxfecuILMdc86evbIlPsb6+dk/pEnTEqIGfpjtowqnpUpTEqWL
	+is7dt1BmK6ypFzHKpHJyP/M9uBZFnU3+rKJGMU=
X-Google-Smtp-Source: ADUXVKIAbJCmoXC/1E1GeKes93irELbUMV7im8HDVwodLu9lZ3ktIQlZOzuxsA/8AOXLUQc7f5BKES4hN8IjfavsUlk=
X-Received: by 2002:a0c:b2c2:: with SMTP id
	d2-v6mr17316536qvf.16.1527623760476; 
	Tue, 29 May 2018 12:56:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 12:55:30
	-0700 (PDT)
In-Reply-To: <CAHUNapQWM33u460br-Hjd9ZxtAVq0TNr5UZ5PKbA_34SCKk5eA@mail.gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-18-twoerner@gmail.com>
	<CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
	<CAJ86T=XbNpLWxCYmOoTRLyvYGZcwD+7tBeg-xi33p1SDZDzEAw@mail.gmail.com>
	<CAHUNapRfpD-bB2WWFkyw4FTO5Q0_Mhs+wcwKYx6eEwmfROxN_A@mail.gmail.com>
	<CAHUNapQWM33u460br-Hjd9ZxtAVq0TNr5UZ5PKbA_34SCKk5eA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 12:55:30 -0700
Message-ID: <CAMKF1srSyh+qBLdiJkiN_+v0yd09o-F2CUeiODO-SRLjHaJ1XQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
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
X-List-Received-Date: Tue, 29 May 2018 19:56:00 -0000
Content-Type: text/plain; charset="UTF-8"

it was in queue so ran through it

ERROR: libeigen-3.3.4-r0 do_package: QA Issue: libeigen:
Files/directories were installed but not shipped in any package:
  /usr/share/eigen3
  /usr/share/eigen3/cmake
  /usr/share/eigen3/cmake/Eigen3Config.cmake
  /usr/share/eigen3/cmake/UseEigen3.cmake
  /usr/share/eigen3/cmake/Eigen3Targets.cmake
  /usr/share/eigen3/cmake/Eigen3ConfigVersion.cmake


It seems you need to keep

${datadir}/eigen3 added to FILES_${PN}-dev


On Fri, May 25, 2018 at 7:49 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Fri, May 25, 2018 at 10:45 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>
>> Sounds good; I'll take a look. Thanks!
>>
>
> Oops, spoke too soon; looks like someone beat me to it :-)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

