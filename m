Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id AA2A577E44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 19:19:21 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id l15-v6so109226oth.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OCYZTZ1zc0QZsp37kiyNtG0+7Xj3O7TPVNKZLjLoUwQ=;
	b=P7udGZte8pJQYdQlnDjg+2Lz/EbIMRC2T6w6CNA2j19oH2slJMm1wCP2gPlZudI/ot
	Pm+K8EFbZiyTQQcsOba7MOQSBK9UCEQKfpyBEHQZrD0dlJMg3s1swdU3X2gabyCIfJGd
	7Wbcr9JC9k00Kr9Djy17K77PDfCJu7kZ3xEBJSxzX79sc4e1PO7g86G312mCp6H1mPHn
	XisAcmlwZ5J+69miT2Ref8jdIvM/d4+VpRJ5Zyx2cbK79Ujc4EFb9vqNJ83lXNA90lm6
	P3b8evvaOxQnYebu4x8j6xM0IbWlTZBWozIquuUn3BNvel/uLBZT52TsB1CzT3AUtQ8R
	zlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OCYZTZ1zc0QZsp37kiyNtG0+7Xj3O7TPVNKZLjLoUwQ=;
	b=Y5pKqtRoKQEiTVUudlhimparFtFwibbWnc4oUNomK3+/KewhBaZOwQAkPIrg/Gh5W8
	Btd8OgHDgQk63NF2Z4ZmmPxVh1YAL4qvyWfyWk/1YcDQgZuyHUVxP51mNp2uSA0SRfyE
	XT/u+KFFM6LM6A9GU0GDDJ4jWBBfuwbs4ug0/t1qNKWfJMFj4k6mfbtifqc0OznrZtn2
	BcnHTujBsVjgWa14T6HAX4p18G+zK+Eze+geSGhyiHmQFDIoNIGFf3N0lXJVgAkDBMZz
	tmo/apXUfVwEymRXw/tIt6Phqwl/W+h5Ft0yefEXghCGQKdynNkzm9Rci9Ov5GP2POhg
	Yg7A==
X-Gm-Message-State: APt69E2+1zXhH2zFsGOX1imVgB5B59WfkwcaaJM4w47XcLb8VrCSLvHN
	7jejdL+u0z0LUTZQxc11XVyFIOXl4/+1OMcRSW07Rg==
X-Google-Smtp-Source: ADUXVKIzWCp4zH6pVAWSj31AjviMnA9T5I4MspzN486maaVGkWh/0Vd76/GS/hZ+Xhw2ihvdZ6v+QUDKbt4V7BT3f/0=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr1087474otz.135.1528831162587; 
	Tue, 12 Jun 2018 12:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 12:19:01
	-0700 (PDT)
In-Reply-To: <a2ccf761-b1e4-eab3-14d8-3ddacea57a11@skidata.com>
References: <20180612143331.2445-1-richard.leitner@skidata.com>
	<20180612143848.GA39978@mbabyjoh-desk.ger.corp.intel.com>
	<a2ccf761-b1e4-eab3-14d8-3ddacea57a11@skidata.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jun 2018 20:19:01 +0100
Message-ID: <CAJTo0La4M3b9Pq8sfu0kcvkJW0T_6K2j=G9Tp5hOB4ChWVtT9A@mail.gmail.com>
To: openembedded-devel-bounces@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 0/4] README: update to reflect current status
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
X-List-Received-Date: Tue, 12 Jun 2018 19:19:22 -0000
Content-Type: text/plain; charset="UTF-8"

The same happens for Richard Purdie for me, I suspect the problem is
that you're sending mail from your own machine (or some other relay)
but skidata.com has SPF configured and that machine isn't listed.

Ross

On 12 June 2018 at 15:51,
<openembedded-devel-bounces@lists.openembedded.org> wrote:
> Hi Maxin,
>
> On 06/12/2018 04:38 PM, Maxin B. John wrote:
>> Hi Richard,
>>
>> On Tue, Jun 12, 2018 at 04:33:27PM +0200, openembedded-devel-bounces@lists.openembedded.org wrote:
>>> Update the README file to reflect current maintainers, dependencies and patch
>>> formatting/sending guidlines.
>>>
>>> Mario Domenech Goulart (1):
>>>   README: Remove Mario Goulart from the list of maintainers
>>>
>>> Richard Leitner (3):
>>>   README: fix dependent branch names
>>>   README: add note on how to send a patch series with cover-letter
>>>   README: add maintainer: Richard Leitner
>>>
>>>  README | 20 ++++++++++++++------
>>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> For some reasons, the "Author" of patches are not clearly set. It shows up like - "openembedded-devel-bounces@lists.openembedded.org",
>> instead of your mail-id.
>
> Just wrote you an email because of that. It's strange because the
> answer from Otavio to my [PATCH 3/4] parses the "From:" correctly.
> Also my "raw patches" which I passed to "git send-email" seem to be fine...
>
> Do you have any ideas what causes this problem?
>
> regards;Richard.L
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

