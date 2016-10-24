Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B8DD71AAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 05:36:50 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id x79so193699409lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2016 22:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A+qIF5RiTJpcaPIj2207ggGmfybJaE3zgtOsqsFO61s=;
	b=BHXSs4PABZy6uxfXpHX0G3KO0OQ2B88ZzByxt1eZxAPQ1Si8v4r4XD1lyW0/A1617x
	Ctr0QH+zPO3+CTzxf/qLEruXealq3rBeivw+8yqbfPjo6Kchz7mMfQgrop3cxTyfYwET
	7DneI/zzZLiC/kDYl3PDlH9hUocaYAl/ScovQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A+qIF5RiTJpcaPIj2207ggGmfybJaE3zgtOsqsFO61s=;
	b=VVyq4vZCwle5FhKxv3hdc7nWp4Fr1b2G7kLfiC6CaVZJDrYry6NXURyEY01unUxRQE
	yXbYss3agUr4CxtkbiGWXQ6stYmuOZV3NYGdqrGAJxd0aVx3DFwZHWp3ra5B08IOVFLD
	np8/+AI2NE4/pwpoLHA5FcuxJJPpTJHYKLx4r96UbgdkhArR0vdoJ3qQt4HPcNNEqOmq
	127QKfaaqbLpkZSjY8lr2vNWMOeg1LoUExNal4eHLFwbILFRl7umga5cmHtQy1edU2K1
	KMVAJa+qgB6aiYtLL3JufbofmpofKIQnA3tzt8TlJnAwEg7K2N4okrS+2JmmGOC8TV8S
	IzoA==
X-Gm-Message-State: ABUngvec49BpG99T67lV4KPkRMj96baBxJ/+tbbcPPey/4055POKveASX0tkBDH6p1ewmd3xImQE1xgwFo6mLw2v
X-Received: by 10.25.22.77 with SMTP id m74mr6180097lfi.143.1477287411365;
	Sun, 23 Oct 2016 22:36:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.18.205 with HTTP; Sun, 23 Oct 2016 22:36:50 -0700 (PDT)
In-Reply-To: <99A3A30C-D999-4428-94F6-68F81B3CA3CE@gmail.com>
References: <1477033819-18461-1-git-send-email-koen.kooi@linaro.org>
	<99A3A30C-D999-4428-94F6-68F81B3CA3CE@gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
Date: Mon, 24 Oct 2016 07:36:50 +0200
Message-ID: <CAP0W-R=54N9vUcc2sPKS9WT8zO-kfTQA0tkGygBMDp8XofaH0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] android-tools: fix native build
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
X-List-Received-Date: Mon, 24 Oct 2016 05:36:51 -0000
Content-Type: text/plain; charset=UTF-8

On 21 October 2016 at 19:12, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 21, 2016, at 12:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>>
>> +# Find libbsd headers during native builds
>> +CC_append_class-native = " -I${STAGING_INCDIR}"
>> +CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
>> +
>
> is CC the only option to be tweaked ? can it be done via CFLAGS or BUILD_CFLAGS
> and BUILDSDK_CFLAGS

Among other things, CFLAGS gets emptied a bit later in the recipe,
which I why I went the CC_append route.

-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

