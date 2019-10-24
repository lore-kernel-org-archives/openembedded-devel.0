Return-Path: <m.schwan@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id 93ABF7F9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1571917106; x=1574509106;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3ZcSKRhVCze1iy5DEBIH8OeSV74W11DMN4sWYbi5GZo=;
	b=XsRziVnN28dDmTgbxD4KTFQxTS3wy4IGe0ZIfoxq21+iZWvSfkYj6Rd6UrciQ9T6
	jNqs2EHFFBvbnM+C+ZX2Rusvjab5+qgs8nj9+Oq11KDkqPcryl38eBlZJZNdyKWL
	LIwYjuFChiO8l/wD5XM0Q88y5Na5i1xIaV81n1PetY0=;
X-AuditID: c39127d2-df9ff7000000408f-d1-5db18d32387e
Received: from Kokolorix.phytec.de (Kokolorix.phytec.de [172.16.0.3])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	DA.BB.16527.23D81BD5; Thu, 24 Oct 2019 13:38:26 +0200 (CEST)
Received: from lws-schwan.phytec.de ([172.16.23.192])
	by Kokolorix.phytec.de (IBM Domino Release 9.0.1FP9)
	with ESMTP id 2019102413382613-6094 ;
	Thu, 24 Oct 2019 13:38:26 +0200 
Message-ID: <84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
From: Martin Schwan <m.schwan@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:38:26 +0200
In-Reply-To: <20191009123218.19821-1-m.schwan@phytec.de>
References: <20191009123218.19821-1-m.schwan@phytec.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Kokolorix/Phytec(Release
	9.0.1FP9|August 14, 2017) at 24.10.2019 13:38:26,
	Serialize by Router on Kokolorix/Phytec(Release 9.0.1FP9|August  14,
	2017) at 24.10.2019 13:38:26,
	Serialize complete at 24.10.2019 13:38:26
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWyRoCBWdeod2Oswcc1ghYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxqVZCQWbhSuef1jD2MB4V6CLkZNDQsBEYkrPRcYuRi4OIYG9
	jBILd19jh3AuMUp8fTCBGaSKV8BN4tDLn0wgtjCQ/X/CFEYQm01AQ+LdmcdsILaIgK7Exw9z
	weIsAqoS7b9vs4LYnAIWEo8XzQHrFRIwl5h+8z6YLSogL7H+6SJGiPmCEidnPmGBuKidSeL/
	lRgIW0ji9OKzYDcwA9VvfzsHytaUaN3+m30Co8AsJO2zkJTNQlK2gJF5FaNQbmZydmpRZrZe
	QUZlSWqyXkrqJkZg8B2eqH5pB2PfHI9DjEwcjIcYJTiYlUR4d6ttjBXiTUmsrEotyo8vKs1J
	LT7EKM3BoiTOu4G3JExIID2xJDU7NbUgtQgmy8TBKdXAKJr3t7TsrEujTK+43VvddaxlIhGr
	JU9MaNtpe0jov7352578gObcxG7WBZ17H0lr9TwwUetnDjXx+/Fvdbf7wXPz1k7OEY2Ma0yW
	XnS0bBmX7gPmsm3uQRZ6BgmmLy0OGvNEbtR7Y3xs/WeJk4taPu1MWZr1vavEYhfP3J6d7PPr
	2BmWRr5XYinOSDTUYi4qTgQAOxotdywCAAA=
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
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
X-List-Received-Date: Thu, 24 Oct 2019 11:38:27 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,

just wanted to kindly ask if anyone had time reviewing this patch? This
is my first patch for this project, maybe I am missing something. Is
there anything that stops this from being merged?

On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
> Waitress is a pure-Python WSGI server.
> 
> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> ---
> Changes in v2:
>  - Fixed missing "K" in "LIC_FILES_CHKSUM"
> ---
>  .../recipes-devtools/python/python-waitress.inc        | 10 ++++++++++
>  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
>  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
>  3 files changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-waitress.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-waitress.inc b/meta-python/recipes-devtools/python/python-waitress.inc
> new file mode 100644
> index 000000000..732c31dbd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-waitress.inc
> @@ -0,0 +1,10 @@
> +SUMMARY = "A WSGI server for Python"
> +DESCRIPTION = "Waitress is meant to be a production-quality pure-Python WSGI \
> +    server with very acceptable performance."
> +HOMEPAGE = "https://github.com/Pylons/waitress"
> +SECTION = "devel/python"
> +LICENSE = "ZPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
> +
> +SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
> +SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> diff --git a/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> new file mode 100644
> index 000000000..26a628ea0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools pypi
> +require python-waitress.inc
> diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> new file mode 100644
> index 000000000..83c8b66d8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3 pypi
> +require python-waitress.inc
> -- 
> 2.23.0
> 


