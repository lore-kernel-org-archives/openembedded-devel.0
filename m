Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DAC786AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:16:40 +0000 (UTC)
Received: by wgso17 with SMTP id o17so54410261wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=cJHnlyGM17l+sKZLmqPASBQlwFUIKzA2AzTjMgTnZXM=;
	b=00VtJcBQnUqo12xab14keeO0mxrZ4GcH9gMfcFxav977P9yfbTFC/1ZQbOw4/m1AmX
	vZtPdrfeia25pT63QQfFsHNVLpcrV2Kp0tQZtwgbDS2pOsyDY6V2xWDgW6LbGyntrCsF
	9rFSsAG2NDyTMx0Odq4ywdGhIeLGvUj3I7fOqvRTT1KG0V5s543Lwoy09/HFlO1vvHpW
	BI8iBfaIY+BPqjbpetLv0mnO0pE4W/yGrHf4qn5KKvkYf7uhR7HXMhZeT7TxZKiM3Ylw
	z9w1yU1lHeN0YXug1bWs3unlt0n2ISesS1qENqbJPf6rU4nlX1bYLOXBLXZRyvhGseR3
	OIkQ==
X-Received: by 10.194.158.234 with SMTP id wx10mr52810540wjb.23.1429118201451; 
	Wed, 15 Apr 2015 10:16:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	df1sm22464431wib.12.2015.04.15.10.16.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Apr 2015 10:16:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Apr 2015 19:16:53 +0200
To: "Gary S. Robertson" <gary.robertson@linaro.org>
Message-ID: <20150415171653.GB2338@jama>
References: <20150413134540.GG2330@jama>
	<1428985140-4170-1-git-send-email-gary.robertson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1428985140-4170-1-git-send-email-gary.robertson@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libhugetlbfs: x86 - don't link against host libs
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
X-List-Received-Date: Wed, 15 Apr 2015 17:16:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 11:18:59PM -0500, Gary S. Robertson wrote:
> The x86 build linker scripts were still searching hard-coded paths on the
> build host for libraries.  As it happens, the libraries needed for
> linking the failing executable are present on my build host, so the build
> succeeds here despite the erroneous linker paths.  Consequently I had
> stupidly assumed the resulting QA warning was a fairly benign error
> until your test build in a pristine environment demonstrated otherwise.
>=20
> I'm unclear as to the exact behavior shown by your log of the failed buil=
d,
> but since it is a linker error I am for now assuming it is precipitated
> somehow by the flawed library search paths.  In any case with the
> hard-coded host paths commented out I get a clean build without the QA
> warning and see no similar logs in my local builds - so I hope this will
> also fix the build failures on your end.

Thanks for quick response, but this doesn't seem to be enough:

| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/i586-oe-linux/gcc/i586-oe-linux/4.9.2/ld: Attempt to open /home/jenkins/=
oe/world/shr-core/tmp-glibc/sysroots/qemux86/lib/libgcc_s.so succeeded
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -I.. -O2 -Wall -g -o obj32/zero_filesize_segment.o -c zero_filesize=
_segment.c
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,noexecstack -=
ldl -L../obj32 -o obj32/zero_filesize_segment -Lobj32 zero_filesize_segment=
=2Eld obj32/zero_filesize_segment.o obj32/testutils.o -Wl,--no-as-needed -l=
pthread -ldl -lhugetlbfs_privutils || cp bad-toolchain.sh obj32/zero_filesi=
ze_segment
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/i586-oe-linux/gcc/i586-oe-linux/4.9.2/ld: error: zero_filesize_segment.l=
d: SECTIONS seen after other input files; try -T/--script
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/i586-oe-linux/gcc/i586-oe-linux/4.9.2/ld: internal error in input_sectio=
ns_begin, at /home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-oe-linux=
/binutils-cross-i586/2.25-r0/git/gold/merge.h:269
| collect2: error: ld returned 1 exit status
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -I.. -O2 -Wall -g -o obj32/linkhuge.o -c linkhuge.c
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,noexecstack -=
ldl -L../obj32 -o obj32/linkhuge obj32/linkhuge.o obj32/testutils.o -Wl,--n=
o-as-needed -lpthread -ldl -lhugetlbfs_privutils
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -I.. -O2 -Wall -g -o obj32/linkhuge_nofd.o -c linkhuge_nofd.c
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,noexecstack -=
ldl -L../obj32 -o obj32/linkhuge_nofd obj32/linkhuge_nofd.o obj32/testutils=
=2Eo -Wl,--no-as-needed -lpthread -ldl -lhugetlbfs_privutils
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -I.. -O2 -Wall -g -o obj32/linkshare.o -c linkshare.c
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,noexecstack -=
ldl -L../obj32 -o obj32/linkshare obj32/linkshare.o obj32/testutils.o -Wl,-=
-no-as-needed -lpthread -ldl -lhugetlbfs_privutils
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -I.. -O2 -Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
| i586-oe-linux-gcc  -m32 -march=3Di586 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,=
--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86 -B./obj32 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,noe=
xecstack -ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread =
-ldl -lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o obj32/=
testutils.o
| i586-oe-linux-ld: internal error in do_write, at /home/jenkins/oe/world/s=
hr-core/tmp-glibc/work/x86_64-oe-linux/binutils-cross-i586/2.25-r0/git/gold=
/output.cc:464
| collect2: error: ld returned 1 exit status

Please try to build qemux86 with gold (ld-is-gold in DISTRO_FEATURES) to se=
e if you reproduce this issue.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

