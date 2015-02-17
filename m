Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id E48B772B6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 12:57:51 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 131so15857199ykp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 04:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CGPVCtoM3mGQ8LQiv8BeV1URzfIdKYBFmTAcZmK94o8=;
	b=ySEiteKN3BO7zoCsahSijZpVJhWAkVKVpCapEfRswokUoLiTXuAqPTZtOMcK+6YNzD
	P7qdEOredg86ZPp6l2/Fyhk3UK8Mkl8wAlcDTBDj9PcHhgl7OUovKXMCLI1uKZCW9PFl
	ewHQm+3/n+tF3gu2yWMxt5OuuhEFwNTyDPw5weAr8DJB8Rwnqz4Itxyv7s6kwxOkgHdJ
	RgZS/3jylyCAG8gqYUN5lhKOHpj94crLvxolB+uDQP/Q+J/rl8dFL4SLJtYydd22M0JK
	0vkDN6n1PHvPwDVwDKhpXBq5xhMrAtLyhI0TtP2xcHXxWDOJRD13N1rU0//DUXO85b9p
	p8hg==
MIME-Version: 1.0
X-Received: by 10.170.219.9 with SMTP id l9mr547593ykf.105.1424177872874; Tue,
	17 Feb 2015 04:57:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Tue, 17 Feb 2015 04:57:52 -0800 (PST)
In-Reply-To: <1424125658-20285-2-git-send-email-max.oss.09@gmail.com>
References: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
	<1424125658-20285-2-git-send-email-max.oss.09@gmail.com>
Date: Tue, 17 Feb 2015 10:57:52 -0200
X-Google-Sender-Auth: UyX7FGRP43NKrX-BZUbwAXUJacI
Message-ID: <CAP9ODKq6QKYojHUiO96s9Kpi4-c4qD1UtnLKi88D0MkbitKE=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [OE-core][RFC] openjdk-7: enable xawt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 12:57:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 16, 2015 at 8:27 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> The build of xawt has been disabled as its build seemed to fail during a qemu
> call to generate a file with information on variable sizes.
>
> qemu is now called with the relevant path into sysroot and thus works.
>
> This patch enables xawt again.
>
> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>

I am fine with this change the only remark I may have is force X11
dependency. Would be easy to put this in a PACKAGECONFIG?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

