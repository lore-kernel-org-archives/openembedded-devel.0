Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OGEui-00007P-RQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 19:24:40 +0200
Received: by bwz1 with SMTP id 1so607637bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gIyp9NUgt5FU+b+j2ORDlO5ovZb64LWMdnDEjWQpfjY=;
	b=NTG/twwuc0/RbDFDSZx4i5Y0e7WfsSBKXjQCqwppzKU+RM6UikT73Kgq6AV21Ry0dl
	s9YOAZJgEl7cIqWf6y9fm1X9sviPUcTMVBMmGFsCe67crrGyewOgks1ZOHhhO4M4DuM5
	3qD6LoyGUpj34aach4WH5BI6RWftDhRR06v+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VZl8TJDonlIl1bKymZZjniWRbV8MFicltsUzuLL1ebhspfNwuvAi2Yf9keEOX5gCbI
	fv8o607CaKgRImKhoziLZ3lPrCA8jeeenuC3FKD0lLCih468H4dYzJVnxEYa5LqfGvRn
	jboUCVg8OtcQUctLwqCi56Jr3kSNz7iic9zUQ=
MIME-Version: 1.0
Received: by 10.204.22.6 with SMTP id l6mr1589298bkb.163.1274635233374; Sun, 
	23 May 2010 10:20:33 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Sun, 23 May 2010 10:20:33 -0700 (PDT)
In-Reply-To: <AANLkTimzxtQko6-MOSAhVLlC4rGFakVOC76zDh091D14@mail.gmail.com>
References: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
	<AANLkTimzxtQko6-MOSAhVLlC4rGFakVOC76zDh091D14@mail.gmail.com>
Date: Sun, 23 May 2010 19:20:33 +0200
Message-ID: <AANLkTin1nyU7-QCJ8LOpk_xXXToOaT79Nao-s5Z0L37i@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Angstrom distro, qemu: uncaught target signal 4 (Illegal instruction) - core dumped on glibc package
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
X-List-Received-Date: Sun, 23 May 2010 17:24:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/23 Khem Raj <raj.khem@gmail.com>

> On Sun, May 23, 2010 at 3:17 AM, Grzegorz Toporek <top.grzechu@gmail.com>
> wrote:
> > Hi all,
> >
> > thank you for all your suggestions and help. I started to build angstrom
> > distro as you recommended.
> >
> > Unfortunately, I got this error while building glibc package:
> > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> >
> > I found this tread which says that gemu doesn't support iwmmxt...but how
> to
> > deal with this? Is there a patch needed? Where to find it?
> > http://ibot.rikers.org/%23oe/20060827.html.gz
> >
> > I use tune-iwmmxt.inc file with my machine.
> >
> > Please help me with it.
> >
>
> I have pushed a fix to qemu recipe to .dev, if you are not using qemu
> built with OE then
> you have to use it to get this fix. IOW if you have qemu-native in your
> list of
> ASSUME_PROVIDED list then remove it from there.
>
> Thanks
>
> -Khem
>

Thank you very much. However it doesn't solve my problem. I still have this
error wit a few additional lines:

NOTE: generating locale es_NI (UTF-8)
Internal resource leak before 4011435c
Internal resource leak before 40114384
Internal resource leak before 40114384
Internal resource leak before 40114624
Internal resource leak before 40114624
Internal resource leak before 40114658
qemu: uncaught target signal 4 (Illegal instruction) - core dumped

Maybe I didn't understand you well. I update my recipes by "git pull" and
checked if ASSUME_PROVIDED variable is not set. It wasn't...I have checked
qemu_0.12.4.bb recipe and SRC_URI contains new patch.

What do you mean "qemu built with OE"?

Sorry for my little knowledge of OE and bitbake.


Kind Regards,
Grzegorz

