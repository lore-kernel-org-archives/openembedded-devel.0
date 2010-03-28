Received: from ey-out-1920.google.com ([74.125.78.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1NvkFG-0002Jl-Q0
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 06:37:07 +0200
Received: by ey-out-1920.google.com with SMTP id 26so834684eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:cc:content-type;
	bh=r5MOLFSazlVk4kx5+6ZMlR57KpWhRyi5P60OtXYoP/s=;
	b=x24UElmnPi4DTAGImoRwOYbV27kkoFEvbcq8VJZTZlzMUqQ4qZ/8Tzcrxyl1P+YnYU
	vt9hZE+zKr37+8xdb/qi3KPf5ichnd8+45OZOrOmZ6+JKG2U8dCca6P3BQhV3PYJ9xTT
	ZMlFsTMDqSsiq5sx3sYW0eoL8G+HMOMj/U9YY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=Xug1r4IKBt6MZj3S0z8U0pCTAbwFIrGKZ3v1u+o7toms++h77kEXn86u0ApXzOd9LX
	JpSJgywMf6357+pajQIOBb4+AP1FN0mDZ3qe2PsOXXK+zJmtGEgum5/bbFSGiyETZIqv
	rLbFG9sLLZvB0PUWBhQH4lvNE+pP+ItSHCpSo=
MIME-Version: 1.0
Received: by 10.213.108.145 with HTTP; Sat, 27 Mar 2010 21:33:55 -0700 (PDT)
Date: Sun, 28 Mar 2010 05:33:55 +0100
Received: by 10.213.52.195 with SMTP id j3mr1661979ebg.33.1269750835295; Sat, 
	27 Mar 2010 21:33:55 -0700 (PDT)
Message-ID: <359c5481003272133x42761a04xeb6d10829fec83f6@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: SHR-devel <shr-devel@projects.openmoko.org>
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: qt4 sqlite plugin crash
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
X-List-Received-Date: Sun, 28 Mar 2010 04:37:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!
It seems qt sqlite plugin crashes on my custom built image (derived
from the current shr-testing branch).
Is this a know bug or am I missing somethings?

Step to reproduce:

opkg install qt4-examples qt4-plugin-sqldriver-sqlite
gdb /usr/bin/qt4/examples/sql/relationaltablemodel/relationaltablemodel

GNU gdb (GDB) 7.0
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-oe-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from
/usr/bin/qt4/examples/sql/relationaltablemodel/relationaltablemodel...(no
debugging symbols found)...done.
(gdb) run
Starting program:
/usr/bin/qt4/examples/sql/relationaltablemodel/relationaltablemodel
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
QIconvCodec::convertFromUnicode: using ASCII for conversion, iconv_open failed
QIconvCodec::convertToUnicode: using ASCII for conversion, iconv_open failed
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.
warning: Unable to find libthread_db matching inferior's thread
library, thread debugging will not be available.

Program received signal SIGSEGV, Segmentation fault.
0x4131e5fc in ?? () from /usr/lib/qt4/plugins/sqldrivers/libqsqlite.so
(gdb) backtrace
#0  0x4131e5fc in ?? () from /usr/lib/qt4/plugins/sqldrivers/libqsqlite.so
Cannot access memory at address 0x0
#1  0x4132fed4 in ?? () from /usr/lib/qt4/plugins/sqldrivers/libqsqlite.so
Cannot access memory at address 0x0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb)

Regards

      Niko


