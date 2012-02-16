Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyR2-0006WN-3J
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:19:32 +0100
Received: by vcbfl15 with SMTP id fl15so1582129vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=OSP3UHyLXYHsHWpF7UPr69+12lALkGFEeKLHp1q0DkQ=;
	b=ORT3611GbDQO9Xs8IDU2KFBnn9FL907d0JF4SWSjExDIHfSLIHv36aXvN0PBhIRDoW
	LYIFxvZbAVoki1Z1E6PavwepEyxhLZKIb9XmlSzVM9u6U6KvXgOpbma4EYprzrYEiBIv
	IeRM/P7+SQWfN69a/QlRNHySotmTKx4qwydUQ=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr981340vcq.44.1329387078973; Thu, 16
	Feb 2012 02:11:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:11:18 -0800 (PST)
In-Reply-To: <1329358015-31996-1-git-send-email-obi@opendreambox.org>
References: <1329358015-31996-1-git-send-email-obi@opendreambox.org>
Date: Thu, 16 Feb 2012 08:11:18 -0200
X-Google-Sender-Auth: y6llYvminMZjS8AOCp5oN9qYM90
Message-ID: <CAP9ODKrg9F9bFc5LSWSXRC9Jtf8d8=6qco9g00bbOJ1aVM2mEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] busybox: create /etc/default on do_install
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
X-List-Received-Date: Thu, 16 Feb 2012 10:19:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:06, Andreas Oberritter <obi@opendreambox.org>wrote:

> * Currently, it's blindly assumed that /etc/default
>  exists, when busybox-syslog gets copied into it.
>  This only works by chance and only if CONFIG_HWCLOCK=y
>  is set.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../recipes-core/busybox/busybox_1.19.3.bbappend   |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> index 7e72a43..98b959f 100644
> --- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> +++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> @@ -13,6 +13,7 @@ SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
>  SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
>
>  do_install_append() {
> +       install -d ${D}${sysconfdir}/default
>        install -m 0644 ${WORKDIR}/busybox-syslog.default
> ${D}${sysconfdir}/default/busybox-syslog
>
>        install -d ${D}${base_libdir}/systemd/system
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

