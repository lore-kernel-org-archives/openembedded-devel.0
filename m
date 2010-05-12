Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OCGQ2-0004cl-Gn
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:12:32 +0200
Received: by qyk2 with SMTP id 2so242425qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=x2jQmlGwOxuDsRk8Ocr3khEKZtzeUuO6mwC7lR0E7z4=;
	b=nVyF0wi33T6aUEW5FHqHESvncIyoJ1jAkqmt0Iwi8l2e6/3u3jiPUVLYqVKTUBliDC
	fFg/+GA5IJhC3UCyCBNpBlNFyGjfh3wy5mgQIF9BihvCHHVRICcaOe4Eg3IoBRRryH/H
	efqSmo99+QcI0GDJAnXu19+FWdWsedyTKfa58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WeRAl8WibZGb2yFqW8aFYF1lUK9Fd8olUQ9E0uQ7ZgqMZdGMWkMhOlgTLJdzt5Antq
	9v/JelIMosSDyMdT/Vp+16ui1miAQV2QIGfTVfX57bVT5qGS1F+K4x1GIAN9LcKV+Hwg
	UtNww4vQ39ACqWwao/s3e5vWX7GGzA4FJjhuY=
MIME-Version: 1.0
Received: by 10.224.88.72 with SMTP id z8mr5326190qal.151.1273687713564; Wed, 
	12 May 2010 11:08:33 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Wed, 12 May 2010 11:08:33 -0700 (PDT)
Date: Wed, 12 May 2010 11:08:33 -0700
Message-ID: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 18:12:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Building from recent pull of oe.dev (yesterday)

Anyone else seeing this?

Steve


ERROR: function do_compile failed
ERROR: log data follows
(/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/temp/log.do_compile.29091)
| NOTE: make -j 4
| make  all-recursive
| make[1]: Entering directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet'
| Making all in src
| make[2]: Entering directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'
| Making all in lib
| make[3]: Entering directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src/lib'
|   CC     libeet_la-eet_lib.lo
|   CC     libeet_la-eet_data.lo
|   CC     libeet_la-eet_image.lo
|   CC     libeet_la-eet_cipher.lo
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
| cc1: internal compiler error: in add_path, at c-incpath.c:425
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
| cc1: internal compiler error: in add_path, at c-incpath.c:425
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[3]: *** [libeet_la-eet_image.lo] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [libeet_la-eet_data.lo] Error 1
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
| cc1: internal compiler error: in add_path, at c-incpath.c:425
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[3]: *** [libeet_la-eet_lib.lo] Error 1
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
| cc1: internal compiler error: in add_path, at c-incpath.c:425
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[3]: *** [libeet_la-eet_cipher.lo] Error 1
| make[3]: Leaving directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src/lib'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet'
| make: *** [all] Error 2
| FATAL: oe_runmake failed


