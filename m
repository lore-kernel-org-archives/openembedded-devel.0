Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id CAE6B60684
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 10:32:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z45so11525953wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dSF7OEQcgmzyj9jwrwNdwC57XOI9L18euCCN+gdHld8=;
	b=P1R3C+dsk5iwf04vFevORkDh/419Q/rY4P0lfkJaPh/T86zSmMmnN9elnvmRyZ+h5y
	RNsRb6Ts6ASXOKfyHwDXEpA9RSxAjZhY7fWNZ6CbAVK30GvxFDsgaxQTW+VT/aaDSmSk
	WsSfY4Gy6JJkjUFmwBV+lko4a6RktE4lSnYdy1pLj8BM1hcDaDFsd0134J/8A21vxUr+
	eYj0wKqs1NZzkKLZNYoGkDgF7NUVrvgO0JpnA/USBq2lx3XUa1eHFO/qeFexAw98iU69
	Ev+nyrpDiJpdiJah27WWLxRLPgIGxfAetBMkTCxrRi/rVlAcOirctvO5w7cYSMUZ94f8
	TlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dSF7OEQcgmzyj9jwrwNdwC57XOI9L18euCCN+gdHld8=;
	b=LyNdTTINHiOE2qJPhyp35XWYi7YWorKhAKp1ffKUpyq+RjULBeRABbXZG9nICvCyta
	EBvrAWkukcZ4nN6hnqWeyvtVvyngcS49+cqargvuywozSY1A40xs+8Hl6c4+WgdXZDwV
	y5Uwwn5NMUnGjzczTDIg8vJwwuEMtkaPhZApcrt7RED/SVdo5nfHLoiRUClbUsjriTzt
	gE43/LLCAMU+SasqqCMtJ0OBf43uBwKv6GXxYB31d4JmCEZhAnU+99S3fYdYa4yLEAIN
	e4sCVdQmTFm1/gqQYs5nWp+s0WomMFoh/miwZ18ALMh9vuSy5j3YU+qHCNbGZIkchjwj
	3lJQ==
X-Gm-Message-State: AKS2vOw/hlNqep5EbcWwrKninHIwoc3yBKvXaJjr/vhC5UKZrFfC+c/6
	GHSccIbg7DM1qZLO
X-Received: by 10.28.165.199 with SMTP id o190mr4922205wme.57.1498213973197;
	Fri, 23 Jun 2017 03:32:53 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z75sm3694361wmz.8.2017.06.23.03.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Jun 2017 03:32:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 23 Jun 2017 12:33:06 +0200
To: Martin Kelly <mkelly@xevo.com>
Message-ID: <20170623103306.GA2791@jama>
References: <2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<ac7731a3-ff5c-b4c8-f8d9-1ee0d30e17a1@xevo.com>
	<CA+chaQcnwYQwBXfxbdpEN8D9ZYzG=fOxX_MPNXt1_uzShSSrwg@mail.gmail.com>
	<CA+chaQdbrZ+R37sKDXamFwW71G9MvYVF-Bb=8OO_k5ChdUFGGg@mail.gmail.com>
	<CA+chaQdrvQK_uDEkEcBy7NEn4EhVXKWx+FOfbmqM+bPfL7ad-Q@mail.gmail.com>
	<1497915785.8604.2.camel@xevo.com>
	<1498151700.8385.2.camel@xevo.com>
	<CA+chaQdZdHS1Jny07kXGcNu7ZU+VBBirgvceNQ+6dBxk36gP2A@mail.gmail.com>
	<8904009a-6498-afa6-e077-4dd166bb04bf@xevo.com>
MIME-Version: 1.0
In-Reply-To: <8904009a-6498-afa6-e077-4dd166bb04bf@xevo.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
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
X-List-Received-Date: Fri, 23 Jun 2017 10:32:54 -0000
X-Groupsio-MsgNum: 67307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2017 at 11:21:16AM -0700, Martin Kelly wrote:
> On 06/22/2017 10:32 AM, Martin Jansa wrote:
> > It basically just calls this script:
> >
> > openembedded-core/scripts/sstate-diff-machines.sh
> > --machines=3D"qemux86copy qemux86 qemuarm" --targets=3Dworld
> > --tmpdir=3Dtmp-glibc/ --analyze 2>&1 | tee ${LOGDIR}/signatures.log
> >
> > see:
> > https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#=
L258
> >
> > for qemux86copy you either need to add meta-selftest layer from oe-core
> > or apply:
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/master&id=3D9d45c08641b868322af4bebc2f095340cf4dac3f
> >
> > Sorry I didn't reply earlier, I think it's resolved by dropped kernel
> > dependency and I didn't notice the question about reproducing it.
> >
>=20
> I'm trying to run the script, but I'm just getting output suggesting=20
> everything is OK, even with the old change that I know has issues. I'm=20
> guessing I need to manually run through some steps that simulate what=20
> Jenkins would have done before running this script ("bitbake world" on=20
> several arches with a particular directory structure?).

It doesn't do anything special before or after the script (you don't
need to build anything in order to compare signatures).

The whole jenkins setup is described here:
http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

You can even call jenkins-job.sh manually if you really want, you just
need to export JOB_NAME=3D"oe_world_workspace-compare-signatures"


> It seems to me we have a few options:
> - Try to troubleshoot how to manually run the tests
> - Submit the fixed-up version and hope it works. I agree that dropping=20
> the kernel dependency will probably fix the issue.
> - If you know how to trigger the Jenkins build manually, you could test=
=20
> it on my new branch before I submit:
> https://github.com/xevoinc/meta-openembedded/tree/open-vm-tools-v2
>=20
> I'm happy with any of these; let me know what you think.

Just submit the fixed-up version and I'll include it in next master-next
run on jenkins.

For the create-pull-request issue we discussed earlier I'm using
following parameters:

scripts/create-pull-request -u contrib -b ${B} -i ${B} -p "PATCH][${R}][RES=
END" -r origin/${R} -s "Backports for ${R}" -o pull-${R}

Where R is release, e.g. morty and
B is e.g. B=3Djansa/${R}-backports

While branches are on openembedded-core-contrib repository:
http://git.openembedded.org/openembedded-core-contrib
and "contrib" is the git remote for it:
OE @ ~/openembedded-core $ git remote -v | grep contrib
contrib git+ssh://git@git.openembedded.org/openembedded-core-contrib (fetch)
contrib git+ssh://git@git.openembedded.org/openembedded-core-contrib (push)

and since this change:
commit 98faa3ec872e06774b5870fcfb52f3ff91494779
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Apr 5 19:31:27 2016 -0700

    create-pull-request: fix for newer git

    Fixed when git > 2.1.0:

I also need to specify local branch name with -l or it will wrongly
assume HEAD and fail with:
NOTE: Assuming local branch HEAD, use -l to override.
warn: No match for commit 9d45c08641b868322af4bebc2f095340cf4dac3f found
at git://git.openembedded.org/openembedded-core-contrib
warn: Are you sure you pushed 'jansa/morty-backports' there?
warning: inexact rename detection was skipped due to too many files.
warning: you may want to set your diff.renameLimit variable to at least
1151 and retry the command.
ERROR: git request-pull reported an error

So currently my script calls it as:
scripts/create-pull-request -u contrib -l ${B} -b ${B} -i ${B} -p "PATCH][$=
{R}][RESEND" -r origin/${R} -s "Backports for ${R}" -o pull-${R}

>=20
> >
> > On Thu, Jun 22, 2017 at 7:15 PM, Martin Kelly <mkelly@xevo.com
> > <mailto:mkelly@xevo.com>> wrote:
> >
> >     (ping) I apologize for the top-post but did not want to have the pi=
ng
> >     lost in the noise.
> >
> >     On Mon, 2017-06-19 at 16:43 -0700, Martin Kelly wrote:
> >     > On Sun, 2017-06-18 at 22:28 +0200, Martin Jansa wrote:
> >     > > And there is also this:
> >     > >
> >     > > =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (3) =3D=
=3D=3D
> >     > >
> >     > > Complete log:
> >     http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/
> >     <http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/>
> >     > > lo
> >     > > g.signatures.20170618_014055.log/
> >     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
> >     > >
> >     > >     * ERROR: 1 errors found in
> >     > > signatures.qemux86.do_configure.sigdata.log
> >     > >     * ERROR: 1 errors found in
> >     > > signatures.qemux86.do_populate_sysroot.sigdata.log
> >     > >     * ERROR: 1 errors found in
> >     > > signatures.qemux86.do_package_write_ipk.sigdata.log
> >     > >
> >     > >     * ERROR: open-vm-tools different signature for task
> >     > > do_configure.sigdata between qemux86copy and qemux86
> >     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/=
tmp-
> >     > > glibc/sstate-
> >     > > diff/1497786055/signatures.qemux86.do_configure.sigdata.log
> >     > >     * ERROR: open-vm-tools different signature for task
> >     > > do_populate_sysroot.sigdata between qemux86copy and qemux86
> >     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/=
tmp-
> >     > > glibc/sstate-
> >     > > diff/1497786055/signatures.qemux86.do_populate_sysroot.sigdata.=
log
> >     > >     * ERROR: open-vm-tools different signature for task
> >     > > do_package_write_ipk.sigdata between qemux86copy and qemux86
> >     > >     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/=
tmp-
> >     > > glibc/sstate-
> >     > > diff/1497786055/signatures.qemux86.do_package_write_ipk.sigdata=
=2Elog
> >     > >     * ERROR: 3 issues were found in these recipes: open-vm-tools
> >     > >
> >     > > So it probably depends on some MACHINE specific variable without
> >     > > being marked as MACHINE_ARCH.
> >     > >
> >     > > Looking at:
> >     > >
> >     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> >     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb=
2>
> >     > > ab
> >     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/ope=
n-
> >     > > vm-
> >     > > tools_10.1.5.bb <http://tools_10.1.5.bb>
> >     > >
> >     > > It's depending on kernel, so it needs to be MACHINE_ARCH, also =
I've
> >     > > noticed few more issues:
> >     > >
> >     >
> >     > Thanks for all the feedback. I believe I've now fixed all the iss=
ues
> >     > you outlined.
> >     >
> >     > I dropped the kernel dependency entirely, as we're no longer buil=
ding
> >     > the kernel modules (they all got upstreamed). Thus I suspect the
> >     > issue
> >     > is no longer present with my latest changes.
> >     >
> >     > That said, I can't repro the sstate errors on my local machine. C=
ould
> >     > you provide repro steps so I can verify this is fixed before I se=
nd
> >     > new
> >     > patches?
> >     >
> >     > > DEPENDS is there twice:
> >     > >
> >     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> >     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb=
2>
> >     > > ab
> >     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/ope=
n-
> >     > > vm-
> >     > > tools_10.1.5.bb#L24 <http://tools_10.1.5.bb#L24>
> >     > >
> >     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> >     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb=
2>
> >     > > ab
> >     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/ope=
n-
> >     > > vm-
> >     > > tools_10.1.5.bb#L39 <http://tools_10.1.5.bb#L39>
> >     > >
> >     > > What is supposed to set KERNEL_VERSION variable in:
> >     > >
> >     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> >     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb=
2>
> >     > > ab
> >     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/ope=
n-
> >     > > vm-
> >     > > tools_10.1.5.bb#L58 <http://tools_10.1.5.bb#L58>
> >     > > ?
> >     > >
> >     > > Don't use tags in SRCREV, use git hash instead (otherwise bitba=
ke
> >     > > fetcher will reach upstream git repo every single time the reci=
pe
> >     > > is
> >     > > parsed and will cause failed builds when github isn't accessibl=
e).
> >     > >
> >     https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb2
> >     <https://github.com/XevoInc/meta-openembedded/blob/402d1b3917195beb=
2>
> >     > > ab
> >     > > 7cac5dc94aaed8992b5a1/meta-oe/recipes-support/open-vm-tools/ope=
n-
> >     > > vm-
> >     > > tools_10.1.5.bb#L35 <http://tools_10.1.5.bb#L35>
> >     > >
> >     > > There are many hardcoded paths like /usr/lib/ or /usr/sbin/, pl=
ease
> >     > > use proper variables like libdir, sbindir.
> >     > >
> >     > > Once you fix these issues please resend all changes to the ML, =
it's
> >     > > much better to review inline than this.
> >     > >
> >     > > Regards,
> >     > >
> >     > >
> >     > > On Sun, Jun 18, 2017 at 9:58 PM, Martin Jansa <martin.jansa@gma=
il.c
> >     > > om
> >     > > > wrote:
> >     > > > Fails to configure on qemuarm.
> >     > > >
> >     > > > If arm isn't expected to be supported, can you please update
> >     > > > COMPATIBLE_HOST restriction?
> >     > > >
> >     > > > http://errors.yoctoproject.org/Errors/Details/145599/
> >     <http://errors.yoctoproject.org/Errors/Details/145599/>
> >     > > >
> >     > > > On Thu, Jun 15, 2017 at 7:50 PM, Martin Jansa <martin.jansa@g=
mail
> >     > > > .c
> >     > > > om> wrote:
> >     > > > > OK, I'll try to remember to fix it before merge.
> >     > > > >
> >     > > > > I'm sorry about it, tweaking other people commits always
> >     > > > > strikes
> >     > > > > back :).
> >     > > > >
> >     > > > > On Thu, Jun 15, 2017 at 7:40 PM, Martin Kelly
> >     <mkelly@xevo.com <mailto:mkelly@xevo.com>>
> >     > > > > wrote:
> >     > > > > > On 06/15/2017 09:54 AM, Martin Jansa wrote:
> >     > > > > > > It didn't make it to patchwork, because you've sent only
> >     > > > > > > the
> >     > > > > > > cover
> >     > > > > > > letter. I've added it to master-next now.
> >     > > > > > >
> >     > > > > > > Next time please send also individual patches. So that =
it
> >     > > > > > > gets more
> >     > > > > > > visibility for other people to comment and also that I =
can
> >     > > > > > > use patchwork
> >     > > > > > > to pull it in.
> >     > > > > > >
> >     > > > > > > Regards,
> >     > > > > > >
> >     > > > > > >
> >     > > > > >
> >     > > > > >
> >     > > > > > Small note: Looks like the initial commit (24b2ac) has a
> >     > > > > > small
> >     > > > > > typo that should ideally be fixed before it's merged into
> >     > > > > > master:
> >     > > > > >
> >     > > > > > "open-vm-tools: add recipe from meat-foss-openswitch"
> >     > > > > >
> >     > > > > > "meat" --> "meta"
> >     > > > > >
> >     > > > > > > On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@x=
evo.
> >     > > > > > > co
> >     > > > > > > m
> >     > > > > > > <mailto:mkelly@xevo.com <mailto:mkelly@xevo.com>>> wrot=
e:
> >     > > > > > >
> >     > > > > > >     On 06/09/2017 03:22 PM, Martin Kelly wrote:
> >     > > > > > >
> >     > > > > > >         Hi all,
> >     > > > > > >
> >     > > > > > >         This patch series adds a new recipe for Open VM
> >     > > > > > > Tools
> >     > > > > > > to
> >     > > > > > >         meta-oe. This
> >     > > > > > >         recipe is invaluable for using Openembedded with
> >     > > > > > > VMWare, as
> >     > > > > > >         without the
> >     > > > > > >         tools, performance is very slow.
> >     > > > > > >
> >     > > > > > >         More information about Open VM Tools can be fou=
nd
> >     > > > > > > here:
> >     > > > > > >
> >     > > > > > >         https://github.com/vmware/open-vm-tools
> >     <https://github.com/vmware/open-vm-tools>
> >     > > > > > >         <https://github.com/vmware/open-vm-tools
> >     <https://github.com/vmware/open-vm-tools>>
> >     > > > > > >
> >     > > > > > >         Please note that, as mentioned in the first com=
mit,
> >     > > > > > > this recipe is
> >     > > > > > >         modified from the recipe originally found in the
> >     > > > > > > Open-Switch
> >     > > > > > >         repository.
> >     > > > > > >         The first patch is directly from that repositor=
y,
> >     > > > > > > and
> >     > > > > > > the following
> >     > > > > > >         patches are modifications to it.
> >     > > > > > >
> >     > > > > > >         Original recipe:
> >     > > > > > >         https://github.com/open-switch/ops-build
> >     <https://github.com/open-switch/ops-build>
> >     > > > > > >         <https://github.com/open-switch/ops-build
> >     <https://github.com/open-switch/ops-build>>
> >     > > > > > >         yocto/openswitch/meta-foss-openswitch/recipes-
> >     > > > > > > extended/open-vm-tools/open-vm-tools_10.0.5.bb
> >     <http://open-vm-tools_10.0.5.bb>
> >     > > > > > >         <http://open-vm-tools_10.0.5.bb
> >     <http://open-vm-tools_10.0.5.bb>>
> >     > > > > > >
> >     > > > > > >         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
> >     > > > > > >
> >     > > > > > >         Although the original recipe packaging was Apac=
he-
> >     > > > > > > licensed, I
> >     > > > > > >         received
> >     > > > > > >         permission from the author (Diego Dompe) to
> >     > > > > > > relicense
> >     > > > > > > it under
> >     > > > > > >         the MIT
> >     > > > > > >         license for inclusion in meta-openembedded:
> >     > > > > > >
> >     > > > > > >
> >     https://lists.openswitch.net/pipermail/ops-dev/2017
> >     <https://lists.openswitch.net/pipermail/ops-dev/2017>
> >     > > > > > > -A
> >     > > > > > > pril/014715.html
> >     > > > > > >
> >     <https://lists.openswitch.net/pipermail/ops-dev/201
> >     <https://lists.openswitch.net/pipermail/ops-dev/201>
> >     > > > > > > 7-
> >     > > > > > > April/014715.html>
> >     > > > > > >
> >     https://lists.openswitch.net/pipermail/ops-dev/2017
> >     <https://lists.openswitch.net/pipermail/ops-dev/2017>
> >     > > > > > > -A
> >     > > > > > > pril/014716.html
> >     > > > > > >
> >     > > > > > >
> >     <https://lists.openswitch.net/pipermail/ops-dev/201
> >     <https://lists.openswitch.net/pipermail/ops-dev/201>
> >     > > > > > > 7-
> >     > > > > > > April/014716.html>
> >     > > > > > >
> >     > > > > > >         --
> >     > > > > > >         The following changes since commit
> >     > > > > > >         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
> >     > > > > > >
> >     > > > > > >           Revert "rrdtool: add gettext-native dependenc=
y"
> >     > > > > > > (2017-06-05
> >     > > > > > >         11:13:09
> >     > > > > > >         +0200)
> >     > > > > > >
> >     > > > > > >         are available in the git repository at:
> >     > > > > > >
> >     > > > > > >           https://github.com/XevoInc/meta-openembedded
> >     <https://github.com/XevoInc/meta-openembedded>
> >     > > > > > >         <https://github.com/XevoInc/meta-openembedded
> >     <https://github.com/XevoInc/meta-openembedded>>
> >     > > > > > >
> >     > > > > > >         for you to fetch changes up to
> >     > > > > > >         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
> >     > > > > > >
> >     > > > > > >           open-vm-tools: style changes (2017-06-07 22:3=
1:34
> >     > > > > > > +0000)
> >     > > > > > >
> >     > > > > > >         -----------------------------------------------=
----
> >     > > > > > > -------------
> >     > > > > > >         Martin Kelly (14):
> >     > > > > > >               add open-vm-tools recipe
> >     > > > > > >               open-vm-tools: add missing pkgconfig
> >     > > > > > > dependency
> >     > > > > > >               open-vm-tools: add missing glib-2.0-native
> >     > > > > > > dependency
> >     > > > > > >               open-vm-tools: clarify and expand licensi=
ng
> >     > > > > > >               open-vm-tools: base_contains -->
> >     > > > > > > bb.utils.contains
> >     > > > > > >               open-vm-tools: update version to 10.1.5
> >     > > > > > >               open-vm-tools: don't use mspack
> >     > > > > > >               open-vm-tools: don't use dnet-config
> >     > > > > > >               open-vm-tools: add #include to fix build
> >     > > > > > > break
> >     > > > > > >               open-vm-tools: add missing X11 dependenci=
es
> >     > > > > > >               open-vm-tools: remove kernel module logic
> >     > > > > > >               open-vm-tools: line up configure options
> >     > > > > > >               open-vm-tools: support FUSE
> >     > > > > > >               open-vm-tools: style changes
> >     > > > > > >
> >     > > > > > >          .../recipes-support/open-vm-tools/files/tools.=
conf
> >     > > > > > > >   2 +
> >     > > > > > >
> >     > > > > > >          .../open-vm-tools/files/vmtoolsd.service
> >     > > > > > >  |
> >     > > > > > > 11 +++
> >     > > > > > >          .../open-vm-tools/0001-Fix-kernel-detection.pa=
tch
> >     > > > > > > |
> >     > > > > > > 35 +++++++++
> >     > > > > > >          .../0002-configure.ac-don-t-use-dnet-config.pa=
tch
> >     > > > > > > |
> >     > > > > > > 41 ++++++++++
> >     > > > > > >          .../0003-add-include-sys-sysmacros.h.patch
> >     > > > > > >  |
> >     > > > > > > 33 ++++++++
> >     > > > > > >          .../open-vm-tools/open-vm-tools_10.1.5.bb
> >     <http://open-vm-tools_10.1.5.bb>
> >     > > > > > >         <http://open-vm-tools_10.1.5.bb
> >     <http://open-vm-tools_10.1.5.bb>>          | 90
> >     > > > > > >         ++++++++++++++++++++++
> >     > > > > > >          6 files changed, 212 insertions(+)
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-
> >     > > > > > > tools/files/tools.conf
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-
> >     > > > > > > tools/files/vmtoolsd.service
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> >     > > > > > > tools/0001-Fix-kernel-detection.patch
> >     > > > > > >
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> >     > > > > > > tools/0002-configure.ac-don-t-use-dnet-config.patch
> >     > > > > > >
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> >     > > > > > > tools/0003-add-include-sys-sysmacros.h.patch
> >     > > > > > >
> >     > > > > > >          create mode 100644
> >     > > > > > >         meta-oe/recipes-support/open-vm-tools/open-vm-
> >     > > > > > > tools_10.1.5.bb <http://tools_10.1.5.bb>
> >     > > > > > >         <http://open-vm-tools_10.1.5.bb
> >     <http://open-vm-tools_10.1.5.bb>>
> >     > > > > > >         --
> >     > > > > > >         2.1.4
> >     > > > > > >
> >     > > > > > >
> >     > > > > > >     (ping)
> >     > > > > > >
> >     > > > > > >
> >     > > > > > >
> >     > > > > >
> >     > > > > >
> >     > > > >
> >     > > > >
> >     > > >
> >     > > >
> >     > >
> >     > >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUztowAKCRA3VSO3ZXaA
HJKUAJ9XAuCMN8CM86WHPcU7I2FREvAQxgCgmfVHWrAgcnP6DkQoVG2em4gVjbg=
=qYyn
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
