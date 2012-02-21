Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rzk4I-00027D-OZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 08:23:23 +0100
Received: by werc1 with SMTP id c1so3806525wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 23:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.180.100.33 as permitted sender) client-ip=10.180.100.33; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.180.100.33 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.180.100.33])
	by 10.180.100.33 with SMTP id ev1mr29164987wib.3.1329808504211
	(num_hops = 1); Mon, 20 Feb 2012 23:15:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.100.33 with SMTP id ev1mr24333043wib.3.1329808504157; Mon,
	20 Feb 2012 23:15:04 -0800 (PST)
Received: by 10.227.113.67 with HTTP; Mon, 20 Feb 2012 23:15:03 -0800 (PST)
X-Originating-IP: [79.117.107.69]
Received: by 10.227.113.67 with HTTP; Mon, 20 Feb 2012 23:15:03 -0800 (PST)
In-Reply-To: <1329790554-14759-1-git-send-email-cheepeero@gmx.net>
References: <1329790554-14759-1-git-send-email-cheepeero@gmx.net>
Date: Tue, 21 Feb 2012 09:15:03 +0200
Message-ID: <CAK18fxHQXZxr5UBfhOq1nSvUwAM+LfcNAqx8RY_eVtD7Uk2Gug@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmscGPdiZPAnuKaX++EGzXJoC/82dlJhCdIFpbQO6UL/8ylQWzwUXeHx9e+R5D9PBblvKm7
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] v4l-utils: skip qv4l2
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
X-List-Received-Date: Tue, 21 Feb 2012 07:23:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "v4l2 and IR applications"
> -LICENSE = "GPLv2/LGPLv2.1"
> +LICENSE = "GPLv2 LGPLv2.1"

This should be " GPLv2 | LGPLv2.1"

>  LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
>
file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
>
> @@ -8,7 +8,8 @@ DEPENDS = "jpeg"
>  # libv4l was absorbed into this, let OE know that
>  PROVIDES = "libv4l"
>
> -SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
> +SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
> +           file://skip-qv4l2-${PV}.patch"
>  SRCREV = "v4l-utils-${PV}"
>
>  S = "${WORKDIR}/git"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

