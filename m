Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Or860-0001UR-Ut
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 13:36:46 +0200
Received: by iwn2 with SMTP id 2so423922iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=H34D/1vy5HtBLjphNwUpb+LH89ymqiowxNcjVo+oWKw=;
	b=KDhSurnzXD1ec/ZCV0UjKheXpsEbwsRjgyL3uWRSjmvbLXD54VKaheJSTQ+/WBvLm7
	WIpxaUcmPqRh8lDTy8aqLosDQ2IkXV87skFkOQqsYXamdpPPhC2vYdxgaqB5JuMbVCph
	EtwEw682YxOmATQTUSnj6BhUU/+zF/tfwwm74=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=lc5g0ghpfv20zNkdleGM3fG0HJKchDPeV2KXjJ3OhNpd5aUD6Unf2uEZV8FHpr+sHu
	Uzm/mkpkAiRXjGWYQScPC/jM7NXwpkI7yPDjAWwt8dCC0ZrXoZzcpLRR/49lTGtewQPK
	VeM2xY596HmzBdiaB4ck2ZcgWEcDK2JQK+0qs=
MIME-Version: 1.0
Received: by 10.231.174.84 with SMTP id s20mr10297658ibz.94.1283427371060;
	Thu, 02 Sep 2010 04:36:11 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Thu, 2 Sep 2010 04:36:10 -0700 (PDT)
In-Reply-To: <AANLkTimJ47S_5NRyubHegYQ4S_xYK6aiBu_TkvNrtqCt@mail.gmail.com>
References: <AANLkTimJ47S_5NRyubHegYQ4S_xYK6aiBu_TkvNrtqCt@mail.gmail.com>
Date: Thu, 2 Sep 2010 21:06:10 +0930
Message-ID: <AANLkTikfPnTmSF_H=u=EQtSA+NkM=jVSWhqEC7UGFDfT@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: Can someone help me understand these errors I got in my build
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
X-List-Received-Date: Thu, 02 Sep 2010 11:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2 September 2010 17:30, J. L. <vwyodapink@gmail.com> wrote:
> When it was going through the final stages in my build I ended up with
> some conflict errors and not sure if I understand how to fix this
> properly. Do I just remove what its says is why it cant install one
> file because another is trying to install the same file ? Or? But I
> dont think I am understanding these correctly as I have never gotten
> them before. I would really appreciate any help on this one so I can
> get my image packaged now that everything is built. Also I can post my
> image I am trying to build if that helps its a very bloated desktop
> image, here is the error:
>
> also I tried to clean it by doing bitbake -c clean and then bitbake
> myimage but still same result.
>
> | Collected errors:
> | =A0* check_data_file_clashes: Package kernel-firmware-down3 wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/e=
dgeport/down3.bin
> | =A0 =A0 =A0 But that file is already provided by package =A0* linux-fir=
mware

These two packages cannot be installed on the same system. There are
two possibilities for fixing this: either don't included both packages
in the same image or remove the file from one of the packages.

> | =A0* opkg_install_cmd: Cannot install package task-base-extended.

For whatever reason, the task-base-extended ipk cannot be found in
your package repository. There are many reasons why this may occur and
I will not speculate upon it.

> | =A0* check_data_file_clashes: Package rt73-firmware wants to install
> file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/rt73.bin
> | =A0 =A0 =A0 But that file is already provided by package =A0* linux-fir=
mware
> | =A0* opkg_install_cmd: Cannot install package rt73-firmware.
> | =A0* opkg_install_cmd: Cannot install package libnet.
> | =A0* check_data_file_clashes: Package glproto-dev wants to install
> file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/include/GL/interna=
l/glcore.h
> | =A0 =A0 =A0 But that file is already provided by package =A0* libgl-dev
> | =A0* opkg_install_cmd: Cannot install package artoolkit-dev.
> | =A0* satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-sdk-native:
> | =A0* =A0 =A0libdbd-sqlite-perl * =A0 =A0libdbix-simple-perl *

The libdbd-sqlite-perl and libdbix-simple-perl ipks cannot be found in
your repository.

> | =A0* opkg_install_cmd: Cannot install package task-native-sdk.
> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python=
2.6/site-packages/setuptools.pth
> | =A0 =A0 =A0 But that file is already provided by package =A0* python-se=
tuptools
> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python=
2.6/site-packages/site.pyo
> | =A0 =A0 =A0 But that file is already provided by package =A0* python-se=
tuptools
> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/python=
2.6/site-packages/site.py
> | =A0 =A0 =A0 But that file is already provided by package =A0* python-se=
tuptools
> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_i=
nstall-2.6
> | =A0 =A0 =A0 But that file is already provided by package =A0* python-se=
tuptools
> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_i=
nstall
> | =A0 =A0 =A0 But that file is already provided by package =A0* python-se=
tuptools
> | =A0* opkg_install_cmd: Cannot install package python-twisted.
> | =A0* opkg_install_cmd: Cannot install package gst-plugin-video4linux2.
> | =A0* resolve_conffiles: Existing conffile
> /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_table is
> different from the conffile in the new package. The new conffile will
> be placed at /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_tab=
le-opkg.

Two packages both provide the same config file. This should really
error out, but its only a warning at the moment because it would cause
too many breakages (the message printing is deferred until the end of
opkg's processing, like an error).

> | =A0* check_data_file_clashes: Package gpe-theme-clearlooks wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/share/them=
es/Clearlooks/gtk-2.0/gtkrc
> | =A0 =A0 =A0 But that file is already provided by package =A0* gtk-theme=
-clearlooks
> | =A0* opkg_install_cmd: Cannot install package gpe-session-scripts.
> NOTE: Task failed:
> /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/UAV-Dimage-=
1.0-r0/temp/log.do_rootfs.4216
> NOTE: oestats: task failed, see
> http://tinderbox.openembedded.net/public/logs/task/7541484.txt
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage.bb
> do_rootfs failed
> ERROR: Task 11 (/home/vdubhack/overo-oe/user.collection/recipes/images/UA=
V-Dimage.bb,
> do_rootfs) failed
> NOTE: Tasks Summary: Attempted 11557 tasks of which 11540 didn't need
> to be rerun and 1 failed.
> ERROR: '/home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage=
.bb'
> failed
> NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds=
/85611/
>
>
> Thanks as always !
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I suggest you start with a much smaller image and add to it
incrementally. That way, if/when you encounter problems, it is much
easier to narrow down which recipe or recipe dependency is causing
problems. Building a dependency graph with bitbake -g may help narrow
down some problems.

-Graham

PS: I appreciate that opkg error messages can be a little cryptic.
Patches welcome!


