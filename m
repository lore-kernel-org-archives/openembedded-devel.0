Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1BF6B988
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 05:39:07 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id v1so3447098lbd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 22:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0YTFqR6udtmnslno7GkdJNF+jzJdavAEJIfoR/gxtgs=;
	b=XfKkPugEAhwOwhhEAlvWNvjrMTODRFVRhsP+KA/5GclHgO3FDWPAh3wM1YSN55qN5Z
	XbqVLGUfEB8TfUMIlyIiDsOlraPgMTvmwfr+qEdScapSSDRsWPLUdvLhn2WACGR9Ue56
	XfpVLKQA2QpohMe455lJgYgPVwSHS6GYAoCmm2IP+xdlDh37S9e6U6FcL/XETCagjzea
	AFrucu8XmRVEZu5H0WlJl1OlKpD1rcq5TMtyDoA268uuElvf9I0UhD6ogaAZtLaGyFjK
	Dus0l+RY0AnIB02wpsp/iUcznyOkRU5nA8zsl5Zv7kRqjlk6YzJtomIkvoj4WNkKiGDr
	3ZWw==
X-Gm-Message-State: ALoCoQnf/q7AKQ98PqS4dgnf4j5PwkWrDz2EFqtGq4RXRNnpoh4OyB+7JM2SWPIkl0LNIZ7RLrjT
MIME-Version: 1.0
X-Received: by 10.152.19.70 with SMTP id c6mr10736756lae.25.1377668347616;
	Tue, 27 Aug 2013 22:39:07 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Tue, 27 Aug 2013 22:39:07 -0700 (PDT)
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A016C2499@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
	<CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAGNsrLC9ZP5seQjwsvb=Py0QE6-fVy8FnRSV7NWxwz9bAS+EUA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016C2499@039-SN2MPN1-023.039d.mgd.msft.net>
Date: Wed, 28 Aug 2013 08:39:07 +0300
Message-ID: <CAGNsrLCU8_+o1GPH+QwNvncNANfd-61nd+kFjnOPhGxkScUF_w@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH ] libhugetlbfs: add recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 05:39:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 August 2013 08:21, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Fathi Boudra
>>
>> On 28 August 2013 05:56, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
>> > Hi,
>> >
>> > libhugetlbfs should be moved to a common layer, since it can be used by
>> other BSPs
>>
>> agreed.
>>
>> > except linaro.
>>
>> what do you mean by "except Linaro"?
> [Luo Zhenhua-B19537] I mean libhugetlbfs recipe is maintained in meta-linaro layer.

It make sense to get rid of if in meta-linaro and move libhugetlbfs in
a common layer where it can be used by everybody.
Now the question is who's doing this work? I suggested that you'll do
it since you've submitted libhugetlbfs inclusion.
However, if you don't want to do it, fair enough, I'll take a look to
make it generic and will propose patches.

Thought?

Cheers,
Fathi

