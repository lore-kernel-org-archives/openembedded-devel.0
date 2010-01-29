Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nam12-0000by-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 09:15:47 +0100
Received: by fxm4 with SMTP id 4so1616807fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 00:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Hb9LO2Bhg02jaER4h0Dp5/6pCDTSzrrCBudEouXW1Uk=;
	b=nitLfxJ+hhv0ByjqjBnNiNsgA52SNWa2az4txExwWPGOo0uvUj3VVrWyV5zodyXNu1
	tnAEBPGseLBS6t+OfX0K4wB8hxzEVin1O2vIu9sDKmSpB4QWjSWLIZ34bAkgnP7qjzaY
	qOpAS0O1JLeM+C/POhKAczhH3A3ygFQ6TM6WA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=MX2g2OxogqcWg5U7fcXxw5PbPN8/ZSPgoPug/CEctE8kqblkoZZ43uIOgoi7Jkc/1x
	2h9tDvwRmUHJF/SSDX/55dp+nbkTv6uuNZ460lvPlS0SvPMlw8xUjXC1MZFBmAuRYhaq
	V6Fe0JFRZyCXV0p6lIsZiIr31CdQOFDK2M3Ag=
MIME-Version: 1.0
Received: by 10.223.3.196 with SMTP id 4mr402454fao.63.1264752800938; Fri, 29 
	Jan 2010 00:13:20 -0800 (PST)
In-Reply-To: <E1Nacxm-0008Sg-9C@melo.openembedded.org>
References: <E1Nacxm-0008Sg-9C@melo.openembedded.org>
Date: Fri, 29 Jan 2010 09:13:20 +0100
Message-ID: <141020e31001290013n550787bcw11fbd74887ab38d1@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Martin Jansa : python-gst: don't use libtool m4 macros from source archive
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
X-List-Received-Date: Fri, 29 Jan 2010 08:15:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2010 at 11:35 PM, git version control
<git@git.openembedded.org> wrote:
> =A0do_configure_prepend() {
> + =A0 =A0#install all except libtool
> + =A0 =A0rm -f ${S}/common/m4/libtool.m4
> + =A0 =A0rm -f ${S}/common/m4/lt*.m4
> =A0 =A0 install -d ${S}/m4
> =A0 =A0 install -m 0644 ${S}/common/m4/*.m4 ${S}/m4/
> =A0}

Sorry, this patch needs a bit more work..

It compiles fine, but today I noticed that lots of files are missing
in resulting package..

I'll commit fix for that asap.. or someone can revert this one.. but
hopefully as there is no PR bump I'll be able to fix it before someone
build it.

Regards,


