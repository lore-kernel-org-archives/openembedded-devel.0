Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id F10297182C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 08:38:11 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id h3so27025639qgf.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 00:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z7NfQT/sATaYPwviizGGpM0V6fRQB5MrsScAPJfAOXg=;
	b=SVG///48gNT0mKIkW3CvwBLsuwmBbDVbC4l3owA9afaB6OVYUQmiaObF2AuK/PTlge
	F6rLtDT56p4A3jYADl/TNr2OLueYrVlVEUwkCrUfPPIs+7xtQrbcfjHCbS6LhoUODIKk
	LGlxLQIVNPPDSy4ZhhWBTy8e1+ffQw3H1B25OUKF2DOC6Fc2gyyJFswzQgWzazZLzxcJ
	AB9a5gQCKQCwpwMpxoa3/ow847tonKN0FxOHH5RfTW09C2ohlMQ3oBf53lP3AA6UU3RW
	pYlkSx70gWLTRQ9a4l8gLU21eJYVMKQSf9639NWOxEVqAn5BPAz1TtnhHPbHQbUuwkLp
	eeZA==
MIME-Version: 1.0
X-Received: by 10.140.104.1 with SMTP id z1mr829516qge.76.1424162292242; Tue,
	17 Feb 2015 00:38:12 -0800 (PST)
Received: by 10.140.82.72 with HTTP; Tue, 17 Feb 2015 00:38:12 -0800 (PST)
In-Reply-To: <CAP9ODKqN2iTwBSQUJW46YH8A-qSkV4FPbCsJ-Y2ArSr9mBTXFQ@mail.gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
	<CAP9ODKqN2iTwBSQUJW46YH8A-qSkV4FPbCsJ-Y2ArSr9mBTXFQ@mail.gmail.com>
Date: Tue, 17 Feb 2015 09:38:12 +0100
Message-ID: <CAEHkU3UQ01La1rSaMSWaeCQUE4jxMqpb9GZgswKu1_oJN5k7KQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH 0/7] Allow build for multiple ARCH in the same builddir
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
X-List-Received-Date: Tue, 17 Feb 2015 08:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Otavio

2015-02-17 0:13 GMT+01:00 Otavio Salvador <otavio@ossystems.com.br>:
> Hello Max,
>
> First I want to Thank you for all the hard work you've been putting in
> the meta-java lately. This is an important step on the right direction
> and fixes several things a lot the process...
Welcome.

>
> On Mon, Feb 16, 2015 at 7:55 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> Building a recipe which provides packages for allarch and ${TUNE_PKGARCH}
>> fails if one builds in the same build directory for different TUNE_PKGARCHs.
>>
>> An example is rhino which fails as follows when one builds first for
>> armv7at2hf-vfp and then for armv7at2hf-vfp-neon.
>>     ERROR: The recipe rhino is trying to install files into a
>>     shared area when those files already exist. Those files and their
>>     manifest location are:
>>        /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
>>     Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk
>>
>> The change in package arch is done in java-library.bbclass. Most of the
>> users of java-library.bbclass don't install any files in the ${TUNE_PKGARCH}
>> packages or install shell scripts which may also be deployed in an allarch
>> package.
>>
>> Most of the recipes including java-library.bbclass no longer build with newer
>> layer revisions.
>> This patchset first update the recipes to build again, changes java-library
>> build all packages in allarch by default and recipes which must have some
>> of their packages in ${TUNE_PKGARCH} to have all of their recipes in
>> ${TUNE_PKGARCH}.
>
> All this is perfect. I agree with all here and it does move things on
> a saner way.
Great.

>
>> Finaly some of the recipes I tried did not build before and after the proposed
>> changes. I document these in README.nonworking. I don't have the time to work
>> on these and I guess no one has been interested in years.
>
> This is the only thing I believe we can improve. We could use
> PNBLACKLIST as done in meta-oe and put a short reasoning on why it
> fails. I prefer this mostly because people don't read README often and
> will end reporting it is failing...
>
> What do you think?
I have a look into the PNBLACKLIST syntax and send a V2 of the patchset.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Regards
Max

