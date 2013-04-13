Received: from mail-lb0-f179.google.com ([209.85.217.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UQorC-0001X2-VV
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 03:02:26 +0200
Received: by mail-lb0-f179.google.com with SMTP id t1so3148149lbd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=d7gxVXtaotvXyIZ8iby0od/lOx/VEELUMvyAbzIKM00=;
	b=Cbz+VMlaaa5gjxb1lgeopDeKm3/IWb8ii+Js3p/9O61UMJPv4EUUuE1vpajGCO2e3Z
	hMDJPU+q0Hy/zHhR0DLQC8UJn126w7uPfN9tgVjaWr2HH+MrVFrATl1fFqGm54jcrqDe
	Ys8gn40x2PkVoawGY+vmi8cAcG3/J1LNZvOClYh0Ydj6uPKCknkDOvNytQam/4A5vz9U
	zVK4YzXq0a37wtNcyBUxeJi1zO0QhXGB5oSHhlqWFkN9GX0hpiGWwimv9OdhFaciggEp
	eaI/itfitIa8kXhINaAHC+vMSVQ4IXOPgmf34Otu3tuYMHs833TaC1j5RD4AH3iibJhM
	g6+w==
MIME-Version: 1.0
X-Received: by 10.152.6.229 with SMTP id e5mr6404986laa.6.1365813893456; Fri,
	12 Apr 2013 17:44:53 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 12 Apr 2013 17:44:53 -0700 (PDT)
In-Reply-To: <20130412225236.GZ2477@jama>
References: <20130412225236.GZ2477@jama>
Date: Fri, 12 Apr 2013 20:44:53 -0400
Message-ID: <CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld] linux-yocto-3.8 failing
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
X-List-Received-Date: Sat, 13 Apr 2013 01:02:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Hi Andrea,
>
> patches from
> http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d738e6a6dc=
2971853644b9ed0e0a9a2e
>
> don't apply after linux-yocto upgrade in oe-core from today
> http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec64591c4=
d91933b3a8db875a374a63640b

Hmm. Andrea and I debugged another problem with these BSPs just yesterday,
I sent a fix to RP that is slightly newer than the commit you are referenci=
ng
above.

If it still doesn't work with the very tip of oe-core, then I'll help
Andrea debug more ... unless
the patches really do need a refresh :)

Cheers,

Bruce

>
> ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spitz-=
oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a20=
5c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patch=
.18051 for further information)
> ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/spitz-o=
e-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a205=
c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_patch.=
18051
> Log data follows:
> | DEBUG: Executing shell function do_patch
> | Deleted branch meta-temp (was 37fdb0c).
> | [INFO] validating against known patches  (spitz-standard-meta)
> error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
> | error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
> | To force apply this patch, use 'guilt push -f'
> | [ERROR] unable to complete push
> | pending patches are:
> | links/linux-yocto-3.8/spitz_pm.patch
> | links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
> | links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
> | ERROR. could not update git tree
> | ERROR. Could not apply patches for spitz.
> |        Patch failures can be resolved in the devshell (bitbake -c devsh=
ell linux-yocto)
> | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spit=
z-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a=
205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_pat=
ch.18051 for further information)
> ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/linux/l=
inux-yocto_3.8.bb, do_patch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to be rer=
un and 1 failed.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


