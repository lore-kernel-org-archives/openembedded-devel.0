Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (unknown [209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id CF8526FAD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 15:32:35 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so7214647ykr.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Wr0ozFwxv9aw5ZDxwqDUsdEn5mD+qM4l1HGtExfwWaU=;
	b=K6jDOi4CT6ZAfV1ogTZ75o+yzH0FXlcb1ZyxgYrheYEkN1be3ys2wQnfiUWF3fHkkz
	jA+Or9TkVqiaZfhkd6J3lIw6pzP8XOK02RNvRU6uId5LiLIXWIvXwu+S+Gd47bSR8LtP
	NIUygZrpTYSazPK6tubSBhRTwzkszhd9ju03umacqmZ3c93xVlxLYjPZSzLvTDNuNyoy
	lfZhr2fENGLD9cm3ltqvnFHiUsuiFKbxGuAqFKPxSNz1XD63Xvc/0XMw/9hatPaugrpz
	cO8kTuA/daXD5HXCL+oz4TjbXkSYAl+pVO/jFcTp0ZHIH5JkLelNJaoPFkcJpHq9jLs1
	DGYQ==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr47834398yhm.47.1401204756084; 
	Tue, 27 May 2014 08:32:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Tue, 27 May 2014 08:32:36 -0700 (PDT)
In-Reply-To: <CAK8F28=UYXL+YmzrCcWnYppsSNhUA3vJq92awZqvV=ihsL8bTA@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<20140527091813.GA2426@jama>
	<CAK8F28=UYXL+YmzrCcWnYppsSNhUA3vJq92awZqvV=ihsL8bTA@mail.gmail.com>
Date: Tue, 27 May 2014 12:32:36 -0300
X-Google-Sender-Auth: iTmp1IcHua8Ea1HodzHcc9lzkgM
Message-ID: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 15:32:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 12:15 PM, Ash Charles <ashcharles@gmail.com> wrote:
> On Tue, May 27, 2014 at 2:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> This will make version going backwards and we don't want that, you can
>> drop PR only when incrementing PV or PE.
> For sure.  I'l do this for v2.
>
> @Otavio: I tried modifying the variable as you suggested as well as a
> couple other ways in both the Makefile.in and Makefile.am.  Because
> autoreconf gets run in do_configure though, any changes either break
> the configuration step or get wiped out.  The source code explicitly
> mentions that the Makefile in the po subdirectory is not using
> automake, I'm stuck either copying the (100K) po subdir over to the
> build directory or resorting to automake-brokensep.  What is
> preferable for my updated patch?  I'm keen to un-break my build ;-).

You need to change the configure.am (or .in) and Makefile.am.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

