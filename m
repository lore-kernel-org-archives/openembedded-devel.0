Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OldNU-0002OS-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 09:48:06 +0200
Received: by iwn38 with SMTP id 38so346160iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jQCOTfFUzHy9xAN1nmkTpPypneoijFQyvwWFNDG636A=;
	b=Wl/z/bK2jaV9k6g8CUakdVKREbFJJTk0cdaeJSG+eNo9bSjBrGRyxh5HShRu7iOfsh
	YEQX5JK1Pi7m6/EC52qO2Y3tU8Ch82scAxPbVWQYlXFtgifIcfsDp4XgbdM4XPFISq/X
	LJ3QDUgR7xto0ANXnkGapzTnAEGzY1om4sWug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ns6NEBpUk1GkbP9Kt+u5biwhaD/P2ExdKjFrp9EaxBkFVjOmnLSHdtyY15sYIcTMcv
	I76GLqCh7AMew8PWZNWfHMZaGPPFITEbvM9T2EXWIxXkoEU6Sqiq03DeJDIR2sWnCjpq
	OMFCoHyqG9pSnO4K2FSSJ2Oei5IOnyFzdrRiU=
MIME-Version: 1.0
Received: by 10.231.183.134 with SMTP id cg6mr8735762ibb.197.1282117666345;
	Wed, 18 Aug 2010 00:47:46 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 00:47:46 -0700 (PDT)
In-Reply-To: <1282054949-3588-1-git-send-email-noor_ahsan@mentor.com>
References: <1282054949-3588-1-git-send-email-noor_ahsan@mentor.com>
Date: Wed, 18 Aug 2010 09:47:46 +0200
Message-ID: <AANLkTimN_QvwUR03nce7tV5V2QAMgiKuiE4RvccQvdgK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] sox-native: Run oe-stylize.py
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
X-List-Received-Date: Wed, 18 Aug 2010 07:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Noor Ahsan <noor_ahsan@mentor.com>:
> * Run oe-stylize.py script on the recipe and modified the recipe accordin=
g to the output of oe-stylize.py.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/sox/sox-native_13.0.0.bb | =A0 13 ++++++-------
> =A01 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/recipes/sox/sox-native_13.0.0.bb b/recipes/sox/sox-native_13=
.0.0.bb
> index 9be0322..0dc90ca 100644
> --- a/recipes/sox/sox-native_13.0.0.bb
> +++ b/recipes/sox/sox-native_13.0.0.bb
> @@ -7,13 +7,12 @@ inherit native
> =A0do_patch() {
> =A0 =A0 =A0 =A0 true
> =A0}
> -
> -do_stage() {
> - =A0 =A0 =A0 make bindir=3D"${STAGING_BINDIR}" libdir=3D"${STAGING_LIBDI=
R}" mandir=3D"${STAGING_DIR_HOST}${layout_mandir}" includedir=3D"${STAGING_=
INCDIR}" install
> - =A0 =A0 =A0 rm ${STAGING_BINDIR}/rec
> - =A0 =A0 =A0 ln -s ${STAGING_BINDIR}/play ${STAGING_BINDIR}/rec
> -}
> -
> =A0do_install() {
> =A0 =A0 =A0 =A0 true
> =A0}
> +do_stage() {
> + =A0 =A0 =A0 =A0make bindir=3D"${STAGING_BINDIR}" libdir=3D"${STAGING_LI=
BDIR}" mandir=3D"${STAGING_DIR_HOST}${layout_mandir}" includedir=3D"${STAGI=
NG_INCDIR}" install
> + =A0 =A0 =A0 =A0rm ${STAGING_BINDIR}/rec
> + =A0 =A0 =A0 =A0ln -s ${STAGING_BINDIR}/play ${STAGING_BINDIR}/rec
> +}
> +

The sox recipe already has been converted about two weeks ago:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dfc909a927dd=
fcb4c0c10da1b278b496c68319a6a
I suggest doing a fresh pull of the head before changing files (in
order to avoid wasting time on work that has been done already or
avoid that you change and old version which is has fixes in git head)

Frans


