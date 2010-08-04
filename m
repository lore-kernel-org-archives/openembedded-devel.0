Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgcVY-0005VZ-Qw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 13:51:42 +0200
Received: by bwz10 with SMTP id 10so2767998bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hLZYlHEnPAf425U6W1BzaX9G+4+dNe3P7JFIHKh9V+c=;
	b=DNbB25vQmrXBMgw54U7ejz4nBOc1yugLuhfurJF7UkjW0nVQY0O0DV1X2xgax2XxUc
	ChRIixtdhdQ7sGgLnswxZKxzFMZ4kMpV+J3706E06ah0R0VKVqIqNAzZUJvq+6ei/zcl
	0TYJcywiU5fpcjCryHFpH4kwSIMrqTw0V1MDo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qFatoc9/eRC1MvsobjV5G/39bsOQQU/Xa+wetyuN8k4swB4RLnIAn2SfapjkwF37bK
	YDEdxYBGuW+N6QanugtduyQghXyvZ8d7hkfrCwnOlR2RpA5XuNI0zfJZLbYvEMJMvLPR
	8qrD8NGXGcS0SYhEz2fCRCy1Y3I2uZz88kf7I=
MIME-Version: 1.0
Received: by 10.204.46.23 with SMTP id h23mr6234087bkf.75.1280922698544; Wed, 
	04 Aug 2010 04:51:38 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 4 Aug 2010 04:51:38 -0700 (PDT)
In-Reply-To: <1280918590-5969-2-git-send-email-henri.bragge@dcombus.com>
References: <1280918590-5969-1-git-send-email-henri.bragge@dcombus.com>
	<1280918590-5969-2-git-send-email-henri.bragge@dcombus.com>
Date: Wed, 4 Aug 2010 13:51:38 +0200
Message-ID: <AANLkTikPX9UW2-PWGweaBe90qHA+NH05kWqEFRj_x0AN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Wed, 04 Aug 2010 11:51:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Henri Bragge <henri.bragge@dcombus.com>

> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
> ---
>  recipes/gsnmp/gsnmp.inc    |    6 ++++++
>  recipes/gsnmp/gsnmp_svn.bb |    8 ++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gsnmp/gsnmp.inc
>  create mode 100644 recipes/gsnmp/gsnmp_svn.bb
>
> diff --git a/recipes/gsnmp/gsnmp.inc b/recipes/gsnmp/gsnmp.inc
> new file mode 100644
> index 0000000..66e88cc
> --- /dev/null
> +++ b/recipes/gsnmp/gsnmp.inc
> @@ -0,0 +1,6 @@
> +DESCRIPTION = "SNMP library written on top of glib and gnet."
> +LICENSE = "GPLv2"
> +SECTION = "libs/network"
> +DEPENDS = "glib-2.0 gnet"
> +
> +inherit autotools pkgconfig
> diff --git a/recipes/gsnmp/gsnmp_svn.bb b/recipes/gsnmp/gsnmp_svn.bb
> new file mode 100644
> index 0000000..ed27bb6
> --- /dev/null
> +++ b/recipes/gsnmp/gsnmp_svn.bb
> @@ -0,0 +1,8 @@
> +require gsnmp.inc
> +
> +SRCREV = "3372"
> +PV = "0.3.0+svnr${SRCREV}"
> +PR = "r1"
>

Why do you start with PR = r1?


> +
> +SRC_URI = "svn://
> cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp;module=trunk;proto=https
> "
>

Does it need to be https ?
If http is also supported, I would prefer http i.s.o. https


> +S = "${WORKDIR}/trunk"
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

