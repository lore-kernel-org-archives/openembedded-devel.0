Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4236A7282E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:26:59 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 131so5617062ykp.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 11:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uw1ETW3Gh0Ndw8VF/I5fLg3aaWmWq1tMC54yx5XYTdI=;
	b=kZEaIpZKWb8NbrfNJMtILAjNmzm6VSbUbeG0PpQ8a8sGWWsSWntxYUZOtMlYgIpsJH
	GOwSYS4LvWf78slkeLBGbDRdr3oBe5Ls1VFWqJzwF4U+KIwYNHCNEH5URbFXc7n10Iwp
	ISt3U349mujIyN57LRnkDlSmr3ClJvi5renotWcDncKKlTJ2PothV5maIAvtu4kIUa8I
	7rSbNRhcFVOhQFzXxbAflQUeUe0y8ZH/xsrVpFtxj9kTJPxh+ScOwGlDdUwmpviG8vz5
	OUTIcv8HwZP8DFfOEsxwPoiM3FYsLjOKGHEhEqGxFrRMgHbDJBb07RLHyQr48wzlgunl
	xCuA==
MIME-Version: 1.0
X-Received: by 10.236.110.36 with SMTP id t24mr4556014yhg.102.1419708420258;
	Sat, 27 Dec 2014 11:27:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 27 Dec 2014 11:27:00 -0800 (PST)
In-Reply-To: <c46d487b35f71ff4a9ecbc02ab17fde4ddd0a506.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
	<c46d487b35f71ff4a9ecbc02ab17fde4ddd0a506.1419700394.git.akuster808@gmail.com>
Date: Sat, 27 Dec 2014 17:27:00 -0200
X-Google-Sender-Auth: c5lOyHpALIEw5YzXOPL9CWKHDZs
Message-ID: <CAP9ODKpBgYNd7+=D6+9LwP1ndYQ9w4cga2QVLxLfVJG74dSFEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 11/27] lvm2: add lvm.con to CONFFILES
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
X-List-Received-Date: Sat, 27 Dec 2014 19:27:05 -0000
Content-Type: text/plain; charset=UTF-8

There is a typo in the short log. *conf*.

On Sat, Dec 27, 2014 at 3:21 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Liu Jian <jian.liu@windriver.com>
>
> * Files will be over written when updating using rpm.
>
> * If there is no %config micro before the file in the spec file,
>   this file will be over-written after updating this package
>   using rpm. This will make our settings lost.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 1bbb158..42f6e3a 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -48,3 +48,5 @@ FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
>  FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
>
>  RDEPENDS_${PN} = "bash"
> +
> +CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
> --
> 1.9.1
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

