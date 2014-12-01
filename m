Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5F565D3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 10:40:15 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id v1so4726808yhn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 02:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=bfc5Cb4TE2O5qR391BDQo3Q9kRRJNsLr3m6mr1KmFqI=;
	b=XofFadTOqfkUYGcHNtK7Tjo2j9N9cjDwlv3tnZmJx8us1MAmLxIEwi5SkF2t1JEzfl
	M1Fhxk0GMJe3puGIkoTWmomlKkpQfiAZzzyPB5T3REHJU66vxQ6LN5yQL/WJNoli5ccW
	sxPDBrjcGX3BZT5c6vbHEnLgJsN/QwALqeK8qURmpqNpj58KC6baG3xXL85RsRvTpRdH
	yOYHsmKRJ4B41rVN+QAnU+son1xRlBQ9bu+rH0kZrFbCAtAeN2+q63UdHdRIMoLsUE6J
	rv5jgKhu7lBRI9bpxFuyTr3jGtEaRDjNSt7yF+Ylgkea+bIDSknEsFcjibrWkWRzTYKK
	v4rQ==
MIME-Version: 1.0
X-Received: by 10.170.70.193 with SMTP id m184mr35997778ykm.50.1417430414988; 
	Mon, 01 Dec 2014 02:40:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 02:40:14 -0800 (PST)
In-Reply-To: <e2b03e9992fc261ef0b7139d9b6443d6eda300a0.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
	<e2b03e9992fc261ef0b7139d9b6443d6eda300a0.1417194166.git.akuster808@gmail.com>
Date: Mon, 1 Dec 2014 08:40:14 -0200
X-Google-Sender-Auth: 3Nium4yEm7dF4xEHsPPozXKGf8I
Message-ID: <CAP9ODKpCAVrvXpk8eYgej1__iTJN2CYg+T8aa6ah=ELt4j-5YA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/15] phpmyadmin: fix for Security Advisory CVE-2014-5274
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 10:40:17 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sun, Nov 30, 2014 at 11:04 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Cross-site scripting (XSS) vulnerability in the view operations page in
> phpMyAdmin 4.1.x before 4.1.14.3 and 4.2.x before 4.2.7.1 allows remote
> authenticated users to inject arbitrary web script or HTML via a crafted
> view name, related to js/functions.js.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5274
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...4505-security-XSS-in-view-operations-page.patch | 43 ++++++++++++++++++++++
>  .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
>
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
> new file mode 100644
> index 0000000..164a072
> --- /dev/null
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
> @@ -0,0 +1,43 @@
> +From 0cd293f5e13aa245e4a57b8d373597cc0e421b6f Mon Sep 17 00:00:00 2001
> +From: Madhura Jayaratne <madhura.cj@gmail.com>
> +Date: Sun, 17 Aug 2014 08:41:57 -0400
> +Subject: [PATCH] bug #4505 [security] XSS in view operations page
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Marc Delisle <marc@infomarc.info>
> +---
> + ChangeLog       |    3 +++
> + js/functions.js |    2 +-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 7afac1a..cec9d77 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,6 +1,9 @@
> + phpMyAdmin - ChangeLog
> + ======================
> +
> ++4.2.7.1 (2014-08-17)
> ++- bug #4505 [security] XSS in view operations page
> ++
> + 4.2.7.0 (2014-07-31)
> + - bug       Broken links on home page
> + - bug #4494 Overlap in navigation panel
> +diff --git a/js/functions.js b/js/functions.js
> +index 09bfeda..a970a81 100644
> +--- a/js/functions.js
> ++++ b/js/functions.js
> +@@ -3585,7 +3585,7 @@ AJAX.registerOnload('functions.js', function () {
> +         var question = PMA_messages.strDropTableStrongWarning + ' ';
> +         question += $.sprintf(
> +             PMA_messages.strDoYouReally,
> +-            'DROP VIEW ' + PMA_commonParams.get('table')
> ++            'DROP VIEW ' + escapeHtml(PMA_commonParams.get('table'))
> +         );
> +
> +         $(this).PMA_confirm(question, $(this).attr('href'), function (url) {
> +--
> +1.7.10.4
> +
> diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
> index c267d89..447b778 100644
> --- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
> +++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
>             file://0001-bug-4504-security-Self-XSS-in-query-charts.patch \
> +           file://0001-bug-4505-security-XSS-in-view-operations-page.patch \
>             file://apache.conf"
>
>  SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
> --
> 1.9.1
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

