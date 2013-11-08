Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBBC6D663
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 11:29:47 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so1767122wgh.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2013 03:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=39PtvbJpqjddebnRK/C8P0CobIyocwVkx1VwisNqZzc=;
	b=oDJQBk4H4311ZtABk9+Rl25b0vgcW79DdiOcQ4Rpge+zLVU2Jt63IUE/mi6QPDOyIa
	EtMWC940BVorlLoNz3czZ9Ca+cYgf1DWivjRmKnDzhtPKLWOaP8/P/pUqw9M3L43+oT3
	XVbUwerK2k7+G+pPd1jtHg1gkff+4R0w8iKAeFp1bY4UpqNXpQXFn7+ikpUwLrz93ppa
	SWgpNISAtUlyVgKG+PUhSqB/obIUSQccIc0VySXffUPpLvGiB41pD8tFQyRbNd6THMtr
	R6aeYi2MmwTCmvTFnJ/I1XPQuY2dctpxPHARw+K8+PwwcW27QhX3+cXyuDtYy7IzeiFM
	48BQ==
MIME-Version: 1.0
X-Received: by 10.194.78.51 with SMTP id y19mr542448wjw.62.1383910188794; Fri,
	08 Nov 2013 03:29:48 -0800 (PST)
Received: by 10.194.179.198 with HTTP; Fri, 8 Nov 2013 03:29:48 -0800 (PST)
In-Reply-To: <20131107160346.GB26197@nexon.se>
References: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
	<20131028082603.GD3704@jama> <20131107160346.GB26197@nexon.se>
Date: Fri, 8 Nov 2013 12:29:48 +0100
Message-ID: <CA+chaQeSXF8qXuiW53e5JaQoFU-3dn83pDJZgrfMQdqTJ5ns=A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: linaro-networking@linaro.org, "patches@linaro.org" <patches@linaro.org>
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
X-List-Received-Date: Fri, 08 Nov 2013 11:29:48 -0000
Content-Type: text/plain; charset=UTF-8

I wasn't using anything special to reproduce it, my setup is described here
http://openembedded.org/wiki/Bitbake_World_Status


On Thu, Nov 7, 2013 at 5:03 PM, Anders Roxell <anders.roxell@linaro.org>wrote:

> On 2013-10-28 09:26, Martin Jansa wrote:
> > On Fri, Oct 18, 2013 at 04:09:07PM +0200, Anders Roxell wrote:
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > ---
> > >  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10
> ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/
> libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/
> libhugetlbfs_git.bb
> > > index 24480c3..4f1bfa4 100644
> > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > @@ -20,10 +20,16 @@ SRC_URI = "git://
> git.code.sf.net/p/libhugetlbfs/code \
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > -COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> > > +COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
> > >
> > > +python __anonymous() {
> > > +    if base_contains('TARGET_ARCH', 'arm', True, False, d):
> > > +        d.setVar('ARCH', 'armv7l')
> > > +    else:
> > > +        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
> > > +}
> > >
> > > -EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}'
> BUILDTYPE=NATIVEONLY ${LIBARGS}"
> > > +EXTRA_OEMAKE = "'ARCH=${ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}'
> BUILDTYPE=NATIVEONLY ${LIBARGS}"
> > >  CFLAGS += "-fexpensive-optimizations -frename-registers
> -fomit-frame-pointer -g0"
> > >
> > >  TARGET_CC_ARCH += "${LDFLAGS}"
> >
> > It enables every arm* and fails for qemuarm:
> >
> > |
> >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> > error: zero_filesize_segment.ld: SECTIONS seen after other input files;
> > try -T/--script
> > | collect2: error: ld returned 1 exit status
> > |      CC32 obj32/linkhuge.o
> > |      LD32 (hugelink test) obj32/linkhuge
> > |      CC32 obj32/linkhuge_nofd.o
> > |      LD32 (hugelink test) obj32/linkhuge_nofd
> > |      CC32 obj32/linkshare.o
> > |      LD32 (hugelink test) obj32/linkshare
> > |      CC32 obj32/linkhuge_rw.o
> > |      LD32 (hugelink_rw test) obj32/linkhuge_rw
> > | arm-oe-linux-gnueabi-ld: error: cannot open text-segment=2097152: No
> > such file or directory
> > | arm-oe-linux-gnueabi-ld: fatal error: unable to parse script file
> > text-segment=2097152
> > | collect2: error: ld returned 1 exit status
> > | make[1]: *** [obj32/linkhuge_rw] Error 1
> > | make: *** [tests/all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at
> >
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libhugetlbfs/git-r0/temp/log.do_compile.24357)
> > NOTE: recipe libhugetlbfs-git-r0: task do_compile: Failed
> > ERROR: Task 23498
> >
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/
> libhugetlbfs_git.bb,
> > do_compile) failed with exit code '1'
> Hi,
>
> I'm sorry for the late response!
>
> How can I reproduce this error?
> I tried to build libhugetlbfs for qemuarm and that worked for me...
>
> Cheers,
> Anders
>
> >
> >
> > > --
> > > 1.8.1.2
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

