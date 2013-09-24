Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id CEFAD610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:42:54 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id i7so2259491oag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kgUDgy2ZnluGlZW7dm2Azz1Xf4trY0W6vuuwNqabjg8=;
	b=KQSESP5VXPMfKVuUrj9ov3DacovD28aauvoICx+AmsxaC6XpJE/mvs2mYtLQEp18Ql
	WkMy37Ak9VsjuJhVhwnxXdobFU+NqbD9ObtaiH3aIzF9iFCWbA12LS9Z+dzmNxc+wpx3
	N+EZ7w2NlrhkpvlZprJ2VC7fAHI3LIvXEdhuGPLVTAzktkeBhF/m7lGnhtK/DKaF6czR
	bYk2WNG5/ntTTLJ1FHNlNSMZROqTM3MYsMcoAIPRiMpRY2jHhPaRmlyjPl9FvSs8kY67
	oXaF1kugjVTPE6J8pERv4EyEuIhcg34YxYI+wWfDr4gIxQ/BSAixSjf6jSsMClldxAnQ
	j/7A==
MIME-Version: 1.0
X-Received: by 10.60.94.164 with SMTP id dd4mr1690104oeb.68.1380033776637;
	Tue, 24 Sep 2013 07:42:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 24 Sep 2013 07:42:56 -0700 (PDT)
In-Reply-To: <1380026637-6511-2-git-send-email-mario@ossystems.com.br>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<1380026637-6511-2-git-send-email-mario@ossystems.com.br>
Date: Tue, 24 Sep 2013 11:42:56 -0300
X-Google-Sender-Auth: Y9CH-7o_Go1AfekUQzmKhcHkrGk
Message-ID: <CAP9ODKrDgbRnLUb=OYwMduJ8xDU4N918mbGAXpYAQuQf2P+eYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 2/2] wvdial: add recipe for version 1.61
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
X-List-Received-Date: Tue, 24 Sep 2013 14:42:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 24, 2013 at 9:43 AM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Recipe based on OE classic's recipe for version 1.60, as of
> ff0d06489db2e50353d72d24aada74c60bddb016.
>
> Summary of changes against OE classic's recipe:
>
> * Apply typo_pon.wvdial.1.patch patch from Debian's
>   http://patch-tracker.debian.org/package/wvdial/1.61-4.1
>
> * Fix Makefile in do_configure task
>
> * Add wvstreams' include dir to BUILD_CPPFLAGS
>
> * Minor adjustments for the current build system (add
>   LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
>   PR)
>
> * Disable parallel make, since it was causing errors like
>
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8
> | * Generating CC
> | ./CXX -c wvdialer
> | * Generating CXX
> | ./CXX -c wvmodemscan
> | /bin/bash: ./CXX: No such file or directory
> | make: *** [wvdialer.o] Error 127
> | make: *** Waiting for unfinished jobs....
> | make: *** wait: No child processes.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvdial/1.61-r0/temp/run.do_compile.18676:1 exit 1 from
> |   exit 1
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

