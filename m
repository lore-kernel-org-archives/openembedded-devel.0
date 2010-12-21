Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PV3jQ-0004AM-6N
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 16:02:28 +0100
Received: by yxd5 with SMTP id 5so1867419yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=O6hbCqaYzvLmwgQ5AuAAZHfwbELAecNHf3dwB1uzgT0=;
	b=vVQlDsbD3qRSnBTx7ewMYs2wnGMYlgkkM/dalznETPi+gHiNGl26K9bXfa8jdnJ5Wd
	LAltT7AOQ/vV3bZAdE0hVJart0/l4CAbfwlgK15tLWfJk0mcelMZR6kCvMhH570g97KA
	1WtpLvNZ7FwiXwERwHy6YCHwo7kQ2lNEvkzqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=wGJpRferDeNCcHtfgqM6U1EHyYRbU7z2hBqv8TZuje7n6FvjK7OmY7HXW8JYEIevMa
	mqXIH4Rw9sFA/2Q2OXd6xyzoUOQrxX8GPqZvqlWNQL9adZK7GA/WUDBsHUfGpQP7hE1L
	ge4EZQa4tNiFCempliBj3tNNXffyrj6sWM+8o=
Received: by 10.151.101.15 with SMTP id d15mr8583502ybm.399.1292943728824;
	Tue, 21 Dec 2010 07:02:08 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v8sm2857403yhg.40.2010.12.21.07.02.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 07:02:08 -0800 (PST)
Date: Tue, 21 Dec 2010 07:02:22 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221150222.GB4665@gmail.com>
References: <1292928098-17357-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1292928098-17357-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] asterisk: fix SRC_URI and remove old recipes
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
X-List-Received-Date: Tue, 21 Dec 2010 15:02:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (21/12/10 11:41), Eric Bénard wrote:
> * old versions either don't fetch or don't patch and are not pinned
> * keep the higher version which fetch and patch
> * fix SRC_URI for all the asterisk recipes
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

You could have moved the recipes to nonworking or obsolete but this ok too

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb   |    2 +-
>  recipes/asterisk/asterisk-1.2.24/asterisk.patch    |  221 --------------------
>  .../asterisk/asterisk-1.2.24/enable-speex.patch    |   21 --
>  .../asterisk-1.2.24/uclibc-compat-getloadavg.patch |   13 --
>  recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch  |   18 --
>  recipes/asterisk/asterisk-1.2.28/asterisk.patch    |  221 --------------------
>  .../asterisk/asterisk-1.2.28/enable-speex.patch    |   21 --
>  .../asterisk-1.2.28/uclibc-compat-getloadavg.patch |   13 --
>  recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch  |   18 --
>  recipes/asterisk/asterisk-1.4.17/Makefile.patch    |   20 --
>  recipes/asterisk/asterisk-1.4.17/init              |   77 -------
>  recipes/asterisk/asterisk-1.4.17/logrotate         |   12 -
>  recipes/asterisk/asterisk-1.4.17/sounds.xml.patch  |   18 --
>  recipes/asterisk/asterisk-1.4.17/volatiles         |    7 -
>  recipes/asterisk/asterisk-1.4.19.1/Makefile.patch  |   20 --
>  recipes/asterisk/asterisk-1.4.19.1/init            |   77 -------
>  recipes/asterisk/asterisk-1.4.19.1/logrotate       |   12 -
>  .../asterisk/asterisk-1.4.19.1/sounds.xml.patch    |   18 --
>  recipes/asterisk/asterisk-1.4.19.1/volatiles       |    7 -
>  .../asterisk/asterisk-1.6.0-beta8/Makefile.patch   |   20 --
>  recipes/asterisk/asterisk-1.6.0-beta8/init         |   77 -------
>  recipes/asterisk/asterisk-1.6.0-beta8/logrotate    |   12 -
>  .../asterisk/asterisk-1.6.0-beta8/sounds.xml.patch |   18 --
>  recipes/asterisk/asterisk-1.6.0-beta8/volatiles    |    7 -
>  recipes/asterisk/asterisk-addons_1.6.0-beta2.bb    |   66 ------
>  .../asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb |    2 +-
>  .../asterisk/asterisk-core-sounds-en-g729_1.4.8.bb |    2 +-
>  .../asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb  |    2 +-
>  .../asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb |    2 +-
>  .../asterisk-extra-sounds-en-alaw_1.4.7.bb         |    2 +-
>  .../asterisk-extra-sounds-en-g729_1.4.7.bb         |    2 +-
>  .../asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb |    2 +-
>  .../asterisk-extra-sounds-en-ulaw_1.4.7.bb         |    2 +-
>  .../asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb   |    2 +-
>  .../asterisk/asterisk-moh-freeplay-g729_0.0.0.bb   |    2 +-
>  .../asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb    |    2 +-
>  .../asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb   |    2 +-
>  recipes/asterisk/asterisk_1.2.24.bb                |   52 -----
>  recipes/asterisk/asterisk_1.2.28.bb                |   46 ----
>  recipes/asterisk/asterisk_1.4.17.bb                |  174 ---------------
>  recipes/asterisk/asterisk_1.4.19.1.bb              |  173 ---------------
>  recipes/asterisk/asterisk_1.4.23.1.bb              |    2 +-
>  recipes/asterisk/asterisk_1.6.0-beta8.bb           |  185 ----------------
>  43 files changed, 14 insertions(+), 1658 deletions(-)
>  delete mode 100644 recipes/asterisk/asterisk-1.2.24/asterisk.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.24/enable-speex.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-compat-getloadavg.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.28/asterisk.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.28/enable-speex.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-compat-getloadavg.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.4.17/Makefile.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.4.17/init
>  delete mode 100644 recipes/asterisk/asterisk-1.4.17/logrotate
>  delete mode 100644 recipes/asterisk/asterisk-1.4.17/sounds.xml.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.4.17/volatiles
>  delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/Makefile.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/init
>  delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/logrotate
>  delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/sounds.xml.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/volatiles
>  delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/Makefile.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/init
>  delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/logrotate
>  delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml.patch
>  delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/volatiles
>  delete mode 100644 recipes/asterisk/asterisk-addons_1.6.0-beta2.bb
>  delete mode 100644 recipes/asterisk/asterisk_1.2.24.bb
>  delete mode 100644 recipes/asterisk/asterisk_1.2.28.bb
>  delete mode 100644 recipes/asterisk/asterisk_1.4.17.bb
>  delete mode 100644 recipes/asterisk/asterisk_1.4.19.1.bb
>  delete mode 100644 recipes/asterisk/asterisk_1.6.0-beta8.bb
> 


