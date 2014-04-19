Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1401E6098B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 03:35:09 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 9so1930575ykp.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CnJ2YUXG2jwhcW3e8DpyHzdrWUu+5TtLIv74i+S9Ql0=;
	b=0RHIovL9/1qBcLoaFdEZFe/BKuHYhPS7F08iGO+iXK8guZtUgQ50/vAkJsAzmFx3Cd
	kO0Ne7nirsxPu+qDghia4G2iDAnxFdfRPl3jFL5XzfXyQnVl7rECnpUPBWpxk0RFk+vd
	LKbWLItJOOeowoLkET+TG6DsYDBHOwJGPQ48yqdi8UhNKPO22f/0O7LnnolLaSYCTZSk
	pPzz7zF0CsEy1wDJ76ggHm+1t3u1wG97duPiENGukZuviFbL5qKgc3tArXqjt1oTjs1t
	7P0XegWvkUmCoLhVFp8Yn8ew70m8xw5HVggGR7+CyerjKNOeWUHkaIzA2+2B45aXTL72
	AHKw==
MIME-Version: 1.0
X-Received: by 10.236.117.174 with SMTP id j34mr34863518yhh.13.1397878510214; 
	Fri, 18 Apr 2014 20:35:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 18 Apr 2014 20:35:10 -0700 (PDT)
In-Reply-To: <20140326204356.GJ3709@jama>
References: <20140326204356.GJ3709@jama>
Date: Sat, 19 Apr 2014 00:35:10 -0300
X-Google-Sender-Auth: gihyIwkFj7KE75-l_mnMVfgqKrU
Message-ID: <CAP9ODKo7X3o3APcB4c=7-x6SScO_CLRaMXw4PPFQwOFrE17Gew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: glcompbench: Create 2012.08 version
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
X-List-Received-Date: Sat, 19 Apr 2014 03:35:13 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Wed, Mar 26, 2014 at 5:43 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Fails to build for qemuarm (looks like missing dependency)
>
> ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/temp/log.do_configure.19183)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/temp/log.do_configure.19183
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | Setting top to                           : /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/glcompbench-2012.08
> | Setting out to                           : /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/glcompbench-2012.08/build
> | Checking for 'g++' (c++ compiler)        : ok
> | Checking for header inttypes.h           : yes
> | Checking for header stdint.h             : yes
> | Checking for header sys/time.h           : yes
> | Checking for library m                   : yes
> | Checking for function gettimeofday       : yes
> | Checking for function sqrt               : yes
> | Checking for function strtol             : yes
> | Checking for function strtoul            : yes
> | Checking for program pkg-config          : /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
> | Checking for 'x11'                       : yes
> | Checking for 'xdamage'                   : yes
> | Checking for 'xcomposite'                : not found
> | The configuration failed
> | (complete log in /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/glcompbench-2012.08/build/config.log)
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/glcompbench/2012.08-r0/temp/log.do_configure.19183)
> ERROR: Task 5 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb, do_configure) failed with exit code '1'

I am working on this and will send a v2 fixing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

