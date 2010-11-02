Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDBLg-0000kd-Dr
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 08:32:07 +0100
Received: by iwn42 with SMTP id 42so7705523iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 00:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=7p9eAp5aNVT83N++02D6YdzZtPkglPNEbKzGizZmXvA=;
	b=WUs8WYkYVcKEm9zsAHb/ZMwwRjZg9SHvy/DmU8jVK2krgZTvRBFFWv4TNa12S+dFDD
	GIPmDgNpGkgcxC8x/RrdK17wI+9Ei7HgYWcKA0kRU5UQJBhChr1VR8v1S3RltiCwmsa2
	y7tb66W8Avzg/Wd1LSjMQoitZXpoJvKG3H3Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=S5i660HcvVKrv8wp4QIIMfUr/lh7Y4Bg0uZj7eimwef5AybWeC+i3y9ZSidELgxPvu
	kJRyfF0UbG3IaO1Y2f+V0aVuqlxdGsObeiEGvYJZNfMt4kclkeVgyVfFh9WfcqXzOkKy
	9PkJOv5O+10z7ETPpoKhgd6pSgOKgwrzgngtU=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr3756907icj.201.1288683074254; Tue,
	02 Nov 2010 00:31:14 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Tue, 2 Nov 2010 00:31:14 -0700 (PDT)
Date: Tue, 2 Nov 2010 08:31:14 +0100
Message-ID: <AANLkTimjzbYrDGarGj=yN8c3q5=CNXjLSeZLj1+Z9S4z@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: e2fsprogs build problems (with ubuntu 8.04 host)
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
X-List-Received-Date: Tue, 02 Nov 2010 07:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Somehow the last few weeks I am getting problems with e2fsprogs on the
testing-next branch on our autobuilder.

It hangs in etex. From ps:

12474 ?        S      6:03 python
/home/hudson/jobs/FM_TEST/workspace/bitbake-1.10.0/bin/bitbake
e2fsprogs
12534 ?        S      0:00 python
/home/hudson/jobs/FM_TEST/workspace/bitbake-1.10.0/bin/bitbake
e2fsprogs
12536 ?        S      0:00 sh -e
/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/temp/run.do_install.12534
12537 ?        S      0:00 make
DESTDIR=/home/hudson/jobs/FM_TEST/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/image
install
12991 ?        S      0:00 /bin/sh -c test -d doc && cd doc && make
install-doc-libs
12992 ?        S      0:00 make install-doc-libs
12994 ?        S      0:00 /bin/sh /usr/bin/texi2dvi ./libext2fs.texinfo
13129 ?        S      0:00 /bin/sh /usr/bin/texi2dvi ./libext2fs.texinfo
13130 ?        D    315:45 etex txiversion.tex

The weird thing is:
building e2fsprogs on that system works fine
running /bin/sh /usr/bin/texi2dvi ./libext2fs.texinfo also works fine
(with the texinfo file from the e2fsprogs work dir)

when the system is running I have:
frans@bob:/home/hudson/jobs/FM_TEST/workspace$ ls -l
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion*
-rw-r--r-- 1 hudson nogroup   0 2010-11-01 23:05
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion.err
-rw-r--r-- 1 hudson nogroup   0 2010-11-02 00:29
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion.log
-rw-r--r-- 1 hudson nogroup 309 2010-11-02 00:29
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion.out
-rw-r--r-- 1 hudson nogroup  24 2010-11-01 23:05
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion.tex

When I do an etex
tmp/work/ppce500v2-oe-linux-gnuspe/e2fsprogs-1.41.9-r24/e2fsprogs-1.41.9/doc/libext2fs.t2d/version_test/txiversion.tex
by hand etex completes without problem.

No idea what is causing this but wanted to report it.

We've meanwhile moved our autobuilder to 10.04. This one does not have
the problem.

Best regards, Frans.


