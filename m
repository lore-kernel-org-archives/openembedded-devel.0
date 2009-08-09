Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ma4ih-0008Jr-Qw
	for Openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 11:29:39 +0200
Received: by qyk35 with SMTP id 35so2322174qyk.24
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2009 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=3xyakF3DEwupo5ydzpAr6y/QsXoW8UdkA39x2U6mflg=;
	b=W90O4wmtldyWxLya253bHreMeksIIk6GnKxjzhTNqbAtO63C5l/XCugnqd2JJAM31G
	kQ1TLiuYvpJGIUFofD0p8loClkxrKRVfb9hXkNXMwwNzUBmpwIhpQ+XrPhifKjaEnawB
	bHnwwUPgDaBtZ3zJb8gHF/6atZK6HjoCLsTIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=bwe7bkt43VZydh83u+p6U7J9eD+ZBEqULTDZBtNuZimHVbNHvAcwGv0bcQCO9h1T3P
	mBMuDt1itXpROT/usloKqHk2d/J1ThNpyNF5H3GhPFQ+i8OjhOU5Fht9Nv8ZLYdFjIjw
	2oRkBRDPa+XI6mUBj/eXhiS41J2A0W8JZR5pg=
MIME-Version: 1.0
Received: by 10.229.99.210 with SMTP id v18mr1036059qcn.34.1249809213842; Sun, 
	09 Aug 2009 02:13:33 -0700 (PDT)
Date: Sun, 9 Aug 2009 02:13:33 -0700
Message-ID: <19c1b8a90908090213x1aea00dfj343f2314282a9129@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: Initialize PACKAGE_EXTRA_ARCHS if not done in tune files.
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
X-List-Received-Date: Sun, 09 Aug 2009 09:29:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

hi

Building for titan machine I was hitting this error. Found out that
PACKAGE_EXTRA_ARCHS is not defined in tune-sh4.inc
Would it be ok if we initialize it conditionally to empty string in
conf/bitbake.conf



  File "/home/kraj/work/oe/bitbake/lib/bb/data_smart.py", line 70, in
python_sub
    s = eval(code)

                              File "<string>", line 1
    " ".join( [ ( "/etc/opkg/%s-feed.conf" % feed ) for feed in "all
${PACKAGE_EXTRA_ARCHS

                 ^
SyntaxError: EOL while scanning string literal



Something like below. Does anybody sees any issues doing this ?

--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -107,6 +107,7 @@ EXEEXT = "${HOST_EXEEXT}"

 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+PACKAGE_EXTRA_ARCHS ?= ""
 MACHINE_ARCH = "${@[bb.data.getVar('HOST_ARCH', d, 1),
bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d,
1))]}"
 PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}
${MACHINE}"


