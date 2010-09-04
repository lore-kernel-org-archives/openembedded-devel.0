Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1OrtVn-0000kS-Qf
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 16:14:35 +0200
Received: by bwz12 with SMTP id 12so2678229bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=k0NCim0DhNZO4namSTNKFjN1j9D+FRXQq7sLookBruk=;
	b=mrMVy6/wAks01Nk0IuSgo2iGqGQt+VWagGdy91mufRALU2Ss0qmnsrXUPmaAMniapw
	ixp/FjwIkmv2wE2T0/6BjhHR86qLTesIqhyVlu7iUHfT4zlhfm9chpz8gMkEZ75CjGgw
	hkwpctUX7GrmpeiYjMgmFWVzukXLRsW9nZf8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:bcc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=gxcVchzsv1oJ+dN054Pn9LXVknzF2Q7JpwV7lD5Sd/etNZqQRx42etk4AiFeTdIeYc
	jHIZ+M83s6NnMkWhzVaHU5tJDehB17IAiqsPfoDGv9w7gi/g6TpmB9aoFt6cZ/FDGPLB
	Zucx3/d3jek5WrIM5fTN9umjCpRNBHYLld5o0=
Received: by 10.204.82.80 with SMTP id a16mr1551340bkl.39.1283609633319;
	Sat, 04 Sep 2010 07:13:53 -0700 (PDT)
Received: from merkur.sol.de (p4FD73552.dip0.t-ipconnect.de [79.215.53.82])
	by mx.google.com with ESMTPS id f18sm2459061bkf.3.2010.09.04.07.13.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 04 Sep 2010 07:13:51 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>)
	id 1OrtSo-0007jM-Cz; Sat, 04 Sep 2010 16:11:26 +0200
Date: Sat, 4 Sep 2010 16:11:26 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Bcc: Jens Seidel <jensseidel@users.sf.net>
Message-ID: <20100904141126.GB29434@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
	<20100812223234.GA7917@merkur.sol.de>
	<AANLkTi=B4WQ+LWOHFS1tWFfb32S+x4Ebm46EdP4VG+ea@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=B4WQ+LWOHFS1tWFfb32S+x4Ebm46EdP4VG+ea@mail.gmail.com>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autotools issues (MKINSTALLDIRS, -s_
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
X-List-Received-Date: Sat, 04 Sep 2010 14:14:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Chris, please don't top post. How the hell should I reply to it? Read an
arbitrary mailing list netiquette guide ...

On Fri, Sep 03, 2010 at 08:46:39PM -0700, Chris Larson wrote:
> I noticed a long time ago that a certain error from the autoreconf is a sign
> that your po/ makefiles are from old gettext, and will end up seeing the
> mkinstalldirs failure.  See http://patchwork.openembedded.org/patch/1004/.
> Haven't had a chance to do any further investigation on it since then,
> however.

Your patch just refers to the warning
"WARNING:  po/Makefile.in seems to ignore the .*dir setting"

Maybe it causes make to install files into wrong directories but I had never
problems with this. The error from this thread was a real error because of
an incompatibility of special versions of gettext and automake. As we both
observed using a newer gettext version (by just bumping the minimal
gettext version in configure.ac, in general not by upgrading gettext) helps.
 
I try in general to use an as old version of gettext as possible, to be
compatible with older hosts. The warning you are referring to was always
ignored by me :-))

Jens


