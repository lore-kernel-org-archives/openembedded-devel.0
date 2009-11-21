Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NBukx-0004ut-G5
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 19:32:26 +0100
Received: by bwz9 with SMTP id 9so3993117bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ocfrp6mhMyrUvBqvu+I21AHzalATrPItEDhdbSW4qxc=;
	b=sAVUSCHhS/FcvZbojk13SK48ba+zI00m4urOlBNgXezK90DBu8ioTfvM39lkJNVl7Z
	I1JBmG+D7BtoKWeOZNwvLdn1P9oQZBifIpOr8S3zRzsXEVYFApoPv91FzKd6/6gBvxFr
	Fd1G1JnvdfyKVI2sbTiLWMUS4jpl/j/DzQQGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=EdyRqtJgu3elKbY/3wxncjbYvLgXEB0W88clWYOXQC+nbVV0n+yBp6uUaib+/DXnI9
	L2CAGUS7xyao8RJ2PVUXQBMll9H6YI76ZxXPplb2AQhDHSHLiIqWgtoqgHnHfRV0e/96
	ztIRxsmqPGjtdiQ5C5Je26zsgfaoX3F0cJnP0=
Received: by 10.204.155.82 with SMTP id r18mr2580044bkw.180.1258828256901;
	Sat, 21 Nov 2009 10:30:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm894342fxm.0.2009.11.21.10.30.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Nov 2009 10:30:56 -0800 (PST)
Date: Sat, 21 Nov 2009 19:30:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091121183054.GA3299@jama>
References: <1258782956.5424.17.camel@gnutoo-desktop>
	<alpine.LFD.2.00.0911210112500.25956@localhost>
	<4B07F8F8.3060802@balister.org> <4B082733.1060504@gmx.net>
	<ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 18:32:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2009 at 07:07:45PM +0100, Frans Meulenbroeks wrote:
> 2009/11/21 Bernhard Kaindl <bernhard.kaindl@gmx.net>:
> > Hi,
> >   indeed, the SDL_mixer-1.2.9.tar.gz has changed on
> > http://www.libsdl.org/projects/SDL_net/release,
> > so conf/checksums.ini is outdated, as it stands, and has to be updated:
> >
> > Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>
> >
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/conf/checksums.ini b/conf/checksums.ini
> > index 784a092..e1aac1f 100644
> > --- a/conf/checksums.ini
> > +++ b/conf/checksums.ini
> > @@ -1099,8 +1099,8 @@ md5=0b5b91015d0f3bd9597e094ba67c4d65
> >  sha256=a8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e0b6
> >
> >  [http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz]
> > -md5=a9eb8750e920829ff41dbe7555850156
> > -sha256=557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
> > +md5=09eb4585f46d3527fe7fce8af8f9e591
> > +sha256=7216a89d92327d2f0fe03e78f3c758a52be68c29daf8e971c226f4a3191e9ec0
> >
> >  [http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
> >  md5=e45b1048d2747480dcc65ece4130a920
> >
> > Philip Balister schrieb:
> >>
> >> On 11/21/2009 01:15 AM, Robert P. J. Day wrote:
> >>>
> >>> On Sat, 21 Nov 2009, GNUtoo wrote:
> >>>>
> >>>> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]
> >>>>
> >>>> NOTE: The MD5Sums did not match. Wanted:
> >>>> 'a9eb8750e920829ff41dbe7555850156' and Got:
> >>>> '09eb4585f46d3527fe7fce8af8f9e591'
> >>>
> >>>   that second checksum is, in fact, the correct one for that tarball.
> >>> and the sha256sum in conf/checksums.ini also doesn't match the one for
> >>> that tarball.  if that used to be correct, does that mean someone has
> >>> replaced a tarball with a different but identically-named one?
> 
> Before committing this patch I would suggest comparing the new and the
> old version to find out what is actually causing this and what has
> been changed.
> If we just blindly change checksums we might as well abandon them.
> Also note that a change of the checksum means that everyone who has
> the file in his/her download dir will get a checksum error.
> 
> For now a nack from me.
> 
> As this already happened before recently (perl twig) I suggest we
> adapt a policy for this or maybe some automated removal (e.g. if you
> have a file in your downloads dir with a checksum in blacklist.ini
> that version is not used but removed or parked aside or something like
> that).
> 
> Frans

As Bernhard probably hasn't old archive I tried it here

/home/downloads/OE/SDL_mixer-1.2.9 $ ls -lR > lslR.txt
/home/downloads/OE/SDL_mixer-1.2.9 $ cd ../SDL_mixer-1.2.9.new/
/home/downloads/OE/SDL_mixer-1.2.9.new $ ls -lR > lslR.txt
/home/downloads/OE/SDL_mixer-1.2.9.new $ cd ..

/home/downloads/OE $ diff -rq SDL_mixer-1.2.9 SDL_mixer-1.2.9.new/
Files SDL_mixer-1.2.9/lslR.txt and SDL_mixer-1.2.9.new/lslR.txt differ

/home/downloads/OE $ diff -r SDL_mixer-1.2.9 SDL_mixer-1.2.9.new/
All file rights are the same only dates changed from Oct 13 to Nov 7

So it looks safe.

martin@jama /home/downloads/OE $ md5sum SDL_mixer-1.2.9.tar.gz;
sha256sum SDL_mixer-1.2.9.tar.gz
a9eb8750e920829ff41dbe7555850156  SDL_mixer-1.2.9.tar.gz
557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
SDL_mixer-1.2.9.tar.gz
martin@jama /home/downloads/OE $ md5sum SDL_mixer-1.2.9-new.tar.gz;
sha256sum SDL_mixer-1.2.9-new.tar.gz
09eb4585f46d3527fe7fce8af8f9e591  SDL_mixer-1.2.9-new.tar.gz
7216a89d92327d2f0fe03e78f3c758a52be68c29daf8e971c226f4a3191e9ec0
SDL_mixer-1.2.9-new.tar.gz

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


