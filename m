Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id B728F793E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 04:23:42 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id c29-v6so3882842lfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 21:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vce25bWbDgsVgyZNyPgL6yj7duOV2BoD4RHO/9uhnCI=;
	b=a2bVTeQ7ZvJY0/za6k9ue8yrMOp3u06swFMz0GPqhR7XB6yHFwLjLhro5o27V2DpXK
	WTrIOuDghNePn/HpgSN4gUa6sCLmJbLPmrHHAh7c0lAPOBOvLJKD9/G9F+Vv/C4kbi6I
	+he4ZSTlpdkgQclQtV9y/FCOGGhrlirMJknpcd9bGFUnDNwCPavUEoZb83r9BbXXwfGW
	55P6d0ZZZM553v1wbaaRVb/95wBJYEgl52CuqTIcGDkST6i/5pNbRmaNpHhLQMY5fKsd
	woyd/v3TqczU2Ip7aldU829NxeawQhYtThxcXSE9sUJVh8PKRRcqrGOIxUu18q5b6siI
	zAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vce25bWbDgsVgyZNyPgL6yj7duOV2BoD4RHO/9uhnCI=;
	b=EWTOSXYlueLwU6MEyYxmustYotIDAt/WhL+MdomQRBuqi6VakmTEZQQCfKQXH70dzg
	/fXcLy3oJ6pJI0gWyX2fDY6RH2qm+huG9WdIGrHWvAczI7TfDw2NqHmguqxkbEybz5b3
	w1kwHfhiKsRveKIWa0vLICyhTa57fpqE9UCmYQU13WlyKAzHYueZbxbOPn7pS4013WCW
	2EBWAibyd4vUtez/4zjR0ncLOr5p25ZldPnGUNFvG/nDcl61Br+ZprFzd8da0ey91dBF
	Mfo8u81gw/4n+C6izXNvIDiNFiaXjIhWH1sPlMfPexoiLcrwtv7U+Lqbw7Ow/YIigm/p
	+H2w==
X-Gm-Message-State: APzg51B9NORwiUiYGhZjCOal4I0CUhwvpbEckQ1APyoLwMbQxBjRGVkN
	G57P/vsB7yuz1saQwSKBMg5qp8f1UFWOh1zKTX8=
X-Google-Smtp-Source: ANB0VdaBeV9yKTAm/XuC+0spIcmW4ji1kQxtnmfRqiF7JnmESvhNsN2nfoA+qscp1Y22iQiRObTB90eAFwtCmODD2Hk=
X-Received: by 2002:a19:1b14:: with SMTP id
	b20-v6mr7663715lfb.12.1537331023229; 
	Tue, 18 Sep 2018 21:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:6b14:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 21:23:42
	-0700 (PDT)
In-Reply-To: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
References: <1530121431-7102-1-git-send-email-daniel.diaz@linaro.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 19 Sep 2018 00:23:42 -0400
Message-ID: <CAHUNapSw15o5NeYXieviKstPeynfaPaGsF+pCUuZP3GXE68mCw@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] bpftool: add new recipe
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
X-List-Received-Date: Wed, 19 Sep 2018 04:23:43 -0000
Content-Type: text/plain; charset="UTF-8"

This recipe only works for kernels > 4.14-ish.
Some BSP layers aren't there yet (e.g. meta-qcom, meta-raspberrypi)
Is there an elegant way to handle this situation?

