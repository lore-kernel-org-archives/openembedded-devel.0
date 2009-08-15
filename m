Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1McRNz-0005ak-NS
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 00:06:04 +0200
Received: by ewy8 with SMTP id 8so329602ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Mc5/xyWge3gkB4knfdJoXrzs13l/L1djFm8XoAX+3ZQ=;
	b=fWFaxvbBfN+9YynzXAdjzhBwYs7Ws2IfZe/RvUM799Y+RiWB04gXDl3rwpY84N672Y
	dMu4ACh1IKStlLjZWUHMhigAD7ldhUu7fED7QQp++OyfJ7i+ILO2NjVDs/RzHiRI4qwh
	lab9kUk5ThQKlFHEJhPrkvtfZyA/mCUavOys4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=f5ZNAYWExPsGp2EgDqmPGT8kJjy7idaeyfCZh8FtfBkpG6T539MZzdMI/TlHxs8EUI
	W0fNJ27TnUY2oepSxKJaRizlpvy5IEfcMJXvuOucNWp97iYX9WG7BJ/ojsoGGylBHdaD
	2bSCW3gvpPuDCdtT8OkJlrD2uQ6ZOad5/yFcA=
MIME-Version: 1.0
Received: by 10.216.30.5 with SMTP id j5mr732728wea.209.1250372955050; Sat, 15 
	Aug 2009 14:49:15 -0700 (PDT)
Date: Sat, 15 Aug 2009 23:49:15 +0200
Message-ID: <d1b08f940908151449x3365f27cl5700731a008e2617@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Wrong crosscompilers path after rebuild from scratch
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
X-List-Received-Date: Sat, 15 Aug 2009 22:06:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I can consistently document an unexpected failure after rebuilding
from packaged staging (wiping /tmp, leaving only /pstage dir).

FWIW I use Angstrom, which sets
./distro/include/angstrom.inc:DEPLOY_DIR = "${TMPDIR}/deploy/${LIBC}
overriding
./bitbake.conf:DEPLOY_DIR ?= "${TMPDIR}/deploy"

After build from scratch I have following tree:

andrea@mizar /oe/build/tmp/cross/armv5te $ ls -l
total 24
drwxr-xr-x 5 andrea users 4096 Aug 15 10:32 arm-angstrom-linux-gnueabi
drwxr-xr-x 2 andrea users 4096 Aug 15 11:44 bin
drwxr-xr-x 3 andrea users 4096 Aug 15 10:24 i686-linux
drwxr-xr-x 3 andrea users 4096 Aug 15 11:03 lib
drwxr-xr-x 3 andrea users 4096 Aug 15 10:32 libexec
drwxr-xr-x 3 andrea users 4096 Aug 15 11:19 share


BUT packaged staging recreates  /oe/build/tmp/cross/bin and
/oe/build/tmp/cross/arm-angstrom-linux-gnueabi/bin

The problem is when you try to build smthg: in run.do_configure I have
export PATH="...:/oe/build/tmp/cross/armv5te/bin:..."

So, the 'armv5te' part is lost...crosscompiler not found :/

Can someone reproduce / help to diagnose the issue?

TIA

Andrea


