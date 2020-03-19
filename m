Return-Path: <SRS0=nN3C=5E=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EBED060CD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 13:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jp482yYlz3L;
	Thu, 19 Mar 2020 14:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584625336;
	bh=XK6xNLaKYDRbYKRMo3a6NyWSFFVInwhRI0OFSCDMD0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkncZfC5yQ5A5Y4jRqvRm7vz13nRniYentIlZIHEoa9vV344JwKjx1nCqLo49XoUI
	8dk4+m2XtEfD/AN1s6jY04KtQrAcTIsEZigIXrAZmvuSiCrmKcvVYXdlzmjiwyxRmI
	LKuJyu5wlSwyVERh5J7nGJe7FPU1EkgrREl2kRqRUq/DLhl+ywiQgKMxuul3U86Pn5
	emrkwnxmAEqVYdR0bqPwHkyXUEoOUVYNmN3hD9bedlHePG3P5s5/Gq9D8BWtixJpcy
	yAP0WS/gNqo1b0ZXXBxweOul2NsBrtSfK62lUWGgU1iW2ZHYSjDfwVyjczi8phhdje
	jXXdbCUBFEzN8y3zOQhcUWh5FOg9Z/b04gvw8uMawf9i9iqONmluq1HHC0V0yTquPA
	voNyHwjB0YGaTpci1gidOBktRrOOD26Zleg5ToHaZGq+TVQB1tJwZYx0s4FdgxbINk
	3EaKQDn0hnfjMeLEl2hUVWqw1uqqpZOxODLB/ivD3+boy8dUOVWK4cz0gL8kl3X6Yf
	e1rQdmodQvHj5u+QZL7sCEeZDu3yfYGxzMqtQhv5QaLEDH1SBGFcykr5nAkZI3K1lH
	Wq6JKu6P5PNWvZSvVY6wX4Q2ufLgPkgzYKwr0uG+M7Crw5RsTia47WB14kgRkjlJnH
	k30DB2P5pNJz9Pvlvn+Ei90g=
Date: Thu, 19 Mar 2020 15:42:13 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200319134213.GA29515@localhost>
References: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: proper way to report(?) conflicting files being installed?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 13:42:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 19, 2020 at 09:22:54AM -0400, Robert P. J. Day wrote:
>...
> +# ax_code_coverage.m4 and ax_check_enable_debug.m4 are in gnome-common only
> +# because older versions of autoconf-archive didn't have them yet. Now they
> +# are in autoconf-archive from OE-core. We depend on that below to ensure
> +# that recipes which only depend on gnome-common still get them.
> +do_install_append () {
> +    rm -f ${D}${datadir}/aclocal/ax_code_coverage.m4
> +    rm -f ${D}${datadir}/aclocal/ax_check_enable_debug.m4
> +}
> +RDEPENDS_${PN} += "autoconf-archive"
> +DEPENDS_append_class-native = " autoconf-archive-native"
> +
> 
>   it *appears* that solved the problem, which raises the question --
> should this patch be applied to the current gnome-common recipe? that
> patchwork entry dates back to 2017 ... should it have been applied at
> some point?

The currently implemented solution is:
# Default to enable autoconf-archive to avoid conflicts
PACKAGECONFIG ??= "autoconf-archive"
PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive, --without-autoconf-archive, autoconf-archive"

It is not clear to me why this gives the user to disable it
instead of unconditionally enabling it.

> rday

cu
Adrian

