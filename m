Return-Path: <acfoltzer@galois.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id E5A3577FA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:25:28 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l74so58076548ywe.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HfQRhD8HfwoVZ2yQnkBVCzW4/CpdgyowV1a2WlmFvZ4=;
	b=QuwfzDlZedCtusQTf6AH9ogMHAmUhw92voT4+7At/nF+uOO8gKIHSVvhjc2dOQz515
	NaPpv94B3xE48iHqFcRQPOKLTTc/hWHfHXBfvBqWw1KnnyKW9/nQS4Y0uMP7LN+1MGJh
	qXj8w1nkouq/BXf/9t2LMcrKezcOrcXr039nbRSpshHSMVo+vUKeabE2D5IdWEyz6zDZ
	ZbZDktwMsKIc7tnPaKH3BjXLq0FN9M3MKb/PmOqA9suwtcqMe7h5OHSpLX9s8H6Qg6hQ
	OvORJAM2h2E/7AEe8eS4GRA/Fx/pNjdTObOgdQHIdGDLSOsjE4jKbB5KSjYqtEMQ2Vbw
	qdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HfQRhD8HfwoVZ2yQnkBVCzW4/CpdgyowV1a2WlmFvZ4=;
	b=L/SBYA8AX7x/DJxVuV+6sL9gD8SkIcgqCcHtatGu14YGfxi8O2LUsDjMwp9QdzMTvv
	eITI7mNBstBnCvFOce3TR5G4ZS4l1BtJDfc4NxHhL9GQ5LlMCZLO0aQWEF5bdrqusAfI
	d2k27Br8C2CTTIC+f4KgU09SuwW8NRNZRMy5CXswOLqj7pZG8Nhr8IObtal+MNMf2Bzz
	Mo2nF6xxcnzMsqYSeO9+khZCZ4o5KI6+YnocXYtAXe3QxjlTsGQattvyd3WPyR5aNrft
	mTYNmjhxXRSpB3fgvRuQ6zxZY439Xio2KRtbF6ZIC7ZLi0Ep4CCfw9gsAAVFjgRC6nUh
	sYxg==
X-Gm-Message-State: AODbwcBD0g44DSw/d/yv/YYzxOkAVOWigKAiW78thfRh0zPBeBuvAPay
	NhgOu7yQa2H6DohIf/LunfZtS6N+vPf0xII=
X-Received: by 10.129.40.144 with SMTP id o138mr16066050ywo.154.1496683529737; 
	Mon, 05 Jun 2017 10:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <CADnrctF66h_p+DnajWstF=Du-uXwNP_Rpe40ZpzR8RUMN_=Cxw@mail.gmail.com>
	<CAJTo0LbpoJCQiSQ4LPm46gkBGT0Ca-ZkuGHa+XRo0PtVq7c8rQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbpoJCQiSQ4LPm46gkBGT0Ca-ZkuGHa+XRo0PtVq7c8rQ@mail.gmail.com>
From: Adam Foltzer <acfoltzer@galois.com>
Date: Mon, 05 Jun 2017 17:25:19 +0000
Message-ID: <CADnrctGwtKS8HwfjnDUw8GJix53z+vmfiM9PE9Zo5ki8iPzHbw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Meson update and fix
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
X-List-Received-Date: Mon, 05 Jun 2017 17:25:29 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks; new patches are submitted. I think my confusion stemmed from the
following in the meta-oe README: "You are encouraged to fork the mirror on
github https://github.com/openembedded/meta-oe/ to share your patches, this
is preferred for patch sets consisting of more than one patch."

Regards,
Adam

On Mon, Jun 5, 2017 at 4:01 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 2 June 2017 at 21:34, Adam Foltzer <acfoltzer@galois.com> wrote:
>
>> These patches respectively fix some issues with the Meson bitbake class,
>> and update the devtool recipe to the latest version. These issues arose
>> when creating a new recipe for a C++ project that uses Meson, but the
>> additional linker flags should help with C recipes as well.
>>
>> The diffs are available here:
>>
>> https://github.com/openembedded/meta-openembedded/compare/master...acfoltzer:meson-updates
>>
>> Regards,
>> Adam
>>
>
> The patches need to be submitted to the list, using git-send-email ideally.
>
> Please split them up more, for example fixing the HOST/BUILD confusion is
> one commit, and the C++ flags another.
>
> Ross
>

