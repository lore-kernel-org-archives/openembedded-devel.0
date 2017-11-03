Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Nov 2017 14:49:18 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 60EA178312
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:49:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1509720559; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=gpBoGKsv2hudddiVtxNvZ1THZFhi8R6Hj1W5gqxJ9Ao=;
	b=QpljBgiqDPGNeEDePTm4ZYYqWZcfsV2wNp9e7R+aVBRAYgVgzhkZGaap875DJqKahNWqR/Vw
	6aapj1TPQCjOFEYAii/6/ZDC8slUmLPl53HrhqDS030/dyE/4VsJEE4YNtsjijBLETflUzHv
	Ik5MUETLnfzveu8bLIkrOO8p4OU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=v3byIJzcwJZALYXTSkd2ma9D52PW8j/UTlvVsTgZ2kQ2oyB/RESCx1lvYsjInlxaFrhrNq
	EXHViG78YnnuwjVzYvD8jhXyuqZb2bmO7r/HKWQMZ+7+5axGRSAAbfh6tEx3xPGGb03KISks
	Dph8hcqTUXhYXd4HTnxLBlEMcmJkI=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mxa.mailgun.org with ESMTP id 59fc80bc.7fc04816d1f0-smtp-out-n01;
	Fri, 03 Nov 2017 14:44:12 -0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id f8so3492374qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Nov 2017 07:44:12 -0700 (PDT)
X-Gm-Message-State: AMCzsaVEfGu0UIxC+08/wmlQNwkkG4cbsEut1CWA5r4J8fVvRGK7pHxG
	VZNjxKBxUzSQYMKSo148oFyT8akqqgX49ijZmKY=
X-Google-Smtp-Source: ABhQp+T15EOum38qRGfdUecyP9T7aTah7IfPEenrXXEPh87MnxGxfwUj3udbGC5XSQuXVEQZl+ZQIF2ItdeuoT4LRhA=
X-Received: by 10.200.3.205 with SMTP id z13mr10890846qtg.25.1509720252614;
	Fri, 03 Nov 2017 07:44:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.21.165 with HTTP; Fri, 3 Nov 2017 07:44:12 -0700 (PDT)
In-Reply-To: <1509720134-17426-1-git-send-email-pascal.bach@siemens.com>
References: <1509720134-17426-1-git-send-email-pascal.bach@siemens.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 3 Nov 2017 10:44:12 -0400
X-Gmail-Original-Message-ID: <CADNbA1rYwQ-eUBn6RpCd5ZtP9G7zKLpdhZC5EOieP_roZc0CPA@mail.gmail.com>
Message-ID: <CADNbA1rYwQ-eUBn6RpCd5ZtP9G7zKLpdhZC5EOieP_roZc0CPA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Pascal Bach <pascal.bach@nextrem.ch>
Subject: Re: [meta-python][PATCH] python-pyasn1, python3-pyasn1: update to 0.3.7
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
X-List-Received-Date: Fri, 03 Nov 2017 14:49:18 -0000
Content-Type: text/plain; charset="UTF-8"

I think this one is just waiting to go into master-next:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-October/115322.html

On Fri, Nov 3, 2017 at 10:42 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> From: Pascal Bach <pascal.bach@nextrem.ch>
>
> Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
> ---
>  meta-python/recipes-devtools/python/python-pyasn1.inc                 |
> 4 ++--
>  .../python/{python-pyasn1_0.3.6.bb => python-pyasn1_0.3.7.bb}         | 0
>  .../python/{python3-pyasn1_0.3.6.bb => python3-pyasn1_0.3.7.bb}       | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyasn1_0.3.6.bb =>
> python-pyasn1_0.3.7.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyasn1_0.3.6.bb =>
> python3-pyasn1_0.3.7.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc
> b/meta-python/recipes-devtools/python/python-pyasn1.inc
> index dedb191..aa375f6 100644
> --- a/meta-python/recipes-devtools/python/python-pyasn1.inc
> +++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac6147
> 5a"
>
> -SRC_URI[md5sum] = "a2d01c561d4996055641bbbb74eda58f"
> -SRC_URI[sha256sum] = "f0380ea97db0ede095a0dd87ce3003
> d46c197191f924206e43f776fc77e51f09"
> +SRC_URI[md5sum] = "d58ecd0d9ff07218073c5acb12974254"
> +SRC_URI[sha256sum] = "187f2a66d617683f8e82d5c00033b7
> c8a0287e1da88a9d577aebec321cad4965"
>
>  RDEPENDS_${PN}_class-target += " \
>      ${PYTHON_PN}-codecs \
> diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
> b/meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyasn1_0.3.6.bb
> rename to meta-python/recipes-devtools/python/python-pyasn1_0.3.7.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
> b/meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyasn1_0.3.6.bb
> rename to meta-python/recipes-devtools/python/python3-pyasn1_0.3.7.bb
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

