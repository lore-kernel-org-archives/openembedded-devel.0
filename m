Received: from [64.233.162.202] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1GaG7h-0007yh-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 20:26:37 +0200
Received: by nz-out-0102.google.com with SMTP id q3so145000nzb
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2006 11:19:38 -0700 (PDT)
Received: by 10.64.156.12 with SMTP id d12mr14990679qbe;
	Wed, 18 Oct 2006 11:19:37 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Wed, 18 Oct 2006 11:19:37 -0700 (PDT)
Message-ID: <b9481e140610181119h27e8c720u69c20fad5e9de06@mail.gmail.com>
Date: Wed, 18 Oct 2006 20:19:37 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200610181240.31042.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <b9481e140610180154r5a3c5c0do543863a9b0b4c059@mail.gmail.com>
	<200610181240.31042.openembedded@hrw.one.pl>
Subject: Re: Bitbake: say who you are cooking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 18:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This is more verbose, but still it will tell me what version of the
package it will build only after having built all the dependencies. It
should tell the version it will compile before going with the
dependencies.

For example, just after the line:
NOTE: build 200610182011: started

Here is the output of a "bitbake --dry-run wpa-gui":

root@zhost:/opt/OE/build# bitbake --dry-run wpa-gui
NOTE: Using cache in '/opt/OE/build/tmp/cache'
NOTE: Handling BitBake files: \ (4004/4004) [100 %]
NOTE: Parsing finished. 0 cached, 3880 parsed, 124 skipped, 0 masked.

NOTE: build 200610182011: started

OE Build Configuration:
BB_VERSION     = "1.6.0"
OE_REVISION    = "cf30bb94f4666250edc553470fefa4459ef0af1e"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "spitz"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061018"
TARGET_FPU     = "soft"

NOTE: package binutils-cross-2.17: started
NOTE: package binutils-cross-2.17: completed
NOTE: preferred version 2.5 of glibc not available
NOTE: package uicmoc3-native-3.3.5: started
NOTE: package uicmoc3-native-3.3.5: completed
NOTE: package mysql-native-4.1.18: started
NOTE: package mysql-native-4.1.18: completed
NOTE: package mysql-4.1.18: started
NOTE: package mysql-4.1.18: completed
NOTE: package qt-x11-free-3.3.6: started
NOTE: package qt-x11-free-3.3.6: completed
NOTE: package wpa-gui-0.4.8: started
NOTE: package wpa-gui-0.4.8: completed
NOTE: build 200610182011: completed
Build statistics:
  Attempted builds: 6


> "bitbake --dry-run foo" do what you seek for.


