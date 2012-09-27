Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1THLBG-0001QR-Nh
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Sep 2012 22:59:35 +0200
Received: by iebc13 with SMTP id c13so5581087ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2012 13:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pURmEoXfC8Q783P1agd7fjxEmhb2eoCo0lJ6ebiSBdA=;
	b=E1dg5XTbCDek6l1yhFV49R5Ses3gKJ71nsipsz7MXcoscP72rsrt4T6ZI5czp403M9
	dw7vDd5FcgKXQ8TI+shB5IPG2IzX3MGuN/Ooj6pHfKNNsRgF4y+FIffqTVC5IMNhF9wJ
	YQ+JWSZXiZK0JE178ITiPv7HCIvTpsZZPYAQAkusPD+k81CRgOYA5Zo0QWtBlfUl31H8
	23CX9Pg+u+EAYXGkZbi99Zd4SJbg+sXM369lEjBLdy2fGDHP+5kv66Y36fiybgs07vvF
	slOMSyMVc05ObWRmGi8voSgaU4gt21n0qxBGwXsvI6c7NP0I2503TMVkws0gyYktSiK5
	RCAg==
MIME-Version: 1.0
Received: by 10.50.104.230 with SMTP id gh6mr15424888igb.50.1348778801717;
	Thu, 27 Sep 2012 13:46:41 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 27 Sep 2012 13:46:41 -0700 (PDT)
In-Reply-To: <20120831003845.485CE10335@opal>
References: <20120831003845.485CE10335@opal>
Date: Thu, 27 Sep 2012 22:46:41 +0200
Message-ID: <CALbNGRTZ1JRhm4Gju3mnHHbi=DqhAhRi_60-_3i3AG_6N_s5jQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : sstate.bbclass: Detect overwriting files in sstate controlled directories
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
X-List-Received-Date: Thu, 27 Sep 2012 20:59:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 31, 2012 at 2:38 AM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1f1b6f93d6b7aa8c9bd9bb5b1826997812e36932
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=1f1b6f93d6b7aa8c9bd9bb5b1826997812e36932
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Aug 25 15:48:14 2012 +0000
>
> sstate.bbclass: Detect overwriting files in sstate controlled directories
>
> We have a potential problem where two sstate packages try and touch the same
> file. This adds code which will print a warning whenever this happens.
>
> The implementation does but by maintaining a master file list and comparing
> file accesses against this. There are a number of places we have duplicate
> accesses which are harmless, mostly in the deploy directory so these
> are whitelisted.
>
> For now the code prints warnings, this could be strengthened in future to
> become error messages. Whilst working on this code on and off over the past
> few months various issues were uncovered, some serious.
>
> [YOCTO #238]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>  meta/classes/sstate.bbclass |   45 ++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 44 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 6762e32..02594a7 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -3,6 +3,7 @@ SSTATE_VERSION = "2"
>  SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
>  SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
> +SSTATE_MASTERMANIFEST = "${SSTATE_MANIFESTS}/master.list"
>
>  def generate_sstatefn(spec, hash, d):
>      if not hash:
> @@ -17,6 +18,7 @@ SSTATE_EXTRAPATH   = ""
>  SSTATE_EXTRAPATHWILDCARD = ""
>  SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
>
> +SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/"
>
>  SSTATE_SCAN_FILES ?= "*.la *-config *_config"
>  SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
> @@ -125,7 +127,6 @@ def sstate_install(ss, d):
>          locks.append(bb.utils.lockfile(lock))
>
>      for state in ss['dirs']:
> -        oe.path.copytree(state[1], state[2])
>          for walkroot, dirs, files in os.walk(state[1]):
>              bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
>              for file in files:
> @@ -140,9 +141,35 @@ def sstate_install(ss, d):
>                  if not dstdir.endswith("/"):
>                      dstdir = dstdir + "/"
>                  shareddirs.append(dstdir)
> +
> +    # Check the file list for conflicts against the master manifest
> +    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
> +    whitelist = d.getVar("SSTATE_DUPWHITELIST", True)
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    fileslist = [line.strip() for line in open(mastermanifest)]
> +    bb.utils.unlockfile(lock)
> +    match = []
> +    for f in sharedfiles:
> +        if f in fileslist:
> +            realmatch = True
> +            for w in whitelist:
> +                if f.startswith(w):
> +                    realmatch = False
> +                    break
> +            if realmatch:
> +                match.append(f)
> +    if match:
> +        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
> +
> +    # Write out the manifest and add to the task's manifest file
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    mf = open(mastermanifest, "a")
>      f = open(manifest, "w")
>      for file in sharedfiles:
> +        mf.write(file + "\n")
>          f.write(file + "\n")
> +    bb.utils.unlockfile(lock)
> +
>      # We want to ensure that directories appear at the end of the manifest
>      # so that when we test to see if they should be deleted any contents
>      # added by the task will have been removed first.
> @@ -152,6 +179,10 @@ def sstate_install(ss, d):
>          f.write(di + "\n")
>      f.close()
>
> +    # Run the actual file install
> +    for state in ss['dirs']:
> +        oe.path.copytree(state[1], state[2])
> +
>      for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
>          bb.build.exec_func(postinst, d)
>
> @@ -268,6 +299,18 @@ def sstate_clean_manifest(manifest, d):
>          except OSError:
>              pass
>
> +    # Remove the entries from the master manifest
> +    mastermanifest = d.getVar("SSTATE_MASTERMANIFEST", True)
> +    lock = bb.utils.lockfile(mastermanifest + ".lock")
> +    mf = open(mastermanifest + ".new", "w")
> +    for line in open(mastermanifest, "r"):
> +        if not line or line in entries:
> +            continue
> +        mf.write(line)
> +    mf.close()
> +    os.rename(mastermanifest + ".new", mastermanifest)
> +    bb.utils.unlockfile(lock)
> +
>      oe.path.remove(manifest)
>
>  def sstate_clean(ss, d):
>
>
I think it started with this one: I often do play around with
different kernel versions/sources to bisect when a bug was born. Doing
so I now get wallpapers with

WARNING: The recipe is trying to install files into a shared area when
those files already exist. Those files are:
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/Module.symvers
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/CREDITS
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/kernel-abiversion
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/Makefile
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/kernel-image-name
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/uImage
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/README
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/COPYING
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/REPORTING-BUGS
   /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/System.map-3.5.0
...
(log.do_populate_sysroot is 2.8 MB)

Would it cause huge effort to add a variable which is in scope of
recipe avoiding this warning because it scrolls out all other
interesting messages?

Andreas


