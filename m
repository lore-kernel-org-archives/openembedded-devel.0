Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id F2C60609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 16:48:06 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 7581A288E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 18:48:07 +0200 (CEST)
Message-ID: <54244747.8060504@pseudoterminal.org>
Date: Thu, 25 Sep 2014 18:48:07 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140925162359.GM25706@jama>
In-Reply-To: <20140925162359.GM25706@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, test-dependencies 2014-08-08
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
X-List-Received-Date: Thu, 25 Sep 2014 16:48:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Also, some recipes don't support the QEMU architectures. I noticed that 
with chromium. 
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140901_100637.log/2_max/failed/chromium.log



On 09/25/2014 06:23 PM, Martin Jansa wrote:
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140901_100637.log/
>
> ERROR: 483 issues were found in these recipes: adb ajenti
> android-initscripts anjuta-remote-run apcupsd barnyard barnyard2
> bigbuckbunny-1080p bigbuckbunny-480p bigbuckbunny-720p
> ca-certificates-cross check chromium claws-mail
> claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl
> clutter-box2d concurrencykit coriander cramfs dbus-ptest edbus2 elbow
> emacs emprint eve fim freerdp genext2fs gnome-mplayer gnu-efi gnuradio
> grub-efi gummiboot hostap-daemon ifuse imake initramfs-live-install
> initramfs-live-install-efi initramfs-live-install-efi-testfs
> initramfs-live-install-testfs intone ipython ipython3 js krb5 libacpi
> libftdi libgc libimobiledevice libjson libungif
> linux-yocto-tiny-kexecboot llvm2.8 llvm2.9 llvm3.2 lua5.1
> maliit-framework maliit-plugins mplayer2 nasm network-manager-applet
> networkmanager news numactl ocf-linux omgps opendataplane openmotif
> packagegroup-core-basic packagegroup-core-sdk-gmae
> packagegroup-core-standalone-gmae-sdk-target packagegroup-xfce-extended
> python-setuptools python3-docutils python3-jinja python3-nose
> python3-pycurl python3-pyzmq python3-sphinx qcanobserver
> qcanobserver-socketcan qconnman qconnman-e qtjsbackend qtjsondb rage
> renderer-service-upnp ristretto rpm-postinsts screenshot soft66 sylpheed
> syslinux talloc tearsofsteel-1080p tumbler u-boot-fw-utils ubootchart
> uhd uhd-firmware v86d vala-terminal valgrind web-webkit webkit-efl
> wxpython wxwidgets xbmc xchat xf86-input-mtev xf86-input-vmmouse
> xf86-video-ati xf86-video-geode xf86-video-intel xf86-video-nouveau
> xf86-video-vesa xf86-video-vmware xfce4-power-manager xorg-cf-files
> zaurusd zenity zeroc-ice zsh
>
> The list of failed recipes looks alarmingly long, but probably the
> biggest part of it are blacklisted or removed recipes (full
> test-dependencies build was including all recipes which were ever
> built with current buildhistory repo I have on jenkins server).
>
>   
>
> This is first report with the message format unified with insane_qa check.
>
> collectd-5.2.2: collectd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> curl-7.37.1: libcurl rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> curlpp-0.7.3: libcurlpp rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida rdepends on libwebp, but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> gst-plugins-bad-0.10.23: gst-plugins-bad-curl rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libcrypto, but it isn't a build dependency? [build-deps]
> gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libssl, but it isn't a build dependency? [build-deps]
> gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> gstreamer1.0-plugins-bad-1.4.1: gstreamer1.0-plugins-bad-curl rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> libetpan-0.57: libetpan rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> liboauth-1.0.3: liboauth rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on jasper, but it isn't a build dependency? [build-deps]
> opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on libdc1394, but it isn't a build dependency? [build-deps]
> postgresql-9.2.4: postgresql rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> python3-3.3.3: python3-tkinter rdepends on tcl-lib, but it isn't a build dependency? [build-deps]
> qtbase-5.3.1: qtbase-plugins rdepends on cups-lib, but it isn't a build dependency? [build-deps]
> radvd-1.9.8: radvd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> strongswan-5.2.0: strongswan rdepends on rtmpdump, but it isn't a build dependency? [build-deps]
> sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
> tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build dependency? [build-deps]
> udisks-1.0.4: udisks rdepends on lvm2, but it isn't a build dependency? [build-deps]
> xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn't a build dependency? [build-deps]
>
> Then few getting libhybris as dependency, this isn't deterministic, the components will link with virtual/libgl provider
> which gets built first (so it's alternating between mesa and libhybris in my case).
>
> mesa-demos-8.2.0: mesa-demos rdepends on libhybris, but it isn't a build dependency? [build-deps]
> mx-1.0-1.4.7+gitAUTOINC+9b1db6b806: mx-1.0 rdepends on libhybris, but it isn't a build dependency? [build-deps]
> piglit-1.0+gitrAUTOINC+bbeff5d21b: piglit rdepends on libhybris, but it isn't a build dependency? [build-deps]
> qtwayland-5.3.0+gitAUTOINC+98dca3b54f: qtwayland-plugins rdepends on libhybris, but it isn't a build dependency? [build-deps]
> qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: qtwebengine rdepends on libhybris, but it isn't a build dependency? [build-deps]
> weston-1.5.0: weston-examples rdepends on libhybris, but it isn't a build dependency? [build-deps]
> weston-1.5.0: weston rdepends on libhybris, but it isn't a build dependency? [build-deps]
>
> And there is couple more QA issues which aren't build-deps:
>
> bluez5-5.22: bluez5: configure was passed unrecognised options: --with-systemdunitdir [unknown-configure-option]
> gstreamer1.0-libav-1.4.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.1-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]
> libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcrypt/usr/lib/libgcrypt.so.20.0.1' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> openldap-2.4.39: openldap: Files/directories were installed but not shipped   /run [installed-vs-shipped]
> qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebengine/0.9.99+gitAUTOINC+21f6ce84ec-r0/packages-split/qtwebengine/usr/lib/libQt0WebEngineCore.so.0.9.0' has relocations in .text [textrel]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' from qwt was already stripped, this will prevent future debugging! [already-stripped]
> xbmc-13.2: xbmc: configure was passed unrecognised options: --disable-rxsx [unknown-configure-option]
>
>
>


