Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74D1465F94
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 13:52:42 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id l4so3060167lbv.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cT+aBMJAfIUaKiA8xpI8qNq/kzD9yzw0IGYsOomY7ZM=;
	b=vVKoDytfW8TnyWQm8mYdhPrG7LmmkRrmA1MWc4H5fmGkUqtI7xYIsjlXeKHc7X7MPf
	etW6s/jCdS9jGfdiAxm8rn9uFxDbNuP6xiYej2o66yKKft+HkYM3zz7BD8tnX9hpptwk
	Rl32R2Ta5DkZE+7d/eRyCrrNCKl7txyySMvLZPNv75HpFAfk/WfyMIhlr7n/mh69HWXK
	hX9Op/+7GQJYN61i79YQjC1fvjRbAiUXAziRPKH+b50kglqbxE3NxF85S7IrzBrmuCcX
	Lqla/54FwM9aQQmChiYmMPVfhALXiIDuix8sySKHP28uKSGUz9PJvK1TDG07BlNeGv4m
	x0Zw==
MIME-Version: 1.0
X-Received: by 10.112.135.39 with SMTP id pp7mr5298496lbb.29.1399384363065;
	Tue, 06 May 2014 06:52:43 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Tue, 6 May 2014 06:52:42 -0700 (PDT)
In-Reply-To: <CANx9H-C2Yar=x3FT+RassRP8siEzwwWf9ULD_X56rhS3ZHHDtw@mail.gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
	<CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
	<1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>
	<CANx9H-DrUWLKp95ouOZZThCTqdgmdFHdD5aoXA4E3ZHsK9Wdyg@mail.gmail.com>
	<53547FB6.5040609@windriver.com>
	<CANx9H-CNfFvLaedkKvBug+YO1uKrcuvEOPfTGLfhfe5wBCidLA@mail.gmail.com>
	<53548B00.5000700@windriver.com> <53548CDA.4000804@windriver.com>
	<CANx9H-C2Yar=x3FT+RassRP8siEzwwWf9ULD_X56rhS3ZHHDtw@mail.gmail.com>
Date: Tue, 6 May 2014 06:52:42 -0700
Message-ID: <CANx9H-D_mGE+=bXxFE8RbtncCLe37AkYMsyXU4ZH+bSC+_T4aw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 06 May 2014 13:52:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 23, 2014 at 9:10 AM, Tim Orling <ticotimo@gmail.com> wrote:

> --Turns out to not be quite so simple. Module::Metadata is not ever being
> created by perl_*.bb. This is somewhat surprising because Module::Build
> needs Module::Metadata and this has been missed in
> Cross/configure.sh-arm-linux since perl v5.13.9.
> --You can verify this by running "perl -mModule::Build" on qemuarm/arm
> target.
> --I am working on a patch for oe-core.
>

Fixed in (and this patch superseded by)
http://patches.openembedded.org/patch/71565/

>
> On Sun, Apr 20, 2014 at 8:13 PM, Hongxu Jia <hongxu.jia@windriver.com>wrote:
>
>> On 04/21/2014 11:05 AM, Hongxu Jia wrote:
>>
>>> On 04/21/2014 11:01 AM, Tim Orling wrote:
>>>
>>>> On Sun, Apr 20, 2014 at 7:17 PM, Hongxu Jia <hongxu.jia@windriver.com>
>>>> wrote:
>>>>
>>>>  On 04/21/2014 04:19 AM, Tim Orling wrote:
>>>>>
>>>>>  (1) I am thinking about dropping this patch. perl-native provides
>>>>>> Module::Metadata 1.00004, so if subsequent packages are being
>>>>>> cross-compiled I have not yet proven there is a need for the updated
>>>>>> v1.000019 provided here.
>>>>>>
>>>>>> (2) The question is, if one wanted to build subsequent packages
>>>>>> in-situ,
>>>>>> how to provide Module::Metadata 1.00004 on a target system, since it
>>>>>> is
>>>>>> only provided by perl-native?
>>>>>>
>>>>>>  It is also provided by perl, for target.
>>>>>
>>>>> //Hongxu
>>>>>
>>>>>
>>>>>  I am not seeing it. Am I missing something?
>>>>
>>>
>>>
>>> Hi Tim,
>>>
>>> I am afraid Module::Metadataj is not in perl by default, you need
>>> to tweak poky/meta/recipes-devtools/perl/perl_5.14.3.bb, to create
>>> a new package for Module::Metadata, you could reference what
>>> 'perl-module-cpan' did, such as:
>>> ...
>>> PACKAGES += "perl-module-metadata"
>>> FILES_perl-module-metadata += ">>the files you need<<"
>>> ...
>>>
>>
>> You also need tweak do_install, to install Metadata.pm from ${S}
>> to ${D}, the default do_install did not do that.
>>
>> //Hongxu
>>
>>
>>
>>> And add 'perl-module-metadata' to your recipes's RDEPENDS.
>>>
>>> //Hongxu
>>>
>>>
>>>> root@beaglebone:~# perl -mModule::Metadata
>>>>
>>>> Can't locate Module/Metadata.pm in @INC (@INC contains: /etc/perl
>>>> /usr/lib/perl/site_perl/5.14.3/ /usr/lib/perl/site_perl/5.14.3
>>>> /usr/lib/perl/vendor_perl/5.14.3/ /usr/lib/perl/vendor_perl/5.14.3
>>>> /usr/lib/perl/5.14.3/ /usr/lib/perl/5.14.3 /usr/local/lib/site_perl
>>>> /usr/lib/perl/5.14.3 .).
>>>>
>>>> BEGIN failed--compilation aborted.
>>>>
>>>>  --Tim
>>>>>> --
>>>>>>
>>>>>>  --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>>
>>>
>>
>

