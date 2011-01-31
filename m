Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PjqIk-0003xz-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:44:02 +0100
Received: by iyj18 with SMTP id 18so4867060iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=VV5vndGObTJ5a7PfOIQOn7ysG3C12EBIAb+7bnW3ihU=;
	b=UfKZzz+XnQE/2nmyKJ0TZKeBbHX7gN0/OLgjzchuZ17oxfG31ISRttNAQgJD3aHcKx
	Bu2PYpIGzY1OzXsXIr1p3ieL1TK8u3nxaOhreIDLr5+DsUgjEcabt3hTh9F7YHgbuhcq
	p8mwDqHLq5ZeH5a/Q4kpRipWFemjjoZteYmwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WSfQV6KctBp7u0wrY9I/cqyhkWNvGjLem9Dq98eKPvQVOhYGTv2ftqv7xSFlq+PuXf
	7bcLrf4qPxeBp7Sac8K4qQwSjzQE2Ex4BknBDBahNjnP90jObP5yfNRKd3/wPgp2FF76
	18H9CUv667ql92bcTPLYPlU4wQvkUIodGRfeM=
MIME-Version: 1.0
Received: by 10.231.19.201 with SMTP id c9mr6259637ibb.183.1296466988945; Mon,
	31 Jan 2011 01:43:08 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Mon, 31 Jan 2011 01:43:08 -0800 (PST)
Date: Mon, 31 Jan 2011 10:43:08 +0100
Message-ID: <AANLkTindnAy_ujVZdrRCbKmwOSos-FJT_=cy5T+BVir+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: binutils QA errors (RPATH)
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
X-List-Received-Date: Mon, 31 Jan 2011 09:44:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

From my testing build (20110128)

NOTE: package binutils-2.21-r13.2: task do_package: Started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/bin/embedspu
NOTE: Multiple libraries (libbfd-2.21.so, libopcodes-2.21.so) found
and LEAD_SONAME not defined
ERROR: QA Issue with binutils: package binutils contains bad RPATH
/home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/bin/powerpc-oe-linux-gnuspe-readelf
ERROR: QA Issue with binutils: package binutils contains bad RPATH
/home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/bin/powerpc-oe-linux-gnuspe-elfedit
ERROR: QA Issue with binutils: package binutils contains bad RPATH
/home/hudson/jobs/OE_test/workspace/tmp/sysroots/ppce500v2-oe-linux-gnuspe/usr/lib
in file /home/hudson/jobs/OE_test/workspace/tmp/work/ppce500v2-oe-linux-gnuspe/binutils-2.21-r13.2/packages-split/binutils/usr/lib/libbfd-2.21.so

Frans


