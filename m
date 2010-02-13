Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NgH4n-000509-Kc
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 13:26:24 +0100
Received: by fxm26 with SMTP id 26so3354684fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 04:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=N1fLrTqEDXbscbGUvQHYVpz86A5LJTGsN8D3GUtex54=;
	b=nlkk7Djx2lwkka4wg0yX0ozCF2a9xT2Hx76Cr5kKJcuYEv71+/JsuWpB9m1GwNTY6r
	MAlAdq8Xg0xzPKs+yUTeUHGDdBODruyj4deRpZagZNJGwm5aVOgVIBMKFXhvnOKwwhqV
	V7Q0iRCbcz6N1SW6jcvdfgoD8JszgYO6edRJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=iwV04poxnA6VJgcOoqF897l27eXi6FPk7MOjGtRS1KuyPkCtnMfQRbvYATSHFh7hfr
	MDfg7OfVRZxFVs1m15huWqfRkikr7AOBt/qmMGjWlF+cEMzCDyMAz+2u42wn8M0EyOE2
	ySMFfjziouG5cSQDAipZ2adLWPSmeO2gwxHLU=
Received: by 10.87.15.29 with SMTP id s29mr4863502fgi.34.1266063825638;
	Sat, 13 Feb 2010 04:23:45 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm2197278fxm.3.2010.02.13.04.23.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 13 Feb 2010 04:23:44 -0800 (PST)
Date: Sat, 13 Feb 2010 13:23:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213122301.GD5364@jama>
References: <ade1bdc1002130107q6e83bca2sd57391ca539ef6a4@mail.gmail.com>
	<1266053054.4218.3.camel@mattotaupa>
	<ade1bdc1002130211o51733308vc79df05ee449cb0d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ade1bdc1002130211o51733308vc79df05ee449cb0d@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git and ssh and kernel development
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
X-List-Received-Date: Sat, 13 Feb 2010 12:26:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Feb 13, 2010 at 11:11:23AM +0100, Raffaele Recalcati wrote:
> Dear Paul,
> 
> 2010/2/13 Paul Menzel <paulepanter@users.sourceforge.net>:
> > Dear Raffaele,
> >
> >
> > Am Samstag, den 13.02.2010, 10:07 +0100 schrieb Raffaele Recalcati:
> >> I have a git mirror of the kernel.
> >> How to fetch from it in ssh .
> >> ssh://user@ipaddress/pathtogit;protocol=git;branch=master
> >> but ssh has password  ..
> >>
> >> Second question: if pathtogit is a dir on my pc where I'm developing
> >> what is the syntax?
> >
> > I think this is the wrong list you are asking this question. Please ask
> > on the Git list, but before you should read the documentation which is
> > quite elaborate for Git as far as I know and should cover your
> > questions.
> >
> > If you do ask the question on the Git list or solve the problem please
> > answer to this thread with the appropriate links.
> 
> I'm sorry.
> It was a stupid question.
> I'll be very careful in the future!
> :)

If you're asking what to put in SRC_URI in recipe it doesn't look stupid
to me :).

I don't know how to use git+ssh in bitbake (especially with password), I
would expect something like
SRC_URI="git://user@ipaddress/pathtogit;protocol=ssh;branch=master"
but you've to check if that's supported at least with key
authentization"

2nd question is easier
SRC_URI = "file:///home/projects/pathtogit/secretProject"
and you would probably need to adjust S variable too
S = "${WORKDIR}/secretProject"


And you don't want to commit either version to public OE repo, right?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


