Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TCBeU-0000sc-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 17:48:26 +0200
Received: by pbcwy7 with SMTP id wy7so3918919pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=4uUtxNIqRHpRWrY3obaKPGrRq3xhQg5IwgPRn5L7LJE=;
	b=fxz7p8d5H0Z7sdErSfhCqfM3jXv0DUcjuM6HmdtI/8j8w5o3KwXErK6aehoTLBRzGp
	T3fvgXRcgsu4yS6/r6NQ1vRNq9ztbcZjWXZtl2STyZujZX2E39K/9fSARjaxvY2bFOP7
	LvgIQ8qqeY5VPcdWfPQ2y4RY7AE8tMo4DJeN/4XYQ6uF2VlatjoK1e+DEaENhoMupEQN
	ffF2jXmERJb2P1dHupzL38SoHsXtK9V4J2Zxi7fS4RXPS103B30xrQLA+vBzFEY+66yB
	XtcKTMwKdt6TCn09jVHHbBKhuSJprE1MR/aw96E4rWK8GWvQwN7+gCxOcgzfgZqk1YqC
	YCug==
MIME-Version: 1.0
Received: by 10.68.197.70 with SMTP id is6mr4638501pbc.64.1347541444186; Thu,
	13 Sep 2012 06:04:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 13 Sep 2012 06:04:04 -0700 (PDT)
In-Reply-To: <1347521638-3093-1-git-send-email-b28495@freescale.com>
References: <1347521638-3093-1-git-send-email-b28495@freescale.com>
Date: Thu, 13 Sep 2012 10:04:04 -0300
X-Google-Sender-Auth: 3r0HW1IY7K0zw-pONtmg7Yvu4nQ
Message-ID: <CAP9ODKoByUb=F+8O60w7juvDJ4tVcU2BG=m3kFbGBgASCJrbvA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: b29882@freescale.com
Subject: Re: [meta-oe][for-denzil][PATCH] systemd.bbclass: use system variables instead of hardcoded paths
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
X-List-Received-Date: Thu, 13 Sep 2012 15:48:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 13, 2012 at 4:33 AM,  <b28495@freescale.com> wrote:
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
> index a2c8ddf..9690c18 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -154,7 +154,10 @@ python populate_packages_prepend () {
>
>         # check service-files and call systemd_add_files_and_parse for each entry
>         def systemd_check_services():
> -               searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
> +               searchpaths = []
> +               searchpaths.append(d.getVar('sysconfdir', True))
> +               searchpaths.append(d.getVar('libdir', True))
> +               searchpaths.append(d.getVar('base_libdir', True))
>                 systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
>                 has_exactly_one_service = len(systemd_packages.split()) == 1
>                 if has_exactly_one_service:
> @@ -168,9 +171,9 @@ python populate_packages_prepend () {
>                 for pkg_systemd in systemd_packages.split():
>                         for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
>                                 path_found = ''
> -                               for path in searchpaths.split():
> -                                       if os.path.exists('${D}' + path + service):
> -                                               path_found = path
> +                               for path in searchpaths:
> +                                       if os.path.exists('${D}' + path + '/systemd/system/' + service):
> +                                               path_found = path + '/systemd/system/'
>                                 if path_found != '':
>                                         systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
>                                 else:

Please check if a similar change is need on master (inside meta-systemd).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


