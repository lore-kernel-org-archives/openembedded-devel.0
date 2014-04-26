Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2782F65D80
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 19:44:55 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hn18so3389090igb.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BVDsP7LX3FNl0/tM7AhbCK2wE6sl9cb7HXi0V//D7t4=;
	b=KTRQojWyGLE5/fB2BZ85a5e4sQk15erHVgsUhEbd6jivrLaR3Jh6ud+YExopDCuKgA
	fYLbb794yFETVVOpqyKlo2oN7i920mYJy0RCiNK8gwkTl0ucZ6B3V9DTA7N9Gep0SHEH
	0Mm557jR4gVd263ZBXrDHPPwN8grqxHJNcsNGidhHLA5Z8Lu4FXXT1wvkB08e7EeRJUs
	pzCbqARLD2mqEQAMcAb2Kka1VqUhYtfojZrSJHBCzA10iMN76ez7l7PbOZm6MOYk7ETs
	El2hDYlEioZ9+lcJMnyOQN6NCsWE+pzgnkhHShw3fd2iKjxODHjDrUG97sbQ3hIdkFne
	Pv+A==
X-Received: by 10.50.30.167 with SMTP id t7mr13401615igh.17.1398541496591;
	Sat, 26 Apr 2014 12:44:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Sat, 26 Apr 2014 12:44:26 -0700 (PDT)
In-Reply-To: <ljcuj9$fuc$1@ger.gmane.org>
References: <ljcuj9$fuc$1@ger.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2014 12:44:26 -0700
Message-ID: <CAMKF1spDyZsRWsQJBiJzRiP9m9Zwo6+KT1_aRonPpASJPjDgNg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
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
X-List-Received-Date: Sat, 26 Apr 2014 19:44:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 24, 2014 at 11:16 PM, Neuer User <auslands-kv@gmx.de> wrote:
> On arm platform the compiler does not implement "-reduce-relocations",
> see here: https://bugreports.qt-project.org/browse/QTBUG-36129
>
> The meta-qt5 layer, however, uses this option, so configure will fail
> for qtbase.
>
> This patch fixes the problem for me, but it should better test on the
> platform and only apply it, when it is an arm platform:
>
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 89736be..f23236a 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -126,7 +126,6 @@ PACKAGECONFIG[nis] = "-nis,-no-nis"
>  PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
>
>  QT_CONFIG_FLAGS += " \
> -    -reduce-relocations \
>      -shared \
>      -silent \
>      -no-pch \

i would rather prefer
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=97323ad11305610185a0265392cabcd37510f50e

to be back ported to OE-Core master/daisy binutils instead

