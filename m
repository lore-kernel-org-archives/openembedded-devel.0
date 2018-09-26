Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Sep 2018 01:01:30 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 99F1779709
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 01:01:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1537923691; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=gRZRPwb0zBXf4sjDK62Y8aUPRiBX+hS3ta2zyWku38Q=;
	b=GLTF8MGXo/JIj1PszPM+nlKWIz3kQqaq7cN7uieuMG7vW5JdPmdGO5KPrJmYSGvaLRTFQRF5
	VtRY5+TFOFH5qFhbiCcxbj6ZV8vFxu0tgLcp27N8TvTC8EJhp14kGM2cF6yGEIQnAbamektB
	n6DIL1XHhLTWVH48RudqcgU6xQw=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mxa.mailgun.org with ESMTP id 5baad93d.7ff9c4757db0-smtp-out-n02;
	Wed, 26 Sep 2018 00:56:29 -0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id j198-v6so8448347ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:56:29 -0700 (PDT)
X-Gm-Message-State: ABuFfogx82lL1OH176DCrBjubduKlN9GqRogPy1uGX/0aA9YFBAW+rZ1
	T11/8GkU6NcX1mhE2dzloWFeKo4F4z2dYooO3p4=
X-Google-Smtp-Source: ACcGV63ptqNeEKmmuf+PTgXctmExRAQMmrNXCOsdtqt0fvozFDA7L4N0SwcMQltgN8YoQXdJsDeZgHhATPv8SOztCmE=
X-Received: by 2002:a02:7a12:: with SMTP id
	a18-v6mr3496520jac.42.1537923389203; 
	Tue, 25 Sep 2018 17:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
	<20180926004237.28406-3-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180926004237.28406-3-hongl.fnst@cn.fujitsu.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 25 Sep 2018 20:56:17 -0400
X-Gmail-Original-Message-ID: <CADNbA1rEiUaCPiKgmQM93rZxB2qyjC2J21F81hT3AZp-3pTpEA@mail.gmail.com>
Message-ID: <CADNbA1rEiUaCPiKgmQM93rZxB2qyjC2J21F81hT3AZp-3pTpEA@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-cmd2: upgrade to 0.9.2
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
X-List-Received-Date: Wed, 26 Sep 2018 01:01:30 -0000
Content-Type: text/plain; charset="UTF-8"

Please note the following from the project github (
https://github.com/python-cmd2/cmd2):

The last version of cmd2 to support Python 2.7 is *0.8.9*, released on
August 21, 2018. Supporting Python 2 was an increasing burden on our
limited resources. Switching to support only Python 3 is allowing us to
clean up the codebase, remove some cruft, and focus on developing new
features.

Was the 0.9.2 version validated at run-time to work on python 2.7?


On Tue, Sep 25, 2018 at 8:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:

> 1.Upgrade python-cmd2 from 0.8.8 to 0.9.2.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-cmd2_0.8.8.bb => python-cmd2_0.9.2.bb}             |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cmd2_0.8.8.bb =>
> python-cmd2_0.9.2.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
> b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
> rename to meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
> index b3bea82..1b75e34 100644
> --- a/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
> +++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=60bc6842001870a418935bd84570b676"
>
> -SRC_URI[md5sum] = "1f555bb656d361d9b0212b07e232752f"
> -SRC_URI[sha256sum] =
> "b08bc5088fdd131d659354e6b4f8cf7c01a70566f68aed146e00d296a24b687b"
> +SRC_URI[md5sum] = "bfe0900a2288283a40f0ee7533486a2f"
> +SRC_URI[sha256sum] =
> "e7b6b4b76272a051c943c3c709cd760142af16fbc9218e0ed3c22b28ea38d0a8"
>
>  inherit pypi setuptools
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

