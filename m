Return-Path: <bkauler@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id D381C7822C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:30 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id r67so6270080ota.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=J4VA1l7VjgwRmrpf0WWG8xEaTDndb1BYoLjC+NOAp3E=;
	b=eR/jaM9l21zZoKpTo5gwD+2Xjx5Yi5J14nk+sWfI+iV0aAoYAnjucxxKr50ACGoKxK
	nsKi6fsXfYH4bkN6YBamL+URFC8FGh49Z3FejKn6zYNcaGB+qU9XJrpheMrKpcMcuRqC
	fl/eReD7qJTmY+uHB1AD9o+KCvMVkrhfi3ShBvvtSGTFMk1HnyqH+mcqXKm5a/i+Lth9
	UoDj4KbCh6igyf67M7ycLkZlzTTgIAvWvsHJn/U4jibekQB+dLhyRouZ9vWeH3qgglju
	p6q+a1zi0foPD1aNXBRXabdYbCsIE/hBu+Ux3LqNGSxKXzuM57LfO/WVOjRP773OA0nt
	adkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=J4VA1l7VjgwRmrpf0WWG8xEaTDndb1BYoLjC+NOAp3E=;
	b=roK8pWvAhictYFaMJcsQt9j/hdJM6LMg/g2sz607NBsUOALYpRf8dNA7SdeERvFjw/
	DGqYEMPftWOcTyGR/UaDHA2jiLqh9ZZQgvo6WLflVDeO6ZIFiylrYVf/1A4Ye86ofIuN
	ukHYW7DoXY5ez8mNibw4Z5OCYjIKBW6GmjILlypKd/zJ9wYs5VBdYhRf3uSzrimR1ifS
	kUdXaWEeLQY1Jo2Jl2LiG83YRjmNEmzThlXTKWnvSQYooA2jfAqdlkcTRryKfYxz+psJ
	rk6LMIjAw26B/j+7gXmYTCWIobS2l8PUaRqgUgF2iIGgagjwgKB91nXthGHhP84r85IG
	ziJA==
X-Gm-Message-State: AKS2vOyQqZhYYfNuGAk1g+qc5g35obtLmC75GKPMHrIJKLl1AQoaUV1a
	lTXFSqDzShuRPlDUvFBDlpY89xFSnilm
X-Received: by 10.157.31.42 with SMTP id x39mr5293772otd.173.1498260091488;
	Fri, 23 Jun 2017 16:21:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.208 with HTTP; Fri, 23 Jun 2017 16:21:31 -0700 (PDT)
From: Barry Kauler <bkauler@gmail.com>
Date: Sat, 24 Jun 2017 07:21:31 +0800
Message-ID: <CABWT5yggD4hoisCsXpYhP902YXhVCF1ZyU+0t9deaOQNJ1EKcA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: New meta-quirky layer, imports 140 packages to OE
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi guys,
I am new to OE, only been using it about two months. I undertook the
challenge of building the entire Puppy Linux and Quirky Linux distro
from source in OE.

I had to import approximately 140 packages, there are some failures.
Some of those I can probably revisit, as my ability with OE has been
slowly moving up the learning curve.

Thanks to the guys who created those layers that I was able to use,
such as meta-office and meta-browser -- so have libreoffice and
firefox in my build.

See my blog announcement:

http://barryk.org/news/?viewDetailed=00576

And it is all on github, with a nice readme:

https://github.com/bkauler/oe-qky-src

Due to the fact that I am still somewhere low on the OE learning
curve, if anyone notices anything dumb in my layer, let me know. Or
any improvements or fixes.

Regards,
Barry Kauler

