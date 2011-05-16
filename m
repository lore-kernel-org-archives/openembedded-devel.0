Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <needemesleepe@gmail.com>) id 1QLyQ7-0000nn-UB
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 16:05:16 +0200
Received: by pzk36 with SMTP id 36so2188544pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=XQJr++NejNrwshvGhGJw9+qbkcVmLQytWhV7LpLjraI=;
	b=XYcVh3SzyVVQ+1fA1qnfxaZHyigoOHn1YWIRKe0yqUxOTjjT4DfYreBJlXsrZE3YZK
	XSi0wFBNehCQfZWa2EDGuS1qgs/ex0r86xL7ziZWsaVG82qHlgPusRrFF2fzcWtBhy0R
	FGVVUimQXAP9sV+HrvXT6oX7K/6uGt2IDFd70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=K45AGSTE8oPwwJBIEAt0JyIQ6KJTjFxQvdefGTfIUsuH8Lroc2k0XN1EweCs+VDGN3
	kG6mzJLjsFShIrvppDsrRSb7Exo/b8eJeD4KouJhILcNwRyd/JzEYLzHwTEwfdqKKJJh
	KQjmFwXqKw+IBaqMiUoiksXTqsu7HK9/7VnyU=
MIME-Version: 1.0
Received: by 10.68.64.225 with SMTP id r1mr7735139pbs.250.1305554542245; Mon,
	16 May 2011 07:02:22 -0700 (PDT)
Received: by 10.68.46.233 with HTTP; Mon, 16 May 2011 07:02:22 -0700 (PDT)
In-Reply-To: <1305238433.13652.47.camel@mattotaupa>
References: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
	<1305236006.13652.41.camel@mattotaupa>
	<BANLkTimdLk4S_0zjM8NTwXSxrTU_epdC+Q@mail.gmail.com>
	<1305238433.13652.47.camel@mattotaupa>
Date: Mon, 16 May 2011 10:02:22 -0400
Message-ID: <BANLkTinkK8Erz22QP=2CbyOReFc9b2YnSw@mail.gmail.com>
From: Martin Bures <needemesleepe@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: steve@sakoman.com
Subject: Re: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Mon, 16 May 2011 14:05:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have updated the patch and simplified it a bit.  I do not want to switch
the recipe to use defconfig instead of .config because defconfig is modified
by the recipe.

The change simplifies down to just changing the directory back to ${S}.
Then .config can be found again.  The line above the first test changes the
pwd and this is the problem.

As I already submitted the patch via email, I will continue for this one and
use git's submission mechanism in the future.

Best regards,
martin.

From f3f91d271e2f8664b72ed77fc523a733094f701a Mon Sep 17 00:00:00 2001
From: Martin Bures <needemesleepe@gmail.com>
Date: Mon, 16 May 2011 09:47:51 -0400
Subject: [PATCH] wpa-supplicant: fixed .inc recipe to correctly deploy dbus
configuration
 files when dbus is configured.

The current recipe changes the directory, changing the scope such that
the recipe cannot resolve .config.  When tests are made whether .config
contains DBUS configurations, it always fails.  This causes the
placement of DBUS configuration files to always fail.

Signed-off-by: Martin Bures <needemesleepe@gmail.com>
---
 recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
index 7649038..abf01c2 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -63,6 +63,7 @@ do_install () {
     cd ${D}${sysconfdir}/network/ && \
     ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant

+    cd ${S}
     if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q
^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
         install -d ${D}/${sysconfdir}/dbus-1/system.d
         install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
${D}/${sysconfdir}/dbus-1/system.d
-- 
1.7.0.4


On Thu, May 12, 2011 at 6:13 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Martin,
>
>
> Am Donnerstag, den 12.05.2011, 17:54 -0400 schrieb Martin Bures:
>
> > I will take a look at the policy and try to update the patch tomorrow.
>
> thanks.
>
> > As for your questions/comments about .config.  That was how the recipe
> was
> > when I found it - I was just trying to make minimal modifications from
> what
> > was there to get it working.  I agree that it could be changed to use
> > defconfig.  As with the patch submission guidelines, I will take a look
> and
> > see if this change as-suggested works correctly tomorrow and modify and
> > resubmit the patch accordingly.
>
> Please also take a look at commit aa35ba5c [1] and maybe even CC the
> author and committer.
>
>        commit aa35ba5cf7e1bf30fb2edb1408c0b599ec89290a
>        Author: Steve Sakoman <steve@sakoman.com>
>        Date:   Tue Apr 19 08:40:52 2011 -0700
>
>            wpa-supplicant: Enable CONFIG_CTRL_IFACE_DBUS and
> CONFIG_CTRL_IFACE_DBUS_NEW
>
>            Signed-off-by: Steve Sakoman <steve@sakoman.com>
>            Signed-off-by: Koen Kooi <koen@openembedded.org>
>
> I do not know what build configuration you use. Please remember to write
> down what version you are using and what distribution and machine.
>
>
> Thanks,
>
> Paul
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=aa35ba5cf7e1bf30fb2edb1408c0b599ec89290a
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

