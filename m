Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgfCE-0005x2-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 18:25:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2532216eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Dec 2012 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:to:subject:in-reply-to:x-mailer:mime-version
	:content-type; bh=ehFXbEKBD4lqx0LvqwUk+ZYsYcHp7i2GHwyLhTty0lU=;
	b=x5xDC/4Un8fqB0Znvvq3NmFCPsClw57/iUbBQAfKtr/Wb71LjlPymWp0WGJbndZkwn
	B2Ue7CsvM9S7RPKgWEDZIR0KjXab1nfIulvFgdFT9/AH3AsAYMaigx+MxF64T10s5VfN
	d8y+3flpzuEwhGJIq/dhBJJEEXiXUHBnwOnc3nhmFcQ9iyOB5Oy+GCRtoyMIeHtjyM/S
	vnlUwsexzXSaNuiUjB1velNQipWUTTZfqtiXbQ5WbW8D97tWGr8c7bjQcz7SxbYzkS3S
	22rvyu5aU7BJaC05LbbVmXcWC2VaBYxxsPBBDxXarG5JbkJ9aRGmcCvsIGVhDlByyfLi
	1MUg==
Received: by 10.14.205.198 with SMTP id j46mr7600392eeo.27.1354813848907;
	Thu, 06 Dec 2012 09:10:48 -0800 (PST)
Received: from www.palm.com (092248071142.atmpu0039.highway.a1.net.
	[92.248.71.142])
	by mx.google.com with ESMTPS id v46sm17022443eep.1.2012.12.06.09.10.47
	(version=SSLv3 cipher=OTHER); Thu, 06 Dec 2012 09:10:48 -0800 (PST)
Message-ID: <50c0d198.c6df0e0a.4813.ffffc0d4@mx.google.com>
Date: Thu, 06 Dec 2012 18:10:47 +0100
From: "Martin  Jansa" <martin.jansa@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
In-Reply-To: <20121206054852.GA13286@ad.chargestorm.se>
X-Mailer: Palm webOS
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 68/77] systemd: add target python to depends
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
X-List-Received-Date: Thu, 06 Dec 2012 17:25:14 -0000
Content-Type: text/plain; charset="UTF-8"

   Yes but there is patch to reenable python support in systemd in this
   patchset. The main motivation was to fix python-pyudev build, but it's
   not enough, so I'm open to remove both patches from patchset.
   Cheers

   -- Sent from my HP TouchPad
   __________________________________________________________________

   On 6.12.2012 6:48, Anders Darander <anders@chargestorm.se> wrote:
   * Martin Jansa <martin.jansa@gmail.com> [121205 19:32]:
   > * pythonnative adds only python-native to DEPENDS, but we need target
   python for working python-config
   > checking for python-config...
   /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python
   -native/python-config
   > Traceback (most recent call last):
   > File
   "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pytho
   n-native/python-config", line 24, in <module>
   > pyver = sysconfig.get_config_var('VERSION')
   > File
   "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/pytho
   n2.7/distutils/sysconfig.py", line 602, in get_config_var
   > return get_config_vars().get(name)
   > File
   "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/pytho
   n2.7/distutils/sysconfig.py", line 518, in get_config_vars
   > func()
   > File
   "/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/pytho
   n2.7/distutils/sysconfig.py", line 416, in _init_posix
   > raise DistutilsPlatformError(my_msg)
   > distutils.errors.DistutilsPlatformError: invalid Python installation:
   unable to open
   /OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/python2.7/
   config/Makefile (No such file or directory)
   Which steps are introducing these errors?
   I'm curious as systemd has been built without this native python
   previously, and we're also adding --without-python to EXTRA_OECONF.
   Thus, to me it seems fishy if we should need to add that depends.
   Though, there might be a good reason, I guess.
   As usual I'm slightly worried about build time...
   Cheers,
   Anders
   --
   Anders Darander
   ChargeStorm AB / eStorm AB
   _______________________________________________
   Openembedded-devel mailing list
   Openembedded-devel@lists.openembedded.org
   http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

