Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09E206ABF3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 12:26:32 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q56so2015174wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9QHTf0NCzFnZsxWfl1rrx4thxV2CAMo6sfVphEnUHpU=;
	b=xZv41yTgu/ejKELcEFka4MiSCR2spERZzexWfk/kEPnY3Y7mfYVLIGnSAkjzqVuk7J
	ScGf3w+40zNl4Zc/CtdE7jKCxNBerxtjiYjLYQ9ZhjLGX832yEiV0EkPRs+zWzAdRS58
	xbolbFBwRzjBhk/r6tJTAw0iEAUX5FC6liSRSUJAW3be+Ws6fjsWQ7Z610KxAYCQUbfw
	6gQxizDpG+vehy2wQcH2sSEKYklixfs8wZCg4XqZmXdHeQFYttiq1q20DhchFyRuhmSE
	RMUXQCNgkJeOdEwARo2mqKaXFYcsEY1qetN7lNC14ehQ+UKvk4yjs7x2OZysdwrE7dOi
	NELA==
X-Received: by 10.181.13.106 with SMTP id ex10mr6220044wid.16.1372508793242;
	Sat, 29 Jun 2013 05:26:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm16766428eew.1.2013.06.29.05.26.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 05:26:32 -0700 (PDT)
Date: Sat, 29 Jun 2013 14:27:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130629122713.GT3261@jama>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Jun 2013 12:26:33 -0000
X-Groupsio-MsgNum: 45246
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCKkSrrNUaKEhaIQ"
Content-Disposition: inline

--lCKkSrrNUaKEhaIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2013 at 09:36:56AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 --
>  .../chromium-24.0.1312.52/armv6/include.gypi       |    8 -
>  .../chromium-24.0.1312.52/armv6/oe-defaults.gypi   |   15 -
>  .../chromium-24.0.1312.52/armv7a/include.gypi      |    9 -
>  .../chromium-24.0.1312.52/armv7a/oe-defaults.gypi  |   15 -
>  .../glib-2.16-use-siginfo_t.patch                  |   35 --
>  .../chromium-24.0.1312.52/i586/include.gypi        |    5 -
>  .../chromium-24.0.1312.52/i586/oe-defaults.gypi    |   15 -
>  .../chromium-24.0.1312.52/ui-gl-no-narrowing.patch |   20 -
>  .../chromium/chromium-24.0.1312.52/unistd-2.patch  |   27 -
>  .../chromium-24.0.1312.52/x86-64/include.gypi      |    5 -
>  .../chromium-24.0.1312.52/x86-64/oe-defaults.gypi  |   15 -
>  .../chromium/chromium-29.0.1518.2/google-chrome    |    7 +
>  .../chromium-29.0.1518.2/google-chrome.desktop     |  222 ++++++++
>  .../chromium/chromium/armv6/include.gypi           |   26 -
>  .../chromium/chromium/armv7a/include.gypi          |   26 -
>  recipes-browser/chromium/chromium/bison-2.6.patch  |  558 --------------------
>  recipes-browser/chromium/chromium/google-chrome    |    7 -
>  .../chromium/chromium/google-chrome.desktop        |  222 --------
>  recipes-browser/chromium/chromium/gypi.patch       |   19 -
>  recipes-browser/chromium/chromium/memset.patch     |   13 -
>  .../chromium/chromium/softfloat-fix.patch          |   22 -
>  recipes-browser/chromium/chromium/unistd.patch     |   51 --
>  recipes-browser/chromium/chromium_19.0.1049.3.bb   |  150 ------
>  recipes-browser/chromium/chromium_20.0.1086.0.bb   |  141 -----
>  recipes-browser/chromium/chromium_24.0.1312.52.bb  |   76 ---
>  26 files changed, 229 insertions(+), 1522 deletions(-)
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv6/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv6/oe-defaults.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv7a/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/armv7a/oe-defaults.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/glib-2.16-use-siginfo_t.patch
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/i586/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/i586/oe-defaults.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/ui-gl-no-narrowing.patch
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/unistd-2.patch
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/x86-64/oe-defaults.gypi
>  create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
>  create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop

Fails to apply cleanly:

patching file recipes-browser/chromium/chromium/google-chrome.desktop
Reversed (or previously applied) patch detected!  Assume -R? [n] ^C

>  delete mode 100644 recipes-browser/chromium/chromium/armv6/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium/armv7a/include.gypi
>  delete mode 100644 recipes-browser/chromium/chromium/bison-2.6.patch
>  delete mode 100755 recipes-browser/chromium/chromium/google-chrome
>  delete mode 100644 recipes-browser/chromium/chromium/google-chrome.desktop
>  delete mode 100644 recipes-browser/chromium/chromium/gypi.patch
>  delete mode 100644 recipes-browser/chromium/chromium/memset.patch
>  delete mode 100644 recipes-browser/chromium/chromium/softfloat-fix.patch
>  delete mode 100644 recipes-browser/chromium/chromium/unistd.patch
>  delete mode 100644 recipes-browser/chromium/chromium_19.0.1049.3.bb
>  delete mode 100644 recipes-browser/chromium/chromium_20.0.1086.0.bb
>  delete mode 100644 recipes-browser/chromium/chromium_24.0.1312.52.bb

--lCKkSrrNUaKEhaIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHO0qEACgkQN1Ujt2V2gByT+gCeJGdjKFuwj1fuGxOpPHzUhYSC
HacAn3pRApG5Ekte7guHYS9C0svOiYGd
=3daB
-----END PGP SIGNATURE-----

--lCKkSrrNUaKEhaIQ--
