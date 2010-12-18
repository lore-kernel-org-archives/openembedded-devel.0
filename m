Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PTsCy-00043o-KZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:32:04 +0100
Received: by ewy8 with SMTP id 8so732245ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 00:32:02 -0800 (PST)
Received: by 10.213.101.5 with SMTP id a5mr2052001ebo.93.1292661122081;
	Sat, 18 Dec 2010 00:32:02 -0800 (PST)
Received: from mozart.localnet (95-29-187-197.broadband.corbina.ru
	[95.29.187.197])
	by mx.google.com with ESMTPS id q58sm908304eeh.15.2010.12.18.00.31.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 18 Dec 2010 00:31:58 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Dec 2010 11:31:27 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.4; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201012181131.27436.jay4mail@gmail.com>
Subject: e2fsprogs do_install failed ('uuid' absence)
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
X-List-Received-Date: Sat, 18 Dec 2010 08:32:04 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello!

Most of my tonight's build was failed because of e2fsprogs.
Bitbake master, latest OE tree.

Below are links to tinderbox but all logs was truncated today. Looks like close() was not called before oestats-client uploaded the log.

http://tinderbox.openembedded.net/packages/1352620/
http://tinderbox.openembedded.net/packages/1354448/
http://tinderbox.openembedded.net/packages/1355387/
http://tinderbox.openembedded.net/packages/1364600/

Typical log message is below:
| make[1]: Leaving directory `/storage/oe/testbuilder/build/testing/angstrom-2008.1/armv5/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.41.12-
r26/e2fsprogs-1.41.12/intl'
| mv: cannot stat `/storage/oe/testbuilder/build/testing/angstrom-2008.1/armv5/work/armv5te-angstrom-linux-gnueabi/e2fsprogs-1.41.12-
r26/image/sbin/uuid': No such file or directory
NOTE: package e2fsprogs-1.41.12-r26: task do_install: Failed
ERROR: Function 'do_install' failed (see /storage/oe/testbuilder/build/testing/angstrom-2008.1/armv5/work/armv5te-angstrom-linux-
gnueabi/e2fsprogs-1.41.12-r26/temp/log.do_install.18126 for further information)

-- 
Yury Bushmelev


