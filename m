Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MjApt-0000PX-QN
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 13:50:42 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1486C110023A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2009 13:31:52 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7507511000AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2009 13:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225145095.adsl.alicedsl.de
	[92.225.145.95]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2009 13:31:51 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B83563C323; Thu,  3 Sep 2009 13:31:50 +0200 (CEST)
Date: Thu, 3 Sep 2009 13:31:50 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090903113150.GA22344@rhein.zuhause.netz>
References: <431b13f90909021248y7e0cc019pfb388fe9b3d2fc8e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <431b13f90909021248y7e0cc019pfb388fe9b3d2fc8e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] add nzbget and libpar2
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
X-List-Received-Date: Thu, 03 Sep 2009 11:50:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2009 at 09:48:46PM +0200, Artur Wronowski wrote:
> Hello!
> 
> This is my first patch to openembedded. I woud like add nzbget and libpar2.
> 
> +inherit autotools pkgconfig
> +
> +do_stage() {
> +	autotools_stage_all
> +}
> +

You can use autotools_stage here, do avoid the extrad do_stage


> diff --git a/recipes/nzbget/nzbget_0.6.0.bb b/recipes/nzbget/nzbget_0.6.0.bb
> new file mode 100644
> index 0000000..1f75124
> --- /dev/null
> +++ b/recipes/nzbget/nzbget_0.6.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "NZBGet is a command-line based binary newsgrabber for nzb files, written in C++"
> +SECTION = "net"
> +LICENSE = "GPL"
> +HOMEPAGE = "http://nzbget.sourceforge.net/Main_Page"
> +DEPENDS = "libsigc++-2.0 libpar2 ncurses libxml2"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}.tar.gz"
> +# http://sourceforge.net/projects/nzbget/files/nzbget-stable/nzbget-0.6.0.tar.gz
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--disable-tls \

Why is tls disabled here?

> +		--with-libcurses-libraries=${STAGING_LIBDIR} \
> +		--with-libcurses-includes=${STAGING_INCDIR} \
> +		--with-libpar2-includes={STAGING_INCDIR} \
> +		--with-libpar2-libraries={STAGING_INCDIR}"
> +
> +do_stage() {
> +	autotools_stage_all
> +}

autotools_stage again

> diff --git a/recipes/nzbget/nzbget_0.7.0-testing.bb b/recipes/nzbget/nzbget_0.7.0-testing.bb
> new file mode 100644
> index 0000000..e0f9b5c
> --- /dev/null
> +++ b/recipes/nzbget/nzbget_0.7.0-testing.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "NZBGet is a command-line based binary newsgrabber for nzb files, written in C++"
> +SECTION = "net"
> +LICENSE = "GPL"
> +HOMEPAGE = "http://nzbget.sourceforge.net/Main_Page"
> +DEPENDS = "libsigc++-2.0 libpar2 ncurses libxml2"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/nzbget/nzbget-stable/nzbget-${PV}-r342.tar.gz"
> +
> +# http://sourceforge.net/projects/nzbget/files/nzbget-testing/nzbget-0.7.0-testing-r342.tar.gz
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--disable-tls \
> +		--with-libcurses-libraries=${STAGING_LIBDIR} \
> +		--with-libcurses-includes=${STAGING_INCDIR} \
> +		--with-libpar2-includes={STAGING_INCDIR} \
> +		--with-libpar2-libraries={STAGING_INCDIR}"
> +
> +do_stage() {
> +	autotools_stage_all
> +}
> +

Bye Henning


