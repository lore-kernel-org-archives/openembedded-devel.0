Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 286516058D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 01:10:13 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id g72-v6so12315442vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 18:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jhgqxh5w74E+ldn1QVKBwFgsKqelfnDL8ll8v8BpQVU=;
	b=Vb08VdvmaYkWuzbqCwePm7joggbNUBs173v94R8fhjgO3tACcwd6NSrnUzqJqZMLhZ
	L3OdmCd7MotJFnRFWZz/9qMPQf2wLrs9MZGWBSh+6ZzMz1tCCSqhzr5F1cLk4otM4Oux
	oyKtLFU7Ap0edw9wOjXwzf87gxEPJCuSEqsf48RGAt52Ocyi0Zh5kUB+LWViDKRWqUZo
	Mc2dr1d2nGrOvgsJRqSYmTtAaYgQAvyjZ7aNh96Vv0UgI3Jjv2NMkQN0qeky4u2AMN/I
	wx9ofdqm01B3tanrsR3P6mtOQQHqXBbTrqoXAOAcycjfY/5MtJ1ZFPXYLI3d06IPDVQG
	BxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jhgqxh5w74E+ldn1QVKBwFgsKqelfnDL8ll8v8BpQVU=;
	b=QmJHK5jt4PgUOuVVaZyIA0oiqipSgbAm73Xvo9g2rSFCJqYKadXe+WpkVy509C1Dvj
	IGjTAtQDcGAjaDjumWz3bnS69dQuwCx5ov1IeJ3QRxqSBlqNC0uiYgTM8BwnnS0m9ozX
	d/h2Cf6uNkKjyREG4YpK0rEEsSUf5GpUmBnbWf5uCa1qQkSEZVU1MiV4mZi9VbGtfmFo
	Ztzwz8rMIq64ufZtW5c6BL5Bi+uJrfCMnd72q06jgfiLA1ypAUuZyu9AHx5jdLdz/mGY
	9dSJ0i7vah33jzCbiulQfzF7sfUvaHRI8p8mlosXN2BakZ0tkBNj+0jT0dSjWmrdreYo
	XQiA==
X-Gm-Message-State: ALKqPwfJbIM7T4AToskdtUIe4J2xEhg7CKa1YlHVqqm45KJ4e1KxLo9w
	x0/MF4MQpZL6ZGRcnVtUyW/UdBormgW6EtP2Eqo=
X-Google-Smtp-Source: ADUXVKLxvkaHgVdTCPY0i8G8ab6Gpfm3BBhdzRReSIr8nA12b2iKDSQf9lMFIDSALwo6BJI2u7D12oOyuIsqD3UM6Eg=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr2980468vkd.154.1527729014794; 
	Wed, 30 May 2018 18:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Wed, 30 May 2018 18:10:14 -0700 (PDT)
In-Reply-To: <20180530171810.205120-1-joe.slater@windriver.com>
References: <20180530171810.205120-1-joe.slater@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 May 2018 18:10:14 -0700
Message-ID: <CAJ86T=Xkq-YPw_iNjQhfkTG_vPYz6RUDEGfXrm9eECiZjJ91ow@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Thu, 31 May 2018 01:10:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 10:18 AM, Joe Slater <joe.slater@windriver.com> wrote:
> Remove configurations requiring json from target.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 771cdb1..a5e4e72 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -83,6 +83,11 @@ do_install_append() {
>      install -d ${D}/${localstatedir}/lib/${BPN}
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
> +
> +    # If json is not supported, remove certain conf files.
> +    if ${@oe.utils.conditional('PACKAGECONFIG','json','false','true',d)} ; then

oe.utils.conditional() probably isn't the best way to test whether or
not PACKAGECONFIG contains a particular value. Maybe try
bb.utils.contains() instead?

> +        rm -rf ${D}${datadir}/${BPN}/include/scl/{loggly,logmatic,cim,elasticsearch}

This kind of brace expansion is bash specific.

> +    fi
>  }
>
>  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

