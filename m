Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 86E5A6FC70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:15:49 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so4981408qge.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 09:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4lGflFGJ2PCTe9pFi2ZSvpnhTFo4tuokwv+BRsfXt8c=;
	b=fyrrpSkXW3VdADFsYz7neKoqW44rRhyCKyA+DlCXpNJjBjzKk9YotGUAVb+v7kRYWd
	BcqVit0X214wL1+Ooq62ZE1DRfBQ18v54uQdKeIzOn9ED18HJLeoMN6D2SOHhbA2Lk9c
	cIHVzeZwdF1E3uw7Oy5X/tG5+J3yUBYYH7WWDMNZTaO3tPzM5gAWwOmTHxvTOuBBJy1L
	C5sIO+GfFBkKcpmeAxcazUTbrQ7Q5qUzAJFRMcudPC3ssynLpWBJWFgM6k+fyEaDu025
	5VqY/i8pTmc/6wV04TAQhMgIR2HYr6nSCeNPbbL5E/avy/zHymFRr++llELoP7eYyqxC
	rBkA==
X-Gm-Message-State: ALoCoQmvfBtt39HANP6pZf7U2dTeRAEzV6+wPLaHbjCMd3+E14Cr1S7fLEOrY8yDD7X3WJBqujER
X-Received: by 10.140.48.161 with SMTP id o30mr9886234qga.68.1402071350374;
	Fri, 06 Jun 2014 09:15:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 6 Jun 2014 09:15:30 -0700 (PDT)
In-Reply-To: <20140604125205.GS2426@jama>
References: <cover.1399993010.git.valentin.popa@intel.com>
	<CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
	<20140604125205.GS2426@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jun 2014 17:15:30 +0100
Message-ID: <CAJTo0Lb8zgZN=1Xb-=L7J3EydTXOd9SCvTfHnL4p7FKV8msA3g@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Fri, 06 Jun 2014 16:15:51 -0000
Content-Type: text/plain; charset=UTF-8

On 4 June 2014 13:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> Sorry for hi-jacking the thread, but since today even the older 9.2.5 is
> failing to find native python-libxml2
>
> config.log:
> configure:8059: checking for python2
> configure:8075: found
> /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python2
> configure:8086: result: python2
> configure:8103: checking python2 module: libxml2
> configure:8112: result: no
> configure:8118: error: failed to find required module libxml2
>
> Any idea why it started to fail now?

Something else must have lost a python-libxml2 dependency recently
because Mesa needs it but doesn't have a declared dependency.

Ross

