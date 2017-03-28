Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1365077B99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 21:05:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u1so24699812wra.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U6I9uheW66m8ef3PpawTcbu2qShR61fdVp3mY2p364o=;
	b=OVZWAn2wevW8HQdYULOOpTHocESFWVWmuXZrXp1gD6oOrPsOXyeezvtEvl2XygKaIG
	hcMk/sj90L3zavjBQK+JrXzD5RckhZbFgbqPVb6uxO4RGB9CgVzsqItDE4860WYyWhHP
	+rxiXOwCTx9igeYItDeB+wltCDpfUMJK0BIpdl1ff95dUvw9Aew13pq5GbgyNt75Wohc
	8S+9s7lvhtduEZevOpL/W8PEycugvS0cUg3E7nmEjgyfWhe2uKxlkTkSOyNNuP0bJwHA
	o4PREcjjulkdydKouWEuf8Dsmy6h7KmC+Pg9TKTPfiLjxQVJ3iURpnw+1IZumEfd6Upw
	TutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U6I9uheW66m8ef3PpawTcbu2qShR61fdVp3mY2p364o=;
	b=exsPQ6R3pGlInhPCNmVjuGgWMpyb4d7TEr+Xnvp8DPqkJxvmmX72AZehDLJSZZM/SC
	PrVgVZRPyrrHMdFlHepxM0zhn4mzpzWcbSIpWNgCqKQHfA35En2wXfpFCwZhOs1ajwxc
	rMyv44fZENDcZsNjgzLclp30I9jah6uo12gn6uUXCiWw43OcSLTO4YkjQPq0L96HQGCa
	0osWX+Sd6ZGy9kxj9B0qGFMOT4Mm1JVkGd0dqANtQ5hwbd+wGI9xBupEkVkU3Mp2+smS
	Gf7tqq1FPgd/2RhiVPbIOCVbkkEDI1d5IV7rrs224UyEAggqjXcIPCVHCPH5+wTwl0d/
	0yqw==
X-Gm-Message-State: AFeK/H3Wv4EKy0tYZau6b+FDS3oBTOCnlx7yPY9wrhym3mi/hKM8bnOvew0tY2tEdssbCrvXjUtXnn14kaCPfQ==
X-Received: by 10.223.152.243 with SMTP id w106mr6044467wrb.151.1490735157576; 
	Tue, 28 Mar 2017 14:05:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 14:05:57 -0700 (PDT)
In-Reply-To: <68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 14:05:57 -0700
Message-ID: <CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Kelly <martin@xevo.com>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 21:05:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 1:55 PM, Martin Kelly <mkelly@xevo.com> wrote:
> On 03/28/2017 01:47 PM, Khem Raj wrote:
>> On 3/28/17 1:37 PM, Andre McCurdy wrote:
>>> On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:
>>>>
>>>> From: Martin Kelly <mkelly@xevo.com>
>>>>
>>>> I tried turning on the Yocto security flags and hit a compilation
>>>> error due to gtest not compiling. Adding -fPIC fixes the issue.
>>>
>>>
>>> Since gtest only creates static libraries, compiling everything with
>>> -fPIC might not be the correct solution.
>>
>> it still is going to be linked with a PIE binary then it should be PIC

Wouldn't compiling all gtest objects with -fpie work in that case too?

> Yes, I should probably clarify that gtest itself compiles just fine, but the
> failure occurs when you try to link against it. As an example from the AGL
> project, dlt-daemon fails to link with security flags turned on, with an
> error message indicating that -fPIC should be added.
>
> More context here:
> https://gerrit.automotivelinux.org/gerrit/#/c/8935/

