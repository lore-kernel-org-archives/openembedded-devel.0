Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stevecgelliott@embeddedoverflow.com.au>)
	id 1Ss6Av-0006Uo-P4 for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:54:54 +0200
Received: by pbbrq2 with SMTP id rq2so4982587pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:organization:message-id:mime-version
	:content-type:x-mailer:thread-index:content-language:x-vipre-scanned
	:x-gm-message-state;
	bh=DyhmlagGtVmQzF9YEgdpq2jMa6gpEAV0iXWhVuQXviQ=;
	b=on2cno/7SssCwmqSYA87tZOtHsy/J9bhxPi0j1SUeJlzHYfod+eCp2GAuoeuHzanDw
	9S3ASxLBo4Yl1+ff7HRnnmSZOTOeuqxruStbz+1skLKqwVfO6IheQ/Quz/y2HzypXG2I
	uy2r1hhtkkJury5dYbvxiIrfRma7J6ECirEO/X2rS0WXt8jAd/uoDUGaypBOoTm2xYil
	7cgM0IwQBBIuX8gnjmYMTHpQMYFwqOlOp0UHKP1HZznlujfCC9wYQYFHEUciFbkYuuC4
	2Gya804j9f72Pp3n5XhyManpL9hy74XQiC1vTpfnqON4Sqq7/Na4bylMK/pN1jmEW/V5
	kQiw==
Received: by 10.68.237.103 with SMTP id vb7mr10853344pbc.38.1342763010350;
	Thu, 19 Jul 2012 22:43:30 -0700 (PDT)
Received: from Win7 (CPE-60-225-134-189.hhui5.cht.bigpond.net.au.
	[60.225.134.189])
	by mx.google.com with ESMTPS id qa5sm3259488pbb.19.2012.07.19.22.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 22:43:29 -0700 (PDT)
From: Steve Elliott <stevecgelliott@embeddedoverflow.com.au>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jul 2012 15:43:22 +1000
Organization: Embedded Overflow
Message-ID: <006b01cd663a$96601cf0$c32056d0$@EmbeddedOverflow.com.au>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac1mOm4hj+FR2DKfTmWRjLrUq6ZfpA==
x-vipre-scanned: 015149C3002FFC01514B10
X-Gm-Message-State: ALoCoQnmF5ePd8L+Ymgkg3bn4A0w4I1n3Aq2Dnei0p8E1aRWFg7LZDEyBLtq9bpX+IfX/w5gGW0N
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build with MACHINE=omap3evm fails
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
X-List-Received-Date: Fri, 20 Jul 2012 05:54:54 -0000
Content-Language: en-au
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

A fresh clone of setup-scripts; config of omap3evm & bitbake virtual/kernel
fails.

Can anyone hint what generates the target:

/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3ev
m-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a739
f857858ef0b98294aa155/image/lib/firmware/./

Steve

 

[steve@Regret OpenEmbedded]$ git clone
git://github.com/Angstrom-distribution/setup-scripts oe2

Cloning into 'oe2'...

remote: Counting objects: 814, done.

remote: Compressing objects: 100% (416/416), done.

remote: Total 814 (delta 376), reused 758 (delta 323)

Receiving objects: 100% (814/814), 101.50 KiB | 64 KiB/s, done.

Resolving deltas: 100% (376/376), done.

[steve@Regret OpenEmbedded]$ 

[steve@Regret OpenEmbedded]$ MACHINE=omap3evm ./oebb.sh config omap3evm

....

[steve@Regret oe2]$ MACHINE=omap3evm ./oebb.sh bitbake virtual/kernel

........

|   MKDIR
/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3ev
m-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a739
f857858ef0b98294aa155/image/lib/firmware/emi26/

| make[1]: *** No rule to make target
`/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3e
vm-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a73
9f857858ef0b98294aa155/image/lib/firmware/./', needed by
`/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3e
vm-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a73
9f857858ef0b98294aa155/image/lib/firmware/ti_3410.fw'.  Stop.

| make[1]: *** Waiting for unfinished jobs....

|   MKDIR
/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3ev
m-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a7ER
ROR: Function failed: do_install (see
/home/steve/OpenEmbedded/oe2/build/tmp-angstrom_v2012_05-eglibc/work/omap3ev
m-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a739
f857858ef0b98294aa155/temp/log.do_install.15049 for further information)

| 39f857858ef0b98294aa155/image/lib/firmware/emi62/

| make: *** [_modinst_post] Error 2

| ERROR: oe_runmake failed

NOTE: package
linux-omap-psp-2.6.32-r121c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155:
task do_install: Failed

ERROR: Task 3
(/home/steve/OpenEmbedded/oe2/sources/meta-ti/recipes-kernel/linux/linux-oma
p-psp_2.6.32.bb , do_install) failed with exit code '1'

NOTE: Tasks Summary: Attempted 973 tasks of which 251 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

 
/home/steve/OpenEmbedded/oe2/sources/meta-ti/recipes-kernel/linux/linux-omap
-psp_2.6.32.bb , do_install

Summary: There were 20 WARNING messages shown.

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

 

Steve Elliott

Principal SW Engineer

Embedded Overflow

+61 (2) 9555-1715

+61 (4) 1126-0812 (Mobile)

4, Glassop St., Balmain  NSW  2041

 


