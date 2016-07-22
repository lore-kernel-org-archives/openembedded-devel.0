Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC7E16067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:47:40 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q8so8798614qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=+oTZhY/pghfCo4qnzFvlZg1KanipWdmipiS8xmFQdY8=;
	b=Ph0xw0SEZGdwh2SoJ5oiI5pWAeehGIMSf9P5uYEoscBUFPT0pnL2HGJjzKQOF6NZE6
	lg7vpRvMIPQr41bDXLa1uplkOsn3uOgUeievQ0fxshRb62zhd8Aq9FMrfVKeGar5UcWg
	HzvYaMo6Nw3342OtqddL8NHHu7At6iFkkb+DWsSRsqpq8VqjH6wYq8TTizsnEKoxIw5f
	8iJKC1CknuUlAf3x0BOoejJOP/L85jamJjbLGQ6QlqdP45LSxe/3B8/GrPW4ChTL1Md+
	DN+sh4uzmTIR/0AtSAvXXTs+R7E04HQnYGBxhpmyFr337l+Er6ifE/0/Dn88UD7tKmkI
	XNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:date:to:subject:user-agent;
	bh=+oTZhY/pghfCo4qnzFvlZg1KanipWdmipiS8xmFQdY8=;
	b=Q0AxZb+Y6QP6tkdYhd8vAcS4XzPF9XXgc7q+dSh/14wmI1TrkBVMZkdXv2nTtFWlFT
	U+LN0pgZ/hVJwdkfTdxQUfZk7yf4cTuDHBixd9V2yKaTpZaOXU8uugjSZtJUEf/v7pdy
	xnIrtOqkUUqXmwJyCRpdzZmOFVJaoSR+DnzBiLcHszwZ0Dqo4cDtC4fVyq9+0AacTFn2
	jWXiVva5mUtGZLao/ys1QoN4T1rElNYHWj/dLY370Xj+iwZl/NIaNHeRSZLH8R1UG7kC
	djdlkzoME2ONjPCEMFOQbFoKIQlkQ3M1Zi0+ronzuoh87+JbsfCBcfhdIImKY8xYiKKL
	eQJw==
X-Gm-Message-State: AEkooutL2QPvsQZueNVNOHwTFZZWpIf/orW3EB5ElvOyUby7141pAw2CaqqsDXUFOcnAYw==
X-Received: by 10.55.102.85 with SMTP id a82mr5326070qkc.173.1469198860936;
	Fri, 22 Jul 2016 07:47:40 -0700 (PDT)
Received: from localhost ([177.100.227.79])
	by smtp.gmail.com with ESMTPSA id e7sm7490627qtb.9.2016.07.22.07.47.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jul 2016 07:47:40 -0700 (PDT)
Message-ID: <5792320c.0736ed0a.4a5ff.6cab@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Fri, 22 Jul 2016 11:47:34 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Fri, 22 Jul 2016 11:47:34 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.9
Subject: Updates to meta-java (master) in 2016-07-22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jul 2016 14:47:43 -0000

Hello,

I pushed following updates:

commit 4ae7c0c40e1f8fccc98d2f58cf61ef58c5a27da6 (HEAD -> pending, yocto/master-next, yocto/master, m/master, m/krogoth)
Author: Patrick Ohly <patrick.ohly@intel.com>
Date:   Wed Jul 20 11:48:36 2016 +0200

    do_unpackpost: explicitly set working directory
    
    bitbake rev 67a7b8b02 "build: don't use $B as the default cwd for
    functions" (included in current bitbake master) breaks the assumption
    that do_unpackpost runs inside the build directory. Now that has to be
    set explicitly, which is also okay for older bitbake versions.
    
    Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 065ee5a0160d7ad95861417a845c9e208499061e
Author: Patrick Ohly <patrick.ohly@intel.com>
Date:   Wed Jul 20 11:48:08 2016 +0200

    openjdk-8: fix compiler detection
    
    When GCC is at version 4 or 5, parsing the recipe fails with:
    
    ERROR: ExpansionError during parsing
    .../ostro-os/meta-java/recipes-core/openjdk/openjdk-8_72b05.bb
    ...
    bb.data_smart.ExpansionError: Failure expanding variable CFLAGS,
    expression was  -O2 -pipe -g -feliminate-unused-debug-types
    -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/work/corei7-64-ostro-
    linux/openjdk-8/72b05-r0=/usr/src/debug/openjdk-8/72b05-r0
    -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/x86_64-linux=
    -fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/intel-corei7-64=
     -fstack-protector-strong -D_FORTIFY_SOURCE=2
    ${ <at> version_specific_cflags(d)} -Wno-error=deprecated-declarations which
    triggered exception TypeError: can only join an iterable
    
    That's because FLAGS_GCC<version> may be unset, thus leading to
    d.getVar() returning None and ''.join(extraflags) failing.
    
    The join() is also redundant: extraflags already is a string. It
    happened to work because Python treats a string as sequence of
    single-character strings, and thus ''.join() re-created the original
    string.
    
    Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 4f7fb37a87e7d63a7419e480ea403aa02a2ce900
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Mon May 30 04:37:47 2016 -0400

    java.bbclass: change a warning message to note
    
    The logic is to check if the destination file exists before
    create the symlink, and give a message about removing the
    existing file, it's harmless and not necessary to be a warning.
    
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

