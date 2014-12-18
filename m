Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 72BAC72827
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:40:18 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id z6so487339yhz.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=Qf51Xn6JgadQ7MkSWLjs+/8llTfV2uaEJm4bDAfqrWM=;
	b=wtQ6G37FjmZnLAIlw7jG3XdFoKxkdfLZmj2v4QZvUFABLvchVXcnETzjMG+z9Yp9zE
	boOxuoTGfgcDDDM7EkG1tmBeJrPNIUpgX1tf5AZyzq1oSbJgnSaJIsy1g4IX8ShVTTcD
	6vbFi68M72rtMHXWydMWYblqIO45wjnN3TAPeVBWkm55FM/Wkji6VfqWur0+UOxHh0Xr
	0xi/jhMVOsfj8B4Ir7AvGvdjL550OPaRC0s/kMzTQMfIGwwPCmNzzMSrqOHuLTI78EfZ
	HS2vM/d+RZ6U1x07djqLgcfx9ajTcm3WGKVYgJ5SWiw4amw91LmONm7x/YWY0UAGFksj
	cwLw==
MIME-Version: 1.0
X-Received: by 10.170.60.87 with SMTP id c84mr1556683ykc.99.1418906418859;
	Thu, 18 Dec 2014 04:40:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 18 Dec 2014 04:40:18 -0800 (PST)
Date: Thu, 18 Dec 2014 10:40:18 -0200
X-Google-Sender-Auth: SQwOrVn6JnjmgQNaAMFrzt_qvu8
Message-ID: <CAP9ODKqdkzDM1v=1dUAxYrEOeTYg2R6EYxGAD426i8tS_HQNNg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [RFH] meta-java recent updates
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
X-List-Received-Date: Thu, 18 Dec 2014 12:40:22 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Since meta-java has been included, few days ago, I started to collect
some fixes to test and merge. There were some pull requests awaiting
to be reviewed and merged on github's tree and this was my initial
focus. I have merged following changes:

Cristian Iorga (2):
      openjdk: add pkgconfig support
      ecj: fix unpackpost task

Henning Heinold (11):
      openjdk6: update icedtea 1.12 to version 1.12.8
      openjdk-common.inc: fix qemu usage
      cacao: fix target compilation and packaging
      README: update for icedtea version 1.12.8
      jamvm: add inherit pkgconfig
      jamvm: update git version to ebd11bde0a97b57f0d18938c6b65468d3c932719
      java-test-image: add jamvm, cacao and classpath
      jamvm: update git url to sourceforge while berlios is gone
      openjdk6: add version 1.13.4
      README: update openjdk6 to the latest icedtea version
      README: minor fixes

Khem Raj (2):
      openjdk-7-25b30: Forward port ppc patches
      libmatthew: Remove the dummy jar symlink

Koen Kooi (2):
      openjdk-7-release-25b30.inc: move nio patch to main section.
      openjdk-7-release-25b30.inc: add patch to fix hotstop build

Merten Sach (1):
      jamvm: port to new update-alternatives

Otavio Salvador (3):
      icedtea6-native: Depends on linux-libc-headers-native
      linux-libc-headers: Add support to build the 'native' package
      README: Update to Daisy

Ronaldo Nunez (1):
      openjdk-postinst.inc: Corrects empty jvm.cfg after postinst task.

Sven Ebenfeld (1):
      openjdk-7: inherit pkgconfig

The layer itself has a huge room for improvement. It needs to be
updated for Dizzy and than master.

I'd like to ask anyone who carry patches on top of meta-java to rebase
those and send for review. Anyone willing to help is welcome :)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

