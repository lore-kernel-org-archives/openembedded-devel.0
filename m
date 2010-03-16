Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NrNpG-0000Eu-01
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 04:52:19 +0100
Received: by ywh13 with SMTP id 13so786373ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=7TlOV6Ovdfjt671w4uDZPg07073poREg24QbYLQKd5E=;
	b=Ss9MfCNEmkhoya6Jn6KXzLjdGujrO0F9PQMsY2klZKbFh3Zc0Z9V7tsScDL2rKhlZo
	IcvHu3hE3fIK/QdhwGjPhEDRD7iX565N4uIHS/jyY6StG//XeNcHZVO2oQD6fjMkyhXe
	Rq4/GrsVXZ1cNOyvmRgJfBNCk0xRVoZ6Ux5Xo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=DvbCnM7bN2h8MtkdMB5EUHrsiOmSUjzq1zR1T3uhFUHM0u+Npwij1BPjpF3XWIIaAe
	9xyHg1E4SXlFbx4x97DyIdOESYl6SVk53XtHD+iqGxSolLZmbSMl/JC+VQ/lhCyb0vFe
	adZp2/hzsERUaBNzd3Q0fe/OFzazOPZSDUrcE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.101.138.30 with SMTP id q30mr6888730ann.57.1268711351188; Mon, 
	15 Mar 2010 20:49:11 -0700 (PDT)
In-Reply-To: <1268709026-7111-1-git-send-email-denis@denix.org>
References: <1268709026-7111-1-git-send-email-denis@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 15 Mar 2010 20:48:51 -0700
X-Google-Sender-Auth: aeb4567448521986
Message-ID: <b6ebd0a51003152048s67509df1o10cd4aa981ac773a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.183
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] opkg: fix global depends on openssl, even in 	-nogpg/-nocurl
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
X-List-Received-Date: Tue, 16 Mar 2010 03:52:19 -0000
Content-Type: text/plain; charset=UTF-8

Looks reasonable to me.

Acked-by: Chris Larson <clarson@kergoth.com>

On Mon, Mar 15, 2010 at 8:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Fixes the problem, introduced by 8c1731d818c89a291f80940c1912587ff9ce46b7,
> where openssl is added with DEPENDS_append override, preventing -nogpg and
> -nocurl variants from clearing the DEPENDS, when they include opkg_svn.bb
> file, thus forcing them to depend on openssl too.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/opkg/opkg.inc    |    4 ++--
>  recipes/opkg/opkg_svn.bb |    2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
> index 4442102..9a3d3dc 100644
> --- a/recipes/opkg/opkg.inc
> +++ b/recipes/opkg/opkg.inc
> @@ -2,9 +2,9 @@ DESCRIPTION = "Opkg Package Manager"
>  DESCRIPTION_libopkg = "Opkg Package Manager Library"
>  SECTION = "base"
>  LICENSE = "GPLv2"
> -DEPENDS = "curl gpgme"
> +DEPENDS = "curl gpgme openssl"
>  PV = "0.1.6+svnr${SRCPV}"
> -INC_PR = "r20"
> +INC_PR = "r21"
>
>  FILESPATHPKG =. "opkg:"
>
> diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
> index 4945260..5138458 100644
> --- a/recipes/opkg/opkg_svn.bb
> +++ b/recipes/opkg/opkg_svn.bb
> @@ -1,7 +1,5 @@
>  require opkg.inc
>
> -DEPENDS_append = " openssl"
> -
>  PR = "${INC_PR}"
>
>  PROVIDES =+ "virtual/update-alternatives"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

