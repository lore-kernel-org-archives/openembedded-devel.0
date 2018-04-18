Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0422571AC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 11:33:58 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s18-v6so3866165wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LS6UeNZKIYV2fYSLW3PHor+on4SOket5adiATpp5Rio=;
	b=ptq4sz/+ztE4TIfOgcsm7g4CqOkW3TYuldILFk0Ii+dkEdK+x91B6UMYMkcl6ulVex
	rlhD5QXQ+W80PyWKrPLHOuPaY+0SybwRP8683Al9gJ2CESVdwj99086cSNyS7PjdR81u
	3+JUQP1cq03OAmJqZnEL/galCH8B+TBcDwda+6Qyvdo7WIzej/ODzUNC/KhxNhAJTLdN
	0Ji6MccQDQTX357YPDYWodgQGZKS9tGFAVQkXX7obJguBc7zKeiy3G9uwl4SxnQIFiiZ
	jVbVdCtOG4BSnnSpUPDqBz8gFcbeBGhrg0vsM5nl2EIQxsOwtQjC2hWsUfqZxbLC0qXu
	iNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LS6UeNZKIYV2fYSLW3PHor+on4SOket5adiATpp5Rio=;
	b=dqX/zRkdIAJ8Nxr2pDlQL8hR7CHajQLAt9TpQdEDpT0DLwf5TG9zP1SBcKv3A2G4Hl
	mPKhhDvapxs+s4jXlKK826dOP5v9IkHCL7CsNBbXkhVzlDTOs9emecOWJnoYXdsnV9/C
	rzOfkKGSspkXaEyiSuSvQItEKtuJ5bCyC/5DgBHXPv9LmPFsqGgimoM7L1xcLRhoY7IP
	FnOvaDEZgH9+L8pAj0Fj0TycDC/yb4P2xJx1lvYfs2r+dKKWyAL2WBlwX6YvIcNfF3WZ
	EpMqAke0uAri6cT5huBTHUIktfHyIFHEjpY0Y0LjiDolloeUZaaY1AJZdicQvaJWa/yD
	unrQ==
X-Gm-Message-State: ALQs6tCWAbDeXsjV8G/q0j+d4v/Emf5svf2XGflNO01NhzkdCAQ6u6aI
	E/bOw2Vya7atsTOFCXZavvACdEW7cWUYzlKx8dM=
X-Google-Smtp-Source: AIpwx49D7fMfnFhriPIKbQYQLIDtHTN5tYQ35uqpwe5njB3fpZS8py60C9+6Td9r2cRWKiOlnIIXhBZ6UHoeFhxTZI8=
X-Received: by 2002:adf:db0a:: with SMTP id
	s10-v6mr1376178wri.241.1524051239508; 
	Wed, 18 Apr 2018 04:33:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Wed, 18 Apr 2018 04:33:58 -0700 (PDT)
In-Reply-To: <1523886232-12585-1-git-send-email-christian.thaler@tes-dst.com>
References: <1523886232-12585-1-git-send-email-christian.thaler@tes-dst.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Apr 2018 13:33:58 +0200
Message-ID: <CA+chaQfuZ0xcExSg_X+9oNX_zFddgNHt=B7T6_bu_j=mU=yaAw@mail.gmail.com>
To: c-thaler <christian.thaler@tes-dst.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: fix environment.d dir permission
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2018 11:33:59 -0000
Content-Type: text/plain; charset="UTF-8"

Missing Signed-off-by and I might take alternative fix for this:
https://patchwork.openembedded.org/patch/150133/

On Mon, Apr 16, 2018 at 3:43 PM, c-thaler <christian.thaler@tes-dst.com>
wrote:

> Fixed an issue with the nativesdk-cmake package, which sets the permission
> of
> /opt/.../environment.d to rwxr-xr-x.
> nativesdk-qtbase set the permission to rwxrwxr-x, leading to a conflict:
>
> Error: Transaction check error:
>   file /opt/poky/2.4.2/sysroots/x86_64-pokysdk-linux/environment-setup.d
>   conflicts between attempted installs of
>   nativesdk-cmake-3.8.2-r0.x86_64_nativesdk and
>   nativesdk-qtbase-tools-5.9.4+git0+0d9208cecb-r0.x86_64_nativesdk
>
> Recipe nativesdk-qtbase will now set the permission to rwxr-xr-x.
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> index 5b20b0a..a678b19 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -171,7 +171,7 @@ do_install() {
>  }
>
>  fakeroot do_generate_qt_environment_file() {
> -    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
> +    install -d -m 755 ${D}${SDKPATHNATIVE}/environment-setup.d/
>      script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
>
>      echo 'export PATH=${OE_QMAKE_PATH_HOST_BINS}:$PATH' > $script
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

