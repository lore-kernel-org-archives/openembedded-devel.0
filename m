Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD03721BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:21:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44074155"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2014 17:18:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAR9L2wm007424;
	Thu, 27 Nov 2014 17:21:02 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Thu, 27 Nov 2014 17:21:28 +0800
Date: Thu, 27 Nov 2014 17:21:15 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141127172115.637e9f8d@Fedora>
In-Reply-To: <20141121140544.GH2163@jama>
References: <1416368645-23882-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141121140544.GH2163@jama>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH v2] tiptop: Add new recipe
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
X-List-Received-Date: Thu, 27 Nov 2014 09:21:21 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 21 Nov 2014 15:05:44 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> > +SRC_URI[tarball.md5sum] = "74255a29acf44569db021b080ad3e3f7"
> > +SRC_URI[tarball.sha256sum] =
> > "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d"
> 
> Drop name=tarball and tarball. prefix.

Modified in v3.

> Fails to build for qemuarm:
> 
> | In file included from target.c:17:0:
> | target-x86.c: In function 'disp_family_model':
> | target-x86.c:54:3: error: unknown register name '%edx' in 'asm'
> |    asm("mov $1, %%eax; " /* a into eax */
> |    ^
> | target-x86.c:54:3: error: unknown register name '%ecx' in 'asm'
> | target-x86.c:54:3: error: unknown register name '%ebx' in 'asm'
> | target-x86.c:54:3: error: unknown register name '%eax' in 'asm'
> | make[1]: *** [target.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tiptop/2.2-r0/tiptop-2.2/src'
> | make: *** [all] Error 2 | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located
> at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tiptop/2.2-r0/temp/log.do_compile.7484)
> NOTE: recipe tiptop-2.2-r0: task do_compile: Failed

Fixed this issue in v3. Now it can be built successfully in my
environment(qemuarm & qemuppc). I also removed the
tiptop-remove-path-of-libxml2.patch in v2 because now it is implemented
in do_configure_prepend.

-- 
Qian Lei

