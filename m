Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLb7U-0003Sc-U5
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 13:40:13 +0100
Received: by fxm8 with SMTP id 8so94155fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 04:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=AVYov4WH5/uUQCicsF/d/GOhkXY+vl1S6adDtfYNKVg=;
	b=gGF7Pr5wLOk2R60nTfW5cRwF7owaEfcnGrDX18jVv1hHXGr6t9Wu6d0CHGMJAFx5mO
	vZpc8PTMT22d4AfWir7QLcTYQrnxbqVP0UKU/eg9UVxwflvXLdIxG0FcsC4j7H7aV3SM
	mQ2HA0Lz6bJi0Vcw4WaB5pcw4vf5yK4s6NrQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=HgNRD0lTuYQ0aV4rsmwOYjBobsVyQfDCUzUa6wioSDStWy4Ms4WcdpNafAMOU7XV/A
	pK19TuV/QQONUcHKOaECjwn8zPSpOIUmUC+phs4WBwCUTPHcNcIwryXcNZgEswxvhPX5
	QwyhQkR1kEZONT6eBh+AwTRhoyijaasY+i9DE=
Received: by 10.223.97.13 with SMTP id j13mr664247fan.146.1290688738163;
	Thu, 25 Nov 2010 04:38:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm174693fam.13.2010.11.25.04.38.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 04:38:56 -0800 (PST)
Date: Thu, 25 Nov 2010 13:38:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125123845.GO3274@jama>
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
	<4CEE336E.9070306@eukrea.com>
	<AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>
	<4CEE37DC.5040503@eukrea.com>
	<AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
	<4CEE4AB9.8050505@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CEE4AB9.8050505@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 12:40:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 12:38:33PM +0100, Eric Bénard wrote:
> On 25/11/2010 12:12, Sylvain Paré wrote:
> > I can't find any obj/ directory in
> > SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/
> > but I have an
> > SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj${QT_LIBINFIX}/
> >
> here is your problem.
> QT_LIBINFIX should be "" in your case.

then something like
QT_DIR_NAME = "qt4"
QT_LIBINFIX = ""

is missing in qt4x11.bbclass (it's defined only in qt4e.bbclass).

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


