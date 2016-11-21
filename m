Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wj0-f173.google.com (mail-wj0-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 09D7A71A4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 06:56:13 +0000 (UTC)
Received: by mail-wj0-f173.google.com with SMTP id qp4so22807642wjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2016 22:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cvbkxNiBLp/+gKQBpexfZbODiQKdgMbdMyWs5UVI/HU=;
	b=eXUDI4CrXZc+3BtRVdNHV1iar4+GQUgrqvKFwHWpFGnJ5xybLU7HetbyZMtWQc+dDE
	yCAlUgpk+UccNn/3S7YAjsiragmZlxQbzScWxcHMbwiY+iUccDedB9hfzXHkbrCGiR5c
	lxqRZp0XfnXRzdWa288wzUBFzJCqC0u40WEk3hmA3ih5FWpDO1tD2Q+RdgE8z6w7p+Yt
	oSIPwvs+7H2J49dmhPG0GoXd/pFBhH2IG/DobWKBN36DKKdTTxpblT17/VM7W7uZpAqc
	6hSgPSaviylcWADcv1HYBOVgUZJqJEiR8dBu/c+2QHx1GNiZzyktonMg++iikIzI1RIM
	Ebkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cvbkxNiBLp/+gKQBpexfZbODiQKdgMbdMyWs5UVI/HU=;
	b=RnCuqiNKqwfFaS2ESl+W8jXnrSclFlXLipsDKwBV9DJxESfoybHoKFb1q4SdNd9WPH
	3T8CUxXesmZLWq7rRdFDc9mHuHvBDyzGZS+CNDgeEKpITcsElZcA+llsmSm/ZCMcBVRp
	AGZ4rmqcKJdAHsRQbnMgtA5dMqFC8bNtIsFAEZiV+2So/Nno3hAaUiK6drRR+pDE6S08
	MjQNA6cFbtyBTN4h+SXrcS1o8hSV9iDB0JK/BK4aDalo4TIU0yUWLx/b/oKPkhGdMg+p
	4MJeImJj3k/Zrx0h2Gkw4oYWIJKMmm6f0vTJIld0wsreLFqrIy+2nDPPV3k7csJ9ftxf
	7Cuw==
X-Gm-Message-State: AKaTC03/DlnIOjCBGMuT3l1TN7jxTZoMUkzHPxCfT7afl0588ys42lp604mUfTM3DEfkVQBJFc+AEPF01j6xLA==
X-Received: by 10.194.148.4 with SMTP id to4mr8010019wjb.194.1479711374483;
	Sun, 20 Nov 2016 22:56:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Sun, 20 Nov 2016 22:55:53 -0800 (PST)
In-Reply-To: <CAMKF1sopAdkOqhWEDmEcB8zQNHM+sD9fb4GUQ5OYk5LmV-TK7g@mail.gmail.com>
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
	<9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
	<696ebdcf-d08d-72cd-7ee8-50b2c11e63d8@windriver.com>
	<2870220.C6Do4WeeW0@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sopAdkOqhWEDmEcB8zQNHM+sD9fb4GUQ5OYk5LmV-TK7g@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 21 Nov 2016 07:55:53 +0100
Message-ID: <CAD4b0_+Kab6MhiUtpqoqyOhuMkHpc842Wasg4ya7MxqEJHH6SQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1" for 3.1
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
X-List-Received-Date: Mon, 21 Nov 2016 06:56:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 21, 2016 at 12:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> There are abi issues that other apps which use ipencv might have not ported
> to version 3. Thats one concern we need to address
>

OpenCV 3.x has been out since June 2015. 1.5 years is enough time to complete a
port. 3.x has been a default since March 2016 in Arch. IIRC Debian has it in
experimental.

-- 
Maciej Borzecki
RnDity

