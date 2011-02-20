Received: from fallback1.mail.ru ([94.100.176.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nyrl@mail.ru>) id 1Pr6Qg-0001Oz-DH
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 11:22:14 +0100
Received: from f253.mail.ru (f253.mail.ru [217.69.128.178])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id CF06A297D2D7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 13:04:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail; 
	h=Message-Id:Content-Type:Reply-To:Date:Mime-Version:Subject:To:From;
	bh=3fuoDTc5A81xXWbnr3lCbHtXUWrNlprHisceF4hLwG4=; 
	b=uZhESP+WCWNtNpx5UsHy/dHf24MKhTDgzj0RiV44Ar27QWrEYRMGJ7bl1fgajdt7yNPQ8f8l6TNtV8nFMJFdUS+CSJUbvrYuws00+DCn97zdA7hnIPqEL37RYaE3afaA;
Received: from mail by f253.mail.ru with local id 1Pr64K-0003ub-00
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 12:59:08 +0300
Received: from [92.100.199.230] by win.mail.ru with HTTP;
	Sun, 20 Feb 2011 12:59:08 +0300
From: Denis Dydychkin <nyrl@mail.ru>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0
X-Mailer: mPOP Web-Mail 2.19
X-Originating-IP: [92.100.199.230]
Date: Sun, 20 Feb 2011 12:59:08 +0300
Message-Id: <E1Pr64K-0003ub-00.nyrl-mail-ru@f253.mail.ru>
X-Spam: Not detected
X-Mras: Ok
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MACHINE_KERNEL_PR overrides PR for modules
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
X-List-Received-Date: Sun, 20 Feb 2011 10:22:14 -0000
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable



When recipe inherits module.bbclass, it will get its PR overwritten if
MACHINE_KERNEL_PR is defined. The outcome is that bumping PR within recip=
e has
no effect, as well as SRCREV does not work anymore, which is especially
important when working with latest version from repos.

The following patch fixes this problem by appending MACHINE_KERNEL_PR to =
PR
instead of replacing it. "+k" is added to get resulting PR looks like "r1=
+kr22"
or "r1+svnr222+kr33" since MACHINE_KERNEL_PR is usually defined as "rXX".


--- classes/module-base.bbclass 2011-02-17 16:14:45.792425264 +0300
+++ classes/module-base.bbclass 2011-02-17 16:36:00.088425246 +0300
@@ -11,7 +11,8 @@
     machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True)

     if machine_kernel_pr:
-       bb.data.setVar('PR', machine_kernel_pr, d)
+       pr =3D bb.data.getVar('PR', d, True) + "+k" + machine_kernel_pr
+       bb.data.setVar('PR', pr, d)
 }

 export KERNEL_VERSION =3D "${@base_read_file('${STAGING_KERNEL_DIR}/kern=
el-abiversion')}"




