Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLzZO-0003KZ-86
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:14:57 +0200
Received: by gyg10 with SMTP id 10so3293145gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Foo4NnT5wXT88KSc+Lr7s1uHzhcSJFxbELeVf0PvA3I=;
	b=IL1Rnkca2kDj9zW4unmvTYiHlBGU3Tzxd1uywVU1/9Su9n1z/iCY6iZPDr/3nKa0un
	+xGbgL7QUyQx5bIh/pbYldMBK7oAEk/3vqFaLRurxcTq/eJLYyOAJjQi3uC2xnWcs0/A
	bRjLg7yQRTRe/regBjiuufNTAVtHB86PV6gKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LEPdDPsfBcQEKYOEnrXVHh20Gs8gR9ynE2IjGr+4wTbyb71C5Fkb6ner5QWtoLhwZ5
	bValypek8K9R1O2Dgp2x4Kr/oVsCSnAsyZOwkfwFKnk8GcnktJAZJMXM/KEw7z6h3/VT
	V9a1fKJGgcayg/McJyzyxBmlAJdE90zV+0TXY=
Received: by 10.101.211.40 with SMTP id n40mr16814944anq.174.1276006200729; 
	Tue, 08 Jun 2010 07:10:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 07:09:40 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF95@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF95@KCINPUNHJCMS01.kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 07:09:40 -0700
Message-ID: <AANLkTimOEUa13gFPmIiiycqefEBc85umHSAhmghH-eL7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Tue, 08 Jun 2010 14:15:16 -0000
X-List-Received-Date: Tue, 08 Jun 2010 14:15:16 -0000
X-List-Received-Date: Tue, 08 Jun 2010 14:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 1:22 AM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Hi All,
>
> =A0 =A0 I get the following error when I run bitbake avn-image
>
> NOTE: Handling BitBake files: \ (0172/0172) [100 %]
> NOTE: Parsing finished. 163 cached, 7 parsed, 2 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/home/likewise-open/KPIT/soumyar/openembedded/recipes/glibc/gli=
bc_2.10.1.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime enti=
ty 'linux-libc-headers-dev' but it wasn't found in any PACKAGE or RPROVIDES=
 variables
> NOTE: Runtime target 'linux-libc-headers-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['linux-libc-headers-dev']
> ERROR: Required build target 'avn-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['avn-image', 'opkg-native',=
 'gnu-config-native']
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 How do I resolve this error?? Any suggestions=
 is badly needed..

post you local.conf somewhere. and take time to add some subject to the mai=
l
many people have filters to send subjectless emails to /dev/null

>
> Thanks in advance
>
> Regards,
> Soumya
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


