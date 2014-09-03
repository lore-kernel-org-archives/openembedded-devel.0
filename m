Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB55713BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:26:16 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so5387126yho.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=1xVE434RqZFqoZjNLnYxSzEnuS7sgGTnrxl+DnpOncI=;
	b=raWbiKp87gu7MoLRhlWzKMBrXTA5Sx5cWSZP+WJTV+OCFdAJ5/oK1FYB1Sw69CHSAv
	bCtzvnXFAmzSgmDl17FT2BuBlZqdtdU804/Qu90XMM4kUdmBUXPvA8JiBTjlJuv/JEs5
	/B9Ml9uP/aA8L3zdxMlz8+yZGpXgdO0F6LDxNuaMM244ye/9aifiSYYWeV7IPExIzHxc
	cuKKyN+MQcTrsmKCapMYSDOM8f5y55dtCPExh65NDNLKQeDce3yboRX//a0WWbiqpeud
	1t1zZ2aPTrpxl5zK/jDOX0UIja6LQnKSwgQNS8mPuNXfdfFEFp7qQ1lFuZFV/hCN+zPr
	JPDA==
MIME-Version: 1.0
X-Received: by 10.236.207.73 with SMTP id m49mr15741263yho.90.1409757977960;
	Wed, 03 Sep 2014 08:26:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 3 Sep 2014 08:26:17 -0700 (PDT)
In-Reply-To: <1409647021-15057-1-git-send-email-dv@pseudoterminal.org>
References: <1409647021-15057-1-git-send-email-dv@pseudoterminal.org>
Date: Wed, 3 Sep 2014 12:26:17 -0300
X-Google-Sender-Auth: puIGnr1RFwjntOVrjA-O5UxBL5U
Message-ID: <CAP9ODKq=FQO26_OLKZCK_vxqLO_8r1Vexbb76XB9g55NZdChRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] Disable fatal linker warnings related to SQLite
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
X-List-Received-Date: Wed, 03 Sep 2014 15:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 2, 2014 at 5:37 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> With the gold linker, problems with hidden sqlite3 symbols occur. Example:
>
>   warning: hidden symbol 'sqlite3_temp_directory' in obj/third_party/sqlite/libsqlite3.a
>   (obj/third_party/sqlite/amalgamation/sqlite.sqlite3.o) is referenced by DSO
>   /mnt/ramdisk/yocto/qemu-test-build/tmp//sysroots/qemux86/usr/lib/../lib/libsoftokn3.so
>
> The problem is known, and a solution would be to set the build scripts
> to not build sqlite3 and use the system's sqlite3 library instead.
> However, currently, this is not possible:
>
>   https://code.google.com/p/chromium/issues/detail?id=22208
>
> The Crosswalk project fixed this by setting the warnings to non-fatal:
>
>   https://github.com/crosswalk-project/crosswalk/commit/83d22586852a3d64300fd024e24ade9a4ac325be
>
> The disable_fatal_linker_warnings GYP flag used in that commit is already
> part of Chromium 37. It just needs to be enabled. This commit does
> precisely that.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

