Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S09p5-0002QS-Tf
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:53:23 +0100
Received: from [192.168.0.35] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id CD0492820A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 09:43:45 +0000 (GMT)
Message-ID: <4F44C53E.9030602@communistcode.co.uk>
Date: Wed, 22 Feb 2012 10:36:46 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Angstrom/OE-dev: cpufrequtils failure
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
X-List-Received-Date: Wed, 22 Feb 2012 10:53:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to build the systemd-image for Angstrom and I run into an 
error with cpufrequtils as detailed below:

    ERROR: Function failed: do_install (see
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/temp/log.do_install.16196
    for further information)
    + cd
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/git
    + do_install
    + oe_runmake -e install
    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image
    + '[' xmake = x ']'
    + bbnote make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
    'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc' STRIPCMD=echo
    -e install
    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image
    + echo 'NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
    LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo -e
    install
    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image'
    NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
    LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo -e
    install
    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image
    + make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
    'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc' STRIPCMD=echo
    -e install
    DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image
    /usr/bin/install -c -d
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image/usr/lib
    /usr/bin/install -c -d
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image/usr/bin
    /usr/bin/install -c -m 644 -D man/cpufreq-set.1
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image/usr/share/man/man1/cpufreq-set.1
    /usr/bin/install -c -d
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r2/image/usr/share/locale
    make: /usr/bin/install: Command not found
    make: *** [install-man] Error 127
    make: *** Waiting for unfinished jobs....
    make: /usr/bin/install: Command not found
    make: *** [install-tools] Error 127
    make: /usr/bin/install: Command not found
    make: *** [install-lib] Error 127
    make: /usr/bin/install: Command not found
    make: *** [install-gmo] Error 127
    Translating de ...... done.
    54 translated messages.
    Translating fr ...... done.
    45 translated messages, 7 fuzzy translations, 2 untranslated messages.
    Translating it ...... done.
    54 translated messages.
    Translating cs ...... done.
    45 translated messages, 7 fuzzy translations, 2 untranslated messages.
    Translating pt ...... done.
    54 translated messages.
    + die 'oe_runmake failed'
    + bbfatal 'oe_runmake failed'
    + echo 'ERROR: oe_runmake failed'
    ERROR: oe_runmake failed
    + exit 1

Now I assume this means that 'install' needs to be added to the build 
deps of cpufrequtils? I'm no expert in this though so would it just be a 
matter of adding 'install' to the depends variable?

Regards,
Jack.

