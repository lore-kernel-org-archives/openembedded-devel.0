Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Szj8l-0002G5-D5
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 08:56:11 +0200
Received: by pbcwy7 with SMTP id wy7so1960015pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2012 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=0XxiUjLPVEbNC0nuPQZ7SqE9VWKnaVfDHdKW9oG3s08=;
	b=BLMan9T8UjNoin7EYakZiShpSY3YrokN6sz40d73jc3JKie+0SUSTRz2qGOViwJf8B
	jViFRm10XSgeXnwagRbXa2LCiLERrBHWEmpRVNyHJBpRu+d8cYnoZNn2D4yx+KcNSsfJ
	yQGV6WBggpIvJHiVN2wYOsH/kTK/uP7LdMiJ7Y5qy2sUvR6Jvhz1iVtIuh0FrSkhbr+4
	gSC7uii/sEWu0Ot+iU3AQ93R5A2nHmTNa1jDlSDGO1m7YzoELPVSwu7Q6TVHpiLk0HxG
	Egu6PJ7l+M2P/qkkSkkhDCQogsdGt8Kvsk0FnQ772ob4mAbI+JpJ+28rj6+YI4zp7uyS
	R80w==
Received: by 10.68.219.166 with SMTP id pp6mr10121414pbc.35.1344581059989;
	Thu, 09 Aug 2012 23:44:19 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id ru4sm2731064pbc.66.2012.08.09.23.44.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Aug 2012 23:44:19 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 10 Aug 2012 10:44:14 +0400
Message-Id: <154964BA-5A71-4E33-84CA-FE5929C67D22@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [meta-openembedded] libgcc-4.5.1: ERROR: QA Issue: No GNU_HASH in the elf binary libgcc_s.so.1
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
X-List-Received-Date: Fri, 10 Aug 2012 06:56:11 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I'm working on adding a gcc-4.5 recipe to the =
meta-openembedded/toolchain-layer.=20

I've based the files off the gcc-4.6 recipes, and taken the patches for =
gcc-4.5.1 from the poky/bernard branch.

I get the following QA error:

NOTE: Running task 806 of 890 (ID: 594, =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/gcc-run=
time_4.5.bb, do_configure)
ERROR: QA Issue: No GNU_HASH in the elf binary: =
'/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/libgcc-4.5.1+svnr162773=
-r14/packages-split/libgcc/lib/libgcc_s.so.1'

Searching through the mailing lists, I find that a potential fix would =
be to add the following to gcc-configure-common.inc

TARGET_CC_ARCH +=3D "${LDFLAGS}"

I was wondering why this issue manifests for gcc-4.5, and not for =
gcc-4.6 and gcc-4.7?

After all, the only difference between the 4.6 and 4.7 recipes is just =
the list of patches and the SRCREV, and the BINUTILS version (2.21) used =
for gcc-4.5, and running it against the current master branches for poky =
and meta-openembedded.

Best regards,

Elvis Dowson=

