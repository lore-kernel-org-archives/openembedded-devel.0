Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBuSb-0002DG-AO
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 21:17:58 +0200
Received: by ywo32 with SMTP id 32so2317153ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=VvL+xo/D8slctwBRteomJNDNTRZ25hCAKzxeQ+sJ77I=;
	b=vGBwJ7WvJd/In87g/LvZa4ijKA9Y6qZUHJaD9+ctvzosnXC2UQyHziAwspY5bCws+c
	/sO9TZEtCobcEg22pzyA/H41i49E/6Svo3Uw/Jb0Fe+zRj1EZsyakTkweXpkX+hQZdl1
	vTE1uARamaOqQTetenfYclHpzpe23XgdUrJnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=MIwx20jqDbFJRnBjQd6W4OqZf8B9VzaX/UTL/zfL/SkCVY+7JAKYpvALwLY4JKS++q
	1E70eKQKfWqAONE69/eoo2Ncdvh1Dau35wDoWD5PN9AEzG4NE+Wew6IRhGHakV9n0gCO
	Ohrkv6U3dG6LlbvbBaCj3pn6DHNUqBvj6ACEY=
Received: by 10.150.96.3 with SMTP id t3mr7369436ybb.42.1288379830675;
	Fri, 29 Oct 2010 12:17:10 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q8sm7022326ybk.0.2010.10.29.12.17.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Oct 2010 12:17:10 -0700 (PDT)
Date: Fri, 29 Oct 2010 12:17:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101029191718.GA27520@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Fri, 29 Oct 2010 19:17:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

There are so many versions of toolchain components gcc/binutils/glibc that
we have in metadata. I would like to reduce the number and keep supporting
the ones we really use. Right now we have recipes for

binutils = 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.0.6,
2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.18,
2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
2.20.1, cvs

gcc = 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.1.2,
4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3

glibc = 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
cvs

uclibc = 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, git


eglibc = 2.9, 2.10, 2.11, 2.12, svn

They all use common files. So whenever there is a bugfix needed its a very
hard job to first create a common fix that works across all versions
secondly verify if it works and I am sure 80% of recipe versions mentioned
here dont even build

So I am going to propose to remove most of them which dont build and
request the distro and machine maintainers to please update the list of
toolchain components to keep.

Please voice which versions should we really really keep. This should be a
set which is buildable and functional.

If I dont hear on this in coming weeks then I have a plan in my mind on
which versions to keep

Thanks

-Khem



