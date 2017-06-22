Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f173.google.com (mail-yb0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id D8CC578240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 17:32:49 +0000 (UTC)
Received: by mail-yb0-f173.google.com with SMTP id 84so6781861ybe.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 10:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FJR/V/r22gaJt4HLNjwh3IB53mz98Wzxix8sybVY2WM=;
	b=sWxqn97+r51oKG/BuZtVlLNCl78LqcGqEKlpZpEe2JnBy3V7c0M1YVH7D5rIQ6kQjr
	LW0ABd2ju9TKPYp74L1maT4e3jq6lb4/YGvdfF5UdGwKVIBg7GLoQVvCdvOYRnd6D/C0
	UFSy5uV/GM4AnWTvrRmbXjNyiHIHsDNyPt3zd0ocO29rJkc5zVGdI3A062h0oYiaSxRA
	ZbUta9qGeIfH5MrpwM435sonXkaDhQ+sC3t3FtnLJi7VJMawWfFxX5rl9KEuVXOAbh47
	lZBBxNEbEVo/cO6l3Idsegdm/Hne0ZqzZPTLnFfyPfbcOQwgRHEP8zekJYzKalX4Ov5w
	A4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FJR/V/r22gaJt4HLNjwh3IB53mz98Wzxix8sybVY2WM=;
	b=lGrzLQLVIrQ0i4HdFDygkkqIpF3s+NU17gMX/402Xa8mGtP5jW84pm/J3vQOAJTg6p
	GxgoC6DfY4vnNYhkeJxy0mFp67b3E9quGoYvxYRGCVDgv2WXpfTu9kWAnxb6OHYzDrum
	l1ZRTt7bHARe20C137llJ9GTGJtucnIWqtDeywkIUqidCq6KpfxOnrEWdz2Uc0yir9pC
	9Gm/SvbUOV+zK8wXQOKzsSrHgE7MCHcG88SwDRw5fR5fnYcMBG3RsiHs7fNvpBYK34lr
	+SApqgvBiA61RGrpztfg2t12yNgSdHdGtLno04mtZUoXL7MYYFWq30/vxE9QZ4B1hDmG
	9LoQ==
X-Gm-Message-State: AKS2vOyiP9RIvRmMZVdyUYD/rsxJWYRbXfjRJLIOee3W1TVzRIYL7N3S
	7rgooV54HKdgnvlvCTjQc+uHobjp7Q==
X-Received: by 10.37.178.4 with SMTP id i4mr2559877ybj.147.1498152770588; Thu,
	22 Jun 2017 10:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 22 Jun 2017 10:32:49 -0700 (PDT)
In-Reply-To: <1498151700.8385.2.camel@xevo.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
	<CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
	<CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
	<CA+chaQdrvQK_uDEkEcBy7NEn4EhVXKWx+FOfbmqM+bPfL7ad-Q@mail.gmail.com>
	<1497915785.8604.2.camel@xevo.com> <1498151700.8385.2.camel@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Jun 2017 19:32:49 +0200
Message-ID: <CA+chaQdZdHS1Jny07kXGcNu7ZU+VBBirgvceNQ+6dBxk36gP2A@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jun 2017 17:32:50 -0000
Content-Type: text/plain; charset="UTF-8"

It basically just calls this script:

openembedded-core/scripts/sstate-diff-machines.sh --machines="qemux86copy
qemux86 qemuarm" --targets=world --tmpdir=tmp-glibc/ --analyze 2>&1 | tee
${LOGDIR}/signatures.log

see:
https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L258

for qemux86copy you either need to add meta-selftest layer from oe-core or
apply:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=9d45c08641b868322af4bebc2f095340cf4dac3f

Sorry I didn't reply earlier, I think it's resolved by dropped kernel
dependency and I didn't notice the question about reproducing it.

Regards,

On Thu, Jun 22, 2017 at 7:15 PM, Martin Kelly <mkelly@xevo.com> wrote:

> (ping) I apologize for the top-post but did not want to have the ping
> lost in the noise.
>
> On Mon, 2017-06-19 at 16:43 -0700, Martin Kelly wrote:
> > On Sun, 2017-06-18 at 22:28 +0200, Martin Jansa wrote:
> > > And there is also this:
> > >
> > > === Incorrect PACKAGE_ARCH or sstate signatures (3) ===
> > >
> > > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/
> > > lo
> > > g.signatures.20170618_014055.log/
> > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
> > >
> > >     * ERROR: 1 errors found in
> > > signatures.qemux86.do_configure.sigdata.log
> > >     * ERROR: 1 errors found in
> > > signatures.qemux86.do_populate_sysroot.sigdata.log
> > >     * ERROR: 1 errors found in
> > > signatures.qemux86.do_package_write_ipk.sigdata.log
> > >
> > >     * ERROR: open-vm-tools different signature for task
> > > do_configure.sigdata between qemux86copy and qemux86
> > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
> > > glibc/sstate-
> > > diff/1497786055/signatures.qemux86.do_configure.sigdata.log
> > >     * ERROR: open-vm-tools different signature for task
> > > do_populate_sysroot.sigdata between qemux86copy and qemux86
> > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
> > > glibc/sstate-
> > > diff/1497786055/signatures.qemux86.do_populate_sysroot.sigdata.log
> > >     * ERROR: open-vm-tools different signature for task
> > > do_package_write_ipk.sigdata between qemux86copy and qemux86
> > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-
> > > glibc/sstate-
> > > diff/1497786055/signatures.qemux86.do_package_write_ipk.sigdata.log
> > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
> > >
> > > So it probably depends on some MACHINE specific variable without
> > > being marked as MACHINE_ARCH.
> > >
> > > Looking at:
> > > https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> > > ab
> > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
> > > vm-
> > > tools_10.1.5.bb
> > >
> > > It's depending on kernel, so it needs to be MACHINE_ARCH, also I've
> > > noticed few more issues:
> > >
> >
> > Thanks for all the feedback. I believe I've now fixed all the issues
> > you outlined.
> >
> > I dropped the kernel dependency entirely, as we're no longer building
> > the kernel modules (they all got upstreamed). Thus I suspect the
> > issue
> > is no longer present with my latest changes.
> >
> > That said, I can't repro the sstate errors on my local machine. Could
> > you provide repro steps so I can verify this is fixed before I send
> > new
> > patches?
> >
> > > DEPENDS is there twice:
> > > https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> > > ab
> > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
> > > vm-
> > > tools_10.1.5.bb#L24
> > > https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> > > ab
> > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
> > > vm-
> > > tools_10.1.5.bb#L39
> > >
> > > What is supposed to set KERNEL_VERSION variable in:
> > > https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> > > ab
> > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
> > > vm-
> > > tools_10.1.5.bb#L58
> > > ?
> > >
> > > Don't use tags in SRCREV, use git hash instead (otherwise bitbake
> > > fetcher will reach upstream git repo every single time the recipe
> > > is
> > > parsed and will cause failed builds when github isn't accessible).
> > > https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> > > ab
> > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/open-
> > > vm-
> > > tools_10.1.5.bb#L35
> > >
> > > There are many hardcoded paths like /usr/lib/ or /usr/sbin/, please
> > > use proper variables like libdir, sbindir.
> > >
> > > Once you fix these issues please resend all changes to the ML, it's
> > > much better to review inline than this.
> > >
> > > Regards,
> > >
> > >
> > > On Sun, Jun 18, 2017 at 9:58 PM, Martin Jansa <martin.jansa@gmail.c
> > > om
> > > > wrote:
> > > > Fails to configure on qemuarm.
> > > >
> > > > If arm isn't expected to be supported, can you please update
> > > > COMPATIBLE_HOST restriction?
> > > >
> > > > http://errors.yoctoproject.org/Errors/Details/145599/
> > > >
> > > > On Thu, Jun 15, 2017 at 7:50 PM, Martin Jansa <martin.jansa@gmail
> > > > .c
> > > > om> wrote:
> > > > > OK, I'll try to remember to fix it before merge.
> > > > >
> > > > > I'm sorry about it, tweaking other people commits always
> > > > > strikes
> > > > > back :).
> > > > >
> > > > > On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly <mkelly@xevo.com>
> > > > > wrote:
> > > > > > On 06/15/2017 09:54 AM, Martin Jansa wrote:
> > > > > > > It didn't make it to patchwork, because you've sent only
> > > > > > > the
> > > > > > > cover
> > > > > > > letter. I've added it to master-next now.
> > > > > > >
> > > > > > > Next time please send also individual patches. So that it
> > > > > > > gets more
> > > > > > > visibility for other people to comment and also that I can
> > > > > > > use patchwork
> > > > > > > to pull it in.
> > > > > > >
> > > > > > > Regards,
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > > Small note: Looks like the initial commit (24b2ac) has a
> > > > > > small
> > > > > > typo that should ideally be fixed before it's merged into
> > > > > > master:
> > > > > >
> > > > > > "open-vm-tools: add recipe from meat-foss-openswitch"
> > > > > >
> > > > > > "meat" --> "meta"
> > > > > >
> > > > > > > On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.
> > > > > > > co
> > > > > > > m
> > > > > > > <mailto:mkelly@xevo.com>> wrote:
> > > > > > >
> > > > > > >     On 06/09/2017 03:22 PM, Martin Kelly wrote:
> > > > > > >
> > > > > > >         Hi all,
> > > > > > >
> > > > > > >         This patch series adds a new recipe for Open VM
> > > > > > > Tools
> > > > > > > to
> > > > > > >         meta-oe. This
> > > > > > >         recipe is invaluable for using Openembedded with
> > > > > > > VMWare, as
> > > > > > >         without the
> > > > > > >         tools, performance is very slow.
> > > > > > >
> > > > > > >         More information about Open VM Tools can be found
> > > > > > > here:
> > > > > > >
> > > > > > >         https://github.com/vmware/open-vm-tools
> > > > > > >         <https://github.com/vmware/open-vm-tools>
> > > > > > >
> > > > > > >         Please note that, as mentioned in the first commit,
> > > > > > > this recipe is
> > > > > > >         modified from the recipe originally found in the
> > > > > > > Open-Switch
> > > > > > >         repository.
> > > > > > >         The first patch is directly from that repository,
> > > > > > > and
> > > > > > > the following
> > > > > > >         patches are modifications to it.
> > > > > > >
> > > > > > >         Original recipe:
> > > > > > >         https://github.com/open-switch/ops-build
> > > > > > >         <https://github.com/open-switch/ops-build>
> > > > > > >         yocto/openswitch/meta-foss-openswitch/recipes-
> > > > > > > extended/open-vm-tools/open-vm-tools_10.0.5.bb
> > > > > > >         <http://open-vm-tools_10.0.5.bb>
> > > > > > >
> > > > > > >         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
> > > > > > >
> > > > > > >         Although the original recipe packaging was Apache-
> > > > > > > licensed, I
> > > > > > >         received
> > > > > > >         permission from the author (Diego Dompe) to
> > > > > > > relicense
> > > > > > > it under
> > > > > > >         the MIT
> > > > > > >         license for inclusion in meta-openembedded:
> > > > > > >
> > > > > > >         https://lists.openswitch.net/pipermail/ops-dev/2017
> > > > > > > -A
> > > > > > > pril/014715.html
> > > > > > >         <https://lists.openswitch.net/pipermail/ops-dev/201
> > > > > > > 7-
> > > > > > > April/014715.html>
> > > > > > >         https://lists.openswitch.net/pipermail/ops-dev/2017
> > > > > > > -A
> > > > > > > pril/014716.html
> > > > > > >
> > > > > > >         <https://lists.openswitch.net/pipermail/ops-dev/201
> > > > > > > 7-
> > > > > > > April/014716.html>
> > > > > > >
> > > > > > >         --
> > > > > > >         The following changes since commit
> > > > > > >         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
> > > > > > >
> > > > > > >           Revert "rrdtool: add gettext-native dependency"
> > > > > > > (2017-06-05
> > > > > > >         11:13:09
> > > > > > >         +0200)
> > > > > > >
> > > > > > >         are available in the git repository at:
> > > > > > >
> > > > > > >           https://github.com/XevoInc/meta-openembedded
> > > > > > >         <https://github.com/XevoInc/meta-openembedded>
> > > > > > >
> > > > > > >         for you to fetch changes up to
> > > > > > >         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
> > > > > > >
> > > > > > >           open-vm-tools: style changes (2017-06-07 22:31:34
> > > > > > > +0000)
> > > > > > >
> > > > > > >         ---------------------------------------------------
> > > > > > > -------------
> > > > > > >         Martin Kelly (14):
> > > > > > >               add open-vm-tools recipe
> > > > > > >               open-vm-tools: add missing pkgconfig
> > > > > > > dependency
> > > > > > >               open-vm-tools: add missing glib-2.0-native
> > > > > > > dependency
> > > > > > >               open-vm-tools: clarify and expand licensing
> > > > > > >               open-vm-tools: base_contains -->
> > > > > > > bb.utils.contains
> > > > > > >               open-vm-tools: update version to 10.1.5
> > > > > > >               open-vm-tools: don't use mspack
> > > > > > >               open-vm-tools: don't use dnet-config
> > > > > > >               open-vm-tools: add #include to fix build
> > > > > > > break
> > > > > > >               open-vm-tools: add missing X11 dependencies
> > > > > > >               open-vm-tools: remove kernel module logic
> > > > > > >               open-vm-tools: line up configure options
> > > > > > >               open-vm-tools: support FUSE
> > > > > > >               open-vm-tools: style changes
> > > > > > >
> > > > > > >          .../recipes-support/open-vm-tools/files/tools.conf
> > > > > > > >   2 +
> > > > > > >
> > > > > > >          .../open-vm-tools/files/vmtoolsd.service
> > > > > > >  |
> > > > > > > 11 +++
> > > > > > >          .../open-vm-tools/0001-Fix-kernel-detection.patch
> > > > > > > |
> > > > > > > 35 +++++++++
> > > > > > >          .../0002-configure.ac-don-t-use-dnet-config.patch
> > > > > > > |
> > > > > > > 41 ++++++++++
> > > > > > >          .../0003-add-include-sys-sysmacros.h.patch
> > > > > > >  |
> > > > > > > 33 ++++++++
> > > > > > >          .../open-vm-tools/open-vm-tools_10.1.5.bb
> > > > > > >         <http://open-vm-tools_10.1.5.bb>          | 90
> > > > > > >         ++++++++++++++++++++++
> > > > > > >          6 files changed, 212 insertions(+)
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-
> > > > > > > tools/files/tools.conf
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-
> > > > > > > tools/files/vmtoolsd.service
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> > > > > > > tools/0001-Fix-kernel-detection.patch
> > > > > > >
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> > > > > > > tools/0002-configure.ac-don-t-use-dnet-config.patch
> > > > > > >
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> > > > > > > tools/0003-add-include-sys-sysmacros.h.patch
> > > > > > >
> > > > > > >          create mode 100644
> > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> > > > > > > tools_10.1.5.bb
> > > > > > >         <http://open-vm-tools_10.1.5.bb>
> > > > > > >         --
> > > > > > >         2.1.4
> > > > > > >
> > > > > > >
> > > > > > >     (ping)
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > >
> > > >
> > >
> > >
>

