Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OF4bB-0006iR-O1
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 14:11:38 +0200
Received: by ywh26 with SMTP id 26so4522356ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=D0auJvcX8GG+1jFKsKKNOKTQ2oLff/wsYLKdRY5Md4w=;
	b=gCeQlBd+K0WN6uiib2MzA2mH2RHYxoKCvGrTlKTqRuKQGZY2P08WrVD1yKRaYQf0Kc
	8riuQlKMIbxwKo31vnCa7AxDf3DfgupXIv95gphhLxqCm70un/NrEHZTitxsM3C3MOuk
	r5XdZ6Tfl7B2oCh95+WCS3916HCvOHgOosorw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ELl9KGtLC5IaNVZq4vRYMfD3r9WJ/ThHIOfWLMb6Z3n/53nrByjcbb2COGUCpClr4z
	vWZWOawT0TPJwsKE/zD62fOIYjKxF2FnQWO8R3w8v7Af3OqG7bsNNtd177u2h6ZaIuyf
	IY1bDlTkW0qSolIMVXDluSBaoUC30pVQ0W6F4=
MIME-Version: 1.0
Received: by 10.101.147.32 with SMTP id z32mr12056522ann.227.1274357254735; 
	Thu, 20 May 2010 05:07:34 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Thu, 20 May 2010 05:07:34 -0700 (PDT)
In-Reply-To: <bug-5437-13@http.bugs.openembedded.org/>
References: <bug-5437-13@http.bugs.openembedded.org/>
Date: Thu, 20 May 2010 14:07:34 +0200
Message-ID: <AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] [Bug 5437] New: packaged-staging freezes
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
X-List-Received-Date: Thu, 20 May 2010 12:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I had same stall on:

NOTE: package stagemanager-native-0.0.1-r12: task do_package_write: Succeed=
ed

There is one patch is shr repo removing one lockfile in
packaged-staging.bbclass which helped my rebuild.

http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/1ae868c5f4=
029f1862555e97a1aba37a8935221c

I think RP could say something about this lock.

Regards

Andrea


On Thu, May 20, 2010 at 1:45 PM,  <bugzilla-daemon@git.openembedded.org> wr=
ote:
> http://bugs.openembedded.org/show_bug.cgi?id=3D5437
>
> =A0 =A0 =A0 =A0 =A0 Summary: packaged-staging freezes
> =A0 =A0 =A0 =A0 =A0 Product: Openembedded
> =A0 =A0 =A0 =A0 =A0 Version: org.openembedded.dev
> =A0 =A0 =A0 =A0 =A0Platform: ARM
> =A0 =A0 =A0 =A0OS/Version: Linux
> =A0 =A0 =A0 =A0 =A0 =A0Status: UNCONFIRMED
> =A0 =A0 =A0 =A0 =A0Keywords: angstrom
> =A0 =A0 =A0 =A0 =A0Severity: normal
> =A0 =A0 =A0 =A0 =A0Priority: P3
> =A0 =A0 =A0 =A0 Component: unspecified
> =A0 =A0 =A0 =A0AssignedTo: openembedded-commits@lists.openembedded.org
> =A0 =A0 =A0 =A0ReportedBy: henri.bragge@dcombus.com
>
>
> First I successfully built a custom Angstrom image for an armv5 platform =
with
> PSTAGE_DIR defined outside of the tmp-directory. Then I removed tmp and t=
ried
> to build again. This time the building froze after the second pstage pack=
age
> (coreutils-native) was installed.
>
> Last few rows of the build output shows this:
>
> NOTE: Running task 20 of 2123 (ID: 169,
> .../oe/os/openembedded/recipes/coreutils/coreutils-native_7.2.bb, do_sets=
cene)
> NOTE: Running task 21 of 2123 (ID: 64,
> .../oe/os/openembedded/recipes/quilt/quilt-native_0.48.bb, do_setscene)
> Unpacking staging-coreutils-native-i686-linux...Unpacking
> staging-quilt-native-i686-linux...Done.
> Configuring staging-quilt-native-i686-linux...Done.
> Done.
> Configuring staging-coreutils-native-i686-linux...Done.
> (never goes any further)
>
> If I remove coreutils-native package from PSTAGE_DIR and rebuild, same ha=
ppens
> with a different package. I did not find any reason for this from logs (e=
ven
> with bitbake -DDD).
>
> I'm building on i686 Debian lenny with bitbake 1.8.18 and OE
> 06fff17991cf5105cb29d3cec2640995ace329b5 (5/19/2010).
>
> Previously, with OE from April (before packaged-staging.bbclass rewrite) =
I
> didn't have these problems. One difference now is that there used to be o=
nly
> one DEPLOY_PSTAGE_DIR, but now there is PSTAGE_DIR and PSTAGE_WORKDIR. Sh=
ould I
> define them both outside TMPDIR to be able to reuse staging packages?
>
> --
> Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=3Demail
> ------- You are receiving this mail because: -------
> You are the assignee for the bug.
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


