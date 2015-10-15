Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B3235770F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:34:27 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so14149981igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MpiZ++twZeK1+IrDCIQDBFwQREXgoAs6siZbdaqI/9g=;
	b=Q+TYS4cZv786a8F2+2PTIR+dyldfjn09q1dIVYmL4LY28QtU6HZhGfI9mDU50pGoJb
	6se6bd4uqao9pwKpN5PM3jc4tDkBB7QB/xPaD8KUOyaNiCzaDTxnSfh2TA9vnpoAgZdD
	cBl6iYYtcWWE+2pOlKkSzwfGpe9xE8BMXPIrWyFgXun05Ggo0M9y+/uoaiIZBp+fEEsS
	tXzUtHB4gBKIcLtJarrlCAeanAGfkp8DtUDw5fEG4bYH2/VsBmceFD3jWvTA8IbMCh3x
	+Vfcmr9BTYAQoBzssFnR8uNHx2RyspR+4yPzT5tdiX2QMOMY2Op6stTMLV3+Zwb+EFYc
	+F3w==
X-Gm-Message-State: ALoCoQkjJ+/5HR4JGwZ0oB4usx3WJnmYXgX21BDVC0rOekTl8ZO9aK+95PSEvtglLkV/8FbQ9QMk
X-Received: by 10.50.111.226 with SMTP id il2mr19365607igb.61.1444916067546;
	Thu, 15 Oct 2015 06:34:27 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180]) by smtp.gmail.com with ESMTPSA id
	i26sm5676682iod.27.2015.10.15.06.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 06:34:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so14149124igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:34:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.2.67 with SMTP id 3mr10185546igs.19.1444916065401; Thu,
	15 Oct 2015 06:34:25 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 15 Oct 2015 06:34:25 -0700 (PDT)
In-Reply-To: <0736624E-A78B-47B2-BABB-18D5839FA698@gmail.com>
References: <0736624E-A78B-47B2-BABB-18D5839FA698@gmail.com>
Date: Thu, 15 Oct 2015 10:34:25 -0300
Message-ID: <CAP9ODKo53YRzTcVSqpmQpVKLR0+6Ew9vywh4VJ3GJn7ybLS4eg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java][PATCH 1/6] cacao-initial-native: fix rebuild with uncleaned workdir breaks accidently
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
X-List-Received-Date: Thu, 15 Oct 2015 13:34:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 8:51 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> When cacao-initial-native is rebuilt because of changed dependency, executable
> name in wrapper script is accidently changed twice into "cacao-initial-inital".
> This is prevented now.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

A patch fixing this very same issue has been applied in meta-java;
please drop this one for next patchset revision.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

