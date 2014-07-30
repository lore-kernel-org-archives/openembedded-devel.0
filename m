Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A432609BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:00:37 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so7711310igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qhPEvgtpCSC8SQR30ALRbRuB0uO+A5WXXYKMQBUGm0U=;
	b=y1EifbN8j55JwAxZLTEl2GGQaWMBoOGQHB/2qB6qH4V6FCEFWIM5MpUHuuBmzIx4Ru
	lZSNS/mwFriI92+ORnTRPZNnxMHUgIU+TceXMKfHK9KdLARY7vGC9sUGVZeKtMULDRxK
	/5zlEVK6m9WSaf5c+S+esUwaCGJnhdVooqtQ1kVa8lR47vQ4+ix4bNZNp20gQregJBQW
	TwVqIQ/XIQ85BD/eRlEscfPtcBvTR2vINy6fgyxb3ywp2TV4MPLLLN+XpKSSJEXLNONt
	6iAgAvQNmAjH4unWtKWMIi/fMpgOYys+ip2xOJyojOb95QlEiS7fPpuTCrmQypKs8x+a
	OgtA==
X-Received: by 10.50.134.136 with SMTP id pk8mr56601141igb.20.1406739638644;
	Wed, 30 Jul 2014 10:00:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 10:00:08 -0700 (PDT)
In-Reply-To: <CAK18fxEwnZdq5nObukmqOCahN6p7JcLRbctDzS2-tJjqALMDCw@mail.gmail.com>
References: <CAK18fxEwnZdq5nObukmqOCahN6p7JcLRbctDzS2-tJjqALMDCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 10:00:08 -0700
Message-ID: <CAMKF1sq3ravDmn6dKzJXhNSEz8aZ6E7iROnW7tL1t7m4u9Eqzg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] Issues while building gpsd
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
X-List-Received-Date: Wed, 30 Jul 2014 17:00:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 5:56 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> | //usr/lib/libpthread.so.0: undefined reference to `__uname@GLIBC_PRIVATE'
> | //usr/lib/libpthread.so.0: undefined reference to
> `__getrlimit@GLIBC_PRIVATE'
> | collect2: error: ld returned 1 exit status
> | //usr/lib/libpthread.so.0: undefined reference to `__uname@GLIBC_PRIVATE'
> | //usr/lib/libpthread.so.0: undefined reference to
> `__getrlimit@GLIBC_PRIVATE'
> | collect2: error: ld returned 1 exit status

well gpsd's own build system seems to be not so cross compile
friendly. Figure out why it decided to poke
at your host thread library instead of one from target sysroot

