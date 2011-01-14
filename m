Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdaHs-0007NW-8n
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:25:16 +0100
Received: by pvd12 with SMTP id 12so364423pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mG9wR6w2mucZYIY3ndAPAAy19hgu4MN4pXUqEOpYLtg=;
	b=oT+YzYMQySy09R9yaNNe0ZHqf/dKPYbKxUgy6TC02a1hkk4sSRHrnDqAE6pJrn2Tj0
	MxrDK2gti52gmQbtLP/gaBw2lUU6+AStoePySycm8UnitJwnPQ/eaTWjvDqivW7t1MyS
	DNBeb2TIpbCYZcxxrB9GBYyR3wC4xwPHAUpWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Rw7cGHXrtt5OmOC3fIP4VVN9FvZ2HmcLnCjJbXVvqmaKwDnXmht7dbn1v2cVneD6m0
	Q4oRtbBzUP2QjOzTkA8aI8wIV91UNauih5gFjwLBSXu8Bf0Zh0wcgQL5dGLiCY+YYrxn
	NRwmxI8JHD7cPIQWHX5oEGVbfIe4UgyCupOzE=
Received: by 10.143.42.12 with SMTP id u12mr286889wfj.220.1294975480480;
	Thu, 13 Jan 2011 19:24:40 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w22sm998332wfd.7.2011.01.13.19.24.39
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:24:39 -0800 (PST)
Message-ID: <4D2FC1F3.20504@gmail.com>
Date: Thu, 13 Jan 2011 19:24:35 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294928952-25833-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1294928952-25833-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] zlib: substitute sharedlibdir
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
X-List-Received-Date: Fri, 14 Jan 2011 03:25:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/2011 6:29 AM, Enrico Scholz wrote:
> From: Enrico Scholz<enrico.scholz@informatik.tu-chemnitz.de>
>
> @sharedlibdir@ is not substituted so that linkerflags in zlib.pc expand to
> "... -L@sharedlibdir@" which breaks e.g. glib builds.
>


I think zlib has --sharedlibdir configure option since 1.2.4.4+
so you could try to use it instead of patching

> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   recipes/zlib/zlib-1.2.5/0001-autotools.patch |    4 +++-
>   recipes/zlib/zlib_1.2.5.bb                   |    2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/zlib/zlib-1.2.5/0001-autotools.patch b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
> index 6642860..f5c50f1 100644
> --- a/recipes/zlib/zlib-1.2.5/0001-autotools.patch
> +++ b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
> @@ -33,7 +33,7 @@ new file mode 100644
>   index 0000000..177c89a
>   --- /dev/null
>   +++ b/configure.ac
> -@@ -0,0 +1,17 @@
> +@@ -0,0 +1,19 @@
>   +AC_INIT(zlib,1.2.5)
>   +AC_CONFIG_SRCDIR(adler32.c)
>   +AM_INIT_AUTOMAKE(zlibs,1.2.5)
> @@ -45,6 +45,8 @@ index 0000000..177c89a
>   +
>   +AC_HEADER_STDC
>   +
> ++AC_SUBST(sharedlibdir,$libdir)
> ++
>   +AC_CONFIG_FILES([
>   +Makefile
>   +zlib.pc
> diff --git a/recipes/zlib/zlib_1.2.5.bb b/recipes/zlib/zlib_1.2.5.bb
> index 34419f0..1f51404 100644
> --- a/recipes/zlib/zlib_1.2.5.bb
> +++ b/recipes/zlib/zlib_1.2.5.bb
> @@ -1,6 +1,6 @@
>   include zlib.inc
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI += "file://0001-autotools.patch "
>



