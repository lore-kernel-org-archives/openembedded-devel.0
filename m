Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D654D7EE93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:28:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7tw60BNz56;
	Sun, 21 Jul 2019 17:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563722937;
	bh=up38V93qnlvhR174m+vGq5xG6pJhtrx5U1VTOhhAfCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oImRFH2nt8hzglOR0Bo+At8Iv7RgOtXz47+WzniwZ+Il52ep4LLk2CqZgJ1T1l9DB
	FJAdsCGcXB95xAx17F5iTRVWdt78Bac6CZEjOjnd0bfos4iNjtylX9y+4G9S+zz7Js
	8r2bN6PQQAgzVSS6vIzrp3J6YLnCsyqFABWU1PDonUK03CQ5jBjQvLHbLAmTTQlukl
	evhseCkF3j4CWm4cdwnq3+iTqk9Rsy+Vi7YPezM+M6s65uP8xLoOMgykRYe2tdUu1V
	azIup2XZPOZEnjHzbrVyf5QmOlhLpfTyGjXqpRR8Z20yPNp3yLIZflX2ZaIYBKqedf
	sEV7ABI97sMrWeYMUJxAzdR/KlC2vg7+xt7h3GvpW+mkwi9DG3EA3r3gSMrE5ML21p
	LGmxzUfUtsG0eqfoKsoNAJKQdWnt7nXF5e59A3fodiUkiPQ/kbhzyDWqTtE47JsBmP
	NrN/UrjzvCPc78VRt92NGmV7YOo2gjN5VSlGNGA1G1YA9Q8ybod1MXKTOyrRnz19Aw
	JMxp5A2Gzv/a+nqFi66fBDXE/PYPyq0tOaWhUShK6/CkDHvBaWCRqDwfY6QUi4tuW0
	xQ0juD/HqgYE7sYXB8Dc3Nqb8g1MNPgDoiQB591PcNLnVZqd7Xv5C236Y9xbUe3q+m
	fps2gnl+MtQCqXiUgsrZdab0=
Date: Sun, 21 Jul 2019 18:28:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190721152855.GC5886@localhost>
References: <cover.1563719996.git.akuster808@gmail.com>
	<f18acea25953f5e0b2d5ebe5aa95c970c26f2ffc.1563719997.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f18acea25953f5e0b2d5ebe5aa95c970c26f2ffc.1563719997.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior] 3/8] ndctl: make MACHINE_ARCH and ignore from libblockdev
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
X-List-Received-Date: Sun, 21 Jul 2019 15:28:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In master the commit
  ndctl: Remove the unnecessary dependency on virtual/kernel
reverted this change and did the correct fix instead.

You could cherry-pick the part of that patch that applies to warrior 
instead of this patch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


