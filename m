Return-Path: <net147@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFD06EE66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 03:20:43 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id c9so9776769qcz.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 19:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=M4aMspeN/vZaLWedHUIubOWHIBKAF7LvndJooM4vD1Y=;
	b=FMipSCiGZwPvhuBNxZ0dwmjAzt+Zu4Jo65Op6pla8yqjeZ3ZBaYwoL9mpC4Gd3ktUQ
	oL1sTVXMjz7juxbo0EpIKkd3bRYAyYQNlh7J2Eu8VhaeIxP9HcoMJ3r1sucCuRY6Lj86
	f89wqI7uQNnPNCp4UuOsIheQ5KD+IEh5tN9QrCfnVKTCd5bBWHC0B5TTJ0Akvcx65jFb
	pxXT3SucOw0o6+/0e0tq/DkPPDjfQt3P22Vi9ykDPTGh8w06yP8XYqOUuz+6ePfnx3UJ
	lBQe91TCn6sNaaQotHOvtbFo9NvdBYFY18N2Vatgyetcqjc1HtuAQgVhXKE3OYhAUgBH
	pSBg==
MIME-Version: 1.0
X-Received: by 10.224.165.133 with SMTP id i5mr35114849qay.75.1393298444241;
	Mon, 24 Feb 2014 19:20:44 -0800 (PST)
Received: by 10.96.78.193 with HTTP; Mon, 24 Feb 2014 19:20:44 -0800 (PST)
In-Reply-To: <1393273696-9249-2-git-send-email-otavio@ossystems.com.br>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-2-git-send-email-otavio@ossystems.com.br>
Date: Tue, 25 Feb 2014 14:20:44 +1100
Message-ID: <CANwerB1b00ngQgTeeRbiV8kYrmd4rk1Ru2XhYGTD2xx7aF-KgA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 1/3] populate_sdk_qt5.bbclass: Fix symlink location for QtCreator use
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
X-List-Received-Date: Tue, 25 Feb 2014 03:20:47 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2014 07:28, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The QtCreator is quite broken regarding finding the mkspecs files; so
> to workaround it we must to add a symlink to it. The workaround was in
> place but in the wrong sysroot, it must to be in the /native/ one.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/populate_sdk_qt5.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
> index 3b849e9..635dd6d 100644
> --- a/classes/populate_sdk_qt5.bbclass
> +++ b/classes/populate_sdk_qt5.bbclass
> @@ -27,7 +27,7 @@ toolchain_create_sdk_env_script_append () {
>      echo 'export QT_CONF_PATH=${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
>
>      # make a symbolic link to mkspecs for compatibility with QTCreator
> -    (cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; \
> +    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
>           ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
>
>      # Generate a qt.conf file to be deployed with the SDK
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Acked-by: Jonathan Liu <net147@gmail.com>

Tested and working. Qt Creator now finds the mkspec after applying this patch.

Regards,
Jonathan

