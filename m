Received: from mail-fx0-f218.google.com ([209.85.220.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NxN0o-0001d4-TW
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:12:55 +0200
Received: by fxm10 with SMTP id 10so564599fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ywOALAV9/hfdHK5fsGtjlzwA+krrILOuLM5z4QYt1RY=;
	b=P6KUW0Xyl8Y2xdATs9bRUCxTTQMBppAahnu2dqa4Zn0Po0WV0D4u8RDyfW5Z1Nh1+0
	1AUUxJ8irOx3rEDOUc7qc0rwdHblXueBQTVqGSCPMR5zLwvDYfMeUArPa8Zt+wGF+eEM
	Kq1iN8WZg7xna4KrOJkcTcoUTqbpx8oN0UmgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OdxpsLgOtQqmNUY937+8aW9QF8jhSmTNHTwgoOy5I+ypONv8DqS0rUhfggvB6AHujc
	0GXpAWOD8ZEVIaqkHcWF/ZlmRof6ajGiZvVTsGf5fZVNdvlm5CzelfTS5TTR8rEW/2fx
	V94cHSAzCWGOazxWf9pqI7/0G2HniU8IcLPV8=
Received: by 10.223.15.143 with SMTP id k15mr871656faa.57.1270138178498;
	Thu, 01 Apr 2010 09:09:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm5695966fxm.8.2010.04.01.09.09.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 09:09:37 -0700 (PDT)
Date: Thu, 1 Apr 2010 18:09:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401160951.GN25489@jama>
References: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
	<1270134711-32158-3-git-send-email-Martin.Jansa@gmail.com>
	<q2g19c1b8a91004010843g2fa4e73co2bf51ee00ef1ba7b@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <q2g19c1b8a91004010843g2fa4e73co2bf51ee00ef1ba7b@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.218
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sane-srcrevs: move SRCREVs to recipes
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
X-List-Received-Date: Thu, 01 Apr 2010 16:12:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2010 at 08:43:11AM -0700, Khem Raj wrote:
> On Thu, Apr 1, 2010 at 8:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> one the following are fixed
> dri/libdrm_git.bb:SRCREV_pn-libdrm ?= "a5c8f55397377994ceeb76ed0ff148ff89eb3a1b"
> dri/libdrm_git.bb:SRCREV_pn-libdrm_shr ?=
> "b5aec2bd3df736216e86eae28e278172d3ba3362"
> mesa/mesa-dri_git.bb:SRCREV_pn-mesa-dri ?=
> "196214bf2b677a83653d49f79d03752f29df44ec"
> mesa/mesa-dri_git.bb:SRCREV_pn-mesa-dri_shr ?=
> "1ac166895fef47806c9e9286d2a6356b4db8398d"

This shouldn't be a problem, but shortend to SRCREV and SRCREV_shr, 

> linux/linux-davinci_2.6.27.bb:# or override in it local.conf like
> this: DAVINCI_SRCREV_pn-linux-davinci = "${@bb.fetch.get_srcrev(d)}"

> opkg/opkg-nogpg-nocurl_svn.bb:SRCREV = "${SRCREV_pn-opkg}"
> opkg/opkg-nogpg-nocurl-slugos_svn.bb:SRCREV = "${SRCREV_pn-opkg}"
> opkg/opkg-nogpg_svn.bb:SRCREV = "${SRCREV_pn-opkg}"

Those were removed in this patch, replaced with one rev in
opkg.inc:
SRCREV = ${OPKG_SRCREV}
PV = "0.1.6+svnr${SRCPV}"

added OPKG_SRCREV setting preferred-slugos-versions.inc instead of those
SRCREV_pn-opkg = "160" there.

> psplash/psplash-ua.inc:SRCREV = "${SRCREV_pn-psplash}

all recipes include also psplash.inc where is SRCREV = "249", so I just
dropped this line from psplash-ua.inc and it should stay the same.

Regards,


