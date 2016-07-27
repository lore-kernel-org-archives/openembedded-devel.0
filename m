Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id EF233606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:42:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1469598131; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=xlG8Ui23HvTdwSkYZ6ncemABmh25zi9CohtJW1d7pzM=;
	b=mkk7sRn4naMR12EbPa+VYZ0yBEVRDbIH41KtuSTvrK3Vt6cz9mi80eWI7fubK5MwWmF63J7c
	Axi49oeSbyuK8PwQUjxjqvnvnnZKUxG5PLEuSqGANpR3Ea+a9+iRv013LwEUMfL9qhz3C1Ff
	VlVX8ZyzdcXu2rTsCgt6ErlBvxk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=auJirptN4X7SxFsGLtBlXQ/NS90lQghp7AAQCA4N6Zrd0AhIWoJ2S+rneIekid87SWbe22
	CTjHVkwl/KyVFHwk3gjPVZSjs3GMRAuN+jEIRaGdaKjejt1uuUCW9CWlxstqy0egmU7SNN2N
	dfRYT8nfysjEeHnYM+M5fZGuBO89M=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mxa.mailgun.org with ESMTP id 579849b3.7fb1e4567530-in07;
	Wed, 27 Jul 2016 05:42:11 -0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id j124so40293646ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:42:10 -0700 (PDT)
X-Gm-Message-State: ALyK8tKrA+6XA9vejJIg8JiYQsgW4z/5Ci0AOtewhK1aeSnLDcvOiBdekcBfMA28fC5l1us7SHAb880Yp3GuSg==
X-Received: by 10.36.131.194 with SMTP id d185mr96799649ite.38.1469598130667; 
	Tue, 26 Jul 2016 22:42:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Tue, 26 Jul 2016 22:42:10 -0700 (PDT)
In-Reply-To: <20160727030338.15620-2-Qi.Chen@windriver.com>
References: <20160727030338.15620-1-Qi.Chen@windriver.com>
	<20160727030338.15620-2-Qi.Chen@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 27 Jul 2016 01:42:10 -0400
X-Gmail-Original-Message-ID: <CADNbA1pSGvE-B6swxQvz+qN2cDDefts1pJNjvy2WDqX1S9Z1OQ@mail.gmail.com>
Message-ID: <CADNbA1pSGvE-B6swxQvz+qN2cDDefts1pJNjvy2WDqX1S9Z1OQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 2/3] python3-pip: add recipe
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
X-List-Received-Date: Wed, 27 Jul 2016 05:42:14 -0000
Content-Type: text/plain; charset=UTF-8

Can the common portions be pulled out into a .inc file that can be included
in the python and python3 recipes or was there a specific reason not to do
that?

-Derek

On Tue, Jul 26, 2016 at 11:03 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-pip_8.1.2.bb | 13
> +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pip_8.1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
> b/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
> new file mode 100644
> index 0000000..612ba7d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pip_8.1.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "PIP is a tool for installing and managing Python packages"
> +LICENSE = "MIT & LGPL-2.1"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
> +
> +SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
> +SRC_URI[sha256sum] =
> "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
> +
> +inherit pypi setuptools3
> +
> +# Since PIP is like CPAN for PERL we need to drag in all python modules
> to ensure everything works
> +RDEPENDS_${PN} = "python3-modules python3-setuptools"
> +
> +BBCLASSEXTEND = "nativesdk"
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

