Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B154606D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 20:19:38 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id mc6so2663280lab.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cMPID/vixoO1bHlHuZYxLmmiB1wggHaMafKc8ZGslP8=;
	b=iXHW1olXQYyoqLj1Y0LDEGovEYQUjD1ONrlRoWemHlYaEEl/1kbGX+PsonGPOD73a2
	3jmJcBqvmHW2ih2EbMm2sP92PCQNUw5a/As0Opo6M2UP73aJr5/Fw38ii3XQLSSZWSfG
	EEbHGvrXbBc654IDYTcxtaV4svOn7LA9ZYehOHaE1dRTQBgEREzYuMKSH7zpQlUbC9X3
	pCYORfZolyU+C69Z7WK+zaWFebMlJPoUkJMmMY6Bz8b42GAT5mEYNRV1KIGllG3R2YTZ
	+NLNDbhBQLkJ0Q/J+OodyV9Nwn1rL80Ga1lS+pbOgHIdDiQjuvPyw3SL32KZXVFp+qyj
	5gag==
MIME-Version: 1.0
X-Received: by 10.152.115.178 with SMTP id jp18mr23809097lab.23.1398025178498; 
	Sun, 20 Apr 2014 13:19:38 -0700 (PDT)
Received: by 10.114.191.202 with HTTP; Sun, 20 Apr 2014 13:19:38 -0700 (PDT)
In-Reply-To: <1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
	<CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
	<1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>
Date: Sun, 20 Apr 2014 13:19:38 -0700
Message-ID: <CANx9H-DrUWLKp95ouOZZThCTqdgmdFHdD5aoXA4E3ZHsK9Wdyg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 20 Apr 2014 20:19:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 31, 2014 at 1:54 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Tim,
>
> On Sunday 30 March 2014 20:30:28 Tim Orling wrote:
> > Yes. It updates the version built into perl. I will submit a patch with
> > insane skip.
>
> INSANE_SKIP isn't the right fix for this - if this recipe is staging
> duplicate
> files, it should be prevented from doing that by simply deleting the files
> within a do_install_append.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

(1) I am thinking about dropping this patch. perl-native provides
Module::Metadata 1.00004, so if subsequent packages are being
cross-compiled I have not yet proven there is a need for the updated
v1.000019 provided here.

(2) The question is, if one wanted to build subsequent packages in-situ,
how to provide Module::Metadata 1.00004 on a target system, since it is
only provided by perl-native?

--Tim

