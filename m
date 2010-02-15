Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nh152-0000S9-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 14:33:43 +0100
Received: by fxm2 with SMTP id 2so1804147fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=7c+3CymMbKjybMYNNBwrbsWnvekA9jCHi1C6JToFtfM=;
	b=Lrgak4UeRyxZMjX8gSeajst1t7135jPH/ENPo361jJ3SndQAFdB7MbIQfIujqZXhKl
	VPbH0GMJ3iAY2MpM/sGbcnGG//AZC/9V6f9xx3AWfMUA0MOAKZaQoSfH9nK0vEd8ldbG
	GJ2Emqu9yxf6P79DclyPYm+ervJyKqvmSDwHM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=S3dJUyR6lxWjPIkST7BhJRtbyt8VwZRyH0RdUBvtm0LiX2yx0y+rV5pgHPdqS1BbWi
	cALdT91dpQ35BK/Ts2nJWFysp8OoMa6Yp1KvLWCJodLqrnJMsBwFwsTHFiYVNwaWwcP1
	KBiPSFG4VxFDp6Tj3dPwvQqd1knXHi9bNLucw=
MIME-Version: 1.0
Received: by 10.223.15.21 with SMTP id i21mr3997507faa.58.1266240662129; Mon, 
	15 Feb 2010 05:31:02 -0800 (PST)
In-Reply-To: <1266231291-18711-1-git-send-email-sledz@dresearch.de>
References: <20100213132656.GE5364@jama>
	<1266231291-18711-1-git-send-email-sledz@dresearch.de>
Date: Mon, 15 Feb 2010 14:31:01 +0100
Message-ID: <141020e31002150531s11663cc1q561cb1e7c7c51287@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] vala-dbus-binding-tool: (mostly) new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Feb 2010 13:33:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 15, 2010 at 11:54 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> --- a/recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
> -DEPENDS = "vala-native libgee-native intltool-native libxml2-native"

> diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
> +DEPENDS = "vala libgee libxml2 intltool-native"

Pushed with small changes:

1) SRC_URI moved to .inc as suggested before
2) checksums moved to recipe
3) updated PV in git recipe

Thanks for patch!

BTW: I noticed a bit strange DEPENDS, why is there depend on
intltool-native? and other depends non-native?

it is expanded like this:
-native:
DEPENDS="autoconf-native automake-native libtool-native
gnu-config-native shasum-native coreutils-native autoconf-native
automake-native libtool-native gnu-config-native shasum-native
coreutils-native vala-native libgee-native libxml2-native
intltool-native"

non-native:
DEPENDS="autoconf-native automake-native libtool-native libtool-cross
gnu-config-native shasum-native coreutils-native
virtual/arm-oe-linux-gnueabi-gcc virtual/libc  vala libgee libxml2
intltool-native"

I'm not saying it's wrong, just curious how bitbake deals with
changing DEPENDS while parsing BBCLASSEXTENDS = "native".

Regards,


