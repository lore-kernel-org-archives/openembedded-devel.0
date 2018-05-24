Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A05972EA1
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 04:57:27 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id y8-v6so232873ual.5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 21:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nalhV9cXE8alGL/RpfwWdZcKRdsyEkXong4Xm7b1XAs=;
	b=LBCikkrOVAuG9pMaAYPuXZcum0ESBS9pAjsik+KQL1Zwxmifoi+GAiaYcEEgU26wh1
	FLbC/jL75Pm34eVbXJTQXlRFiHK0OnTk7IDAfrAH/zqiYEzwzOP6AHfyQsKhqB59V5EV
	esFVVaKgwfc0NuyxysCE54DTktRQy/RRaGuCWD1Tqo8qWNYb+CQw5d2cVF663am1M2nd
	XV6qx3CDjLK5DQ5cvXoICOp59RHylC73jYQkpQs7XF9lL20AKNnFAjVYs8GTpAk6hFR7
	IU79ZkTTy5kpuRx+OWi7+B4kFb3LykNGQzFF6jSTpiaWjzVMo8QwBHwOH5FPGA0uj8U0
	F+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nalhV9cXE8alGL/RpfwWdZcKRdsyEkXong4Xm7b1XAs=;
	b=Vz7NwWuIWfBixIg9Qhtv6fpjI5x8YnT7QKYvRSWRgZjqKL2zJoulvsvV3CD3TjYj6j
	gGcb8m3vLwnUJ6GdD3GT12/Uc8iWqvTF8cZ76IrbAWVc0EE8LAX6aMnYm917TWo5ZijL
	c8apFKj2kB2T2XQSiiqfuIunFz+wvlCUssm+SD05KLj/p4qE3wTuP/qLxbQ54SupDu2T
	vE/4wW3YvLo/o7WVrveVGIeOBeXI4zpZmMKe21DXqLQNToIn2KH5Eswh6YOJtuiloMSU
	W2JmfExBvpsnbqOZYj1q8R4G03IZfRKH8fF5BCMwTxkoxmRQw6W/gyZa13NUxX6VO84b
	YOig==
X-Gm-Message-State: ALKqPweDDlkBkbAtXweyNrTEozBJvC+y5fIiELuPyNY1w6X3lkUeqnLy
	VMAxtiUvx7rZfJ7w88YE4CRziY4aI0FG3uZ3+Nc=
X-Google-Smtp-Source: AB8JxZpZN8qXp3fC1/qo/DIGwbvAOUMYK4HMia46UyZACMcNowtAuu4HOM9nN052biIISkg5wAUmBUhSb4O7AXzjJ7s=
X-Received: by 2002:a9f:3766:: with SMTP id
	a35-v6mr3898251uae.66.1527137848656; 
	Wed, 23 May 2018 21:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:3643:0:0:0:0:0 with HTTP; Wed, 23 May 2018 21:57:08
	-0700 (PDT)
In-Reply-To: <CAMKF1srrPL4jBCaxWXz1Wq6KwKPxyHCL5vDjrx-fGLdnKCx9bw@mail.gmail.com>
References: <CAMKF1spo+S9+NF7W6dkEnBBLDxWQfvrg3L93Rz1jdZ68UL182g@mail.gmail.com>
	<CAJ86T=XXUE=Thv1Gpq9aC1bJq13qcSmKMt6-RRu3BZ=gsiSxnQ@mail.gmail.com>
	<CAMKF1srrPL4jBCaxWXz1Wq6KwKPxyHCL5vDjrx-fGLdnKCx9bw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Thu, 24 May 2018 06:57:08 +0200
Message-ID: <CAC+thW2PAHwn2tf0eS3Tev6QJZxiq=5vh1XR1KOvB2GTxX45wg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded patch flow
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
X-List-Received-Date: Thu, 24 May 2018 04:57:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 4:58 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 23, 2018 at 9:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, May 22, 2018 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi All,
>>>
>>> I am writing this to just paraphrase the patch flight process that is
>>> in place more or less
>>> and I am going to follow.
>>>
>>> We have patchwork instance where all patches from mailing list are captured
>>>
>>> https://patchwork.openembedded.org/project/oe/patches/
>>>
>>> I am going to watch this and cherry pick patches from patchwork into
>>> master-next branch
>>
>> New patches currently seem to be going into
>> meta-openembedded-contrib/kraj/master.
>>
>
> Yes, currently, I am trying to get the jenkins builds going, and until
> then I have been
> staging them into contrib kraj/master, so it can be run though my home
> based CI loop.
>
>> Is that the branch you mean when you say "master-next"?
>>
>
> Once I get the jenkins job straightened out, then it will start using
> this branch

Is the CI jobs configuration available somewhere? I need to setup a
company CI infrastructure and it'd be nice to dig into already working
setups.

>>> master-next then will be run through CI loop on my own system as well as on
>>>
>>> http://jenkins.nas-admin.org/
>>>
>>> tasks - oe_world_qemuarm oe_world_qemuarm64 oe_world_qemux86 oe_world_qemux86-64
>>>
>>> For layer maintainers
>>>
>>> Please review and provide your ACK/NACK based upon your own testing
>>> and judgement. If
>>> you want to rely on the jenkins jobs above thats fine too. If you want
>>> to test your bundle separately
>>> and send a separate approved patchlist via a pull thats fine too.
>>> Usually we do not give explicit
>>> ACKs and provide feedback if a patch needs to be changed. It would be
>>> good if you start providing
>>> ACKs if you think patch is good to signal. If a patch is not
>>> ACKED/NACKED and its passing the
>>> jenkins builds, I will assume you are OK with the patch for master.
>>>
>>> Submitters, please watch the patchwork for progress on your submission
>>> Hopefully patchwork will reflect the current state
>>> more accurately, if its stuck in same state for a long time (1+ weeks
>>> ) send the pings to maintainers.
>>> you can also check master-next branch if its still there and not
>>> dropped then its in queue for merge
>>>
>>> Since we all have limited resources and time, I would invite all of
>>> you to test master-next for machines/distros you are interested in
>>> (keep in mind master-next will get rebased) and provide
>>> feedback/review so we can include it in decision
>>> to accept the patch, any help will be appreciated.
>>>
>>> If you have suggestions, feel free to share here
>>>
>>> Thanks
>>> -Khem
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

