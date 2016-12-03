Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA4C6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 15:41:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so11106263pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2016 07:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=16Jwx06XWUNin1lBcRmyeFP+BlehikPmwar0GqmzdvY=;
	b=MGp3xjMlOy2IJKeg71HV4E/9RoMLANuUUt9QpkgrTsLHpDy+OBbvOR9JREWCJr44Xi
	g03whFpTh90jFPPK0OlBzR/VfwbbbkbufQs8DvoFt6/sD1WDUy0R7sr/HC4O1VHVFCzu
	S7iqD551AesTDNAtv0xd0ypt8kVfbCoprsc/R/FEXsKzWf7gY96Vc3AH5/AgwtXPBGfv
	+colfPyvC4FuCvlcrFH2S6oi2f1/FlcVe6KeT9eJ6bwyeKsm8OpqM2Au3fJ9l5tbyaBs
	sN2LTkrfvHh0pie6NudYM9rSN//Nc7+oJ8A/9JHtjJ1wWPhW/0bq1YrGb+Xt78n3rFx9
	w2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=16Jwx06XWUNin1lBcRmyeFP+BlehikPmwar0GqmzdvY=;
	b=FOHtQJwsawY93gdUR3VmYn84Pw5L9WfPtG5f+BXt594m5MvJUoPA5xG5naZhryE3Wb
	b/maJ2o6xzZXDJj6X3SOKxnlLhfIHxfwaZ3idgVd2FV6/39B2yvpDYXjZI7i5TUYHsO5
	beQ2SGgmuKwayGxoSnLximL9pwIhst8NvV1a0Uk4SNZZG3zm17ZwQYsVv6jJX5QuUtpY
	d7Rbtc/aXpTn0wCY2VdFQJk9wRNixoch76AFU56Ldo0JFC2RkSyfMmjMVjMnq2ZL0cph
	Rv8EZ3svavc84ih2EIQfIprJqZv7pzhRC5E2aO36tYUWuu17wEHky8uiOeiMQvMam04Y
	/WMA==
X-Gm-Message-State: AKaTC02rjY16FHcp4jc0Kzmkc6Nrzn70R2gV54cVhuDu0zz68REvyHZgLBmkjSDMxmbuyA==
X-Received: by 10.98.103.201 with SMTP id t70mr49749823pfj.99.1480779694839;
	Sat, 03 Dec 2016 07:41:34 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:5aa:72a1:f3b6:20dc?
	([2601:202:4001:9ea0:5aa:72a1:f3b6:20dc])
	by smtp.googlemail.com with ESMTPSA id
	v77sm15710356pfa.85.2016.12.03.07.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Dec 2016 07:41:34 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1480608365.git.akuster808@gmail.com>
	<CALbNGRRT2Nz_nHaJZeFLNfYGvoi01hiTuMADrz=kjyAjkTKqvg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c6654118-e5ce-7a9e-1d49-9b025153eb4c@gmail.com>
Date: Sat, 3 Dec 2016 07:41:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRT2Nz_nHaJZeFLNfYGvoi01hiTuMADrz=kjyAjkTKqvg@mail.gmail.com>
Subject: Re: [PATCH 00/67] meta-oe pull request v2 morty
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
X-List-Received-Date: Sat, 03 Dec 2016 15:41:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 12/01/2016 08:16 AM, Andreas Müller wrote:
> On Thu, Dec 1, 2016 at 5:08 PM, Armin Kuster <akuster808@gmail.com> wrote:
>> Please consider these changes for meta-oe Morty.
>>
>> removed two commits not needed.
>>
>> The following changes since commit 659d9d3f52bad33d7aa1c63e25681d193416d76e:
>>
> Please consider also
> 

got it
Thanks, Armin

> commit 5a752d719eb35dcbdf4b58bd70ec904befbe0c59
> Author: Andreas Müller <schnitzeltony@googlemail.com>
> Date:   Fri Oct 28 22:59:50 2016 +0200
> 
>     exo: unbreak Thunar's detailed file view
> 
>     see further details at [1]
> 
>     [1] https://bugzilla.xfce.org/show_bug.cgi?id=12916
> 
>     Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Andreas
> 

