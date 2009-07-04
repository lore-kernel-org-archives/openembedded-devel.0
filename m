Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roosmaa@gmail.com>) id 1MMzpi-0005aK-3u
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 09:38:50 +0200
Received: by ewy21 with SMTP id 21so3126964ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jul 2009 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7xb9HRvDD10F1mfQCKNScwN3IPNzmhOilolAvnX9Erg=;
	b=kMfTxn/CS+203J39Zo9k1jBRZKGMHWdNQCsRO4O+Hu3D63Tv0r4014O9B8wIvmFPlN
	fromZ69cOk+EI07M+EtSa77N2uZn8ksica308zhMgkdWQpbgXUep5F3DiyMJSc1xyl7t
	vu4cux9ovzAIj9asb+OlaOH/VTqPVRkQ+DaY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	b=iHKYXZJStGWoDMjNHRpgEaGjrdkgnWzVDNKF5JanXNhliECoKjQG+bUP6QvzlRFpPk
	myy4hMS2XMg3gtRJ5e+OmN15NPZGfFXDRLsBdUHnLxHZfxaTaWGTrULEkSvrYRsePE7H
	lUwbmcmkaskLBgdbT5DoFUOkhGsq6u1vU2zUA=
MIME-Version: 1.0
Sender: roosmaa@gmail.com
Received: by 10.216.0.84 with SMTP id 62mr576135wea.185.1246692396097; Sat, 04 
	Jul 2009 00:26:36 -0700 (PDT)
From: "Mart R." <roosmaa+list@gmail.com>
Date: Sat, 4 Jul 2009 10:26:16 +0300
X-Google-Sender-Auth: d169c986e4cdb983
Message-ID: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OpenEmbedded goals?
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
X-List-Received-Date: Sat, 04 Jul 2009 07:38:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have been exploring =C3=85ngstr=C3=B6m and thus OpenEmbedded lately. The
building process works nicely out of the box, but running it on some
low end embedded system is out of the question because it is just too
slow and bloated for my taste. Stripping it down is not an easy job
either as I would have to edit countless of *.bb files.

Knowing that Portage has USE flags I was interested to see why they
haven't been implemented to at least some extent in
BitBake/OpenEmbedded. Having found my answer [1] it still kept nagging
me why have they not at least enabled such USE flags at distribution
level?! Sure one can just create a new repository of metadata, but why
duplicate all that work?

It got me thinking about OE and what it tries to be in general.
"Openembedded offers a best-in-class cross-compile environment. It
allows developers to create a complete Linux Distribution for embedded
systems." - This is what the front page says about OE. In reality it
is straying far from its goal in my opinion. It tries to be a generic
framework for building systems and is a full blown distribution (with
options to have custom branding). And from what I can tell it's far
from being "easy to customize".

What if... What if OE went (back) to being a scaffolding to building
actual distributions? OpenEmbedded could provide:
- Out of the box cross-compile environment to whatever system you can imagi=
ne,
- Vanilla *.bb files for distributions to use, so they would not have
to duplicate all that work that has already been put into creating
those rules.
It would also mean scrapping all the distribution configurations out
of OE, doing away with all non-essential patches from the BitBake
recipes, etc.

For those vanilla.bb rules to be most efficient some form of USE flags
could be introduced, that can only be assigned in the distribution
configuration files. That way there will be no binary clashes inside
one distribution, and that distribution can come in many flavors
(mydist, mydist-lite, mydist-very-experimental).

For distribution maintainers it would provide more freedom to do as
they please, however they would not have to worry about every single
package and configuration out there (if those vanilla.bb's are
provided by OE already).

If these things have already been discussed in detail, please don't be
shy to point me to those discussions. Also I might be terribly
misinformed and this is actually how things are done and run already.

Mart

[1] http://projects.linuxtogo.org/pipermail/openembedded-devel/2007-Septemb=
er/002990.html


