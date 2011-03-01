Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuFWL-00007R-E3
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 03:41:05 +0100
Received: by pvc30 with SMTP id 30so704021pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 18:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=4i3GlOvMDBbempjFdi0lOOMQz7Jik5b28ELchiZBC7g=;
	b=xIr36sxxm4KKaqt2WDc/jLtRta6GoT2Bf8807BpZyBOg1ITws58tPKN8qI0bQM1JS7
	g1PAhTFlKMZVKJjkxazfay+WQBLwM+32DKzEmQsmCv4zEeiLJaK74XogWGIeiBM/0eET
	3S8zKpJrW76k9SB0FbICbX3kmHSoWNaWeSjDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=an+4Ra8YOlM+Vf7WRzs4e8AICIQSvctKUWcxnne6e5ui1+nS90/QvsDpSzJoJfvfrM
	Yfag/gznYnGQHB6rH2c4fkcl0oZgqbhTK4vUXZdAWXZW5F1zA/jL1nUnodrsGStA83mp
	NW3rQfVUsjDGkci4twrgbczAg5MoXUJRdeExw=
Received: by 10.142.245.1 with SMTP id s1mr4952965wfh.135.1298947173036;
	Mon, 28 Feb 2011 18:39:33 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w32sm6810956wfh.7.2011.02.28.18.39.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 18:39:31 -0800 (PST)
Date: Mon, 28 Feb 2011 18:40:25 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301024025.GB651@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Phil Blundell <philb@gnu.org>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298468511.2178.430.camel@phil-desktop>
	<AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 05/14] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Tue, 01 Mar 2011 02:41:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/02/11 13:47), Otavio Salvador wrote:
> On Wed, Feb 23, 2011 at 13:41, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2011-02-23 at 13:07 +0000, Otavio Salvador wrote:
> >> -  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.6/Modules/ )" >> ${WORKDIR}/toolchain.cmake
> >> +  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.8/Modules/ )" >> ${WORKDIR}/toolchain.cmake
> >
> > This seems a bit fragile (and, presumably, is bad news for anybody who
> > is still using cmake 2.6 for any reason).  Isn't there any way to
> > automatically select the version that matches
> > ${STAGING_BINDIR_NATIVE}/cmake or whatever?
> 
> I see noone using cmake 2.6.
> 
> In any case cmake will know the "internal" modules directory by itself
> so it works even if this value doesn't match. This is where it is
> going to look as fallback and I was using 2.8 without 2.6 for long
> time without noticing any issue.
> 
> This seems safe. We could drop the CMAKE_MODULE_PATH if preferred. I
> just fixed it to 2.8 to reflect the current default one.

yeah make it portable for future if no one is using cmake 2.6

> 
> -- 
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


