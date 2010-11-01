Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD0IE-0008SH-5Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:43:46 +0100
Received: by pwi3 with SMTP id 3so1172824pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7mpo09IT7oHNvY6woTIy/LlOyY6y96ntDL3YDoLKfR0=;
	b=qCDIsWtc2dcS2L3kuxH3dfD+2L/3IK0yX6CJJvsChnckOoW7kKGQkLARephi8v384N
	MZniND/kGJaxtYjiGfcUxEq5g21wwCuLcbk/NgeP2TP5JcH6uQZvKIPRvs3ryXwNVRot
	hyrF2vn1+8dfRlR0jkKiyvZv3yu586G37GRmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c2SKNUX5EiCM1J9ByY13XW2QUJy9qic/3/hED5K0WjysqAmj1lyzT7IXLfYsT4Qxzq
	EtLNkVk80V4j0qQD7VN7uPUD8S6bJJ6RYz3pIm/ss0RQrDoob28CZTD/JD9IKB83GTLi
	yx/NO65A9eNVxRSKQhyvidPWXEWYBORkPbbv0=
Received: by 10.142.114.5 with SMTP id m5mr5121694wfc.237.1288640576140;
	Mon, 01 Nov 2010 12:42:56 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w15sm6485137wfd.9.2010.11.01.12.42.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 12:42:55 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:43:07 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101194307.GD11482@gmail.com>
References: <20101029191718.GA27520@gmail.com>
 <4CCF16A7.3020600@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CCF16A7.3020600@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Mon, 01 Nov 2010 19:43:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/11/10 12:36), Tom Rini wrote:
> Khem Raj wrote:
> >Hi
> >
> >There are so many versions of toolchain components gcc/binutils/glibc that
> >we have in metadata. I would like to reduce the number and keep supporting
> >the ones we really use. Right now we have recipes for
> >
> >binutils = 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.0.6,
> >2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.18,
> >2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
> >2.20.1, cvs
> >
> >gcc = 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.1.2,
> >4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
> >4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3
> >
> >glibc = 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
> >cvs
> >
> >uclibc = 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, git
> >
> >
> >eglibc = 2.9, 2.10, 2.11, 2.12, svn
> 
> For flexibility in out of tree projects, I'd like to see us keep at
> least for binutils 2.18 and newer (official releases) and one each
> of the H.J. Lu releases (.5x.y.z) for folks that need that.
> Similarly for gcc, 4.2.4, 4.3.4, 4.4.4 and one of the csl's.  For
> glibc, 2.9 and newer?  For uclibc maybe we can drop 0.9.30.[12] if
> they aren't pinned.
> 
> But I fear this won't help your concern as much since often fixing
> up for say gcc 4.2.4 fixes it up for 4.2.1 and 4.2.2 and 4.2.3, and
> so forth.

Well my intention is to keep the versions that we can build and maintain.
I plan to rework the .inc file mess once we have limited the versions to
support

> 
> -- 
> Tom Rini
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


