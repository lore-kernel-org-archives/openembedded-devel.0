Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 60FF46E623
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Feb 2015 11:56:19 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id n8so33456991qaq.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Feb 2015 03:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SZFtaCjSHmx9S2uvbwtKHN961/KCdg8F45+yVDxq9LU=;
	b=FIxSfJsr180Di/TNzo67zGAAuYFSBkJ5Rk56LcUUzZsPa7v13dbBvAL18jvqIQEL5T
	bYSZJD8N6xGmnmHqMIgy2sTIT4cccT7YrmAfTJhO9m48dsOZFIjVmrvvZpGNqYerDkF6
	fiMWVItmtv0wNQonoJpPBHOJOYGGcQAfXzyvqjuVyD+jmXxXkNrjBd7kEwzHYzmuHwIK
	Zcw825lZ1TuLakGeyVFIBvbEAapQCdkmoADTRNidayf6gVBpWwVwSm1krRApPbOKIcaW
	sWwBnKlMfNDyYPo/yEf029UXyuwUQDZ8vV/VyukGdeN+Hmjwk3hlRgMSgsbcILghAXWC
	BuzQ==
X-Gm-Message-State: ALoCoQleEQeaeFGKMLY6yNQ6y68OcHPBb9BmM7BonySq9m9gTO8uJcm6/w3jcqUw09b9fVNQryxN
X-Received: by 10.229.51.201 with SMTP id e9mr8519936qcg.4.1422964575894; Tue,
	03 Feb 2015 03:56:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 03:55:55 -0800 (PST)
In-Reply-To: <CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 11:55:55 +0000
Message-ID: <CAJTo0LZJwGxPLa5eLB8dymDqBYtFZkVdyknU7wtbj014dWoO9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Tue, 03 Feb 2015 11:56:23 -0000
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 05:03, Khem Raj <raj.khem@gmail.com> wrote:

> I think this issue was there even with older version of glibc for i7
> but it was flagged as a warning, glibc 2.21 now uses -Werror by
> default. Can you confirm that via inspecting 2.20 glibc build logs for
> this machine ?
>

dl-caller.c:1:0: warning: SSE instruction set disabled, using 387
arithmetics
 /* Check whether caller comes from the right place.
 ^
../sysdeps/unix/sysv/linux/dl-execstack.c:1:0: warning: SSE instruction set
disabled, using 387 arithmetics
 /* Stack executability handling for GNU dynamic linker.  Linux version.
 ^

You're right.  I'll test the new branch shortly.

Ross

