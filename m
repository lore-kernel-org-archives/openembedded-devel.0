Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrIJ1-0004VO-Jp
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 00:31:02 +0200
Received: by ewy7 with SMTP id 7so743712ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 15:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dSwj4nhEzyYl9hWaEtFWWPrQW5prkYoypsSy1NN6Sb8=;
	b=CKc4aRqc1lPcgKDKPieGrPR4zg53cMBnougOTwtHjN8+4PL0vksZkvaR+Qo31DV/Xk
	i1X8OJehKJhq9qcScRdnQDRAbzZRTx5UOzBhgeTSPAUrv50OuVjLgg4l6uQRZK6SLh4+
	KvnK05RnV6ahXHophU517KLo7wJwZyttuEX/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OcPo2qlMcwRO6qIYlTfWytii1aEIhvhFYePBqhgwl09rDTJLUZcwx67XG34TVaBgqq
	x22nvzJsFrM1+htYDkpPgqIKZ6UepsuTCrA8y+hTVt13oFmn7I6PXRYmIWmqiH1fbZKa
	K2Nf+QcF1qVSYVddXKQOzl17XXdheC1+aaOGk=
MIME-Version: 1.0
Received: by 10.216.174.7 with SMTP id w7mr10014528wel.21.1283462540777; Thu,
	02 Sep 2010 14:22:20 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 14:22:20 -0700 (PDT)
In-Reply-To: <AANLkTikfPnTmSF_H=u=EQtSA+NkM=jVSWhqEC7UGFDfT@mail.gmail.com>
References: <AANLkTimJ47S_5NRyubHegYQ4S_xYK6aiBu_TkvNrtqCt@mail.gmail.com>
	<AANLkTikfPnTmSF_H=u=EQtSA+NkM=jVSWhqEC7UGFDfT@mail.gmail.com>
Date: Thu, 2 Sep 2010 14:22:20 -0700
Message-ID: <AANLkTi=79Og=M=kehLt5NJobvPCZmQouUWpxtkoPoGMy@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 02 Sep 2010 22:31:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2010 at 4:36 AM, Graham Gower <graham.gower@gmail.com> wrote=
:
> On 2 September 2010 17:30, J. L. <vwyodapink@gmail.com> wrote:
>> When it was going through the final stages in my build I ended up with
>> some conflict errors and not sure if I understand how to fix this
>> properly. Do I just remove what its says is why it cant install one
>> file because another is trying to install the same file ? Or? But I
>> dont think I am understanding these correctly as I have never gotten
>> them before. I would really appreciate any help on this one so I can
>> get my image packaged now that everything is built. Also I can post my
>> image I am trying to build if that helps its a very bloated desktop
>> image, here is the error:
>>
>> also I tried to clean it by doing bitbake -c clean and then bitbake
>> myimage but still same result.
>>
>> | Collected errors:
>> | =A0* check_data_file_clashes: Package kernel-firmware-down3 wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/=
edgeport/down3.bin
>> | =A0 =A0 =A0 But that file is already provided by package =A0* linux-fi=
rmware
>
> These two packages cannot be installed on the same system. There are
> two possibilities for fixing this: either don't included both packages
> in the same image or remove the file from one of the packages.
>> | =A0* opkg_install_cmd: Cannot install package task-base-extended.
>
> For whatever reason, the task-base-extended ipk cannot be found in
> your package repository. There are many reasons why this may occur and
> I will not speculate upon it.
>
>> | =A0* check_data_file_clashes: Package rt73-firmware wants to install
>> file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/lib/firmware/rt73.bin
>> | =A0 =A0 =A0 But that file is already provided by package =A0* linux-fi=
rmware
>> | =A0* opkg_install_cmd: Cannot install package rt73-firmware.
>> | =A0* opkg_install_cmd: Cannot install package libnet.
>> | =A0* check_data_file_clashes: Package glproto-dev wants to install
>> file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/include/GL/intern=
al/glcore.h
>> | =A0 =A0 =A0 But that file is already provided by package =A0* libgl-de=
v
>> | =A0* opkg_install_cmd: Cannot install package artoolkit-dev.
>> | =A0* satisfy_dependencies_for: Cannot satisfy the following
>> dependencies for task-sdk-native:
>> | =A0* =A0 =A0libdbd-sqlite-perl * =A0 =A0libdbix-simple-perl *
>
> The libdbd-sqlite-perl and libdbix-simple-perl ipks cannot be found in
> your repository.
>
>> | =A0* opkg_install_cmd: Cannot install package task-native-sdk.
>> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/pytho=
n2.6/site-packages/setuptools.pth
>> | =A0 =A0 =A0 But that file is already provided by package =A0* python-s=
etuptools
>> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/pytho=
n2.6/site-packages/site.pyo
>> | =A0 =A0 =A0 But that file is already provided by package =A0* python-s=
etuptools
>> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/lib/pytho=
n2.6/site-packages/site.py
>> | =A0 =A0 =A0 But that file is already provided by package =A0* python-s=
etuptools
>> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_=
install-2.6
>> | =A0 =A0 =A0 But that file is already provided by package =A0* python-s=
etuptools
>> | =A0* check_data_file_clashes: Package python-zopeinterface wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/bin/easy_=
install
>> | =A0 =A0 =A0 But that file is already provided by package =A0* python-s=
etuptools
>> | =A0* opkg_install_cmd: Cannot install package python-twisted.
>> | =A0* opkg_install_cmd: Cannot install package gst-plugin-video4linux2.
>> | =A0* resolve_conffiles: Existing conffile
>> /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_table is
>> different from the conffile in the new package. The new conffile will
>> be placed at /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/etc/device_ta=
ble-opkg.
>
> Two packages both provide the same config file. This should really
> error out, but its only a warning at the moment because it would cause
> too many breakages (the message printing is deferred until the end of
> opkg's processing, like an error).
>
>> | =A0* check_data_file_clashes: Package gpe-theme-clearlooks wants to
>> install file /home/vdubhack/overo-oe/tmp/rootfs/UAV-Dimage/usr/share/the=
mes/Clearlooks/gtk-2.0/gtkrc
>> | =A0 =A0 =A0 But that file is already provided by package =A0* gtk-them=
e-clearlooks
>> | =A0* opkg_install_cmd: Cannot install package gpe-session-scripts.
>> NOTE: Task failed:
>> /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/UAV-Dimage=
-1.0-r0/temp/log.do_rootfs.4216
>> NOTE: oestats: task failed, see
>> http://tinderbox.openembedded.net/public/logs/task/7541484.txt
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimage.bb
>> do_rootfs failed
>> ERROR: Task 11 (/home/vdubhack/overo-oe/user.collection/recipes/images/U=
AV-Dimage.bb,
>> do_rootfs) failed
>> NOTE: Tasks Summary: Attempted 11557 tasks of which 11540 didn't need
>> to be rerun and 1 failed.
>> ERROR: '/home/vdubhack/overo-oe/user.collection/recipes/images/UAV-Dimag=
e.bb'
>> failed
>> NOTE: oestats: build failed, see http://tinderbox.openembedded.net/build=
s/85611/
>>
>>
>> Thanks as always !
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> I suggest you start with a much smaller image and add to it
> incrementally. That way, if/when you encounter problems, it is much
> easier to narrow down which recipe or recipe dependency is causing
> problems. Building a dependency graph with bitbake -g may help narrow
> down some problems.
>
> -Graham
>
> PS: I appreciate that opkg error messages can be a little cryptic.
> Patches welcome!
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the more clear break down I am sorting through everything
now and getting a little further. I will soon start working towards
learning the patching and recipe procedures. If I run into anymore
issues I will post back on this thread


