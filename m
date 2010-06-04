Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRV6-0007n5-RK
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:39:34 +0200
Received: by fxm9 with SMTP id 9so589806fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cVCMX3ORiFxPktx/+Gsr9+W/uVKYTTP0CTBQzz9szlY=;
	b=pOwimsg//V7GZOFwWt4VDDNseKFA0y3XtSw1TzAlZAX4Xav2rkBlPSk3BjG2n1cPCV
	p6gm1DutDVZtigrxDEP7aZL2HA7HmOmkSeyC3ZC5+fWzQ9fpQOo9HW17EJE7b6j8UJFQ
	VKJGSvvnaVfyozVAEtcpiW2shU7ZP7TKEv+Ws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=s7TrxKiT4lBHVVGbZAXU/LBEtj6dpvR53GoQ94DTTLHCPqHcFQ/4B5tbcsmDOsEypK
	nFuYwLiDJrzziB1ssicIr16NNWR9eswC39cNxLCOmTePitXK/SE+MqIqbToxV93hd/IY
	L8+inP3QXxskPReTyBCS9ocQIJG8Kd4cMhJgU=
MIME-Version: 1.0
Received: by 10.223.67.144 with SMTP id r16mr11357971fai.102.1275636916193; 
	Fri, 04 Jun 2010 00:35:16 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:35:16 -0700 (PDT)
In-Reply-To: <1275510896-30845-2-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-2-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:35:16 +0200
Message-ID: <AANLkTinpXQhb5AyRr4iaHozciOEg_aVv2D03sbr6AlXz@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/16] classes/autotools.bbclass: Dont bail out if gettext/config.rpath does not exist.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:39:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Add a note if this file does not exist. The reason is that gettext can
> =A0needs libiconv and libiconv needs gettext so we need to solve this
> =A0catch 22
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0classes/autotools.bbclass | =A0 =A06 +++++-
> =A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index df2c114..8a5b982 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -125,7 +125,11 @@ autotools_do_configure() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "no" | glib-g=
ettextize --force --copy
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if grep "^[[:space:]]=
*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp ${STAGING_DATADIR}/g=
ettext/config.rpath ${S}/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -e ${STAGING_DATAD=
IR}/gettext/config.rpath ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp ${STAGING_DATADI=
R}/gettext/config.rpath ${S}/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oenote ${STAGING_DA=
TADIR}/gettext/config.rpath not found. gettext is not installed.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


