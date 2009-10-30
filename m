Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N3m74-0007tb-F6
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 08:41:37 +0100
Received: by yxe5 with SMTP id 5so2514664yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=SgmXbir4pnRN4+TlFWesPFAEsomCF/dfuOdEOdWAdTk=;
	b=gj8WAmSPN9rsmEancmVHHINgWBxhDzwVycXUYK2dlH0sdmiKvvswUFJ9fGfwgVkigy
	az9J+8YQBRYNqRWufOjgwTcenPtnIlnlSj1JB0CfQhhSm5/5fMOl//TbRzt7l/X2gzhH
	DG3hTtF6rs7pgw1Bb8B2KxVVZdMgXH0fz0G3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JzyON4d93nHZSO2uFV8UWRtBjy8HfQ5KR5gWEOT/6xHktAygiupYpliwa6b3ZFz/SW
	eMKqjJCgzvJoEsHSZTqeuLX6IgopnYcLYuHL/kuk/AxGpJ+lz6J70PetXcRVaQs+UOX4
	6ywNmJ6xlbAX2TymuIbWMJO5sZ77kRqVmA/cM=
MIME-Version: 1.0
Received: by 10.101.184.13 with SMTP id l13mr1340531anp.11.1256888426001; Fri, 
	30 Oct 2009 00:40:26 -0700 (PDT)
Date: Fri, 30 Oct 2009 08:40:25 +0100
Message-ID: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: about staging
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
X-List-Received-Date: Fri, 30 Oct 2009 07:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Yesterday I ended up in a discussion on staging in #oe (ok, ok, I
mainly caused the discussion :-) )
Also based upon that I looked at various recipes on how people
implement staging.

There does not seem to be really standard way.
Some recipes copy from ${S} which ihmo is not desirable; i think it
should be a file that is exported by the application).
Others use other mechanisms.

For my own recipe I ended up with something like:

do_stage() {
        install -d ${STAGING_INCDIR}
        install -d ${STAGING_INCDIR}/${PN}
        install -m 0644 ${D}/${includedir}/${PN}/*.h ${STAGING_INCDIR}/${PN}
}

as that seems the best. ${D} contans the exported/installed files from
the application. Those files are the ones the application wants to
make externally available and those should end up in staging. Not
something from ${S}.

There is something odd here though. Only a few recipes do this
1453 recipes have a do_stage or do_stage_append function.
646 of these do autotools_stage_all (and perhaps other things).
The rest? all kind of interesting variants. Some understandable, some
outright odd.

That has lead me to the following thoughts:
Why is not all of install/usr/include (including subdirs) copied to
staging inc?
Why is not all of install/usr/lib copiied to staging lib?
(and of course alternatives like /usr/loocal/lib, /usr/local/include, ...)

A solution could be to do this automatically (and have a way with a
var to add additional dirs). This is more or less identical to making
the _dev packages but now copying stuff to staging.
Alternately we could opt for a manual solution where do_stage()
invokes e.g. do_stage_inc() and do_stage_lib(), which (apart from the
obvious defaults) use a variable to decide what directories/files are
copied to staging (normally from ${D}).
After that we can clean the existing recipes and probably get rid of
most of the do_stage rules.

What do people feel about this?

Any volunteers to implement this? I'm more than happy to do part of
the recipe cleaning. My knowledge of the internal structure and do's
and don't's of the build system are pretty weak (and so is my pyhthon
knowledge) so I'd rather not make the build system changes myself.
(unless someone stands up who wants to guide and mentor me).

Frans

PS: I used install in my example above, which I know is the regular
way to do it.
As I also had some subdirs it was more complicated than given above.
Would a cp -r followed by a chmod -R have been ok instead? (it would
definitely be a lot simpler). FM


