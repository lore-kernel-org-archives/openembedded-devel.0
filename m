Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id BC3AD65D9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:12:49 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 19so5441102ykq.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=boWHlrIFarX/y+nPxR7N+p+sDpsLgcc2PJ+RRQUYc/M=;
	b=KxptQOYJHJmcv8cmI0gZp2ZmlLnWs1osxjh/hbC1McOY2BZCnK4SKHijc5hpH6VL4+
	+jR40gEGshHHzAHHVKF1ymKGzhUBeDPthV2FP3Stxi5HkbumtcMLnzRRa8caLt7220LG
	asP66Ltf/MGKnOMc7J703nkdhOhtkZoDuW5iL1IuVYxsO1t0lCDEj6tacKWNsdP48fs0
	LQS1O0owV4oOY/1MucpOqI15q0uJwPAU33CtWFu+xMEf8QfKf86993sd+PmoctBcvrYi
	i/67oui/8sJhhJfBEmMIVz1z+yp3yi9tKO8oVg6VEp+KRixwcdEDtNFBa7YBHG4qrLIR
	9Bpw==
MIME-Version: 1.0
X-Received: by 10.236.228.161 with SMTP id f31mr39033272yhq.44.1407715970755; 
	Sun, 10 Aug 2014 17:12:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 10 Aug 2014 17:12:50 -0700 (PDT)
In-Reply-To: <1407620350-7644-2-git-send-email-Martin.Jansa@gmail.com>
References: <1407620350-7644-1-git-send-email-Martin.Jansa@gmail.com>
	<1407620350-7644-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 10 Aug 2014 21:12:50 -0300
X-Google-Sender-Auth: DFFnQXlpMZrLYyA2D_8kQ00phQ8
Message-ID: <CAP9ODKqvW9XkHB3e5f1WwjCvVgpdOMmU3WNNfW=H11CaWH3s=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium-35*: use BFD when building for x86-64
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
X-List-Received-Date: Mon, 11 Aug 2014 00:12:53 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 9, 2014 at 6:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * this doesn't fix it completely, but allows it a bit further and then
>   it fails in the same spot as when building for qemux86 (or 37* version
>   with gold)
>
>   sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
>     warning: hidden symbol 'sqlite3_temp_directory' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamation/sqlite.sqlite3.o)
>     is referenced by DSO
>     sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
>   sysroots/x86_64-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld.gold:
>     error: treating warnings as errors
>   collect2: error: ld returned 1 exit status
>
>   and few more symbols like this, libsoftokn3.so is provided by system
>   nss, using system sqlite3 has some issues too:
>   https://code.google.com/p/chromium/issues/detail?id=22208
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Are you going to work on this to fix it completely?

I think we ought to focus in 37 as 35 is "old" already.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

