Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UTC4m-0006wq-It
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 16:14:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2013 06:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,509,1363158000"; d="scan'208";a="324893958"
Received: from unknown (HELO helios.localnet) ([10.255.13.209])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2013 06:56:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Wayne Warren <steven.w.warren@gmail.com>
Date: Fri, 19 Apr 2013 14:56:31 +0100
Message-ID: <1488847.vh4yAelbek@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1366376983-26493-1-git-send-email-steven.w.warren@gmail.com>
References: <1366376983-26493-1-git-send-email-steven.w.warren@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qtserialport: Adds initial recipe.
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
X-List-Received-Date: Fri, 19 Apr 2013 14:14:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Wayne,

Some of this feedback is a little bit pedantic I'm afraid, but it's probably 
best to get everything right.

On Friday 19 April 2013 08:09:43 Wayne Warren wrote:
> ---

Please include Signed-off-by.

>  meta-oe/recipes-qt/qtserialport/qtserialport.inc   |   34
> ++++++++++++++++++++ .../recipes-qt/qtserialport/qtserialport_5.1.0.bb  |  
>  6 ++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport.inc
>  create mode 100644 meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
> 
> diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport.inc
> b/meta-oe/recipes-qt/qtserialport/qtserialport.inc new file mode 100644
> index 0000000..09f2f9a
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qtserialport/qtserialport.inc
> @@ -0,0 +1,34 @@
> +DESCRIPTION = "Qt Serial Port Library"

Would you mind using SUMMARY instead of DESCRIPTION here? (DESCRIPTION will be 
set from SUMMARY as well).

> +SECTION = "qt/libs"
> +HOMEPAGE = "http://qt-project.org/wiki/QtSerialPort"
> +
> +LICENSE = "LGPL FDL GPL "

I'm not 100% sure, but I think for this particular piece of software, this 
should actually be "(LGPL-2.1 | GPL-3.0) & GFDL-1.3"

> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
> +    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
> +    file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
> +    "
> +
> +inherit qt4e pkgconfig

If this is to be built against Qt Embedded, the recipe should be named 
qtserialport-e; in fact I'd suggest replacing this with just "inherit 
pkgconfig" and then adding "inherit qt4e" to the .bb file and then it would be 
possible for someone else to create a qtserialport-x11 recipe that used the 
same inc file.

> +SRC_URI = " \
> +    git://gitorious.org/qt/qtserialport.git \
> +"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/${BPN}-${PV}"
> +
> +QMAKE_PROFILES="${S}/qtserialport.pro"
> +EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"

I think this should be ${prefix} rather than hardcoding /usr.

> +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
> +
> +do_compile_append() {
> + 	BOGUS_PREFIX=`qmake2 -query QT_INSTALL_PREFIX`
> +	for f in `find ${B} -name "Makefile"` ;do
> +		sed -i -e "s|\(\$(INSTALL_ROOT)\)${BOGUS_PREFIX}|\1${prefix}|g" ${f}
> +	done
> +}

It seems a bit extreme to me that this should be necessary; googling suggests 
that qt.conf is supposed to be used to override QT_INSTALL_PREFIX. My build is 
still running so I haven't been able to check if this can work yet or if 
there's an alternative method but I'll let you know.

> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D} INCLUDEDIR=${includedir}
> +}
> diff --git a/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
> b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb new file mode
> 100644
> index 0000000..d903eb3
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qtserialport/qtserialport_5.1.0.bb
> @@ -0,0 +1,6 @@
> +require qtserialport.inc
> +
> +PR = "r0"

This doesn't need to be set this since it's the default value (and we're no 
longer incrementing this value manually).

> +
> +SRCREV="22e45f0b0f956c025339d72ad53dca57ef684858"
> +

This is really pedantic, but we usually prefer spaces around the assignment 
(as you have elsewhere.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


