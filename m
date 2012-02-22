Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Igw-00060a-LS
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 21:21:34 +0100
Received: by lahc1 with SMTP id c1so537936lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.145.137 as permitted sender)
	client-ip=10.152.145.137; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.145.137 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.145.137])
	by 10.152.145.137 with SMTP id su9mr24072660lab.23.1329941594204
	(num_hops = 1); Wed, 22 Feb 2012 12:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+yUHR9Qx1ESN5cPnPE2wy9+xlAGjOJeLPNwLYmMOz+A=;
	b=OfmTOq/dlU5B4ym0eH/uyFjQh8MdP7xyp4eHrVqv5xBC1f46+mryuzioqWFfapvZBB
	rkaNWjwMq2LAyHu5q/hs51qnG2RLXwbj3suv33jJGfeER5bdDxVYCug3sxATg5TyeULB
	W+65OCVvz3+ddgF54rOto4FCILtuN77GHKmjI=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr20192441lab.23.1329941594135;
	Wed, 22 Feb 2012 12:13:14 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 12:13:14 -0800 (PST)
Date: Wed, 22 Feb 2012 21:13:14 +0100
Message-ID: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gcc-cross-initial patching fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 20:21:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

At build from scratch I get

ERROR: Command Error: exit status: 1  Output:
Applying patch gcc45-no-add-needed.patch
patching file gcc/config/alpha/elf.h
patching file gcc/config/ia64/linux.h
patching file gcc/config/linux.h
Hunk #1 succeeded at 89 (offset -12 lines).
patching file gcc/config/rs6000/sysv4.h
Hunk #1 FAILED at 908.
1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/temp/log.do_patch.5367
NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Failed
ERROR: Task 2829
(/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb,
do_patch) failed with exit code '1'

git log does not help me much -  what goes wrong?

Andreas


