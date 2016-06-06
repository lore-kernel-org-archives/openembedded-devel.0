Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8FFF71951
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jun 2016 20:19:53 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id e4so78729037vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2016 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=PZYAmMtOsDM/EpY8MnRKFYLci1m1CvtyJ6tVHhzZqbw=;
	b=2T2d5aZz2nsqDw6VALJStGxpM2HtMkIJim+osMiUwxvU+q0aEdC2/Kms3/QFuLL5s3
	EhCcDehMJVBHk99Vwy2EVGwXrplapNB2QsppkUfFGM0WmVe+awosSGeDX0kQjdXslMgl
	oLVliunYp47V7/2mkKSWkuqBTXdGucNmKktwhMP+DvY5I4iFKaUpmxZdZdWJXCuX/Fdg
	1vuxSEcj1vpppiM7m+rAW2bWUfnY8LsO9FXrY+hyeZ94APFQPZzDzgM51w/GMDQYP7tn
	JjVitjvbLtrM/qO0/2R/xEGIbTUJXWgAI/K84RiTSzjUqVlYTot3dXQflPtjXGdZa6Z0
	itnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=PZYAmMtOsDM/EpY8MnRKFYLci1m1CvtyJ6tVHhzZqbw=;
	b=PX5CAdtnEJnLZECQEGsedTivwxCgZMhVJFYefAmvBgOJexna6H1h6WBI/N4XJ8GjQc
	mel2Nut1XgxFmMLNL5XbyfrkMxBnaO9OciesukqdacUgOP72Mn++NWzVihaY5l7ivGYL
	QARw+xBdmr3XMx5aYqnhxjl6kFeEXlFVEMVaZ0dwOn3oaFgqkKByBMZZpnDlOYUspCOq
	s0muJp0A16VFbAMvbaRRDpzYIe5wDIv25/GxJ8CvWhUKgzxI7U+o2AuPsTG3OFoTHN5f
	1t5Wa54f7zAf+xrMTfQMM3yO1u3ZzSizNI+50VRtJkXzF1g3ykP10wsPpJxhz1vkANRc
	Yh1w==
X-Gm-Message-State: ALyK8tKc32ixtWKRgj+wg6qwxohjp3qZYqPk2KdziC9gqBQCKPg0QyGlUOGHyfflufC82Q==
X-Received: by 10.31.50.137 with SMTP id y131mr7410716vky.60.1465244393407;
	Mon, 06 Jun 2016 13:19:53 -0700 (PDT)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com.
	[209.85.213.48]) by smtp.gmail.com with ESMTPSA id
	101sm3629831uan.24.2016.06.06.13.19.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jun 2016 13:19:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f48.google.com with SMTP id c66so61572626vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2016 13:19:52 -0700 (PDT)
X-Received: by 10.159.35.34 with SMTP id 31mr7601355uae.39.1465244391879; Mon,
	06 Jun 2016 13:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.129 with HTTP; Mon, 6 Jun 2016 13:19:51 -0700 (PDT)
Date: Mon, 6 Jun 2016 17:19:51 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoFrSmbEk48XwA-LoS+sEk6RBoAKe_-UUQh_9r+BN=R_w@mail.gmail.com>
Message-ID: <CAP9ODKoFrSmbEk48XwA-LoS+sEk6RBoAKe_-UUQh_9r+BN=R_w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [for-krogoth] Fix build error in some hosts
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
X-List-Received-Date: Mon, 06 Jun 2016 20:19:56 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

There are two fixes for rrdtool which are simple and improve the
stability of it on some hosts. Those are:

daf619e rrdtool: only unset PERLHOSTLIB in do_configure
be3d4c0 rrdtool: fix do_configure failure on some hosts

Could those be queued for stable?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

