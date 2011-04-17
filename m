Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QBUw4-0006tb-RI
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 18:34:57 +0200
Received: by iye7 with SMTP id 7so3756108iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=BENWXb4cWbIgubgDE0wM5zJZd/XxJ0qscclYgWyvWkQ=;
	b=LdFJYnIV1AdX0CjlrGEU1RjFFhI8T4AFuq6p+jXyIdgJDfQhhMPY3ORmvIoJHM27tT
	QQJ9LftWNzKc3fIPLiZnQ/eVCRxoArcsETW7J0TwQkIUpCRRs9Ep+HxT5xaUbMSMIhrB
	6wD0MqLGaYlCylLuND3NZ7dV96IfSpNZ15Roc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=EPXNY4MUlV8U73FqaLyFLU+CxxooFEPpYK6jQexR84ZYdtAQAUIs6hbmzQWmSKocL3
	VP92IEZYbbQduNOT/qFH2kpkKpGhG0OFNs+KpguAv/8ZlzBHYi94uW1SJmIa6R9Eyf4O
	Bwc/rqiUnjKT1FyOsszVHx5HPzCdJ+49kZCUA=
MIME-Version: 1.0
Received: by 10.231.79.131 with SMTP id p3mr3126348ibk.191.1303057953352; Sun,
	17 Apr 2011 09:32:33 -0700 (PDT)
Received: by 10.231.19.204 with HTTP; Sun, 17 Apr 2011 09:32:33 -0700 (PDT)
In-Reply-To: <1303057740.23572.23.camel@mattotaupa>
References: <1303057740.23572.23.camel@mattotaupa>
Date: Sun, 17 Apr 2011 18:32:33 +0200
Message-ID: <BANLkTimDT0KbTeygMoREYawyJN68sKVYHQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] schroedinger.inc: remove version dependent checksums
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
X-List-Received-Date: Sun, 17 Apr 2011 16:34:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/17 Paul Menzel <paulepanter@users.sourceforge.net>

> Date: Sun, 17 Apr 2011 18:14:13 +0200
>
> This is a fix up for commit cb84b138 [1].
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=cb84b138269ed9f3426f4e79f4bb9911e5066387
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

Thanks!
Having the checksums twice in there is indeed not too useful.
Acked-by:  Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> ---
>  recipes/schroedinger/schroedinger.inc |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/schroedinger/schroedinger.inc
> b/recipes/schroedinger/schroedinger.inc
> index 4dc8a6e..386fc73 100644
> --- a/recipes/schroedinger/schroedinger.inc
> +++ b/recipes/schroedinger/schroedinger.inc
> @@ -5,8 +5,6 @@ DEPENDS = "liboil orc-native orc"
>  INC_PR = "r1"
>
>  SRC_URI = "
> http://www.diracvideo.org/download/schroedinger/${P}.tar.gz;name=schroedingertargz
> "
> -SRC_URI[schroedingertargz.md5sum] = "d67ec48b7c506db8c8b49156bf409e60"
> -SRC_URI[schroedingertargz.sha256sum] =
> "345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
>  SRC_URI += "file://configure.ac.patch"
>
>  EXTRA_OECONF += "STAGING_DIR=${STAGING_DIR_NATIVE}"
> --
> 1.7.4.4
>

