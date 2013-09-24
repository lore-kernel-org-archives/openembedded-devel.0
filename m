Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id DC803610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:42:19 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id i7so2203836oag.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ltCWBT2IXx87k/dcfdw9TZebPmWb09sz1oQCn3kup5w=;
	b=MIQaDiI9CPn60rzyXM80SMfpFc45O5cD0qSUME9kBftT4u404s4Lp+hzeTkNVkStoQ
	h/bfUVF1DU3LcEtytEwDCjJoGRM9YsR1wZjuS5tuQKfcWaiHUr4Z/uAJCqHKwzT751Yh
	+0svuNPNphQp7DFZwIbMhYuD/EMy1etIppNImnNhoW0KgV/g237roy6jxvR0JbwMlCFS
	LEkKQb05bBS3vPxql3zDS1RtBP1CmY2Fg5z9UAzXeSOgRgG3j+uOZAsiMwq0Je5yCUeY
	HwYIYWQa/N8DK1TuvHCZOQpA06EFvbu+D1ZLEUh/Q+3yFfFISXuil7OYHG4bCVNmZI5G
	7plg==
MIME-Version: 1.0
X-Received: by 10.182.16.201 with SMTP id i9mr25831326obd.21.1380033741444;
	Tue, 24 Sep 2013 07:42:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 24 Sep 2013 07:42:21 -0700 (PDT)
In-Reply-To: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
Date: Tue, 24 Sep 2013 11:42:21 -0300
X-Google-Sender-Auth: 1NKSynheT_jbkdBzKWxYS3S3Kr0
Message-ID: <CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
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
X-List-Received-Date: Tue, 24 Sep 2013 14:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Recipe based on OE classic's recipe for version 4.4.1, as of
> 0585ccfa49f71a81652c7f63885202e952ebd0e9.
>
> Summary of changes against OE classic's recipe:
>
> * Apply some Debian patches from
>   http://patch-tracker.debian.org/package/wvstreams/4.6.1-6
>
> * Minor adjustments for the current build system (add
>   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
>   PR)
>
> * Disable parallel make, since it was causing errors like
>
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8
> | ./CXX -c utils/wvbuffer
> | ./CXX -c utils/wvbufferstore
> | ./CXX -c utils/wvcont
> | /bin/bash: ./CXX: No such file or directory
> | /bin/bash: ./CXX: No such file or directory
> | /bin/bash: ./CXX: No such file or directory
> | * Generating CC using c
> | make: * Generating CXX using cc
> | *** [utils/wvbuffer.o] Error 127
> | make: *** Waiting for unfinished jobs....
> | make: *** [utils/wvbufferstore.o] Error 127
> | make: *** [utils/wvcont.o] Error 127
> | ERROR: oe_runmake failed
> | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/run.do_compile.19302:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvstreams/4.6.1-r0/temp/log.do_compile.19302)
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Just for reference, Mario and I discussed about the path for including
this recipe.

We agreed it to be placed at wvdial subdir as it will only be used by it.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

