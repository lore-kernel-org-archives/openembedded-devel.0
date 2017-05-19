Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 300 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 May 2017 20:13:19 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id AACA77809E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 20:13:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1495224801; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=o/872a87IU5TMKPjDMvy0xc9TzmByumi4HauHipiX6s=;
	b=At/tKSmcKzdBx+AIFFIUFDev/5upu6Ga/J2gJk6pm0c0scWKIFv86uJM3QjyoRBtgapcrI8z
	CWOyVT6vdQRv2K+OqVG1lZKfSjwiQKY3UqSYQWKchZouOW8l2nEgDCU+8kghxo7z0IDQq/xQ
	KKvnxbsVjaS6+NfzVt2ftNSqsUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=l0h0bNA9hFs5aQIXrJoZDVqelnrOZ7Rr2UxUcgcr90zJGo8bEBJolHp4SkFIJRAb2XjpF4
	bb6Bc4PBAfEGgtRt5QqMkCSs+kP2Lct3qmyhUt35uznL2iqjJgLrcZOJdSuVmmbfODLcJKvk
	UqQ8aTzA/PiRvHQ8vL1oZwB1hMM50=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mxa.mailgun.org with ESMTP id 591f50b3.7f5ad1124630-smtp-out-n03;
	Fri, 19 May 2017 20:08:19 -0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id f102so53462979ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 13:08:18 -0700 (PDT)
X-Gm-Message-State: AODbwcApWB9erJUHryMdvV/VH+wyx2QjcIbSJ1y0CFTUZ9pfnGkX2hTh
	+aqCNwoTuJqxhFbslUHdluzSmo2blQ==
X-Received: by 10.107.202.70 with SMTP id a67mr12711814iog.141.1495224498396; 
	Fri, 19 May 2017 13:08:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.170.96 with HTTP; Fri, 19 May 2017 13:08:17 -0700 (PDT)
In-Reply-To: <1495220611-17447-1-git-send-email-moritz.fischer@ettus.com>
References: <1495220611-17447-1-git-send-email-moritz.fischer@ettus.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 19 May 2017 16:08:17 -0400
X-Gmail-Original-Message-ID: <CADNbA1r8nmgj58_X-Tgsrm6XthOKGm9h0MiSxfJ0J3HPUbMOVQ@mail.gmail.com>
Message-ID: <CADNbA1r8nmgj58_X-Tgsrm6XthOKGm9h0MiSxfJ0J3HPUbMOVQ@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	tico.timo@gmail.com
Subject: Re: [meta-python][PATCH v2] python-sdnotify/python3-sdnotify: Add new recipe
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
X-List-Received-Date: Fri, 19 May 2017 20:13:23 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rework the patch to place the common portions into an inc file?
Thanks

On Fri, May 19, 2017 at 3:03 PM, Moritz Fischer <moritz.fischer@ettus.com>
wrote:

> python-sdnotify/python3-sdnotify is a pure python implementation for
> systemd's sd_notify mechanism.
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../python/python-sdnotify_0.3.1.bb                | 22
> ++++++++++++++++++++++
>  .../python/python3-sdnotify_0.3.1.bb               | 22
> ++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-sdnotify_0.3.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-sdnotify_0.3.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
> b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
> new file mode 100644
> index 0000000..e63560c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-sdnotify_0.3.1.bb
> @@ -0,0 +1,22 @@
> +HOMEPAGE = "https://github.com/bb4242/sdnotify"
> +SUMMARY = "A pure Python implementation of systemd's service notification
> protocol (sd_notify)"
> +
> +DESCRIPTION = "\
> +  sdnotify is a pure Python implementation of the systemd sd_notify
> protocol. \
> +  This protocol can be used to inform systemd about service start-up
> completion, \
> +  watchdog events, and other service status changes. \
> +  Thus, this package can be used to write system services in Python that
> play nicely with systemd. \
> +  "
> +
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc821
> 3e"
> +
> +SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
> +SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a8
> 0cf51033fde47dcb056fbda71e2dff2d5a"
> +
> +inherit setuptools pypi
> +
> +do_install_append() {
> +       rm -r ${D}/${datadir}
> +}
> diff --git a/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
> b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
> new file mode 100644
> index 0000000..57c7e5d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sdnotify_0.3.1.bb
> @@ -0,0 +1,22 @@
> +HOMEPAGE = "https://github.com/bb4242/sdnotify"
> +SUMMARY = "A pure Python implementation of systemd's service notification
> protocol (sd_notify)"
> +
> +DESCRIPTION = "\
> +  sdnotify is a pure Python implementation of the systemd sd_notify
> protocol. \
> +  This protocol can be used to inform systemd about service start-up
> completion, \
> +  watchdog events, and other service status changes. \
> +  Thus, this package can be used to write system services in Python that
> play nicely with systemd. \
> +  "
> +
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc821
> 3e"
> +
> +SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
> +SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a8
> 0cf51033fde47dcb056fbda71e2dff2d5a"
> +
> +inherit setuptools3 pypi
> +
> +do_install_append() {
> +       rm -r ${D}/${datadir}
> +}
> --
> 2.7.4
>

