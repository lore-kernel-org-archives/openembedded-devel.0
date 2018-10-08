Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3368278890
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 02:44:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e22-v6so12473154qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MLrpkEUJE+hHR+accFNARhK+rc4M0DZrTdgDZwcUhZE=;
	b=k40HhAkVxFQTq/47A/it8X/XKbjwIP65RFdVckykuNXO5TKAwSFB0M8rLIj/pPYJtv
	Ko53VJaFxzq+CrSODRWRNo8r2sn0Smi3fZnPQ4CTQ2H9Q5RfvdGOXMLVIuSR9LnLRg5J
	cBon6gIwTE+UleQs6le84mFuflNkBBeRjq1Hvagt9fUcf/tCM8mcWSEq7siiywe2Hrsa
	w5dgxk5xew3CWdumZSl4ttQLf1sbkiJEYc6NKI0W2VYQf4N0RWutQ4fjIFlyDkFXQrV1
	3F++aAgi14ObzooMAGo1gCLG66EAtSAgqez6VfB2v7OVZPlVauO/wltkJfglekKV/7ar
	0orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MLrpkEUJE+hHR+accFNARhK+rc4M0DZrTdgDZwcUhZE=;
	b=bxX3GN2KrFMnn0eIIRD848gScjtiVZykgB3qgennhYmt2T7gXOVaYuSjTAXEW09ms2
	RxuTYhTCLC57vZb6XLKioxz8qH92i9Aa0PayVe4zH6A6FLhwL+xBCcUhP2MAza254iNn
	6X6W1TmGqHYhDJH8jlsaZ9MOpp4eQmwWU5FZFpImDxN2HHXOC/cc4p6ILLUTI9085XJf
	zVOVj0ammKbMIwVQaDZKHuAFjuQxp5QB7cSn9jaouv8aT3CnC9hMnKsvilHaKVN17uh3
	+ssUpGQPx5z3gYiBwY5aR6bL3weA6A3z0o09gdQhDa/5/4rcFmDDFSatUang1eDXRBMw
	F55g==
X-Gm-Message-State: ABuFfojKDAITcL0evMB2GCADxZ7lB3coSufcHwxCz5ttL44yxFVaZ6mp
	Wq91vXzZxPCOj3iUzt0PnJdewDKu9rXdCg8MSPg=
X-Google-Smtp-Source: ACcGV62i7RKhdh31ysUAHPW+QxMatjIUIutmOimujdwDkQ7qZdRV9DMgUiJoxcNboRSokjG3snCmpCAtIQ72i1HWkZA=
X-Received: by 2002:a0c:9c42:: with SMTP id
	w2-v6mr17610723qve.194.1538966686974; 
	Sun, 07 Oct 2018 19:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181008021256.23106-1-hongxu.jia@windriver.com>
In-Reply-To: <20181008021256.23106-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Oct 2018 19:44:20 -0700
Message-ID: <CAMKF1sp=5xtm35NK5OyxU27=eggnKEGbfumYuyxM4DuNH63H3Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 02:44:46 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: umip-1.0-r0 do_fetch: Fetcher failure for URL:
'file://add-dependency-to-support-parallel-compilation.patch'. Unable
to fetch URL from any source.
On Sun, Oct 7, 2018 at 7:13 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since `36983fe umip: move to meta-networking' applied,
> it was moved to invalid location.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb (100%)
>
> diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
> similarity index 100%
> rename from meta-networking/recipes-connectivity/umip_1.0.bb
> rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
> --
> 2.10.2
>

