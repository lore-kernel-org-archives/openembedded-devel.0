Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0D9C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 05:35:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.3965.1633066556264836883
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 22:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lHy/oogY;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 138so8091236qko.10
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 22:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=JgoYMWshZNTEM66wjPAFIz7xRVv87iCjEmn5f6/xt9U=;
        b=lHy/oogYaVFWVij4cBvC/RP4eDOMqVQluwjIQtxI243Wy5l9/7UtwC3FLY+45qyknU
         QrETzA5HXiYhDcZWs/wLAJlO40sdZ50nLjpRSdB0HHDupg0mb0R48vCWUJ0W3QzjAZnN
         cOKSfKLd6g5xIFO39hhxDE8v3SPl3Goy8PBwBj+3zrTw8JBXnqrdJONPIBQ77mYpPOLj
         yz2X51EplNt4I0D/We2kl+XU0BEpf+6WElB87r2I86OZ9IJmcTN0HRrjqNGy9vYVXeV7
         3SiY/yq0PreZvKGNJhfTThqr9qRPI+6eKx5N40boDBsuXUMmO/T6LQZ+0tv4NaifQIOp
         OSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JgoYMWshZNTEM66wjPAFIz7xRVv87iCjEmn5f6/xt9U=;
        b=Ykc0Cj7y1mFhKjL/aiJxQNlHW5PSDFYO5AYngsPk2iYlN0r/It1fTu6jHdH/DewOpW
         lnTOiES5EquPRJOHPSo6b8hQ9iaY5QnMyE1RDjzBG0k1AePa4etx0843ZKxQrhrSKzww
         eFPCX4PuojNUt83OnE21K5PaZpni230q7NZQfd6qLGRauBNUThxelwa2zThnNop6QNk1
         zGYpYtc09bHOVX8uUu4kNClGtjb4HHzLhzzXiyk1rprLB3FccpKbBYkCqIpMFAjSJN9r
         7+Jmi6LskPFfonwB7AW0/AFMXZxe2euVfQF902JAJGKnXO0+ICk8ZsYbrE72ovfKXX9R
         BeaA==
X-Gm-Message-State: AOAM530iUYlpWqbBQElocblki+hdJ9sGcH0ZQxZqD1glfXEu8/geMP3I
	NT1o9y1xh2wyrHVMg4DGHCGcqiNIgQ790OtKH/WYcsOYjik=
X-Google-Smtp-Source: 
 ABdhPJzjwPd7/FR3AsxeGNvZiwUHhNR/Npac13VuJKZdq38uqGgFtw39kFi3bsJ94CKLHEuUA/bdUfojZhBPhlTHqCs=
X-Received: by 2002:a37:618c:: with SMTP id
 v134mr8092456qkb.231.1633066555006;
 Thu, 30 Sep 2021 22:35:55 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Sep 2021 22:35:29 -0700
Message-ID: 
 <CAMKF1sqWQXyp+n6vR3cn9HjPgF+ubzYgi0=EoVNF+H3f5QUJoQ@mail.gmail.com>
Subject: Honister branch created for meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Oct 2021 05:35:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93184

Hello All,

honister branch for the upcoming 3.4 release has been created for
meta-openembedded layers
Armin has graciously offered to continue as stable maintainer for this
release as well.

Please test it in your honister based distro setup and report any
issues you might encounter
master branch continues to accept changes as usual

Thanks you
-Khem

