Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RolEJ-0004dx-12
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jan 2012 01:24:19 +0100
Received: by iabz21 with SMTP id z21so3074805iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2012 16:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=to38VThySYt8lsc0NeGd6iqePVp2/a71vb95XFz53cU=;
	b=fWFQyOEJ+1ra2FyOrzS+Z4KeV71ZnCFcmJjWLywSf4VW1ukuy+aReXhpqJa9xf8gnw
	jMzRHnK9SH0ygjSekEMJRH1Szb32GVlUJplTppArMa6w+jtV3NkZiINP+v8HSpJS+qRS
	xedkQ9yOzlmYM7eMwTVqtgGahNmVg+B4X+cSg=
Received: by 10.50.42.199 with SMTP id q7mr3207321igl.9.1327191396220;
	Sat, 21 Jan 2012 16:16:36 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z22sm27721585ibg.5.2012.01.21.16.16.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 16:16:34 -0800 (PST)
Date: Sat, 21 Jan 2012 16:16:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120122001630.GF12691@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
	<CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
	<CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
	<4F0B0F7A.9020907@windriver.com>
	<CAP9ODKpHL0y6wi6eYtYE979p0kw6P4P9=TjdJroAND53MCEYtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpHL0y6wi6eYtYE979p0kw6P4P9=TjdJroAND53MCEYtA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Sun, 22 Jan 2012 00:24:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/01/12 15:19), Otavio Salvador wrote:
> On Mon, Jan 9, 2012 at 14:02, Mark Hatle <mark.hatle@windriver.com> wrote:
> 
> > Hmm, I think the best solution is to fix the docbook problems, but baring
> > that a static version of the man pages is the next best alternative.
> >
> > Advantage to fixing docbook is it will work for the next package.  :)
> 
> 
> I fully agree but I am short in time for our deadline so this wasn't an
> option thus we choose the shortest route for now.

I think if we keep this thing going without addressing underlying
problem it degrades the quility of metadata. Documentation is important
aspect of a package and we should make it possible to generate it as
much

no body is going to remove that option later when xsltproc-native starts
working since this package will be building with or without xslt at that
time. So in my opion fixing it at the same time is more efficient though
a bit more effort I concur.


