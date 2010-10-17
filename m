Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7Z1s-0003bv-4H
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 21:36:25 +0200
Received: by bwz9 with SMTP id 9so130228bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UiP27vLvCLxsJQ8LhP9NaRej651q9s3FmPvYj0qgZfM=;
	b=lWeOj9mkPHzOk2g9Uhc5J2CXIDTfCWVQYxQs4hCJvpG7ldSuIm0earWvx0vWstJBy2
	GaoKE3m3E73RNmvZ0p1mcjZhfjXtgK7sLuVUbJuSubkQblPKd078Nbtc4FlKsY/5JzkS
	VxfGh6ABmwX6xb9wSUxq+ceeEe0R9Zxve4z9M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gTp90wjdGN4wzfsOPozVKZfhuR1X8tx9DVZRNV2+Ummfv+TZMz3UdT5MFXvRHwSyb9
	JEMkmfl4s9oHy9OPslXpmpUlEOpdatiUfjcEDp54nTMZIXs+339bLuk0EmL6SoVvZcRs
	8K/CDie6BJPBqENEyKUuynspbMeQspbjQhbTo=
Received: by 10.204.53.207 with SMTP id n15mr3455255bkg.185.1287344145850;
	Sun, 17 Oct 2010 12:35:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm14214155bks.8.2010.10.17.12.35.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 12:35:44 -0700 (PDT)
Date: Sun, 17 Oct 2010 21:35:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101017193539.GA3324@jama>
References: <1287340776.3748.31.camel@mattotaupa>
	<i9fha5$t75$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i9fha5$t75$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libgee: `do_configure` fails: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Sun, 17 Oct 2010 19:36:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 17, 2010 at 09:03:33PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 17-10-10 20:39, Paul Menzel wrote:
> > Dear OE folks,
> > 
> > 
> > commit a89e9c
> > 
> >         libgee.inc: Use libtool macros from installed libtool
> > 
> > breaks task `do_configure` with at least `minimal-{libc,uclibc,eglibc}`.
> > 
> >         | gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
> >         | autoreconf: automake failed with exit status: 1
> >         | FATAL: autoreconf execution failed.
> >         | ERROR: Function do_configure failed
> >         NOTE: package libgee-1_0.6.0-r6.0: task do_configure: Failed
> > 
> > This problem was seen before [2].
> > 
> > Reverting commit a89e9c fixes the build.
> 
> Does building gobject-introspection-native help as well?

It does, pushed
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=df932a2769c2f6f7195363e8eb83994846805398

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


