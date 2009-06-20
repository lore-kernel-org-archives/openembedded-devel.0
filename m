Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI5Oe-0003vz-71
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 20:34:36 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ000VBV3IPG00@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 11:23:48 -0700 (PDT)
Message-id: <8FA0FE1F-E57A-4E3C-99E8-81E6BD6BA72B@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245521341.29153.288.camel@lenovo.internal.reciva.com>
Date: Sat, 20 Jun 2009 22:23:27 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 18:34:36 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		Thanks for the input! :-)

On Jun 20, 2009, at 10:09 PM, Phil Blundell wrote:

> Try:
>
> do_compile() {
> 	oe_runmake SUBDIRS="src doc examples"
> }
>

I made the required changes but now get the following error:

| Making all in src
| /bin/sh: line 17: cd: src: No such file or directory
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/doc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed



Here is what the full recipe looks like:

DESCRIPTION = "C++ library for serial port support."
SECTION = "libs"
LICENSE = "GPL"
HOMEPAGE = "http://libserial.sourceforge.net/mediawiki/index.php/Main_Page 
"
DEPENDS = ""

SRC_URI = "${SOURCEFORGE_MIRROR}/libserial/libserial-${PV}.tar.gz"

S = "${WORKDIR}/libserial-${PV}"

inherit autotools pkgconfig

do_compile() {
	oe_runmake SUBDIRS="src doc examples"
}

do_stage() {
	autotools_stage_all
}




Best regards,

Elvis



