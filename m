Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F148E65C87
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O2Xqaj004938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Oct 2014 19:33:52 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 23 Oct 2014 19:33:51 -0700
Message-ID: <5449BA8D.4000304@windriver.com>
Date: Fri, 24 Oct 2014 10:33:49 +0800
From: Yang Hongjun <Hongjun.Yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <koen@dominion.thruhere.net>
References: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
	<m280ju$50a$1@ger.gmane.org>
In-Reply-To: <m280ju$50a$1@ger.gmane.org>
Subject: Re: [meta-oe][PATCH] tree: Add a new package
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
X-List-Received-Date: Fri, 24 Oct 2014 02:33:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年10月22日 18:23, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hongjun Yang schreef op 22-10-14 11:57:
>> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>>
>> Add tree command, some test scripts need it.
>>
>> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>>
>> --- .../tree/tree-1.7.0/fix-cross-env.patch            | 32
>> ++++++++++++++++++++++ meta-oe/recipes-support/tree/tree_1.7.0.bb
>> | 16 +++++++++++ 2 files changed, 48 insertions(+) create mode 100644
>> meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch create mode
>> 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb
>>
>> diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
>> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch new file
>> mode 100644 index 0000000..ccdf635 --- /dev/null +++
>> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch @@ -0,0
>> +1,32 @@ +From 7ad835ae0c2b2b311002fda0be2dbf8f17c5a3d5 Mon Sep 17
>> 00:00:00 2001 +From: "Hongjun.Yang" <hongjun.yang@windriver.com> +Date:
>> Wed, 22 Oct 2014 11:05:35 +0800 +Subject: [PATCH] fix the install path
>> change the install path for cross + compile environment. +
>> +Upstream-Status: Pending + +Signed-off-by: Hongjun.Yang
>> <hongjun.yang@windriver.com> +--- + Makefile | 4 ++-- + 1 file changed, 2
>> insertions(+), 2 deletions(-) + +diff --git a/Makefile b/Makefile +index
>> e91f1f6..776f1f3 100644 +--- a/Makefile ++++ b/Makefile +@@ -22,9 +22,9
>> @@ CC=gcc + + VERSION=1.7.0 + TREE_DEST=tree +-BINDIR=${prefix}/bin
>> ++BINDIR=${DESTDIR}/${prefix}/bin + MAN=tree.1
>> +-MANDIR=${prefix}/man/man1 ++MANDIR=${DESTDIR}/${prefix}/man/man1 +
>> OBJS=tree.o unix.o html.o xml.o json.o hash.o color.o + + # Uncomment
>> options below for your particular OS: +-- +1.9.1 + diff --git
>> a/meta-oe/recipes-support/tree/tree_1.7.0.bb
>> b/meta-oe/recipes-support/tree/tree_1.7.0.bb new file mode 100644 index
>> 0000000..b7fc43b --- /dev/null +++
>> b/meta-oe/recipes-support/tree/tree_1.7.0.bb @@ -0,0 +1,16 @@
>> +DESCRIPTION = "This is a handy little utility to display a tree view of
>> directories."
> This looks more like SUMMARY
>
>> +HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/" +LICENSE="GPLv2"
>> +SECTION = "console/utils" +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
> Please keep LICENSE and LIC_FILES_CHKSUM together.
>
>> + +inherit autotools-brokensep + +FILES_${PN}-doc += "${prefix}/man"
> FILES* and R* go below do_install
>
>> + +SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz
>> \ +	   file://fix-cross-env.patch \ +	  " + +SRC_URI[md5sum] =
>> "abe3e03e469c542d8e157cdd93f4d8a6" +SRC_URI[sha256sum] =
>> "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFUR4W+MkyGM64RGpERAnKsAJ0UVS3WtlDbYJuvWRIeGGQ6kpP4tgCgu1sz
> EpivpXj9lw0NN63JNPzvtB4=
> =luch
> -----END PGP SIGNATURE-----
>

Thanks for your suggestion, I will re-work on it and send v2 patch.


