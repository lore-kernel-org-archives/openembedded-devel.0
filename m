Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id C5C8E65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 09:47:57 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 2 Oct 2014 11:47:55 +0200
Date: Thu, 2 Oct 2014 11:47:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141002094731.GA4821@ad.chargestorm.se>
Mail-Followup-To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1411996185.git.anders@chargestorm.se>
	<c3982a9e7a7182cfb3f0147477202f0c7b15858a.1411996185.git.anders@chargestorm.se>
	<20141001151952.GD25706@jama>
MIME-Version: 1.0
In-Reply-To: <20141001151952.GD25706@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 1/1] breakpad: install static library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Oct 2014 09:48:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [141001 17:19]:

> On Mon, Sep 29, 2014 at 03:10:30PM +0200, Anders Darander wrote:
> > In order to build against breakpad when using an SDK, we need to also package
> > libbreakpad_client.a.

> > The SDK will then need to add breakpad-staticdev to TOOLCHAIN_TARGET_TASK.

> Fails in world builds:
> |  ( cd '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/image/usr/lib' && arm-oe-linux-gnueabi-ranlib libbreakpad.a )
> |  ( cd '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/image/usr/lib' && arm-oe-linux-gnueabi-ranlib libbreakpad_client.a )
> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/build'
> | install: cannot stat `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/trunk/src/client/linux/libbreakpad_client.a': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/breakpad/svn-r0/temp/log.do_install.11600)
> NOTE: recipe breakpad-svn-r0: task do_install: Failed

> I guess it should be installed from ${B}

Thanks, I'll re-test and send a v2 once I've made a clean build.

I guess I mixed up all my own branches, as most of the work has been
done on a daisy-based branch. :(

Cheers,
Anders

