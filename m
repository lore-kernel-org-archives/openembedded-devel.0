Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GmaeN-0007VD-Hq
	for openembedded-devel@openembedded.org; Tue, 21 Nov 2006 19:47:19 +0100
Received: (qmail 14457 invoked by uid 813007); 21 Nov 2006 18:44:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 21 Nov 2006 18:44:32 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Nov 2006 19:44:29 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200611211944.29813.openembedded@hrw.one.pl>
Subject: [ERROR] some recipes are unfetchable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2006 18:47:19 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Currently I work on creating source mirror and it is progressing nicely. 
During that time I collected list of unfetchable packages which need 
fixing or removal.

Biggest problem is Maemo stuff - we have old (first?) release of it in OE 
and it is mostly unfetchable currently. Someone need to update it to 
IT2006 (or newer) or we will remove most of it.

Next common problem - old Qtopia related applications and games. Many of 
them are unmaintained upstream so it is also had to find someone who will 
want to work on fixing them. We will drop them rather.

Other are misc packages - some of them was not touched during years, most 
of them has newer version upstream, some was dropped upstream.

Some packages are machine related but not marked as ones with 
COMPATIBLE_MACHINE stuff.

The list:
-------------------------------------------------------------------------
packages/apr/apr_1.1.1.bb 
packages/arpwatch/arpwatch_2.1a13.bb 
packages/billiardz/billiardz_0.1.4.bb 
packages/bluesnarfer/bluesnarfer.bb 
packages/ccache/ccache_2.3.bb 
packages/cdtool/cdtool_2.1.8pre4.bb 
packages/directfb/directfb_0.9.25.1.bb 
packages/ekg/ekg_1.5.bb 
packages/emelfm2/emelfm2_0.0.8.bb 
packages/ethereal/ethereal_0.99.0.bb 
packages/gbluezconf/gbluezconf_00.10.bb 
packages/geode-drivers/geode-v4l2lx_2.6.11.bb 
packages/giac/giac_0.5.0.bb 
packages/giftcurs/giftcurs_0.6.2.bb 
packages/gpe-themes/gpe-theme-foxbox_0.1.bb 
packages/hvsc/hvsc_5.8.bb 
packages/ica/ica-bin_8.0.bb 
packages/intercom/intercom_0.15.bb 
packages/irssi/xirssi_cvs.bb 
packages/ixp4xx/ixp-osal_2.1.bb 
packages/ixp4xx/ixp4xx-npe-native_2.3.bb 
packages/juce/juce_1.29.bb 
packages/libedit/libedit_20050118.bb 
packages/libeina/libeina_0.96.7.bb 
packages/libmikey/libmikey0_0.3.2.bb 
packages/libmikey/libmikey_0.1a.bb 
packages/libmnetutil/libmnetutil0_0.2.2.bb 
packages/libnet/libnet_1.0.2a.bb 
packages/libnet/libnet_1.1.2.1.bb 
packages/libqanava/libqanava_0.0.7.bb 
packages/librcf/librcf_0.4.bb 
packages/libtomcrypt/libtomcrypt_0.97b.bb 
packages/linphone/linphone_1.3.99.8.bb 
packages/live555/live555_20051005.bb 
packages/lm_sensors/lmsensors-apps_2.10.0.bb 
packages/maradns/maradns_1.0.23.bb 
packages/masqmail/masqmail_0.2.20.bb 
packages/matchbox-applet-cards/matchbox-applet-cards_1.0.2.bb 
packages/micro-emacs/micro-emacs_20040301.bb 
packages/militaryalphabet/militaryalphabet_0.2.1.bb 
packages/mono/mono-native_1.0.bb 
packages/ncftp/ncftp_3.1.9.bb 
packages/nvidia-drivers/nvidia-display_1.0-8756.bb 
packages/nvidia-drivers/nvidia-nforce_1.0-0310.bb 
packages/nylon/nylon-scripts_cvs.bb 
packages/olsr/olsr_0.3-1.bb 
packages/opencvs/opencvs_cvs.bb 
packages/openh323/openh323_1.13.5.4.bb 
packages/pdm/pdm_1.0.bb 
packages/phalanx/phalanx_22.bb 
packages/pmount/pmount_0.9.4.bb 
packages/pmtools/pmtools_20050926.bb 
packages/poboxserver/poboxserver_1.2.5.bb 
packages/prism54/prism54-module_cvs.bb 
packages/puzzles/puzzles_r6727.bb 
packages/python/python-sip4_4.4.5.bb 
packages/qc-usb/qc-usb-messenger_1.1.bb 
packages/rlpr/rlpr_2.05.bb 
packages/rp-pppoe/rp-pppoe_3.5.bb 
packages/rsync/rsync_2.6.8.bb 
packages/sane-backends/sane-backends_1.0.15.bb 
packages/scummvm/opie-scummvm_1.0.1.bb 
packages/scw/scw_0.4.2.bb 
packages/silo/silo_1.4.8.bb 
packages/socat/socat_1.3.2.1.bb 
packages/spca5xx/spca5xx_20060202.bb 
packages/tapioca/libjingle-tapioca_svn.bb 
packages/tickypip/tickypip_0.1.2.bb 
packages/u2nl/u2nl_1.1.bb 
packages/uml-utilities/uml-utilities_20040406.bb 
packages/wrt/wrt-utils.bb 
packages/xerces-c/xerces-c_2.6.0.bb 
packages/xscreensaver/xscreensaver_4.22.bb 


-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

 BSD is for people who love Unix. Linux is for people who hate Microsoft.




