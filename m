Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JT5dn-0005EL-QQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2008 02:26:57 +0100
Received: by ug-out-1314.google.com with SMTP id i24so371396ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2008 17:26:37 -0800 (PST)
Received: by 10.67.23.5 with SMTP id a5mr1132228ugj.8.1203816396944;
	Sat, 23 Feb 2008 17:26:36 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id e23sm2308400ugd.56.2008.02.23.17.26.35
	(version=SSLv3 cipher=OTHER); Sat, 23 Feb 2008 17:26:36 -0800 (PST)
Date: Sun, 24 Feb 2008 03:29:19 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080224032919.01451fed@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.174
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Situation with qemu-native and its FB support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2008 01:26:58 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I just found that qemu-native no longer supports FB emulation, quitting
with "Could not initialize SDL - exiting", while it worked some time
ago (within 2 last months). Tracing thru changes to figure out what
could have happened, I'm finding that it really couldn't work at all -
we build libsdl-native with no video driver enabled for quite some
time, and qemu DEPENDs on it for quite some time either. This is all
aggravated with XV/OpenGL problems I started to have here after ATI
drivers upgrade.

So, does anybody else experience this? Is full-fledged device emulation
(with FB for example) within scope of qemu-native at all? I have to say
that the need to have X11 development packages installed to just build
an OE image (due to need of qemu-native to generate glibc locales)
wasn't ideal, but at the same time it's convenient to have fresh qemu
build to do general emulation.

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


