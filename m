Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id BF3546D134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:16:18 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so6247155ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EXnrwH6NXb9tFQjlYa3qJsChEn7MbzOoHkysjVddTKg=;
	b=SfKnbZCC8L9MMB6rpKal5eMZ0NsUaa6Tsrzq5SkQUeOS1QClYRLS9NhBF5c6AT4x0o
	ASq2TYoRWRABBBFtw5Sa+ZjFXPxaCMd4cRKsese/FBGggtjlcT7r+BhkGr8T01xMFtZP
	pN3/DfGghay3IowOairUASLZVOcRVfwiNizKkVgdEjuqLnt+ujBv5Hz/JQnaSPhiIEPV
	y3o7WCM6T8c/UB832uQETPXPYOrD60lEBLGwjZwaSHgxJnQFpVkWz0z6cTX61A/4RU1U
	yos/yvc2DXLaHm201yENcygI/aWHSTeo4mSMKFkMxIsi1ErImCp97WNVZDnnzbf09ijI
	gDzw==
X-Received: by 10.42.240.133 with SMTP id la5mr47800icb.78.1382703379951; Fri,
	25 Oct 2013 05:16:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:15:49 -0700 (PDT)
In-Reply-To: <CAGJTLJ6Sszu7NjAWLf4bW=mxxWq7=Rhvqc5=-fSQ5_Ftq6eEnA@mail.gmail.com>
References: <CAGJTLJ6MLtO_neHZq7QoER7Vs4JCLnfXZbxHeKhtV53V2+PDkw@mail.gmail.com>
	<52685AB2.2060606@balister.org>
	<CAGJTLJ5z=8Wjj2WOzid3MuaJEErc_Qja93bk5Uponw-aXwcxQA@mail.gmail.com>
	<5268CEB6.7030401@balister.org>
	<CAGJTLJ6Sszu7NjAWLf4bW=mxxWq7=Rhvqc5=-fSQ5_Ftq6eEnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:15:49 -0700
Message-ID: <CAMKF1srrVYeZnZ=cOVDAAxPFChTeg5nFAc1=iCyH_iW3LJxZnQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Issues Building Numpy
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
X-List-Received-Date: Fri, 25 Oct 2013 12:16:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 1:12 AM, Stephen Harrison
<msteveharrison@gmail.com> wrote:
> Great, I tried uninstalling those libraries and it seems to resolve the
> problem!

hmmm, numpy build seems to be not cross compile safe. Can you post
your do_configure/do_compile logs of failed build.


>
>
> On Thu, Oct 24, 2013 at 12:39 AM, Philip Balister <philip@balister.org>wrote:
>
>> On 10/24/2013 12:29 AM, Stephen Harrison wrote:
>> > Hi,
>> >
>> > Yes I do have these libraries installed on the build machine. Are you
>> > saying I need to uninstall them?
>>
>> Or fix the numpy build to not find them on the build machine :)
>>
>> Philip
>>
>> >
>> >
>> >
>> >
>> > On Wed, Oct 23, 2013 at 4:24 PM, Philip Balister <philip@balister.org
>> >wrote:
>> >
>> >> Do you have atlas, blas etc installed on the build machine. As I recall
>> >> the numpy recipe is weak and tends to finds things installed on the
>> >> build machine.
>> >>
>> >> Philip
>> >>
>> >> On 10/23/2013 08:22 PM, Stephen Harrison wrote:
>> >>> Hi,
>> >>>
>> >>> I am trying to build an image for the Zedboard (ARM) platform. I can't
>> >> seem
>> >>> to build the Numpy package and I can't quite understand why.
>> >>>
>> >>> I've attached the compile log. I've noticed there are many complaints
>> >> about
>> >>> ATLAS, BLAS etc not being available and other errors about executables
>> >>> being in the wrong format.
>> >>>
>> >>> Any help would be much appreciated.
>> >>>
>> >>> Regards,
>> >>>
>> >>> Stephen
>> >>>
>> >>>
>> >>>
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

