Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6C96AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 23:41:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86NfZos029001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 16:41:36 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 16:41:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a1b92287-eaad-9dfa-17e1-8ffeb3d43ced@windriver.com>
Date: Wed, 6 Sep 2017 18:41:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH 00/31] Numerous patches to resolve yocto-compat-layer
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
X-List-Received-Date: Wed, 06 Sep 2017 23:41:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Current version of these patches, the v2 of 13/31 and the dropping of 29 and 31
has been pushed to:

git://git.openembedded.org/meta-openembedded-contrib
mgh/yp-compat/master-next

--Mark

On 9/6/17 2:22 PM, Mark Hatle wrote:
> This patch set attempts to address the 'yocto-compat-layer.py' failures.
> 
> Many of the patches seem like obvious fixes or changes to me.. however some
> of them are clearly dubious.
> 
> I would not suggestion treating this as a single take them all or take none,
> but as individual changes.. (a few of them may require prior changes...)
> 
> Besides the standard git summary (below), I have attempted to summaries the
> individual patches here to help with review:
> 
> [01/31] iproute2: Move tipc enablement to oe-core
> [02/31] libml: Move to oe-core
> - I will be sending up a corresponding patch to oe-core for these.  See the
> other email ( iproute2: Move tipc enablement to oe-core ) for a description
> of why this is necessary.
> 
> [03/31] openipmi: Move to meta-networking requires net-snmp
> - openipmi in meta-oe requires net-snmp, but meta-oe doesn't depend on
> meta-networking.  Easiest resolution was to move it.
> 
> [04/31] glmark2: Set required distro features to opengl
> - Should be one of the 'obvious' fixes
> 
> [05/31] openlmi-tools: Only build if the necessary python
> - This is one of the dubious patches.  I could not figure out an appropriate
> place to 'move' this to that requires meta-python -- as the item itself does
> not appear to be appriopriate to put into meta-python.
> 
> [06/31] xorg-drivers: Add opengl distro flag requirement to ati
> [07/31] boinc-client: Add distro flag, requires opengl
> - Another set of the 'obvious' fixes
> 
> [08/31] networkmanager-openvpn: requires openvpn from meta-networking
> - requires openvpn from meta-networking, but meta-oe doesn't depend on
> meta-networking.  Easiest resolution was to move it.
> 
> [09/31] telepathy-python: Move to meta-python, requires python-dbus
> - This seems like a reasonable move to meta-python
> 
> [10/31] networkmanager: Move to meta-networking, requires dnsmasq
> - This moves the rest of networkmanager to meta-networking
> 
> [11/31] python-ldap: Move to meta-networking, requires cyrus-sasl
> - I originally was going to move to meta-python, but that doesn't depend on
> meta-networking... so move it there instead
> 
> [12/31] python-networkmanager: Move to networking, requires networkmanager
> - Due to the prior moves, move this as well to meta-networking
> 
> [13/31] corosync: Requires net-snmp from meta-networking
> - Again move to meta-networking due to dep
> 
> [14/31] pywbem: Requires python-m2crypto-native (and others)
> - This is one I'm not sure if it's the right thing or not.. but it does
> require meta-python.. so move it.
> 
> [15/31] dlm: requires corosync, from meta-networking
> - Again move to meta-networking due to prior move
> 
> [16/31] open-vm-tools: only build if meta-networking and meta-filesystems
> - open-vm-tools requires libdnet (meta-networking) and fuse (meta-filesystem)
> I think this is a dubious way to 'fix' the issue, but I really couldn't think
> of a better way.
> 
> [17/31] miniupnpd: Move to meta-networking, requires libnetfilter-conntrack
> - Move to meta-networking due to dependency...
> 
> [18/31] enable_gnome.conf: Move the AVAHI_GTK setting
> - The yp-compat script does not allow a layer to modify the system wide
> configuration (including modifying other recipe behavior).  The AVHAI_GTK
> changes the behavior of that recipe, which is detected by the script.  So
> I choose to move this to a configuration file that will need to be required
> by the user IF they want avahi to use GTK.  I'm not happy with this, but I
> don't see any other way to meet the requirements.
> 
> [19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
> - Similar to the above, but with PACKAGECONFIG this time.
> 
> [20/31] libart-lgpg: Obsolete, replaced by version in oe-core
> - OE core already has this version, remove it.
> 
> [21/31] pinpoint: Add dependency on opengl for cogl
> - Add the required distro flag...
> 
> [22/31] vim: Remove xfce vim bbappend
> - This breaks the same rule as 18 and 19.  I didn't see a way to 'fix it',
> so I just removed the change.
> 
> [23/31] layer.conf: Add meta-networking for the networkmanager
> - add meta-networking as a dependency to meta-gnome for networkmanager
> this is due to the move above
> 
> [24/31] meta-xfce: depend on meta-multimedia
> - There was a duplicate openembedded-layer entry, but I think it was
> supposed to be for meta-multimedia.  This resolves a bunch of dependency
> errors.
> 
> [25/31] mpv: Requires ffmpeg which has a LICENSE_FLAGS =
> [26/31] recipes-multimedia: Add LICENSE_FLAGS
> [27/31] recipes-multimedia: Add LICENSE_FLAGS
> - Above items all get LICENSE_FLAGS added to match their dependencies.  This
> resolves a dependency issue where the required item(s) are not avaialable.
> 
> [28/31] libmtp: remove 'mtp-tools' from PACKAGES
> - This is a real bug in mtp-tools, and needs to be fixed.
> 
> [29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
> - There is no 'fix' for xfce4-mixer using gstreamer-0.10, so remove it...
> 
> [30/31] florence: update 0.6.3
> - Use Andreas Muller's patch from Oct 2016 to git rid of the gstreamer-0.10
> dependency.  Resolve the issue with requiring gtk+3.
> 
> [31/31] gstreamer-0.10: Remove as all users are gone and it is
> - Remove gstreamer-0.10 as all of the users are now gone.  (This resolves
> various preferred provider issues I observed..)

