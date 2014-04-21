Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id E8CDB65D23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 03:01:42 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so2871331lbd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kakJJbmV14/wrhZosUVyVsMsDvJ+mEJA7hgKg3jKNOM=;
	b=PxVl5/VYSpcFOJk5xhw3XFzK2NgsdcfuFTEFr0F2mf3tjVPAI/KAbBoK+of9bGzZBL
	jAMYIksZ2nd7LYqiZDroy5Zrg2tufRyi+P1tQP8h/5+6yt2rs0mdSP0+lnj+vHdHd2RM
	H+dGyor8b/jvL2C12wBhlS/CvHu3XSmvvMmfd9Ghrm7UbLqsg0rSvqK5RUIHyGLTmNya
	m0vDnqPJORVCmCX/04DfUg1FXeETsn2n1rP7zsNmeP6jJ5VXaT0PULq0O2MwXYB9IRJo
	b0IK8QTyaD2EhkjYwP6bTJpDOJLSFn/c3JQj6HK2vMVJs8+uTuVFfmEQXGc4eqNMlEgR
	jzZA==
MIME-Version: 1.0
X-Received: by 10.112.22.130 with SMTP id d2mr639818lbf.33.1398049303385; Sun,
	20 Apr 2014 20:01:43 -0700 (PDT)
Received: by 10.114.191.202 with HTTP; Sun, 20 Apr 2014 20:01:43 -0700 (PDT)
In-Reply-To: <53547FB6.5040609@windriver.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
	<CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
	<1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>
	<CANx9H-DrUWLKp95ouOZZThCTqdgmdFHdD5aoXA4E3ZHsK9Wdyg@mail.gmail.com>
	<53547FB6.5040609@windriver.com>
Date: Sun, 20 Apr 2014 20:01:43 -0700
Message-ID: <CANx9H-CNfFvLaedkKvBug+YO1uKrcuvEOPfTGLfhfe5wBCidLA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
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
X-List-Received-Date: Mon, 21 Apr 2014 03:01:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 20, 2014 at 7:17 PM, Hongxu Jia <hongxu.jia@windriver.com>wrote:

> On 04/21/2014 04:19 AM, Tim Orling wrote:
>
>> (1) I am thinking about dropping this patch. perl-native provides
>> Module::Metadata 1.00004, so if subsequent packages are being
>> cross-compiled I have not yet proven there is a need for the updated
>> v1.000019 provided here.
>>
>> (2) The question is, if one wanted to build subsequent packages in-situ,
>> how to provide Module::Metadata 1.00004 on a target system, since it is
>> only provided by perl-native?
>>
>
> It is also provided by perl, for target.
>
> //Hongxu
>
>
I am not seeing it. Am I missing something?

root@beaglebone:~# perl -mModule::Metadata

Can't locate Module/Metadata.pm in @INC (@INC contains: /etc/perl
/usr/lib/perl/site_perl/5.14.3/ /usr/lib/perl/site_perl/5.14.3
/usr/lib/perl/vendor_perl/5.14.3/ /usr/lib/perl/vendor_perl/5.14.3
/usr/lib/perl/5.14.3/ /usr/lib/perl/5.14.3 /usr/local/lib/site_perl
/usr/lib/perl/5.14.3 .).

BEGIN failed--compilation aborted.

>
>> --Tim
>> --
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

