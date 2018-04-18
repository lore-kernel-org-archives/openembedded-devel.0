Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 00DD971CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 12:18:00 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id p2-v6so1642031otf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=n1pfsChhgNYu+MR2Wmgz6v7wn73Vf/bhnPg9tizZhPg=;
	b=qNe1WLLp/Hnim7W7QBYh7X6y6n1mIjNjhZoHexwiNj7Q7TrXDNHd9tpWCE2hRRgtx8
	BzTIRKDJW9APbOb0Bq847vhKeQ5vgoBL8RCHmKF40iTVGquiW4BpXfF5N0ZqEVJ2148i
	BUhCHxFnZVU8PhKvHYzvJ/YrCvR06y05veKAf1uW92Retz4fECyJ4dDJ4DYRJmh30Cnx
	tNupX3FY9HQ6xcGNoz7HC8pqaWj/Wa4meWQ4LscX2f5+sNLalAYgnjr+BFT7Fig1mdA0
	EJwrIVBN8X/1BN+70Y/kIWl08TGPartQbzAKAfozDqzxxd+YEv0wMBSRbC+RnILpBDZ5
	JBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=n1pfsChhgNYu+MR2Wmgz6v7wn73Vf/bhnPg9tizZhPg=;
	b=cO0VDymRQKkbmKZ/kgDnGn3jRz5SW491md8MgFeidqtipema/8bca58868MaMz/XI1
	j/lKmCtwog0YkIion07TFr6yHEbJQt3fMSipXxx/32bHC2lS7c0+Nz+bLv5qbbi7kzBc
	LPTwo8pVJ/U0H+YW0rhoO7tPz72U3exqlR2NhvV9SKT6PQ0s1s2YOnZmAnGgEoMLp5rM
	+4atx+utpSozkC2IDrM3GohQMqkKSaGVn9RIer6MGY6Ch1AEAKM648lmL9P1AWbgOB0W
	zl53cO+WQQk4qc87kqOHusLTwUdaGenn902YEKJ5fZcVJNjaielAScXA+HbFAGYu+zYB
	5hIQ==
X-Gm-Message-State: ALQs6tDQUtOjgNj9VdlTUTOepXaHCs3xnFuQxAeTg9rSHw2S1cPqkhoP
	2mwvDNOiVV/jUx6Qx5xzJ7qvd9wb
X-Google-Smtp-Source: AIpwx48FFshWt3pNfg50M3Sv0NXKeqWA0y8s4EGRFqI8FhEATrzHM59ce/6ix2omFeIDJOFWnMWTUQ==
X-Received: by 2002:a9d:cb9:: with SMTP id b54-v6mr993792otb.249.1524053881187;
	Wed, 18 Apr 2018 05:18:01 -0700 (PDT)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com.
	[74.125.82.174]) by smtp.gmail.com with ESMTPSA id
	f5-v6sm567076oti.69.2018.04.18.05.17.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 05:17:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f174.google.com with SMTP id p33-v6so1627071otp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 05:17:59 -0700 (PDT)
X-Received: by 2002:a9d:7150:: with SMTP id y16-v6mr978022otj.35.1524053879216;
	Wed, 18 Apr 2018 05:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2269:0:0:0:0:0 with HTTP; Wed, 18 Apr 2018 05:17:57
	-0700 (PDT)
In-Reply-To: <CA+chaQcOqEibGRtm+eSNmJJXcj+f88s89PHXTV9az9b35VW2Mw@mail.gmail.com>
References: <CA+chaQcOqEibGRtm+eSNmJJXcj+f88s89PHXTV9az9b35VW2Mw@mail.gmail.com>
Date: Wed, 18 Apr 2018 09:17:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpwvNPwkhwUj9S8-NRfz=05Tt=Rp3Mss71TZqmgP2ww+g@mail.gmail.com>
Message-ID: <CAP9ODKpwvNPwkhwUj9S8-NRfz=05Tt=Rp3Mss71TZqmgP2ww+g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Most meta-qt5 patches on ML marked as Not Applicable on patchwork
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
X-List-Received-Date: Wed, 18 Apr 2018 12:18:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 18, 2018 at 8:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Otavio: I think it's time we start using separate ML and gerrit for
> meta-qt5, do you still have the public gerrit instance somewhere we can use?
> I don't want to deal with patchwork anymore.

We do. It is at code.ossystems.com.br. I can easily add a group with a
specific set of access for it if you want.

I also like the idea of Gerrit for it. We have a clear view of pending
patches, feedback and like. For the ML, I think doing the review on
Gerrit reduces a lot the use of ML leaving it just for general
discussion so leaving it as is also works...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

