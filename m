Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4D577811
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 20:20:47 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id e9so3194390pgs.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WKHaoi/Y8P4MkrvE3qVK2NKLkPTAJ4YHqqTVcd4rPS4=;
	b=UmR6Tfsyw5qcGghh6eehGq1HT3pT5ul12VSyddXC/lP8sBgA+mq1a0nIheB67n0zRg
	LMNMz5vyZcLxp6InkF1ZGndcAEzKKQIwp6FIEor9E8BS30lqmXw4ahuuTFaaEtkoXvQT
	G4f9lf/52Ma40yFZkGinBjDqPdoQfgS0Ulpn+qq+9Vc37NNWl0ASzd9j6Jt6sXMoGYyk
	Nb8q/5iZUVEhSkP/AcCyr1XUalxVUYfVEx5NV8NPbkUGiKNfu9kVS5116MtglyODBraK
	Vz6kg/sXJPzbaRDn1yRMXVoBxDnYACv/RtUFdCAcUl3ETNrUAQx3o73tfKueUVFPRAw4
	ZlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WKHaoi/Y8P4MkrvE3qVK2NKLkPTAJ4YHqqTVcd4rPS4=;
	b=mHapFBu/CQz3yKsHCSCAho9reTofkyDrfOKn8O1YliilOBDp3CmcO0HefrMC0x0jFL
	8N4iz8St8n5zPXg7LxBJ3LRTED5IXnO8GMdFQ7FZ3afKYo8PEouoSeqAyg2CI76rkDi1
	2pF626SsofD4vihxbtdGnAl6yzllWtEPxUZfjzjCYTtmYYXWq0iLziP+23ckNeZRydPx
	GjMGGG973PhEFAZGunjWJeVnqrH1nY5dWshy5n5ryvt3MmpMpOKeH0tcAH+FKioOoQBH
	e3pyI+kUgsNVE1+D3FUYAxT+gLBfv78bJblo25GxWe1NRmTVNvQ3bOwo20MnHdYFSARz
	aNVA==
X-Gm-Message-State: AElRT7HW5lLty+NEq0KAFen6ShmGDIRTVk/GiuZmRD1iFBSq6GVs/N3g
	LlcMJKZVopwQraSkkf3ro/I8umQhh6UpPEBIK1o=
X-Google-Smtp-Source: AG47ELufIA+pddKEr4/9vhmnPStGrMlrPhuybu2z8ZIF9gW3/H+RgFIM6KPRHvyZNAhIIwKbZrBo0Yjs1TsO1G+ltWo=
X-Received: by 10.99.170.73 with SMTP id x9mr7656196pgo.393.1521145249301;
	Thu, 15 Mar 2018 13:20:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.162.16 with HTTP; Thu, 15 Mar 2018 13:20:18 -0700 (PDT)
In-Reply-To: <p8aquq$s6r$1@blaine.gmane.org>
References: <1520960607-22392-1-git-send-email-akuster808@gmail.com>
	<p8aquq$s6r$1@blaine.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Mar 2018 13:20:18 -0700
Message-ID: <CAMKF1spKoX+RFPGEYhOk+O8qF9_qnm+9wPu616P0REmKQav-YQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: don't build for aarch64
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
X-List-Received-Date: Thu, 15 Mar 2018 20:20:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 14, 2018 at 2:47 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 13-03-18 om 18:03 schreef Armin Kuster:
>> this package depends on luajit which is not supported on aarch64
>
> FWIW, luajit upstream supports it, it just isn't in an official release. Both fedora and debian are now using a snapshot to get luajit working on aarch64.

I think I posted patches to use snapshot in the past and there were few
regressions it came up with, it might be time to revisit.

