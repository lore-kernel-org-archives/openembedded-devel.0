Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 939156093E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:27:57 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id z61so12789226wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8LFP55Zba91SH5n8xTD8RwRsC4dHppb0V1QBWcR8DVk=;
	b=JwUchi5WieJ3mB0ActW8zfBLGOdTSz+BKbdr3OCOYfTDvlrNBmCV0pTrATZXeZmyWW
	E/xuGBDkta5xeCaQlLqhr/HTkZ4mu+FAP+aJUbkv7MITUsrywU+TwIlJhrx3OptjuxnN
	AiZZMjiA9kH6lTgtRaOPKXvGPmt+yD52k7BAzX2+7jxkOc4vjQxHhVgwNmPND+Pq6K8B
	ncsz1jvlsCWmI4YYxeJ5Py+LeNgfrqzXzyCGpgxetFGgsl4pWta/97oLunZ6vBWi17yV
	zEAkc79seHhAh3f/tMxFlHUHnD2unUIESkHAhaHVUvqIHlOGKpL07kLobn/kvLG5aBxh
	s3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8LFP55Zba91SH5n8xTD8RwRsC4dHppb0V1QBWcR8DVk=;
	b=mx9Ztp5tbWNTCWg03Wz0ud7l2AgjYWrJVFJoUe8HzWkSDBF1IqZo3ktUl4SstelHpz
	g71+m5q6J7QowqqPYIhHJme7lBUgi2UQMry/w9Cb+8m+2sZVcfKXL/eZUY5h9ycQe/fw
	MnQMRv07GxwUk0Tw9bmqly2DoyuTCZc9AL0LTg01JfkOTuYeMvqL9FYTzq2PKkm3ka6r
	Z47bIW1/DBd9/QTthrfQkqlLy4hgHHlwELoUtHQxcvWLEGWRZiaesi6uG2pvgi2LsK4g
	uczdWViQY2ozbR+bF0QSQAhvuUFjQrEf7a/RIcZDoKklxOyHiV4Xonhia5EJ2CNF2Uc4
	Vo6A==
X-Gm-Message-State: AMke39mvOF1inuSFgD9PF89gyx9wbwwic+dh50IhnSTx7NMNpNestFcDZnmKpUMroj0KRff0Y0TkegzU33Ar1Q==
X-Received: by 10.223.150.34 with SMTP id b31mr2663949wra.196.1487255277980;
	Thu, 16 Feb 2017 06:27:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 16 Feb 2017 06:27:57 -0800 (PST)
In-Reply-To: <5a673173-1ee1-6d3d-dbc4-2f4011d04a47@exceet.de>
References: <5a673173-1ee1-6d3d-dbc4-2f4011d04a47@exceet.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Feb 2017 15:27:57 +0100
Message-ID: <CA+chaQd_O8+rQ10gRJqgXZt9zYdR7CowTKXD3trYPn-hXNZEhg@mail.gmail.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] wrong mkspec set for sdk in nativesdk-qtbase
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
X-List-Received-Date: Thu, 16 Feb 2017 14:27:58 -0000
Content-Type: text/plain; charset=UTF-8

> I don't know if this was on purpose or maybe by accident.

I don't use nativesdk-qtbase.

It was moved there to keep the source code shared as much as possible
between native/nativesdk/target builds and I wasn't aware of this issue it
causes.

Please send patch moving it back to only target qtbase.

On Thu, Feb 16, 2017 at 2:46 PM, Frieder Schrempf <
frieder.schrempf@exceet.de> wrote:

> Hi,
>
> I stumbled upon an issue with the Qt5 SDK in morty-branch.
> There's a patch 0008-configure-paths-for-target-qmake-properly.patch
> being applied to nativesdk-qtbase, that sets mkspec to linux-g++ while it
> should be linux-oe-g++.
>
> To solve the problem I removed the patch from SRC_URI in
> nativesdk-qtbase_git.bb.
>
> The issue (and the solution) is also described here:
> https://github.com/graugans/meta-udoo/issues/20#issuecomment-261241783
>
> and here:
> https://lists.yoctoproject.org/pipermail/yocto/2016-October/032407.html
>
> The patch was originally added for qtbase only, but later also for
> qtbase-native and nativesdk-qtbase (https://github.com/meta-qt5/m
> eta-qt5/commit/1a42aa78af040d0fbecc960e4f9dd3f180ccb404).
>
> I don't know if this was on purpose or maybe by accident.
>
> Regards
> Frieder
>

