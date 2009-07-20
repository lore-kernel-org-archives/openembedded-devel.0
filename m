Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MSohN-0000Y6-Lm
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 10:58:17 +0200
Received: by gxk27 with SMTP id 27so3149221gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2009 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=5xFJGolLaCPbPnsErPKKLwhBr875ENYWb/rjR3FtWRQ=;
	b=gjIJFBo/Kx8nroBQSe3yN/6vDOI6R4YugAlfxyBX31CwY41JI2PH+iJV78yueLU0TV
	lDy5OzPjNw22KlV6YmudmSPNwljVl3mIbJVfpKzD0ucj0oX3O16vQcU/DjTABScq8497
	uGB7FfAchDpfv4SMEqDPI5Cbg+fEC0Pelo3kw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=HA4mSprNxaevi+vOAkcoHtR36+VvkbyKIEEnxvepBAVxjuuIp4vonYxh1vdIhKygNy
	T8lwsToM8NEo6h4IvWwoQLp1ziiafKsF3vRendPnZ+H77K56OIpUEBDF7WxYFUO8/7kN
	O3lpe0D4xKpkrVkLjHOm8SfQ0t9sknK1gcA7A=
MIME-Version: 1.0
Received: by 10.231.16.138 with SMTP id o10mr191377iba.13.1248079460483; Mon, 
	20 Jul 2009 01:44:20 -0700 (PDT)
Date: Mon, 20 Jul 2009 10:44:20 +0200
Message-ID: <c384c5ea0907200144y3c53863bk6e75b24daf03fae@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: [PATCH] Support for powerpc-gnuspe for angstrom-eglibc
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
X-List-Received-Date: Mon, 20 Jul 2009 08:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The calamari machine uses a PowerPC E500 core, which has the (GNU)SPE
ABI for it's signal processing extensions.
This is the default ABI for Linux, so let's enable it.

This should not affect any other machines and/or architectures.

Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>

diff --git a/conf/distro/include/angstrom-eglibc.inc
b/conf/distro/include/angstrom-eglibc.inc
index 92e2233..e947833 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -3,6 +3,8 @@ require conf/distro/include/eglibc.inc

 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1)
in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in
['collie','h3600', 'h3800', 'simpad', 'ht

+TARGET_OS = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1)
in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in
['calamari']]}"
+
 #TARGET_OS = "linux-gnuspe"

 #mess with compiler flags to use -Os instead of -O2


-- 
Leon


