Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5AAB719DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:07:42 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id u25so49603635qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=LtLuEnCE4zNUnPzlcrJg92f0F3JmnxDWpltmHVYZ7yM=;
	b=i0p7oDMmMqsS/F9KT6Eb2yBXMaKSVZ665sDINlxTUIeobXRkrBwv3w+hnkLYhK1aKZ
	PGr8jN1zJ+SdEU+qIAAj1Mu/NJfGCn8GJZfQE1zFBtPvpFoJSepLDNqhPI+jYJchodJc
	6FOQcjiZRmwjloruPqKzwf66/QOaIHzBIm8FAS4MnDHUXeFifWS/wxuViTNxeoJdtHya
	o5KJ+H2SQsOcaonfGuXtd6PSyPB6CWnzaCp8usEMYNLALyf9bQbfAEFN2v1yrYj0K9Ud
	0TOM8tQLZFTQb2UJ6hxayutz6Ysvo6p1HlJdQKHlmeyM+cgHWLQeiAv7A9RBCKG/Y7+5
	Thiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LtLuEnCE4zNUnPzlcrJg92f0F3JmnxDWpltmHVYZ7yM=;
	b=XCPp4mFF9rBJDdunTrXDVnACO2cs/0WaPlvXwic1O9yS0W8pPMoEtJJfl6V4dBk/5u
	ZHSsECmhviewuIJooz1uASH0dTcRkRAnr8HLI9DHGSOvm++p0totm8aZQONCUzqRN6Dt
	WlfqKPdhZiuAlEG+pmLvLUYKKVEKdY5t7Fsi013Jhavz92J8OulNQUtJEhBfFfvZobxv
	E3h8wsL+alhsli9HjoJv8Ucm2ZOF2Xu7XXoXNYRjQkBZ4nlVlX1NyF3+CFZAvKz5EKoE
	GMbVWBTJYoDNmb/Llle+oXS36vbAGh2gvGpXqHgAcZ/vqNOeJci7AfDISHw/2k6luK0I
	FifQ==
X-Gm-Message-State: AMke39ma0QxqYpvV2DMuXiJJosk6Dn3h+EzLyTrcRALmjhCxU4fO621nCWUDY1QrKJfbqu4fDjgW+Ek0my0gKHzw
X-Received: by 10.55.3.18 with SMTP id 18mr7949582qkd.244.1487351262682; Fri,
	17 Feb 2017 09:07:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 09:07:22 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 17:07:22 +0000
Message-ID: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Splitting meta-oe?
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
X-List-Received-Date: Fri, 17 Feb 2017 17:07:43 -0000
Content-Type: text/plain; charset=UTF-8

The recent storm of breakage in meta-oe caused by recipe specific sysroots
was quite dramatic:

ross@flashheart ~/Yocto/meta-oe ((044e518...))
$ git grep PNBLACKLIST| wc -l
320

Is it time to talk about splitting meta-oe into smaller real repositories
so they can be maintained at their own pace by more maintainers?

Ross

