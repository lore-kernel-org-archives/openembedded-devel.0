Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TP2lE-0000TA-0F
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 04:56:32 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3990ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Iynsl6xks1xCuvhnG3nY96L3Nu1VD6kzqoNJooNMrdI=;
	b=hV2Ke6BMknv751Z6hw/JdIrMdzoyjLelX4X+M9DYe7jJdJZnxqQjtO2JqYlBLeEP2R
	qcDSI26yIEXG6it0GRqiD+vFcXw3gOyJmIpZ7GnleuZEnmiMwQWKwtKIB/hD1Ul8ug+2
	Tn3+HMqPR61pkspD1Hynm61RZQ9zQYrnjDpqJYMpsAo3bSIrdUIbSxxSsp/u7A8dROqR
	bTTQXDR4R2PxmO7r8fZ0kEfBMlp3v/q0fKEHzc3LXZXqhkcyGbAedgrJ9tmzvxThFFRx
	52TPjGm3t7JLNodm7bacPYuBDu/Q0TT1MO+f2pslurIROjl+lvUgWkWKeBnDCbBb2I6c
	XXMg==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr7093308igc.31.1350614590920; Thu,
	18 Oct 2012 19:43:10 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Thu, 18 Oct 2012 19:43:10 -0700 (PDT)
In-Reply-To: <9610a228f0d8308baefe7457efebe7953bf02831.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<9610a228f0d8308baefe7457efebe7953bf02831.1350589969.git.Martin.Jansa@gmail.com>
Date: Fri, 19 Oct 2012 04:43:10 +0200
Message-ID: <CALbNGRTki15AnitLToVDzcx=xycPm9THEVy5snksc3Q8tzb+Xg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/5] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Fri, 19 Oct 2012 02:56:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 18, 2012 at 9:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * bitbake uses PACKAGES_DYNAMIC as regexp
>   ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
>   * made all those last '-' optional, use .* (or nothing)
> * use += instead of = in most cases to keep ${PN}-locale from
>   bitbake.conf:PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/efl/evas-generic-loaders.inc         | 2 +-
>  meta-efl/recipes-efl/efl/evas.inc                         | 2 +-
>  meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb         | 2 +-
>  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    | 2 +-
>  meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb              | 2 +-
>  meta-gnome/recipes-support/goffice/goffice_0.8.17.bb      | 2 +-
>  meta-initramfs/recipes-devtools/klibc/klibc-utils.inc     | 2 +-
>  meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb  | 2 +-
>  meta-oe/recipes-extended/lcdproc/lcdproc5.inc             | 2 +-
>  meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb         | 2 +-
>  meta-oe/recipes-multimedia/libav/libav.inc                | 2 +-
>  meta-oe/recipes-support/freerdp/freerdp.inc               | 2 +-
>  meta-oe/recipes-support/openldap/openldap_2.4.23.bb       | 2 +-
>  meta-oe/recipes-support/pidgin/pidgin.inc                 | 2 +-
>  meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb | 2 +-
>  meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb  | 2 +-
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb              | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
>
Some buildhistory results for that?

Andreas


