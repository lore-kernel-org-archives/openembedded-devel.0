Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1S6mBm-00040Q-96
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 18:04:10 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2F9AB2232636;
	Sun, 11 Mar 2012 17:55:30 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 540272232635;
	Sun, 11 Mar 2012 17:55:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225164073.adsl.alicedsl.de
	[92.225.164.73]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 11 Mar 2012 17:55:29 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E12C23C4B9; Sun, 11 Mar 2012 17:55:27 +0100 (CET)
Date: Sun, 11 Mar 2012 17:55:27 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120311165527.GA24330@rhein.zuhause.netz>
References: <1331467277-7665-1-git-send-email-ajlennon@dynamicdevices.co.uk>
MIME-Version: 1.0
In-Reply-To: <1331467277-7665-1-git-send-email-ajlennon@dynamicdevices.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: Re: [PATCH] Backported libgdiplus 2.10 from meta-mono
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
X-List-Received-Date: Sun, 11 Mar 2012 17:04:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 11, 2012 at 12:01:17PM +0000, ajlennon@dynamicdevices.co.uk wrote:
> From: Alex J Lennon <ajlennon@gmail.com>
> +SRC_URI[md5sum] = "451966e8f637e3a1f02d1d30f900255d"
> +SRC_URI[sha256sum] = "2d9e0397ef5583ed855eaafcdac8cabbe1d58463ed1e4b545be6dde5b63712a4"
> +
> +
> +FILES_${PN} += "${libdir}/libgdiplus.so"
> +INSANE_SKIP_${PN} += "dev-so"
> +
> +do_install_append() {
> +  # fix pkgconfig .pc file
> +  sed -i -e s#I${STAGING_DIR_HOST}#I#g ${D}${libdir}/pkgconfig/*.pc
> +}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I tought this is handled by the pkgconfigi.bbclass which you inherit.

Bye Henning


