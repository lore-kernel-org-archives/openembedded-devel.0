Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0462165D00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 21:58:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513461527; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=ti1CycJ1xGTSY07DNcFqljRqfT6BQcKF3c+/E6yfRxA=;
	b=PRRI41Dkrqgh87o2ji9HDLiJKyTdiWMYXWvdFnmUxdiGFccXgPIU+UVRpGkRvn+hGaQYFwvx
	s+hm8INwcERrlyuUYr85WzDfpDoJjAaNPqphoYW8Uze/LgTSVLNgOQxYOGVGkpdVjtzXwxPB
	EKM1Nd6JjEoPTPOB1zDilRpb8No=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mxa.mailgun.org with ESMTP id 5a359717.7f33f06742f0-smtp-out-n03;
	Sat, 16 Dec 2017 21:58:47 -0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id c13so14374193qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Dec 2017 13:58:47 -0800 (PST)
X-Gm-Message-State: AKGB3mJNoc0Jw6WKS19mfMIcXMKapapxV4kDZtJsum/hpZjzVyJDpDJE
	yR6hum3Do6lOqSY7thtA4PeNAXy9LuaoY/RGB9I=
X-Google-Smtp-Source: ACJfBotllr1fJhUZNK13FawkTo6TJOoXkIgmgUgeHir9WaMFFq/V5x4AE9gGO2t8gpxmPodfy397LJ7yy2q+rHjY+Sk=
X-Received: by 10.55.207.216 with SMTP id v85mr27423470qkl.331.1513461527436; 
	Sat, 16 Dec 2017 13:58:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Sat, 16 Dec 2017 13:58:46 -0800 (PST)
In-Reply-To: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Sat, 16 Dec 2017 16:58:46 -0500
X-Gmail-Original-Message-ID: <CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
Message-ID: <CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Sat, 16 Dec 2017 21:58:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 4, 2017 at 2:00 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Drop the json<-->simplejson patch instead opting to depend on
> python-json (part of core python libs). Beyond this the uprev is
> straightforward.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-pyroute2.inc    | 23
> +++++--------------
>  .../import-simplejson-as-json.patch                | 26
> ----------------------
>  ...yroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} |  0
>  ...route2_0.3.22.bb => python3-pyroute2_0.4.21.bb} |  0
>  4 files changed, 6 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/
> python/python-pyroute2/import-simplejson-as-json.patch
>  rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.22.bb =>
> python-pyroute2_0.4.21.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyroute2_0.3.22.bb
> => python3-pyroute2_0.4.21.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc
> b/meta-python/recipes-devtools/python/python-pyroute2.inc
> index da1d4cd..521162c 100644
> --- a/meta-python/recipes-devtools/python/python-pyroute2.inc
> +++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
> @@ -1,26 +1,15 @@
>  SUMMARY = "A pure Python netlink and Linux network configuration library"
>  LICENSE = "GPLv2 & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=
> b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://LICENSE.Apache.v2;md5=
> 3b83ef96387f14655fc854ddc3c6bd57"
> +                    file://LICENSE.Apache.v2;md5=
> 34281e312165f843a2b7d1f114fe65ce"
>
> -SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
> -SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14
> a1a50ebdffbd50d4e30ffda62c0a05d7b3"
> -
> -SRC_URI += "file://import-simplejson-as-json.patch"
> +SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
> +SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d0
> 0560ed9910203e93f107833b6e8d151171"
>
>
Can we remove the extra path prepend now?

>  FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
>
>  inherit pypi
>
> -RDEPENDS_${PN} += "\
> -  ${PYTHON_PN}-distutils \
> -  ${PYTHON_PN}-simplejson \
> -  ${PYTHON_PN}-multiprocessing \
> -  ${PYTHON_PN}-io ${PYTHON_PN}-pprint \
> -  ${PYTHON_PN}-pickle \
> -  ${PYTHON_PN}-logging \
> -  ${PYTHON_PN}-threading \
> -  ${PYTHON_PN}-textutils \
> -  ${PYTHON_PN}-subprocess \
> -  ${PYTHON_PN}-netclient \
> -"
>
None of these other dependencies are needed for a minimal python install?

> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-json \
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-
> pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-
> devtools/python/python-pyroute2/import-simplejson-as-json.patch
> deleted file mode 100644
> index d73da07..0000000
> --- a/meta-python/recipes-devtools/python/python-
> pyroute2/import-simplejson-as-json.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Upstream-Status: Inappropriate [wrong dependency]
> -
> -Subject: [PATCH] import simplejson as json
> -
> -At runtime python-pyroute2 tries to import json, but the module is not
> -available, import simplejson as json solve the issue.
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py b/pyroute2/netlink/rtnl/
> ifinfmsg.py
> -index 4f14f25..55643eb 100644
> ---- a/pyroute2/netlink/rtnl/ifinfmsg.py
> -+++ b/pyroute2/netlink/rtnl/ifinfmsg.py
> -@@ -1,5 +1,5 @@
> - import os
> --import json
> -+import simplejson as json
> - import errno
> - import select
> - import struct
> ---
> -2.1.4
> -
> diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
> b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
> rename to meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
> diff --git a/meta-python/recipes-devtools/python/python3-
> pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-
> pyroute2_0.4.21.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

