Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B4A8C771D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:06:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1485187596; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=QUvM4JwKuoLW+ir6opxfS+7mLpuZGJU45XAaSQqOJvk=;
	b=Qpj3JQVq0uZZn/sXLcDnfSEujTjgoqOHMD92NQCR78FvL/ewj2bbtTH6bbGJCqRAUuP4FGGB
	ATp4QlFMW4rEJnw0y0zHHw6xdImn4HZSKVGvlWan027Cyj2Ym1Pm7lf6fX9mnmzTO3qOVr3+
	/h8XhDtJHipIp2pWmzaSPFzxgfM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=O5lRdSsj09RCgiDsKupEGC+Igq2gCmYl4pYAhjcqBE8aooByEWWQ4PMVtp2K8FyTXaEv9q
	rW+W5vIVT8aRd1VPwC5jhZMTH/OcECK2miAQont2liyQhlZChEcPnbJ1/SrW6QNWSnFxWuHY
	BNgmZljX7GYeODzKb1szMN7XlxHCs=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 58862a0b.7f4b61f8f230-smtp-out-n02;
	Mon, 23 Jan 2017 16:06:35 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c7so65884860itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:06:34 -0800 (PST)
X-Gm-Message-State: AIkVDXKWg+ZmSTsFQ0UlAz5rolJPvCU1rYgYOGnOsoHF00HBuWzpmfvsqWJBjFA+riqUP7YHMrD8BpoiM9JsKg==
X-Received: by 10.36.65.163 with SMTP id b35mr15710378itd.41.1485187594103;
	Mon, 23 Jan 2017 08:06:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Mon, 23 Jan 2017 08:06:33 -0800 (PST)
In-Reply-To: <1484620597-26212-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484620597-26212-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 23 Jan 2017 11:06:33 -0500
X-Gmail-Original-Message-ID: <CADNbA1qAmmRm6FXTC+tV0cH5KOj3_9=a+BvQnJe2GVXDf0mWhA@mail.gmail.com>
Message-ID: <CADNbA1qAmmRm6FXTC+tV0cH5KOj3_9=a+BvQnJe2GVXDf0mWhA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python] [PATCH] python-lxml: 3.7.0 -> 3.7.2
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
X-List-Received-Date: Mon, 23 Jan 2017 16:06:37 -0000
Content-Type: text/plain; charset=UTF-8

This breaks python3-lxml since it is still at 3.7.0 and it pulls its
checksum from the .inc file.

On Mon, Jan 16, 2017 at 9:36 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-lxml from 3.7.0 to 3.7.2.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-lxml.inc                   |
> 4 ++--
>  .../python/{python-lxml_3.7.0.bb => python-lxml_3.7.2.bb}             | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-lxml_3.7.0.bb =>
> python-lxml_3.7.2.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-lxml.inc
> b/meta-python/recipes-devtools/python/python-lxml.inc
> index 8319799..6299385 100644
> --- a/meta-python/recipes-devtools/python/python-lxml.inc
> +++ b/meta-python/recipes-devtools/python/python-lxml.inc
> @@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=
> f9f1dc24f720c143c2240df41fe5073b \
>
>  DEPENDS += "libxml2 libxslt"
>
> -SRC_URI[md5sum] = "b78e6f7e859c2ff57add7f63a5e387b7"
> -SRC_URI[sha256sum] = "9c62eb2a1862e1ae285d7e7e3b7dc8
> 772d387b19258086afcec143c6b7b8a5c9"
> +SRC_URI[md5sum] = "8dcf8d6c692b7aed9370f7462ff09935"
> +SRC_URI[sha256sum] = "59d9176360dbc3919e9d4bfca85c1c
> a64ab4f4ee00e6f119d7150ba887e3410a"
>
>  DISTUTILS_BUILD_ARGS += " \
>                       --with-xslt-config='pkg-config libxslt' \
> diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
> b/meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
> rename to meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
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

