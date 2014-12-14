Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id D635372013
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 13:30:52 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id gd6so8333345lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 05:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bq/SIEFJFWbsvXmu0KXVcH039jcufWtRY1jkVNeWg6Q=;
	b=slwYmSywJmZ/OpHmYnjhygtljd+JN2Gbnng0t9LRUErcPCh/g10NOz/7pnuQw/HwbT
	QTCeFM+5ve5TUestTO8keZKsH+zRbcmT7a9J8NdfJPjz1t9ZwcGk0YXZDznF24M4ae0Q
	Uck5Ytd3XFYsYf7/xkbyoQcaohD7cY1/rZz7O0cn3ZgviLRkhquAu2DOU4gevJLEPtZS
	G5t0jGtrbuuYIEochGqyG7zacGccfa1YsMprql9n8DpUDHclsEkBOqUj2YVoxD9eESob
	ONsEtOtwiFSXSKvmTvQgcP68v54shjXKHUDcmwbzQV5y74lRPi5TVeBJjC6rOEJRwJeG
	faRw==
MIME-Version: 1.0
X-Received: by 10.152.42.169 with SMTP id p9mr25310887lal.94.1418563851464;
	Sun, 14 Dec 2014 05:30:51 -0800 (PST)
Received: by 10.25.155.18 with HTTP; Sun, 14 Dec 2014 05:30:51 -0800 (PST)
In-Reply-To: <548D4051.5080504@tames.com>
References: <548D4051.5080504@tames.com>
Date: Sun, 14 Dec 2014 14:30:51 +0100
Message-ID: <CAPbeDCkN02Rsk8a92t_vApn5i6FCG2VRK+x0fUwWjx0ZOYsKXA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Cross canadian gcc configuration
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
X-List-Received-Date: Sun, 14 Dec 2014 13:30:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alfonso,

On Sun, Dec 14, 2014 at 8:46 AM, Alfonso Tam=C3=A9s <alfonso@tames.com> wro=
te:
>
> When I try to compile a hello world program with the
> arm-poky-linux-gnueabi-gcc compiler, first I get an error not finding
> <stdio.h>, and when I pass the directory through the -I flag, I get the
> classic"stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or
> directory" error which I supposed is being thrown since gcc cross canadia=
n
> is not being configured by default (as my image) hard float.
>
> I noticed in the gcc-cross-canadian.inc that the --with-gxx-include-dir
> and --with-sysroot in EXTRA_OECONF_PATHS have a "/not/exist" string:
>
> EXTRA_OECONF_PATHS =3D "\
> --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} \
> --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_=
SYS}/bin
> \
> --with-sysroot=3D/not/exist \
> --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> "
>
>

The sysroot is poisoned by intention. Try sourcing the environment script
from the SDK, and use $CC instead of invoking the compiler binary directly.

See git commit 04b725511a505c582a3abdf63d096967f0320779 in
openembedded-core.

Jacob

