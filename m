Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxMek-0004Sh-8u
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:50:07 +0200
Received: by pwj5 with SMTP id 5so1052307pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cKMy5jP6zv3JwVusG0LVzv3IlS5oKC6e2eTaCvwM8jo=;
	b=KG2x8DbaPiLJg9ptvCCnC+dSKMk1oNcUoGZq7TszvLku6RexdRZY9fQILBlAW6VyFi
	tp2TJ6Udz5GAFZ1V11NkbQM+3NICrcbL+afxj/IPHjsQiOpUX7Eu8zpklmytTk7VOIR1
	Gxmd0Op2YOqsJLtMA4D/L9HEtUg5G1fdIQmGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AoyvmXweelKP/VhorIz6kP6jMhLG28bZdp/ahC+s9CzKf7Nxj4teZyX3zvZEy2clbN
	akvtoAyy0hLmRfZBZZgkViD1zloODjArWGiQkal+/Ba4oa2+rgLTx/YCczBOcoUmKLaJ
	Px2HJba00Hfq0J/4l2F59bKd65WLULFNU3c3M=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Thu, 1 Apr 2010 08:46:48 -0700 (PDT)
In-Reply-To: <1270135981.4993.128.camel@rex>
References: <1270135981.4993.128.camel@rex>
Date: Thu, 1 Apr 2010 08:46:48 -0700
Received: by 10.114.86.3 with SMTP id j3mr1337640wab.177.1270136808682; Thu, 
	01 Apr 2010 08:46:48 -0700 (PDT)
Message-ID: <h2n19c1b8a91004010846u8f936157z252190a0f6a6b6e4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 15:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 1, 2010 at 8:33 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> I've been aware that Poky and OE have been diverging slightly and I'd
> like to correct this. There are some patches that I've promised for a
> while too such as the rename from do_populate_staging ->
> do_populate_sysroot.
>
> With some help from Joshua Lock, I have a branch I'd like to propose be
> merged into OE.dev:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Drpurdie/work-=
in-progress
>
> This branch:
>
> * Renames do_populate_staging -> do_populate_sysroot as per previous
> =A0staging discussion emails and also the staging directory ->
> =A0sysroots. It should convert existing builds safely and insert a
> =A0compatibility symlink. This continues the process of improving our
> =A0"staging" concept into one focused around true sysroots.
> * Adds some gettext class sanity checks. In Poky this error is fatal,
> =A0for OE this is just a note for now. The idea being if AM_GNU_GETTEXT
> =A0is in configure.ac and gettext in some form isn't in DEPENDS,
> =A0something is wrong.
> * Added relocatable binary processing from Poky for -native binaries
> =A0using chrpath. This isn't enabled for -cross packages due to the
> =A0relative path length problems.
> * Added packaged-staging fetching capabilities. This uses new mirror
> =A0handling abilities in bitbake master branch but should work with older
> =A0bitbakes, just with less functionality.
> * Started moving gcc dependency information into core gcc version
> =A0specific includes as part of the gcc cleanup.
> * Converted gcc to use the new style staging
> * Added EXTRA_OECONF_INITIAL and EXTRA_OECONF_INTERMEDIATE variables to
> =A0gcc as part of the gcc cleanup
> * Converted binutils, modutils-cross, glibc and gdb to new style staging
> * Cleaned up the gcc-cross do_install function a lot
>
> Along with a small number of other tweaks spotted along the way.
>
> I could post the patches individually and get Acked lines for each one
> but I'm hoping to avoid that and get permission to merge the branch
> directly. We have talked about most of these things in one form or
> another.
>

Looks good stuff.
I would have preferred to have eglibc also converted to new style
staging if possible but can be done afterwards too.


