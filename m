Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0JMR-0007ai-Qe
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 22:04:27 +0100
Received: by lahc1 with SMTP id c1so592289lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:56:07 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.87.234 as permitted sender)
	client-ip=10.112.87.234; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.87.234 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.87.234])
	by 10.112.87.234 with SMTP id bb10mr11915607lbb.33.1329944167257
	(num_hops = 1); Wed, 22 Feb 2012 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gqZPJPRD/5iTbkXmaHHgZxxV/44qjQdLr7pOz0OrRsY=;
	b=SoWOgOdQ5g5W3iKasRyKgdM09cYZVB9lkQR6n//nuUKB3V4xYeEN8GgMSbUYuoU82C
	dwg+BlW59RxO6too388UW1my895pdgqAqPgDrqQkrg4Bx/WkiuHmSXtCaBtL/meeFu3P
	JBeVDYivLHh30zpMte2ufDbgrUXQZmt0GVE6U=
MIME-Version: 1.0
Received: by 10.112.87.234 with SMTP id bb10mr9922738lbb.33.1329944166972;
	Wed, 22 Feb 2012 12:56:06 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Wed, 22 Feb 2012 12:56:06 -0800 (PST)
In-Reply-To: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
Date: Wed, 22 Feb 2012 21:56:06 +0100
Message-ID: <CALbNGRSt8==s56Ef4EHKDx5i1WP6ww8gb9T7XBzi2G879DPRNw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 21:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 9:13 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> At build from scratch I get
>
> ERROR: Command Error: exit status: 1 =A0Output:
> Applying patch gcc45-no-add-needed.patch
> patching file gcc/config/alpha/elf.h
> patching file gcc/config/ia64/linux.h
> patching file gcc/config/linux.h
> Hunk #1 succeeded at 89 (offset -12 lines).
> patching file gcc/config/rs6000/sysv4.h
> Hunk #1 FAILED at 908.
> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/tem=
p/log.do_patch.5367
> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Failed
> ERROR: Task 2829
> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-d=
evtools/gcc/gcc-cross-initial_4.5.bb,
> do_patch) failed with exit code '1'
>
> git log does not help me much - =A0what goes wrong?
>
After looking around a bit I think this one is better on oe-core list.
Maybe it is related to the last two patches:

commit 6546096d068b51cc9cf4557cdb35aee6f62838d5
Author: Lianhao Lu <lianhao.lu@intel.com>
Date:   Tue Feb 14 10:57:52 2012 +0800

    gcc: Excluding the DATE/SRCDATE from do_patch dependency.

    Corrected the error introduced by commit afb400e of dropping
    DATE/SRCDATE out of the vardepsexlude list of do_patch.

    Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc
b/meta/recipes-devtools/gcc/gcc-common.inc
index 57668f9..df6021a 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -109,4 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
 # We need to ensure that for the shared work directory, the do_patch
singatures match
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
-should_apply[vardepsexclude] =3D "PN"
+should_apply[vardepsexclude] +=3D "PN"

commit afb400e9c3ddac604906bde44df5da29a6c134d9
Author: Lianhao Lu <lianhao.lu@intel.com>
Date:   Fri Feb 10 11:42:18 2012 +0800

    gcc: Ensure same sstate hashes for shared soruce directory

    Ensure do_patch have the same sstate hashes for nativesdk variants of
    gcc family recipes, since they share the same source directory.

    Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc
b/meta/recipes-devtools/gcc/gcc-common.inc
index e89a7c0..57668f9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -109,3 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
 # We need to ensure that for the shared work directory, the do_patch
singatures match
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
+should_apply[vardepsexclude] =3D "PN"

Andreas


