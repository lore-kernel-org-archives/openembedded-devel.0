Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clenovak@gmail.com>) id 1NbFdu-000385-HU
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 16:53:53 +0100
Received: by ewy4 with SMTP id 4so3216204ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 07:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=9vMDnP3eE3J8Wwg9tJDkG7n3DF3/14/w0GbthrJTkJs=;
	b=mcRD0gEJkuNustnRq26b8qHzmWh9U04tDGM3EkAGJNMZ/O/dsffxNnkYJ55mFkxiIt
	ruk4KgncGx0VZ6uM+gWTJ5Fg/7Rn2vsJIKgmomGL1paNBG3e4KfFh+TnJHageLopR3xs
	l9lPxFL/wQAeSbGHHM83r343mc9GPfQh5hgL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ci9fMRByU7a8w2Spx7S/IlbRaVQrw94fnwSA55UGz3/El1WEkKOqFNKG1v/aj46dsT
	L96mvAQjiS64P+iC0f9JyPO18CeuAuwbrLRMYQTwD2M5ClwGlxgOQbsriE+PMHS+CLTm
	Pec9qNN6C/Wc48EmaH4uaXBSwomahvURdGmVY=
MIME-Version: 1.0
Received: by 10.213.109.67 with SMTP id i3mr2149677ebp.42.1264866685013; Sat, 
	30 Jan 2010 07:51:25 -0800 (PST)
In-Reply-To: <6594c4541001300748n1e9939f2t2ef47cb7738f2f4d@mail.gmail.com>
References: <6594c4541001300748n1e9939f2t2ef47cb7738f2f4d@mail.gmail.com>
Date: Sat, 30 Jan 2010 16:51:24 +0100
Message-ID: <6594c4541001300751j40b0c294g8f185063f80d1607@mail.gmail.com>
From: clemens novak <clenovak@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: clenovak@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Problems with building minimial-image for AVR32
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
X-List-Received-Date: Sat, 30 Jan 2010 15:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I'm fairly new to Openembedded, and try to build a system for the
Atmel NGW100. I proceeded according to the getting started guide
(obtaining bitbake and checking out openembedded). My local.conf sets
DL_DIR, BBFILES,
MACHINE = "atngw100"
TARGET_OS = "linux-uclibc"
DISTRO = "angstrom-2008.1"
ANGSTROM_MODE = "uclibc"
ANGSTROMLIBC = "uclibc"

and then I try to start bitbake minimal-image. Bitbake runs for a
while, but then it fails with
Running task 533 of 886 (ID: 166,
/home/cnovak/OE_ATNGW100/openembedded/recipes/dropbear/dropbear_0.51.bb,
do_configure)
ERROR: function do_configure failed
| checking for deflate in -lz... no
| configure: error: *** zlib missing - install first or check config.log ***
| FATAL: oe_runconf failed

appearantly zlib is missing :-) but I don't understand this, as in
dropbear.inc (which gets included by dropbear_0.51.bb) there is a line
DEPENDS = "zlib".

What am I doing wrong here and can anybody help me out with this?
Thanks a lot - Regards,

Clemens


