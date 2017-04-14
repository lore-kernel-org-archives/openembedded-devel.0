Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5FD477E93
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 19:34:23 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id o21so55178224wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rZYkZCNPU59NQw/cmvgPK2qKhy824ohUHWDdEc2EoZQ=;
	b=aeTzxWMI7Ic5DEDTsioUjdIW0/ig5ODcvaXOPAMK8sdNV+62/BGfa4dH+TLzPYmJ8r
	QHYHqBBToJ8tYSGmxPohtuDAvcWB5EcyCblrAcZ5d0QVAAHcQI0jDEQGVeBb2ZNkIdC0
	5OWWvx228aLc1vZ/T25s+wWggPm8XTUo3UmNmJBesIMgF4fc5ZcaFYY4Q6ijpkdLG7QY
	rwAEta88wFM8Nhw3etssM5pSY02gEcnNLLGml7iY47IqnTfC56zQU5ZnwGZDQnoBNWmc
	HNLPP90gYRReHgKqp3dndC2GqEhx5+aqGciflpNEL7OHnphfbQ6yQAx2/7UQDKzN29kW
	l1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rZYkZCNPU59NQw/cmvgPK2qKhy824ohUHWDdEc2EoZQ=;
	b=WVd33Skf6HhPeRP3d1PZptYtcYLJSP0fFPTGS5er1x8W6npe6AFZfPG3vonygII93D
	6AZYKpACBnB3f/g+xcwXt6lCQa/WooVnlOx73ccuOrCzgSpucCczI41Za0WeV8V6frfO
	8/0B2tioWcJcoEpsQyScTnh3WT+9HiulnhkIn2JaUBc6KeQdVMfbxzxsgrGlkAQrSyq2
	w8rrjxioflVVhj7uA0McyQvqN2vXuolSvgvwi4YYAlBStx3WlhyYDIbNcBOI3ZOn1ed2
	nsx3+tMQ3gNtIphxJNBr0dbi3anPfynuTyHS6Cafi5ZZuQMLKVE4Z44JiHMGpDplf51Q
	30uw==
X-Gm-Message-State: AN3rC/5i/XWpwprzPhfo4sX2dUk3X4G0FvNrkLLX6U+/lkV0dxrevzeb
	aVoQIN9dnNw1Rn2Edv4NT7v2L5wZXw==
X-Received: by 10.223.136.165 with SMTP id f34mr8444543wrf.145.1492198464079; 
	Fri, 14 Apr 2017 12:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Fri, 14 Apr 2017 12:34:23 -0700 (PDT)
In-Reply-To: <20170412195638.3243-8-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
	<20170412195638.3243-8-schnitzeltony@googlemail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Apr 2017 21:34:23 +0200
Message-ID: <CA+chaQeO9+92rCxVyQzvtq3d5zGyQO2ohjm2+mZafqt_t4b6ig@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 07/29] xfce4-taskmanager: update 1.1.0 -> 1.2.0
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
X-List-Received-Date: Fri, 14 Apr 2017 19:34:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fails to fetch here, might be only temporary (lets see tomorrow):
http://errors.yoctoproject.org/Errors/Details/140439/

On Wed, Apr 12, 2017 at 9:56 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb  | 10
> ----------
>  .../recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb  | 10
> ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/
> xfce4-taskmanager_1.1.0.bb
>  create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/
> xfce4-taskmanager_1.2.0.bb
>
> diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-
> taskmanager_1.1.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-
> taskmanager_1.1.0.bb
> deleted file mode 100644
> index cb1be67..0000000
> --- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -SUMMARY =3D "Easy to use task manager"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -inherit xfce-app
> -
> -DEPENDS +=3D "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
> -
> -SRC_URI[md5sum] =3D "7da465a4798629ebd8650fef62770ab7"
> -SRC_URI[sha256sum] =3D "2e1eb161f966cbfbd68bd029fb5911
> 5bc5ab0c0704cb500d20e7d73967e59ecb"
> diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-
> taskmanager_1.2.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-
> taskmanager_1.2.0.bb
> new file mode 100644
> index 0000000..f955585
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY =3D "Easy to use task manager"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +inherit xfce-app
> +
> +DEPENDS +=3D "gtk+ cairo libwnck libxmu xfce4-dev-tools-native exo-nativ=
e"
> +
> +SRC_URI[md5sum] =3D "6f30ce3c688454812008281065a6e05c"
> +SRC_URI[sha256sum] =3D "5746d473ad428b13db7c05cfcbc809
> 9fbea13da6be26d3a9359bcb4de971ba69"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

