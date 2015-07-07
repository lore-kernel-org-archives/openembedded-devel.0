Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9651475CEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 15:18:02 +0000 (UTC)
Received: by igau2 with SMTP id u2so39213796iga.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=V6daxvMx478enZezcrWIC9R4ZXHmWcQSzgpL2dhWPqc=;
	b=s9KQZF7zgzjIuVBjEcoVmhXEl+2J0w+Yx3+C5TqAeOhM+eBIRuX+Q8yNVhzyHAkRPi
	+uMcZpJPIm5k9LhsrVyn9wVMCYnn5TgcPYfBjfhKObtEZNIho6L5iasWtMCYVDdamwU7
	YB2kaxtemoKy7APaxIsdrXM88W8AIJzQtDgiUv1RmwBHQh3ebFoMuAC4klx+ug7bOyeM
	ESYAyJIJBZhYpyEN+fSd1PgWAziBjhDoZHyxNBQ9Crh0ni/FIOiiT32+FUtFgU9+Y5D/
	eVQ99hDBYiQBFt+Pj64SwzV5TlFJjDaKdQhW18KN0Wv79tY4KxcJSABHDM9xR0u+VUTY
	j4qg==
MIME-Version: 1.0
X-Received: by 10.107.16.223 with SMTP id 92mr7573421ioq.14.1436282282398;
	Tue, 07 Jul 2015 08:18:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Tue, 7 Jul 2015 08:18:02 -0700 (PDT)
In-Reply-To: <20150624152730.GA22543@windriver.com>
References: <20150624152730.GA22543@windriver.com>
Date: Tue, 7 Jul 2015 12:18:02 -0300
X-Google-Sender-Auth: X__vylELAAXcUK4pNm0tii-1sIg
Message-ID: <CAP9ODKp8ztNVqy5y65cz-3kAojg94g_tOfvWg428w5wtQdu76g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] [PATCH] cacao-initial-native build issues on gcc 4.4
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
X-List-Received-Date: Tue, 07 Jul 2015 15:18:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 24, 2015 at 12:27 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From 460ba5f0f8d995e430608ae41eb6527da61bcb3e Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Tue, 23 Jun 2015 17:13:58 -0400
> Subject: [PATCH] cacao-initial-native build issues on gcc 4.4
>
> The following error is seen when cacao-initial is built with gcc 4.4:
>
>   LOG: [0x00007f595fed3700] We received a SIGSEGV and tried to handle it, but we were |
>   LOG: [0x00007f595fed3700] unable to find a Java method at: |
>   LOG: [0x00007f595fed3700] |
>   LOG: [0x00007f595fed3700] PC=0x0000000000459a37 |
>   LOG: [0x00007f595fed3700] |
>   LOG: [0x00007f595fed3700] Dumping the current stacktrace: |
>           at java.lang.String.<clinit>()V(String.java:185) |
>   LOG: [0x00007f595fed3700] Exiting... |
>   Aborted (core dumped)
>
> Adapting fix from the following (add -fno-strict-aliasing to CFLAGS):
>
>   2009-06-24 Andrew John Hughes <ahughes@redhat.com>
>
>   * patches/cacao/no-strict-aliasing.patch:
>   New patch to fix CACAO build on GCC 4.4 (see PR129).
>   * Makefile.am: Add new patch.
>   * HACKING: Update.
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>

There is no reason to have a GCC 4.4 fix in master; this should be
added to the customer layer.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

