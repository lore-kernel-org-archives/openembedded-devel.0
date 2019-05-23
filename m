Return-Path: <angelovic.s@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF3357E32D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 22:10:07 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a95so2768861uaa.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 15:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2NRGFQ/yBCCxwk+uTjDNvyZ2OkXO/+dIrTZiE1ZEoTs=;
	b=eYxlQo9hn7pR9yQaJZVD3wsJpPq6QDOxhMdE33ieV3g7dIWkqKKWt8SfC+040KD5vt
	e3XvN5v0EFHnivjmf3ZJ+l2LRWHVImM+B0JJ3oxz1Y+aTCntLpAZy1UrQK9vpZMJBZSz
	voVwXm/qAu3zh9HPU2Mfn4LRukhuDEKn6eQ9fv+sLvS26a+dxrshpW1aAc4cUqfZPBaZ
	83PKdpTj3dI7XVknsBLLCTPeGd5ltPKaCWkw+bIp+hzVSpt3bQ1u+sdDkCrbQXA4Rhmp
	AfEJ2J0B95PydOxyb7yE/uEOPaLI+d50TXJiIKFm4v4Brj3y3lSTuuatk88MqZ4xpzzQ
	zkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2NRGFQ/yBCCxwk+uTjDNvyZ2OkXO/+dIrTZiE1ZEoTs=;
	b=RohMGMWsJZM1lRXy77kwanNz6SgmzR+0rc7g9Wf+J6/z8LLjDizW0ay7xtP6Cte4TU
	VnribFG6ZvokKSiw/x+LyYCT9jLZPmUaSC4GvTivL0YJaeYqT8X0M60hfZFbNrH1velb
	gznYBD0fszmcRmGcu3g6I83ldY0mTbocfRt8SWNC6wv0BUl9rC3N0MbUXiStxE3/tuYa
	JI0skvTj9KE9OcTPlIyOnBBC2GJfeqFjw1S4dej0WmzE/USZyXeLcqpVkIhkFXOF8ON8
	2yoiu/HQIgJR2YbaapXaRKyMgxgZGV+my6Lrg8jCmHGVEH6RMQa3sz/hYnwseroZO4X1
	WZXg==
X-Gm-Message-State: APjAAAUWkjNdHqdI+46ptbXJRZtSC+h/bpGeYKJ3BOnJrE5g9t9xylA/
	9+mjTK/or6EP3wBx8GzzH1Ei7xJA9Ra9LVkY9ed0+Cj/
X-Google-Smtp-Source: APXvYqzuyfK0+SdF6fYXUxc4bPhDOBgr3q7zsK6F1HHkp1OIPYlqWfpq/XW66wiCp/8/crenS/d++3t9o1PfGCtzPFg=
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr26226037ual.123.1558649408186;
	Thu, 23 May 2019 15:10:08 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Stanislav_Angelovi=C4=8D?= <angelovic.s@gmail.com>
Date: Fri, 24 May 2019 00:09:57 +0200
Message-ID: <CAA9bybO-v4iJ8YcSDQVtmoopRY5YOjvhERUcQWjYh=1Omd--mQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Adding recipes to former meta-openembedded releases
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
X-List-Received-Date: Thu, 23 May 2019 22:10:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm about to send a PR introducing a new recipe for sdbus-c++ library to
meta-openembedded master. I'd also like to support previous releases -
sumo, thud, warrior, where the recipe differs a little bit from current
master version. Is it possible to send PR back-porting to branches
representing those releases, or is the recommended practice to clone
open-embedded and provide the recipes there on my own?

Thank you, best regards,

Stanislav Angelovic.

