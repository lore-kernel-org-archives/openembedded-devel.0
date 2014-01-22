Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 15D8B6002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:42:42 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so790670obc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=qXyEP7MaGm5tfIJFil/3iR30KvWQraf/dctn/uYiwoQ=;
	b=PY7BqgwL4xqskxQKiRy6oQ/MtFO/u0h4QB/wS9dHrdBiRWI8kOxlDJ2W/mCRrbLS3D
	QxHo6hsiZ2SeIeLvLLOwkxSjz6haTZv7KplCMmVRkNYOgoLwjKZQvoRjgpvViZ4Avn6r
	NbWFWyxYSDu4IqX/Zdyv/f7bLWk8IvSY9QUcH5aOlxwOBhIFuYFeymSE/f6lDHZb72Q6
	sAXh1o/xnqVAva+Rob+JdB9uGGnCngqb1xjg7mRiqqxh8wj/pdQ8sdUiEiN4gj0Bo2wQ
	EQdH/RtA6YIguy9rmXqh6mnB8C4uKboUOjiKKeTEstH3jGci7Fj25X0Yr48ekHC0Nls5
	toLQ==
X-Gm-Message-State: ALoCoQkeJl2fYCotR7t6rxHEcs+/YlvOd34ZpUcCzJeVbc67HeURX1h6Bkxx1n0ncHcSGiSqkYCe
X-Received: by 10.60.47.116 with SMTP id c20mr2366972oen.60.1390412563097;
	Wed, 22 Jan 2014 09:42:43 -0800 (PST)
Received: from localhost.localdomain (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id g4sm15021955obe.5.2014.01.22.09.42.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 09:42:42 -0800 (PST)
Message-ID: <52E00310.4000808@felipetonello.com>
Date: Wed, 22 Jan 2014 09:42:40 -0800
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
In-Reply-To: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
Subject: Re: [PATCH v2] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Wed, 22 Jan 2014 17:42:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2013 02:25 PM, Felipe F. Tonello wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> Packagekit will compile support for all backend supported by OE-core. Images
> that want to install packagekit should specify its correct backend dependency
> as well.
>
> Ex.: install the following packages to an image that uses rpm:
>   * packagekit
>   * packagekit-backend-smart
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>   ...deprecated-glib-functions-and-use-the-new.patch | 166 --------
>   .../packagekit/packagekit-0.5.6/configurefix.patch |  13 -
>   .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 ---------------------
>   .../packagekit/packagekit_0.5.6.bb                 |  62 ---
>   .../packagekit/packagekit_0.8.13.bb                |  64 ++++
>   5 files changed, 64 insertions(+), 663 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
>   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
>   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
>   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
>   create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb
>

Any updates on this?

Felipe

