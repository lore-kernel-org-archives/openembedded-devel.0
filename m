Received: from [213.4.149.66] (helo=ctsmtpout4.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GSZ60-0000dG-IG
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 15:05:04 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout4.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 45197045000263B7 for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 15:00:06 +0200
Message-ID: <451A8390.1050704@adtelecom.es>
Date: Wed, 27 Sep 2006 14:58:40 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Error detecting generated glibc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2006 13:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to build images using the following compiler, library and 
binutils:

PREFERRED_VERSION_gcc-cross = "3.3.2"
PREFERRED_VERSION_gcc-cross-initial = "3.3.2"
PREFERRED_VERSION_gcc = "3.3.2"
PREFERRED_VERSION_glibc = "2.3.2-pxa27x"
PREFERRED_VERSION_glibc-initial = "2.3.2-pxa27x"

PREFERRED_VERSION_binutils-cross = "2.14.90.driscoll"
PREFERRED_VERSION_binutils = "2.14.90.driscoll"
PREFERRED_VERSION_linux-libc-headers = "2.6.11.1"

The compiler and the library are generated with no problems. The 
problems appears that before compiling a package, bitbake checks its 
dependences. It determines that the glic-2.3.2-pxa27x insn't existing 
and then starts to build glic-2.4 (it is not possible due to gcc version).

A sample of the logs are provided:

DEBUG: already built 
/home/qduran/oe/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb 
in this run
DEBUG: Additional runtime dependencies for ncurses-native are:
DEBUG: Additional runtime dependencies for ncurses are:
DEBUG: providers for virtual/libintl are: ['glibc', 'gettext']
DEBUG: update_data()
NOTE: preferred version 2.3.2-pxa27x of glibc not available
DEBUG: update_data()
DEBUG: selecting 
/home/qduran/oe/org.openembedded.dev/packages/glibc/glibc_2.4.bb to 
satisfy virtual/libintl

Why does it happens?


Thanks and Best Regards,
Joaquim Duran


