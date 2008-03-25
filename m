Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JeBN7-00006d-9g
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 16:47:33 +0100
X-ASG-Debug-ID: 1206460051-3fbf000e0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 116F62A045
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 10:47:32 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 6IozBB4fqAVGKHpl for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 10:47:32 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 can build "base-image" target
Date: Tue, 25 Mar 2008 10:47:36 -0500
User-Agent: KMail/1.9.7
References: <200803251023.51386.geoffrey@pager.net>
In-Reply-To: <200803251023.51386.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200803251047.36750.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1206460052
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: AVR32 can build "base-image" target
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
X-List-Received-Date: Tue, 25 Mar 2008 15:47:33 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 25 March 2008 10:23:51 am Geoffrey Wossum wrote:
> Hi all,
>
> I just submitted patches to the OpenEmbedded Bugzilla that will allow you
> to build the Angstrom 2008.1 "base-image" target for the AVR32.  Bug #4123
> (http://bugs.openembedded.net/show_bug.cgi?id=4123).

For anyone interested, here's my local.conf for the AVR32, minus all comments 
and blank lines:

---begin---
DL_DIR = "${PRJROOT}/sources"
BBFILES = "${PRJROOT}/org.openembedded.dev/packages/*/*.bb"
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " 
virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_VERSION_linux = "2.6.23"
MACHINE = "at32stk1000"
TARGET_OS = "linux-uclibc"
DISTRO = "angstrom-2008.1"
ANGSTROM_MODE = "uclibc"
IMAGE_FSTYPES = "ext3 jffs2 tar"
BBDEBUG = "yes"
PARALLEL_MAKE = "-j 3"
BBINCLUDELOGS = "yes"
---end---


---
Geoffrey


