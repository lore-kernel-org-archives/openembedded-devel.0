Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHsAd-0000Ob-3r
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 07:31:50 +0200
Received: by pwi5 with SMTP id 5so372640pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=GmrZEMqXtgg6vgUw3ZHE16HU9ZhbBgMaa92vxxF6ilQ=;
	b=EtnQBowb1ZUX/5dFXXT6T2C/gFp5BzaTABJ0zjD46nv+7tjdavfZ8jAAzqJW6oFm8J
	ptiA5sFOQZuWOp6wuIh1LpC+N9Dxn9VG5TQI5Sda/RLrORYAiC40KGPS2uXX7cGyTpR0
	qpRCWJRfySMk1rabh7+2f6wExqhy7pWbuCgIo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=OLqp0q2pHCsjzwTYc/i9Yw/ScY8flKe/kMGqf/VoxIWMWDbIhKMIRiFX720dsc/j7T
	1YgJw1GyoR2qi4OE7QG3wfo5q7Tp/Xp4rKjkc4CIeFVaHXjpe/dfo2h3wdxDsVciVBii
	xEixTEvhffBVE8bOVwxkUM0YIo9aniWNY0dZ8=
Received: by 10.114.237.21 with SMTP id k21mr9986742wah.141.1275024456584;
	Thu, 27 May 2010 22:27:36 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 33sm16398667wad.20.2010.05.27.22.27.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 22:27:35 -0700 (PDT)
Date: Thu, 27 May 2010 22:27:20 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100528052720.GA15949@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: <package>-static name conflict with some recipes
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
X-List-Received-Date: Fri, 28 May 2010 05:31:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have seen that we have parallel recipes for some applications for static
build
called package-static.bb like below

./dialog/dialog-static_1.1-20080819.bb
./busybox/busybox-static_1.2.1.bb
./busybox/busybox-static_1.11.3.bb
./kexec-tools/kexec-tools-klibc-static_1.101.bb
./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
./klibc/klibc-utils-static_1.5.15+1.5.16.bb
./klibc/klibc-utils-static_1.5.18.bb
./klibc/klibc-utils-static_1.5.15.bb
./klibc/klibc-utils-static_1.5.bb
./klibc/klibc-utils-static_1.5.17.bb
./skype/skype-static_2.0.0.72.bb
./udev/udev-static-devices.bb
./udev/udev-static_124.bb

Now they conflict with the automatic package that we generate to bundle
static libraries. Since the the packages which bundle static libraries
are essentially development packages may be they should be called

<package>-dev-static instead of <package>-static

IMO that will avoid the conflict and also clarify the package content
a bit

Thoughts?

-Khem


