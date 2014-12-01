Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 49EB572051
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:25:48 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so4809616ykt.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=DO2XlVMLN/nz5M5zkwf32QPjwUUwDLg3sYukqzCvSEU=;
	b=Ez1wLm/HL04pNy9fA5XNZBCyes/6B7Or4AJIYbEqi1vY3PbtAYsEN9BGPZylZXZbuU
	NNzPwRSuAR2+tTlM9nFNSQmlaXb5UkYtOSEhI/WjDYS3774atZQbnSqMTkccgspzIDlx
	nh9Kf/hY/Ffr1ZIsojfRyIle2js4PcjpMG3VyiZvQteCrR1t87Bdyfiiiq3QBK2XEBTe
	zp4sJ0n4O6YGzhJgYPJBTWa1DvDN1qT8E1iworYeNk+bYESMUFyeYUy3yOuj99OMatWX
	bt8r34qIMtZVIQ/jPYGkYS/PGg1vZ/InWYIfyKbcy93b4+EgRHqRx2jjKsZRL7pX/upl
	0LOg==
MIME-Version: 1.0
X-Received: by 10.170.83.198 with SMTP id z189mr67673338ykz.70.1417447549499; 
	Mon, 01 Dec 2014 07:25:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 07:25:49 -0800 (PST)
In-Reply-To: <1417436579-26311-1-git-send-email-Martin.Jansa@gmail.com>
References: <1417436579-26311-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 1 Dec 2014 13:25:49 -0200
X-Google-Sender-Auth: 0Vt4iy2tUm_8GdJYrSPyYn9GEHk
Message-ID: <CAP9ODKrLBUYE3YJM9d4aBa2Jx_WiWvGu5hoDYKNcQttUxQ=UFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy][PATCH] gdal: fix sqlite, expat and libtiff detection
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
X-List-Received-Date: Mon, 01 Dec 2014 15:25:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 10:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * fixes following configure errors like:
>   checking for SQLite3 library >= 3.0.0... yes
>   cat: /OE/sysroots/qemux86/usr/lib/include/sqlite3.h: No such file or directory
>   /OE/work/i586-starfish-linux/gdal/1.10.1-r0/gdal-1.10.1/configure:
>   line 25411: test: !=: unary operator expected
>   configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h
>   header to retrieve SQLite version!
> * and autodetected expat support which sometimes tries to use host
>   version from /usr/include
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

