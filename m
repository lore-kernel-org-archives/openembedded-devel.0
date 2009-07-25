Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MUmTq-00031L-7I
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 21:00:26 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1150092qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=vIs2vHpdsd4tAHNBPhANmWzrLz99x/gSzw3xywDYA0Q=;
	b=lGLEDlR5I7hJ6vQP5ocqFa46tjSjK2sxrE7JkmfXKcmi5Da0/NVdoz4EilNA+opcdQ
	ujku5R7motaMMTw+jf0gXvtkLtfdCnjfm4hYUOKsAkxLwkEkLm5bLIQbezbrcI7JLRiD
	OZzY3bV+RDEfDK6OvITXsOgOV1sLrLG07ZDCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=BdCGPApLst3wNZIH9Hm40Rqq7wAGOIZtfYqau24V7oYB6O4AMi67GrvzCOi/Z4ELKk
	gAj8TGVsgyGj8iZYgb3W6idgV8LPxZpqAKPWsRiHa6AEhUE4wwBW/4m7S4kJjwajuvbk
	30hEE/3mcyAhAokWXfLdWHF3LIzhZjEG9KOHA=
MIME-Version: 1.0
Received: by 10.220.90.199 with SMTP id j7mr2988386vcm.57.1248547556456; Sat, 
	25 Jul 2009 11:45:56 -0700 (PDT)
In-Reply-To: <1248544432-5221-1-git-send-email-raj.khem@gmail.com>
References: <1248544432-5221-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 25 Jul 2009 11:45:56 -0700
Message-ID: <19c1b8a90907251145m4f3ed4a0sb428ed37f7b17d29@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] shell.py: Quash python warning: DeprecationWarning: the sets module is deprecated.
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
X-List-Received-Date: Sat, 25 Jul 2009 19:00:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2009 at 10:53 AM, Khem Raj<raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0lib/bb/shell.py | =C2=A0 =C2=A01 -
> =C2=A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/lib/bb/shell.py b/lib/bb/shell.py
> index 2ab855b..1e532c0 100644
> --- a/lib/bb/shell.py
> +++ b/lib/bb/shell.py
> @@ -55,7 +55,6 @@ PROBLEMS:
> =C2=A0try:
> =C2=A0 =C2=A0 set
> =C2=A0except NameError:
> - =C2=A0 =C2=A0from sets import Set as set
> =C2=A0import sys, os, readline, socket, httplib, urllib, commands, popen2=
, copy, shlex, Queue, fnmatch
> =C2=A0from bb import data, parse, build, fatal, cache, taskdata, runqueue=
, providers as Providers
>
> --
> 1.6.3.3
>
>

wrong patch ignore it.

Thx
-Khem


