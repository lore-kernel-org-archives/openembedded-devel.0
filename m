Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13CF76AC7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:44:30 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id u10so974894lbd.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YLpdcdKUjYrvn9IWXjtjgG9JuCvX0i5ZuxrMvAjb07k=;
	b=TUAUb1QeXj6SOlPPM3Wu912+D8mvKicwIsP3Icnq3Ifboeshwgv7V1ae0eP5rWlmaa
	OLH4EfVCD356r1t9jWUjooyIIiVqrvPRMgDVPOFR4Q0Dl/QTJJEVsInZj4/GpY3DCnr7
	TSW/MuYT2Nh3g9R9gb4lwsrmLoIyae4oEAyhvCN809NF5JT+mf1YeGFaWKdkrefBcnRU
	OhYwg/dAkUgufrWPVWaorkT/sxE9qm//cKwZWt7CxiNwB2dRNF9XrVYJgVfpJPX0xQTx
	yne1zm/h+mNkjdsYtgemLD08mGlDdZwxcW00peUE6wz7dyj5lmcj5/+rqZkNyDl3UbeT
	C1pA==
MIME-Version: 1.0
X-Received: by 10.152.37.99 with SMTP id x3mr1935606laj.55.1406126671568; Wed,
	23 Jul 2014 07:44:31 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Wed, 23 Jul 2014 07:44:31 -0700 (PDT)
In-Reply-To: <1404965315-9777-1-git-send-email-net147@gmail.com>
References: <1404965315-9777-1-git-send-email-net147@gmail.com>
Date: Wed, 23 Jul 2014 16:44:31 +0200
Message-ID: <CAPbeDCkbza6BYMHWDEPn9Fmfevv6s3in9-wPKzF_rC0637xzGA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org, Jonathan Liu <net147@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qtbase: fix 0003-Add-external-hostbindir-option.patch
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
X-List-Received-Date: Wed, 23 Jul 2014 14:44:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 10, 2014 at 6:08 AM, Jonathan Liu <net147@gmail.com> wrote:

> The isEmpty function takes a variable name instead of a value.
> As $$[QT_EXTERNAL_HOST_BINS] is a built-in we need to assign it to a
> variable to check if it is empty.
>
> If QT_EXTERNAL_HOST_BINS is empty (as is the case for generated Qt 5
> toolchains), we need to fallback to QT_HOST_BINS when determining
> the path for tools such as moc otherwise you get the following error
> when building a Qt project using the generated toolchain:
> make[1]: /moc: Command not found
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../0003-Add-external-hostbindir-option.patch      | 65
> +++++++++++++---------
>  .../0003-Add-external-hostbindir-option.patch      | 65
> +++++++++++++---------
>  2 files changed, 78 insertions(+), 52 deletions(-)
>
>
On my system, this change seems to cause "syncqt.pl" being removed from the
"qtbase-tools" package.
From buildhistory:

-FILELIST = /usr/bin/qt5/moc /usr/bin/qt5/qdoc /usr/bin/qt5/qlalr
/usr/bin/qt5/rcc /usr/bin/qt5/syncqt.pl
+FILELIST = /usr/bin/qt5/moc /usr/bin/qt5/qdoc /usr/bin/qt5/qlalr
/usr/bin/qt5/rcc

Is this by intention ? The package still RDEPENDS on perl.

/Jacob

