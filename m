Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3FEF6B074
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 16:59:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y16so7750664qki.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5nwGy1Oi7jaCS/Y+AWKSvhuCz8gq6sRbkX61y9fjR9c=;
	b=QsJz0z2mmU9H80Kufnvjxx5+ef1eEO6Ak7zK8oVCPRVA3CuoSdfsvwD9eyzR7n6zAh
	rhF4f7KoPEOIVK0WhB1VfhoWq/hZ9+k4EKSOuHwxVk6TurBk4oKVmddBvvxA5E5hE5qZ
	/yKPlcOEuEaxbil4JINqmzGZst3Vh/XXBqNsBV1OU+nLY8XelNmXSLN5wruHY5RL6tGq
	rna0GyMSZASH+cVWra9n/cl3mqXY7INVn7ib8kBLpBYlW8NSc31luwKB1gX+rdx0TBqh
	6K4HM1bHUPZBc3NG++ThTcG+J/haSOdxzkd/hbwJ++aCUsJTjcW2kMGEYm7QqkiSFzbW
	EzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5nwGy1Oi7jaCS/Y+AWKSvhuCz8gq6sRbkX61y9fjR9c=;
	b=DxFgnXspgiFLqcFMmcFbb+btXvUjoO0Ad+zxaArAljVcBKJnO82JsG0tjbp750+07g
	xUPdDQ7rPVV/pRFliapp1zCuMRxjR7JFMwChanYaeLTJlhMVkeXA4iCwDM64+63s5uzY
	jizY32Dar/q/ReaZUl41pLhxFWKISeU7zT9sOA3ELjCBcyRIeXPqaFo/Xx1/7GnlS4CO
	D1PcHjvoFyTgmJie87aYnukhNIYTxvrSEq+l9c8W+3i7miucYwkYzlMsGf74ELM3DLoI
	oEGol4f6E2eQHYnvytGmO83cNKFjjaaFUrmBdsuvGGUZQB1w2WcX7nPjMA6mYNspiKfl
	bVxg==
X-Gm-Message-State: AA+aEWacCGJSRt6vLfV4RWIUS7eHNF69pTAzLf0COjInjB7r7ow86t97
	BJXoktf6pjahNNvlEmm4uIdizCMBp0TJbKn61wY=
X-Google-Smtp-Source: AFSGD/VIgRmqqUw7+sMLg6yDV91wJE4YeTgnxXn84y0y4ZJIAyXwX5SLewIZ1vBZle9iEYkTnihmm+e6TTP9NDX/tJ4=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr16129544qke.2.1543856392578; 
	Mon, 03 Dec 2018 08:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
	<6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
	<CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
	<CANNYZj_3o662t1+4+1Xk7pSU2nnK16ZadDZkwr=aSeE974w3=w@mail.gmail.com>
	<CAMKF1sq+iGKKHvHnNOeeM001+ATb2stsrwLwJoRdzo1o1Ed7tQ@mail.gmail.com>
	<CANNYZj8YGUxi6-UzdkcNVY+3xFga+QhmqR5YrcSTfoVi_gvUpA@mail.gmail.com>
In-Reply-To: <CANNYZj8YGUxi6-UzdkcNVY+3xFga+QhmqR5YrcSTfoVi_gvUpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 08:59:26 -0800
Message-ID: <CAMKF1sppoQ2QjDOwV2wnTxcyzjVjHhM5X_EtA6sO0vMfDp5tmA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Mon, 03 Dec 2018 16:59:52 -0000
Content-Type: text/plain; charset="UTF-8"

No problem, thanks!

Taking
https://patchwork.openembedded.org/patch/156806/
https://patchwork.openembedded.org/patch/156807/
On Mon, Dec 3, 2018 at 2:48 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 2 Dec 2018 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
>
> > > However, maybe renaming the ptest group will work. Let me try that.
> > >
> >
> > while you are at it, send all the four patches in a single series,
> > current version seems to have conflicts.
>
> Sorry for the confusion - drop the first two patches, and take the
> last two only.
>
> Alex

