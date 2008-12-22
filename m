Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LEhAs-000396-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Dec 2008 10:34:06 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LEh5y-00073M-0j for openembedded-devel@lists.openembedded.org;
	Mon, 22 Dec 2008 17:29:12 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LEh6W-0002SH-3k
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Dec 2008 17:29:36 +0800
Date: Mon, 22 Dec 2008 17:29:36 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20081222092936.GY2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Please review john_lee/openmoko-toolchain
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
X-List-Received-Date: Mon, 22 Dec 2008 09:34:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

This branch contains just 4 extra commits but these are highly
controversial.


    meta-toolchain.bb: introduce POPULATE_SDK_EXTRA_TASK
    
    In case some more modifications are required before the toolchain is
    packaged up, introduce this variable to do extra tasks right before
    packaging.


    meta-toolchain-openmoko.bb: add feed to toolchain
    
    By modifying the opkg config files in the toolchain, the toolchain can
    expend itself by installing packages from the repository.


We need to do some modifications to the contents of toolchain before
the packaging complete, so we use this variable as a hook.  The
modification is to create an opkg config file so the toolchain knows
where to get new packages.  A better way might be to install
distro-feed-configs, but that includes several opkg config files while
alias 'opkg-target' uses just one: opkg.conf.


    libtool-sdk_1.5.10.bb, meta-toolchain.bb, task-sdk-host.bb: introduce
    sysroot libtool-sdk.
    
    Add libtool-sdk to help the meta toolchain using the .la files.  Patch
    add_sysroot_function.patch is applied to teach libtool about
    LIBTOOL_SYSROOT_PATH .
    
    task-sdk-host.bb is updated along with its consumers to include
    libtool-sdk, and meta-toolchain.bb is updated to include this
    environment variable.


After some packages is installed by user to extend the toolchain, one
will find out that the .la files in the -dev packages often contain
incorrect paths.  In order to solve that, LIBTOOL_SYSROOT_PATH is
introduced, and it works just like PKG_CONFIG_SYSROOT_DIR.

This patch is posted to upstream already:

http://lists.gnu.org/archive/html/libtool-patches/2008-12/msg00000.html


    autotools.bbclass: adding do_install_append() to autotools.bbclass
    
    This function is used to correct .la files.  Many bb files use their
    own do_install so just adding this into the original
    autoclass_do_install won't work.  This ensures the .la files contain
    correct path.


The last commit along is not enough to fix the .la files.  This
enforces do_install to check the .la files and fix them.


Comments?  Flames?


Regards,
John


