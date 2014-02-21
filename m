Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id C5DEB6CAD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 17:33:48 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id vb8so4313534obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QkLKYKqdJ4rZuKY9aF6xOCWnTMR84oAYtlDc3FQvV5w=;
	b=ksgojHO4m7uZ/HIw9MtLe9qXLrGZ/YOD5QWHjqL2VWvyf908I03X2KQAG64agIrmKw
	XG3sZZbcisvbXyWczSJVXc1oSkUkcBGaWACKLqtZB+cCUJpU9W3ysFz68zeFncvVcoFl
	bZ8Lr0lQ6HiLGf2AJ+X1mcfgHZYASYhc5MOSKQ4M/QGaMeQhnEm76AAJ76qjfztoa/hy
	dvlrntKFIEeeLgMQ/X0rVAcOMPMVLS47RDi2AHT9DcNDiF1i13JQArcbyqgHdD0xqD4J
	uH+WN5F416r1sdDe9HHk3N/y0eSQJT6VtSUvpWhd1mV4ruo4Df1DLoKyNQuQxY2B82z5
	PKQw==
X-Received: by 10.42.85.140 with SMTP id q12mr3599800icl.51.1393004028592;
	Fri, 21 Feb 2014 09:33:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Fri, 21 Feb 2014 09:33:18 -0800 (PST)
In-Reply-To: <1392963430-16876-2-git-send-email-armccurdy@gmail.com>
References: <1392963430-16876-1-git-send-email-armccurdy@gmail.com>
	<1392963430-16876-2-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Feb 2014 09:33:18 -0800
Message-ID: <CAMKF1sptmyKyxT9hwxNKHkQT2ZtfH03kx_kUfGC8+=pj98j1BQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtwebkit-examples: add missing RDEPENDS for ca-certificates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2014 17:33:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 20, 2014 at 10:17 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> If qtbase is configured with openssl support (as it is by default)
> then the qtwebkit example browser apps require CA certificates to
> check the authenticity of https connections.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit-examples.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
> index 50c28cd..8a8e000 100644
> --- a/recipes-qt/qt5/qtwebkit-examples.inc
> +++ b/recipes-qt/qt5/qtwebkit-examples.inc
> @@ -9,4 +9,4 @@ SRC_URI += " \
>  "
>
>  DEPENDS += "qtwebkit"
> -RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
> +RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins ca-certificates"

if this is dependent upon a PACKAGECONFIG feature from other package
turn this one  unto same/similar PACKAGECONFIG as well otherwise the
dependency will be lurking around if openssl is disabled.


> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

