Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LdTex-000434-I1
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Feb 2009 19:11:35 +0100
Received: by fxm11 with SMTP id 11so1442018fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Feb 2009 10:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+xcz57sgZP+ivXs4AsMWAoGqthV2T5oYkiDIo+mfATo=;
	b=J3YgTxg2c7I1F6PYOBJYRV0cu7XZS+NxXUhauY8dE9XChpG5TrvZPkAthblA87XlCN
	nPZUUpVlV99lKZ6f97fh3jskZiZpKXsPt32jqf7v/bnUIxs15PO3SlRnZFV4qyV6c1D4
	jOPWNT46QAM4p9S0X0ZyT0N/LCNfWXYJdRRMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=M14QyMafbuL71YR9LxVAEpqXfKh6atotk+522touNhWboQqnJB/dAVnqfHIlm8O1kt
	MwT6jSa2gQvNE4YUxqcBfnhMQOXYfGIeikSXR36z13gjXig5ymgjrw4kYpdUjLHg75TE
	f03yVbD2QWg8alLQbKBhTVUqpXLJDwim68eVw=
MIME-Version: 1.0
Received: by 10.223.108.211 with SMTP id g19mr4464575fap.39.1235844475553; 
	Sat, 28 Feb 2009 10:07:55 -0800 (PST)
In-Reply-To: <20090228155335.GJ5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
	<ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
	<20090228155335.GJ5420@smtp.west.cox.net>
Date: Sat, 28 Feb 2009 19:07:55 +0100
Message-ID: <ac9c93b10902281007h3e063b81u63bbad13419c5d6c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Sat, 28 Feb 2009 18:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/2/28 Tom Rini <trini@kernel.crashing.org>:
> On Sat, Feb 28, 2009 at 11:54:46AM +0100, Frans Meulenbroeks wrote:
> [snip]
>> Not sure whether it will be easy to make a build env with chroot
>> (although I know debian does something like that).
>
> Having done this, yes. =A0It's basically using deboostrap to setup a new
> system, then for Ubuntu use aptitude and mark everything auto-installed
> except ubuntu-minimal and ubuntu-standard. =A0Then use (and update)
> the OEAndYourDistro wiki page + bitbake to see what other host stuff you
> must bring in. =A0Vanilla Debian would be, I think, just a different set
> of meta packages.
>
> --
> Tom Rini
>

I've used debootstrap in the past, but was not too sure whether it
could also do a cross build.
If it can I would say such a solution would make it a lot easier to
port packages.

What also could speed up starting from scratch is if you can download
a binary build environment.
Currently if you remove your tmp dir it takes hours and hours to build
things like gcc, glibc, etc etc

Frans.


