Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JYQcN-0004GQ-Gk
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 19:51:36 +0100
Received: by an-out-0708.google.com with SMTP id b33so357351ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Mar 2008 11:49:43 -0700 (PDT)
Received: by 10.100.137.11 with SMTP id k11mr9430931and.38.1205088583936;
	Sun, 09 Mar 2008 11:49:43 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 9 Mar 2008 11:49:43 -0700 (PDT)
Message-ID: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
Date: Sun, 9 Mar 2008 19:49:43 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.250
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc-cross-initial.inc DEPENDS on libc-initial, but why conditionally on TARGET_ARCH?
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
X-List-Received-Date: Sun, 09 Mar 2008 18:51:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

OE toolchain question: any reason why the list below includes arm*,
mips* but nothing else?

gcc-cross-initial.inc:

DEPENDS = "virtual/${TARGET_PREFIX}binutils"
DEPENDS += "${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVar('TARGET_ARCH',
d, 1) in ['arm', 'armeb', 'mips', 'mipsel']]}"
PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
PACKAGES = ""

(I'm tracking down a parallel make issue, this seems to cause/trigger
it as I build for powerpc).

Thanks,
-- 
Leon


