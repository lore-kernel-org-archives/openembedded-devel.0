Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6D70678456
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 14:58:16 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id y35so195735uay.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eZ0FnfuV5/3LInm6czsTOD7tEh9X7hj7rRVdI7fZRic=;
	b=KWpOXPqHF+fV7MQlNLS1bQ92uW5WntKVzoeSV/pbq2RBRVxzTkfqune/Xtsh71F5Y/
	yl1FlZxVIKttZPfMMQCTTw0AOzSHxQ3tycdwj4pqu8uLKY0GJaKxuDl+mdn4QB+e6OOK
	i8W8lb7P853HkGAnvFNeceYzFIkPcjVTsbsmwfUAYT9QqwEkyqjjq3Eh5uO9+t/sPb8l
	EXe76DU5bilZCspicBSsujurDyAAhWKwmLTTlQT7oHPCbIKYBogGKHRrw7rIRTuGW/l5
	bkKhKT801LKkjTRX4UCI5PQewJqTOJeUTW/UwN7+fJmOy/WnBCM0zYAl6sA22x506d1I
	Ztkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eZ0FnfuV5/3LInm6czsTOD7tEh9X7hj7rRVdI7fZRic=;
	b=AAUAz+LTNYiVQTbkaz60QIbDJs5MhPE/iDtmQMzRKYTTjswdVa0SSgrh/K7GaTjnq/
	TI7U/fUlCGr72wEjw33ftmbNj7KJKA4TRi9w/oioAyhcOPjhQSsJhn7U8JxjCKDqX2rP
	BdJw9LuGyxOH+HpP8B9wZUd2+ZPFQrxtptVS5PT2T7+vJL6/yMdv+TYYHIgqE6+wegdg
	HXauEeHYNMUFoL9bu3yLHMT7Mxc2m51dt1AHty00uzu4z/on0QPpECIIA3GrqIPHS7Ir
	/m6pGYXnt5acGNFmixR710MzJMBiSHUh2czUSeITBrybR5rpet9ffQQd4EQAmLn8F7WF
	TbeA==
X-Gm-Message-State: AHYfb5gyu3M7u3h5mJhi4YJ/CDcLw6Sj31nq+SFwC/7YAvZDAiVoHb9d
	SlDCzLIVn10NtKol+7k4NycqZPrF9g==
X-Received: by 10.176.16.227 with SMTP id x35mr2773157uab.191.1503673097445;
	Fri, 25 Aug 2017 07:58:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Fri, 25 Aug 2017 07:58:16 -0700 (PDT)
In-Reply-To: <1503645565-147503-1-git-send-email-hongxu.jia@windriver.com>
References: <1503645565-147503-1-git-send-email-hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Aug 2017 16:58:16 +0200
Message-ID: <CA+chaQchXQomKxrTVbDMyqi38ZQO+89DJXtNu5PLg9xdLLw04g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libreport: fix typo of SRC_URI
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
X-List-Received-Date: Fri, 25 Aug 2017 14:58:16 -0000
Content-Type: text/plain; charset="UTF-8"

Please change it to git fetcher, github archives can be regenerated from
time to time with different checksums.

On Fri, Aug 25, 2017 at 9:19 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-extended/libreport/libreport_2.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
> b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
> index 459f0f2..ee9a84c 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
> @@ -11,7 +11,7 @@ DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
>
> -SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}}-%{
> PV}.tar.gz"
> +SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}-${
> PV}.tar.gz"
>  SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
>              file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
> \
>              file://0003-without-build-plugins.patch \
> --
> 2.8.1
>
>

