Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjAdn-0002W0-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 16:24:03 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so4171539wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZJxNjc3yGwfMk09owx3nNuRBd+oNUbP75MFa61hDDJo=;
	b=0sZ3CsZcFwFWJ36iHTv9TacxhW9OsjbbXYKiY/VzgTyCTtkm7ey2k8lt4tIpREGuYq
	gve3Q1bk9ONvRewHmr3y6UL6vxqmvhvjpGLg1yT5KDVRAXxyjVr6S0fVZTNnWimjiN53
	xJbPSHxM1bg2z5YVSHkadaRtnHAeAw6TnIgKeJYjUrHCUsljpp/0BGCa8cJnlPE0rkJU
	QPDBEUp2A1RU50opVQKmqcX/L6oLK6nmRcpf8XzfktOc5cVuAAeVBtR9fftmQgm+SwTI
	mEv9te45nKfmZnnOHjXiqfGWEmZYx6jW56qeUnocPDeHHbDKdCuE5LdmA3v0FTD0QXNx
	pmMw==
MIME-Version: 1.0
Received: by 10.180.74.108 with SMTP id s12mr3938509wiv.12.1355411368244; Thu,
	13 Dec 2012 07:09:28 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Thu, 13 Dec 2012 07:09:28 -0800 (PST)
In-Reply-To: <CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
References: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
	<CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
Date: Thu, 13 Dec 2012 16:09:28 +0100
Message-ID: <CA+chaQcZNAzJ56QMbhn225V119ZoDZ0uV404=0gnynLdFbm=FA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: current bbappend issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 15:24:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 2:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 December 2012 13:17, Cliff Brake <cliff.brake@gmail.com> wrote:
>> ERROR: No recipes available for:
>>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
>>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
>>   /scratch/oe/oe-build-core-3/sources/meta-ti/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
>>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
>> ERROR: Command execution failed: Exited with 1
>
> You can fix that locally by reverting the revert of the qt4 fixes...
> (cherry-pick 421a73c9c3bea13e029cd0505711ef02753949bb).
>
> Agreed - meta-oe master needs more maintainers so that it keeps
> current with oe-core master.

pw ids:
40585
40525


