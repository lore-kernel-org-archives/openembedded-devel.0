Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfbLK-0006VT-CL
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 17:57:11 +0100
Received: by pxi17 with SMTP id 17so204949pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=LJheW3SEVUMwfOZZLmA3nNc1WGKcMla4BIeIhh17gtw=;
	b=QX2Iu80b7hCuzCpE6u0gmZBmSgiap9PAX24qhCr3LfqR1m4ip7jH5sK1jhLqYQwVaE
	jt49EVDBIghdqQkR0GNr81SW1Nijh7hj4LQk64w9ESaR5Nj43KRszjKaOXwS1RvNBhSq
	g/QWTZ89ndyFrsySamKnUL1J18ygmrkDrPhu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=WGrca69XEPnIpjmjhahpCHiMdPEj/kM6Y1j7iax6M48TtBlLyUJxHXt+VDIbMZOTSg
	ZONQ0WRnKlZk2kNj7m82LJiZyqoarQQnx6xIbpYS9KfmJXjj+7WTdFhH80F95G85u2B/
	YTIuyOPhvc9rWs8x1F1w4cEw/oHghgFeUtsQA=
Received: by 10.142.194.1 with SMTP id r1mr931556wff.12.1295456188777;
	Wed, 19 Jan 2011 08:56:28 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm9821119wfa.23.2011.01.19.08.56.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 Jan 2011 08:56:26 -0800 (PST)
Date: Wed, 19 Jan 2011 08:56:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110119165624.GA21354@gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 16:57:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (19/01/11 09:46), Frans Meulenbroeks wrote:
> 2011/1/18 Khem Raj <raj.khem@gmail.com>:
> > On Tue, Jan 18, 2011 at 12:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
> >> I think we also agree here.  But what's the rule of thumb(s) we want to
> >> have, to provide enough choice without too much headache?  As I said
> >> elsewhere, .inc files should probably be used a whole lot more, to help with
> >> the problem of recipe bugfixing and N recipes for an app with the problem.
> >>  We should probably also say that in addition to the "keep the last GPLv2+
> >> version around" rule of thumb we should also have a "keep the latest stable
> >> release" around too.  But what else?  To use busybox as an example, do we
> >> really need to keep 1.18.0 and 1.18.1 around when we have 1.18.2?  How about
> >> if we make the delta between the 3 be just the SRC_URI + checksums?
> >
> >
> > Well what to keep around can not be generalized so much. It also
> > depends upon the nature of releases for various packages
> > some packages have a major release and then push out bug fix releases
> > like busy box case you sited but there are packages
> > which only do major releases which can cause compatibility hassles as
> > new interfaces come and old ones are removed etc.
> > so I think it has to be flexible and mostly left to package
> > maintainers discretion as they know the nature of releases most but
> > I like the idea of keeping one GPLv2 release around and 1 latest
> > release around. If a distro pinned a version then that should
> > be considered as well. It is bad to sweep underneath a distros
> > pinnings. Then they have to rebuild and they get problems
> > as they have to make sure that if a package bump happens then they
> > should be able to define an upgrade path
> >
> > Sometimes newer is not always better in case of udev the size has
> > increased over the time and some distro's may not like
> > it and there can be many such scenarios.
> >
> 
> I wholehearthy agree with the proposal that it is left to the package
> maintainers discretion.
> Wrt the GPLv2+ version. I suggest to reflect this in the name.
> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
> samba-gplv3). Then it immediately becomes obvious why there are two
> versions.
nope, LICENSE field should denote that. Renaming recipes this way does
not look nice.

> Similarly with versions that became a lot fatter over time (which imho
> is a good reason to keep the old version).
> 
> Frans.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


