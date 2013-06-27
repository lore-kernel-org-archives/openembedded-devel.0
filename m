Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 167946A4E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 08:30:28 +0000 (UTC)
Received: by mail-bk0-f50.google.com with SMTP id ik8so156875bkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cux6erEBz7v6prqB5du2gppvoezO6wRsSkjod2d5rtg=;
	b=C/pnPc9ybhNWk1oiopqaNl/rwI13M5tMwu9HAnfezOyCgrFbjkTOvCeTGsVqgCMhyH
	AegPdwF+eBzcoxFYjwifIz/zTKnkRZdBF8rw4P9i+U7/48kdNS50Bs2vDp64IFgiB40h
	o3biD+kcNdZMzZnejw0EySJ35eJ77H1tfO8QL3ScZYnHBDddxJTtl+OJgVgSBBvEtMaJ
	SaRjCxJBtfNlCUicB/s6xPjKOsc39MzzVROltLbR+81FM3sJOywRo/YGGe7wr4wSuyP7
	oK0FpNrgrlmhk3jdD0pgdevpRt7z/Eoo9+ZWqnrt0zt4pXMtJKODdByC8y+tAhDlFbVp
	sP/Q==
MIME-Version: 1.0
X-Received: by 10.204.57.203 with SMTP id d11mr1036626bkh.69.1372321829237;
	Thu, 27 Jun 2013 01:30:29 -0700 (PDT)
Received: by 10.205.34.139 with HTTP; Thu, 27 Jun 2013 01:30:29 -0700 (PDT)
In-Reply-To: <20130620155842.GB5093@windriver.com>
References: <1371522235-9161-1-git-send-email-lei.yang@windriver.com>
	<20130619143511.GB8093@windriver.com>
	<CAHsH0E9x-wd4pOWeM5VhGxyZXMf+ZN88obet0_wrJ_N57wenKQ@mail.gmail.com>
	<20130620155842.GB5093@windriver.com>
Date: Thu, 27 Jun 2013 16:30:29 +0800
Message-ID: <CAHsH0E-RWpEvtsSjq_z=qc-cvKoW4-wz6h3-=rjAPx9Rm6VOFw@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: paul.eggleton@linux.intel.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH:V2] vlan: Add vlan recipe
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
X-List-Received-Date: Thu, 27 Jun 2013 08:30:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

I read this page
http://rpm.pbone.net/index.php3/stat/4/idpl/15627532/dir/opensuse_11.x/com/vlan-1.9-124.1.x86_64.rpm.html
and then I think I should  remove them to keep it clean, thanks for the
advice

Lei


On Thu, Jun 20, 2013 at 11:58 PM, Joe MacDonald <Joe.MacDonald@windriver.com
> wrote:

> [Re: [oe] [meta-networking][PATCH:V2] vlan: Add vlan recipe] On 13.06.20
> (Thu 23:47) lei yang wrote:
>
> > Hi Joe
> >
> > On Wed, Jun 19, 2013 at 10:35 PM, Joe MacDonald <
> Joe.MacDonald@windriver.com>
> > wrote:
> >
> >     Hey Lei,
> >
> >     [[oe] [meta-networking][PATCH:V2] vlan: Add vlan recipe] On 13.06.18
> (Tue
> >     10:23) lei.yang@windriver.com wrote:
> >
> >     > From: Lei Yang <lei.yang@windriver.com>
> >     >
> >     > A 802.1q vlan support program,which can be used by virt-test
> >     >
> >     > Signed-off-by: Lei Yang <lei.yang@windriver.com>
> >     > ---
> >     >  meta-networking/recipes-support/vlan/files/ip      |   21 +++++++
> >     >  .../recipes-support/vlan/files/vlan-post-down      |   28
> +++++++++
> >     >  .../recipes-support/vlan/files/vlan-pre-up         |   61
> >     ++++++++++++++++++++
> >     >  meta-networking/recipes-support/vlan/vlan_1.9.bb   |   36
> ++++++++++++
> >     >  4 files changed, 146 insertions(+), 0 deletions(-)
> >     >  create mode 100755 meta-networking/recipes-support/vlan/files/ip
> >     >  create mode 100755 meta-networking/recipes-support/vlan/files/
> >     vlan-post-down
> >     >  create mode 100755 meta-networking/recipes-support/vlan/files/
> >     vlan-pre-up
> >     >  create mode 100755 meta-networking/recipes-support/vlan/
> vlan_1.9.bb
> >     >
> >     > diff --git a/meta-networking/recipes-support/vlan/files/ip b/
> >     meta-networking/recipes-support/vlan/files/ip
> >     > new file mode 100755
> >     > index 0000000..d7de05c
> >     > --- /dev/null
> >     > +++ b/meta-networking/recipes-support/vlan/files/ip
> >     > @@ -0,0 +1,21 @@
> >     > +#!/bin/sh
> >     > +# This should probably go into ifupdown
> >     > +# But usually only those with lots of interfaces (vlans) need
> these
> >     > +if [ -d "/proc/sys/net/ipv4/conf/$IFACE" ]
> >     > +then
> >     > +     if [ -n "$IF_IP_PROXY_ARP" ]; then
> >     > +             if [ "$IF_IP_PROXY_ARP" -eq "1" ]; then
> >     > +                     echo 1 >
> "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
> >     > +             else
> >     > +                     echo 0 >
> "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
> >     > +             fi
> >     > +     fi
> >     > +     if [ -n "$IF_IP_RP_FILTER" ]; then
> >     > +             if [ "$IF_IP_RP_FILTER" -eq "0" ]; then
> >     > +                     echo 0 >
> "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
> >     > +             else
> >     > +                     echo 1 >
> "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
> >     > +             fi
> >     > +     fi
> >     > +fi
> >     > +
> >
> >     Sorry, I should've caught this in the v1, but what's up with this
> file?
> >     Did you get it out of the vlan package?  It's decently isolated with
> the
> >     do_install in the recipe, but it's an exact namespace configuration
> for
> >     a binary from iproute2 and it doesn't appear to do even close to the
> >     same thing.  Can you expand on where it's from and whether it's
> >     practical to give it a less opaque name?  I'm mainly asking because I
> >     can't convince myself I know which 'ip' you are relying upon (or
> >     getting, actually, I think I know which one you're getting...) in
> >     vlan-pre-up.
> >
> >
> >
> > on my ubuntu desktop
> >
> > lyang001@lyang001-OptiPlex-9010:~/WORK/leaning-work/git$ dpkg -S
> /etc/network/
> > if-up.d/ip
> > vlan: /etc/network/if-up.d/ip
> >
> > lyang001@lyang001-OptiPlex-9010:~/WORK/leaning-work/git$ dpkg -S `which
> ip`
> > iproute: /sbin/ip
> >
> > actually I don't check the difference
>
> Well, for one:
>
> $ file $(which ip)
> /bin/ip: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
> linked (uses shared libs), for GNU/Linux 2.6.26,
> BuildID[sha1]=0xac673e1884dfbfab74e9f07e23af91c284327916, stripped
>
> :-)  (Obviously my system is a bit different from yours, my /sbin/ip ->
> /bin/ip ...)
>
> Anyway, so I'm still curious, though, if the script that gets installed
> as part of the vlan package is actually part of the vlan package, why
> have you broken it out as a separate file?  Or is it not part of the
> package, but a separate script on the web page?  Sorry if this is
> obvious, I really just don't know.
>
> The follow-up question still stands too.  What's this thing doing there
> and does not installing it break something?  It probably seems like a
> trivial point, but I'm genuinely curious about this.  It seems really
> odd and it seems like maybe it's not doing what it was intended to do.
>
> -J.
>
> >
> >
> >
> >     > diff --git
> a/meta-networking/recipes-support/vlan/files/vlan-post-down b/
> >     meta-networking/recipes-support/vlan/files/vlan-post-down
> >     > new file mode 100755
> >     > index 0000000..89b16fb
> >     > --- /dev/null
> >     > +++ b/meta-networking/recipes-support/vlan/files/vlan-post-down
> >     > @@ -0,0 +1,28 @@
> >     > +#!/bin/sh
> >     > +
> >     > +# If IFACE is an automagic vlan interface (without the
> vlan-raw-device
> >     > +# parameter) then let's try to discover the magic here..  Another
> way
> >     would be
> >     > +# to just probe for the right device name in /proc/net/vlan
> >     > +
> >     > +case "$IFACE" in
> >     > +  # Ignore any alias (#272891)
> >     > +  *:*)
> >     > +    exit 0
> >     > +  ;;
> >     > +  eth*.0*|bond*.0*|wlan*.0*)
> >     > +    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
> "s/\(eth[0-9][0-9]*\)\..*/\1/;s/
> >     \(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> >     > +  ;;
> >     > +  eth*.*|bond*.*|wlan*.*)
> >     > +    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
> "s/\(eth[0-9][0-9]*\)\..*/\1/;s/
> >     \(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> >     > +  ;;
> >     > +  # Test for vlan raw device (#196890, #292648)
> >     > +  *)
> >     > +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> >     > +  ;;
> >     > +esac
> >     > +
> >     > +if [ ! -x /sbin/vconfig ]; then
> >     > +    exit 0
> >     > +fi
> >     > +
> >     > +vconfig rem $IFACE
> >     > diff --git
> a/meta-networking/recipes-support/vlan/files/vlan-pre-up b/
> >     meta-networking/recipes-support/vlan/files/vlan-pre-up
> >     > new file mode 100755
> >     > index 0000000..b977be8
> >     > --- /dev/null
> >     > +++ b/meta-networking/recipes-support/vlan/files/vlan-pre-up
> >     > @@ -0,0 +1,61 @@
> >     > +#!/bin/sh
> >     > +
> >     > +# Most of this stuff is to enable vlans
> >     > +
> >     > +case "$IFACE" in
> >     > +  # Ignore any alias (#272891) which uses <interface>:<alabel>
> >     > +  *:*)
> >     > +    exit 0
> >     > +  ;;
> >     > +  vlan0*)
> >     > +    vconfig set_name_type VLAN_PLUS_VID
> >     > +    VLANID=`echo $IFACE|sed "s/vlan0*//"`
> >     > +  ;;
> >     > +  vlan*)
> >     > +    vconfig set_name_type VLAN_PLUS_VID_NO_PAD
> >     > +    VLANID=`echo $IFACE|sed "s/vlan0*//"`
> >     > +  ;;
> >     > +  eth*.0*|bond*.0*|wlan*.0*)
> >     > +    vconfig set_name_type DEV_PLUS_VID
> >     > +    VLANID=`echo $IFACE|sed
> "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*
> >     \.0*//;s/wlan[0-9][0-9]*\.0*//"`
> >     > +    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
> "s/\(eth[0-9][0-9]*\)\..*/\1/;s/
> >     \(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> >     > +  ;;
> >     > +  eth*.*|bond*.*|wlan*.*)
> >     > +    vconfig set_name_type DEV_PLUS_VID_NO_PAD
> >     > +    VLANID=`echo $IFACE|sed
> "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*
> >     \.0*//g;s/wlan[0-9][0-9]*\.0*//g"`
> >     > +    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
> "s/\(eth[0-9][0-9]*\)\..*/\1/;s/
> >     \(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
> >     > +  ;;
> >     > +  *.0*)
> >     > +    # Silently ignore interfaces which we do not (know how to)
> support
> >     > +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> >     > +    vconfig set_name_type DEV_PLUS_VID
> >     > +    VLANID=`echo $IFACE|sed "s/[^.]*\.0*//g"`
> >     > +  ;;
> >     > +  *.*)
> >     > +    # Silently ignore interfaces which we do not (know how to)
> support
> >     > +    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
> >     > +    vconfig set_name_type DEV_PLUS_VID_NO_PAD
> >     > +    VLANID=`echo $IFACE|sed "s/[^.]*\.0*//g"`
> >     > +  ;;
> >     > +
> >     > +  *)
> >     > +    exit 0
> >     > +  ;;
> >     > +esac
> >     > +
> >     > +if [ -n "$IF_VLAN_RAW_DEVICE" ]; then
> >     > +    if [ ! -x /sbin/vconfig ]; then
> >     > +        exit 0
> >     > +    fi
> >     > +    if ! ip link show dev "$IF_VLAN_RAW_DEVICE" > /dev/null; then
> >     > +        echo "$IF_VLAN_RAW_DEVICE does not exist, unable to create
> >     $IFACE"
> >     > +        exit 1
> >     > +    fi
> >     > +    ip link set up dev $IF_VLAN_RAW_DEVICE
> >     > +    vconfig add $IF_VLAN_RAW_DEVICE $VLANID
> >     > +fi
> >     > +
> >     > +# This is not vlan specific, and should actually go somewhere
> else.
> >     > +if [ -n "$IF_HW_MAC_ADDRESS" ]; then
> >     > +    ip link set $IFACE address $IF_HW_MAC_ADDRESS
> >     > +fi
> >     > diff --git a/meta-networking/recipes-support/vlan/vlan_1.9.bb b/
> >     meta-networking/recipes-support/vlan/vlan_1.9.bb
> >     > new file mode 100755
> >     > index 0000000..b79da6e
> >     > --- /dev/null
> >     > +++ b/meta-networking/recipes-support/vlan/vlan_1.9.bb
> >     > @@ -0,0 +1,36 @@
> >     > +SUMMARY = "802.1q vlan support program"
> >     > +HOMEPAGE = "http://www.candelatech.com/~greear/vlan.html"
> >     > +LICENSE = "GPLv2"
> >     > +SECTION = "console/network"
> >     > +
> >     > +SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
> >     > +SRC_URI[sha256sum] =
> >     "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
> >     > +LIC_FILES_CHKSUM =
> "file://macvlan_config.c;beginline=4;endline=62;md5=
> >     dc0660d77e4313e8ccdf256fbe436a63"
> >     > +
> >     > +S = "${WORKDIR}/${PN}"
> >     > +
> >     > +SRC_URI = " \
> >     > +     http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz \
> >     > +     file://ip \
> >     > +     file://vlan-pre-up \
> >     > +     file://vlan-post-down \
> >     > +     "
> >
> >     I think Paul had meant to put SRC_URI[...] around here in his
> request to
> >     v1.
> >
> >
> >
> >
> > Aha I mis-uderstand it
> >
> > Lei
> >
> >
> >     -J.
> >
> >     > +
> >     > +CCFLAGS = "-g -D_GNU_SOURCE -Wall -I${STAGING_INCDIR}"
> >     > +LDLIBS = ""
> >     > +
> >     > +do_compile() {
> >     > +     ${CC} ${CCFLAGS} -c vconfig.c
> >     > +     ${CC} ${CCFLAGS} ${LDFLAGS} -o vconfig vconfig.o ${LDLIBS}
> >     > +}
> >     > +
> >     > +do_install() {
> >     > +     install -d "${D}${sbindir}"
> >     > +     install -m 755 "${S}/vconfig" "${D}${sbindir}/vconfig"
> >     > +     install -d ${D}/${sysconfdir}/network/if-pre-up.d
> >     > +     install -d ${D}/${sysconfdir}/network/if-post-down.d
> >     > +     install -d ${D}/${sysconfdir}/network/if-up.d
> >     > +     install -m 0755 ${WORKDIR}/ip
> ${D}/${sysconfdir}/network/if-up.d/
> >     > +     install -m 0755 ${WORKDIR}/vlan-pre-up
> ${D}/${sysconfdir}/network/
> >     if-pre-up.d/vlan
> >     > +     install -m 0755 ${WORKDIR}/vlan-post-down ${D}/${sysconfdir}/
> >     network/if-post-down.d/vlan
> >     > +}
> >     --
> >     -Joe MacDonald.
> >     :wq
> >
> >     _______________________________________________
> >     Openembedded-devel mailing list
> >     Openembedded-devel@lists.openembedded.org
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>
> --
> -Joe MacDonald.
> :wq
>

