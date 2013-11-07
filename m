Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 59DC86D1FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 15:55:50 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id q8so587996lbi.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 07:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GjV05ir3D99WqbcfoXPXLPKboqUiEyhV+26hXz2G72g=;
	b=VsuOX/Vg2yGwPU6sDwd/TJ1IC5zobs7/hcIH/eanxQEgYElEWj/fZJDbIF2ebglc2v
	2zlhitQ8Hh4zVi614u9XlVX6o16eBUrqgAs8TuilYmvNXHNRqFdFdgSwoc670BBfRvWL
	Qdg7CdWeCtA15nvq0tzqclQhdpLVQZLowMKp1DCpiANuDEBRFqDlpK6s79msEk6ErrjW
	snPLC/KIPnkcQ78xVuZJ/+Z6KAi+UEP5608S6GJ0Pv3+xn8uS/vAi8wy3N7wLlDJPe8P
	bZq/zl9siN7IqzAt50+BlcM4S+FwAzIb7TNMNFuNpdtmdhbzU5Wyf6ZDcaKSXB6p136e
	Rang==
X-Gm-Message-State: ALoCoQmuV30eKcTgF1GU2u+8NMzM/BatXAstLU+uFaOZcfYBjq9v7UIFTLPntKB7aN6KaCH0kuIl
X-Received: by 10.152.18.131 with SMTP id w3mr574258lad.47.1383839751537;
	Thu, 07 Nov 2013 07:55:51 -0800 (PST)
Received: from nexon.se (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id vs11sm4034828lac.3.2013.11.07.07.55.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 07:55:50 -0800 (PST)
Date: Thu, 7 Nov 2013 17:03:47 +0100
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131107160346.GB26197@nexon.se>
References: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
	<20131028082603.GD3704@jama>
MIME-Version: 1.0
In-Reply-To: <20131028082603.GD3704@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: Re: [PATCH] libhugetlbfs: add support for armv7a
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
X-List-Received-Date: Thu, 07 Nov 2013 15:55:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 2013-10-28 09:26, Martin Jansa wrote:
> On Fri, Oct 18, 2013 at 04:09:07PM +0200, Anders Roxell wrote:
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index 24480c3..4f1bfa4 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -20,10 +20,16 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
> >  
> >  S = "${WORKDIR}/git"
> >  
> > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> > +COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
> >  
> > +python __anonymous() {
> > +    if base_contains('TARGET_ARCH', 'arm', True, False, d):
> > +        d.setVar('ARCH', 'armv7l')
> > +    else:
> > +        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
> > +}
> >  
> > -EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> > +EXTRA_OEMAKE = "'ARCH=${ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' BUILDTYPE=NATIVEONLY ${LIBARGS}"
> >  CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
> >  
> >  TARGET_CC_ARCH += "${LDFLAGS}"
> 
> It enables every arm* and fails for qemuarm:
> 
> |
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> error: zero_filesize_segment.ld: SECTIONS seen after other input files;
> try -T/--script
> | collect2: error: ld returned 1 exit status
> | 	 CC32 obj32/linkhuge.o
> | 	 LD32 (hugelink test) obj32/linkhuge
> | 	 CC32 obj32/linkhuge_nofd.o
> | 	 LD32 (hugelink test) obj32/linkhuge_nofd
> | 	 CC32 obj32/linkshare.o
> | 	 LD32 (hugelink test) obj32/linkshare
> | 	 CC32 obj32/linkhuge_rw.o
> | 	 LD32 (hugelink_rw test) obj32/linkhuge_rw
> | arm-oe-linux-gnueabi-ld: error: cannot open text-segment=2097152: No
> such file or directory
> | arm-oe-linux-gnueabi-ld: fatal error: unable to parse script file
> text-segment=2097152
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [obj32/linkhuge_rw] Error 1
> | make: *** [tests/all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libhugetlbfs/git-r0/temp/log.do_compile.24357)
> NOTE: recipe libhugetlbfs-git-r0: task do_compile: Failed
> ERROR: Task 23498
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb,
> do_compile) failed with exit code '1'
Hi,

I'm sorry for the late response!

How can I reproduce this error?
I tried to build libhugetlbfs for qemuarm and that worked for me...

Cheers,
Anders

> 
> 
> > -- 
> > 1.8.1.2
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

