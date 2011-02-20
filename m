Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pqy2J-0004n7-Lc
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 02:24:31 +0100
Received: by pvd12 with SMTP id 12so685594pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 17:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=oPZIATYSJ6XKAG2TKNUWRJzRFNXj4WOKZbk9pJ+SFjU=;
	b=SlQuGQPPPSkMLeVStog1IAILyD1vxNe+fLVccW7yaaxxss20OvW6rH4fMn99vFQE82
	Vs/EYJ1bfb2j4jjKwB4UDoyzaW8G1dhhUm8KS70YxHwIBysPCwzEiJjVEOiSKB7HBivK
	4EJYjB5gsnpxzILbEhIbSsl1EwZwc/lpQlS60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=TsJfnFWtP7JDuOc38fy6tDf3QHFYYNBzpRKikHtyXAbeRvh+hmW29Dralufha4Z+bh
	3+VzFrcRE7E+mJ4SJSHbKO+w0lRiNaPgpky68JetluHlOl7uFHs5z94Z1NhQQwfvlWd3
	bCoinc1T/sDo/4Mx2QJfJCZo9hQdGFfRw2EDA=
Received: by 10.142.245.10 with SMTP id s10mr1814497wfh.130.1298164993977;
	Sat, 19 Feb 2011 17:23:13 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z1sm5236243wfd.21.2011.02.19.17.23.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 17:23:12 -0800 (PST)
Date: Sat, 19 Feb 2011 17:23:10 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110220012310.GC3451@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
	<4D5FB38C.3010009@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4D5FB38C.3010009@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Sun, 20 Feb 2011 01:24:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/02/11 13:11), Eric Benard wrote:
> Hi Andreas,
> 
> >index 1a6d906..50c0f63 100644
> >--- a/classes/cross.bbclass
> >+++ b/classes/cross.bbclass
> >@@ -75,6 +75,6 @@ sysroot_stage_all() {
> >
> >  #
> >  # Cross .la files have more path issues we have to correct only for libtool<  2.4
> >-SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
> >+SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
> >
> >  SYSROOTEXTRALIBDIRSED = "${@["${SYSROOTEXTRALIBDIRSED_OLD}",""][("${LIBTOOL_HAS_SYSROOT}" == "yes")]}"
> 
> I was just finishing to test a similar fix and this seems to be the
> right direction. Now testing your fix which is cleaner.

Also try meta-toolchain targets 
> 
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


