Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9247F7FA2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 09:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47NFP64Mbnz4J;
	Wed, 27 Nov 2019 10:10:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574845850;
	bh=wfGub8RA5GCPHSp1gf0QWkmUhCZFK5o9GZgRU0sChkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvbKPBrHVfyDCI4DafKF3nvxRYiNhYOuiXu2DjZWZxmGbQeSTYZxjZDzrQq45g+Dw
	IP27XF+PgBCzRiRdTJU/Dpg2DKZV33Zz/F2PROLpnV6UnzPVu6bC8Fek7nLjQMMqoK
	XH/p0sXtzKXc9Nszj10EEb7qhqkRoVsM2j72FwQfnQ35fKcLfN+szFIAfQPD/ROz/D
	U+wxvdQBD/2s0BQVKxxdmfLnB728VrxFxqAwcPvokAjA2fk57TazUjo7isUW5gwd/b
	x3Fim0m9XiP79kU5o75z7KfuFhHm4oQ1bGGT24RG0ufSMNEtfRTXTPEyuhfdwX0kax
	tA9KsplTrZwSsXv0WDhZJKxjgnzRfRw03Uyh9wTY7s2kgcEPbER2Lw9+279nxinUO8
	uurWoy+X5b4zQ2WZqerx0vvD0gvFvNAxCo2QCcpiB/s2Bt1ANqGf7Gz5TYUO+qXK4a
	Dy0h+NoOn0L2cd5yEKdOVEJoNYkabPtdsLR6Hol2DbBDKf4tM3ZXSYYtgiOhUKnfLM
	R0SaFPDTV1Fb1TQtwMpTgl83RQP4uKTTiJLgmQzBDJRfDHK01qCEKkpwZLHDqibM65
	lJUjsYtCwLnpjbV0ko4gm7ih8I9dPqBsEsVT+hHr1hbOs5Y2bt7WCW+4EOheU6ggZc
	FeKLyJPsJYKGwsWYVSEMU8So=
Date: Wed, 27 Nov 2019 11:10:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191127091048.GB31353@localhost>
References: <20191127080028.823495-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191127080028.823495-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pidgin: Use python3 during build
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
X-List-Received-Date: Wed, 27 Nov 2019 09:10:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 27, 2019 at 12:00:28AM -0800, Khem Raj wrote:
>...
> +@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
> + dnl (Thanks to XChat)
> + if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
> +         AC_MSG_CHECKING(for Python compile flags)
> +-        PKG_CHECK_MODULES(PY, python, [
> ++        PKG_CHECK_MODULES(PY, python3, [
> +                 AC_SUBST(PY_CFLAGS)
> +                 AC_SUBST(PY_LIBS)
> +         ], [
>...

This one also wants
https://bitbucket.org/pidgin/main/pull-requests/357/gnt-fix-use-after-free-memory-violation/diff

Not sure whether there are more fixes that need backporting for Python3.

cu
Adrian

