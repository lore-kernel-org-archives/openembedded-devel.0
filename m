Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 83C45771E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 16:58:01 +0000 (UTC)
Received: (qmail 25514 invoked by uid 1003); 10 Apr 2016 16:58:01 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.15.136)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	10 Apr 2016 16:58:01 -0000
To: openembedded-devel@lists.openembedded.org
References: <20160410061425.GA9652@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <570A8618.6000906@balister.org>
Date: Sun, 10 Apr 2016 12:58:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <20160410061425.GA9652@jama>
Subject: Re: State of bitbake world, test-dependencies 2016-04-10
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
X-List-Received-Date: Sun, 10 Apr 2016 16:58:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Where are the log files?

Philip

On 04/10/2016 02:14 AM, Martin Jansa wrote:
> This time complete test of all recipes, for both qemux86 and qemuarm.
> 
> qemux86:
> 
> Found differences: 
> WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build dependency?
> WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependency?
> WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build dependency?
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
> ERROR: 50 issues were found in these recipes: chkconfig-alternatives-native core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk core-image-sato-sdk-ptest cpupower cyrus-sasl enchant fontforge gtkmathview jasper libdrm lttng-modules meta-ide-support meta-world-pkgdata nativesdk-zeroc-ice netmap netmap-modules openlmi-networking openlmi-providers openlmi-storage packagegroup-core-tools-profile perf proxy-libintl python-pyparsing samba sblim-sfcb tiptop zeroc-ice
> 
> 2_max/failed/chkconfig-alternatives-native.log
> 2_max/failed/core-image-rt-sdk.log
> 2_max/failed/core-image-rt.log
> 2_max/failed/core-image-sato-dev.log
> 2_max/failed/core-image-sato-sdk-ptest.log
> 2_max/failed/core-image-sato-sdk.log
> 2_max/failed/cpupower.log
> 2_max/failed/cyrus-sasl.log
> 2_max/failed/fontforge.log
> 2_max/failed/lttng-modules.log
> 2_max/failed/meta-world-pkgdata.log
> 2_max/failed/nativesdk-zeroc-ice.log
> 2_max/failed/netmap-modules.log
> 2_max/failed/netmap.log
> 2_max/failed/openlmi-networking.log
> 2_max/failed/openlmi-providers.log
> 2_max/failed/openlmi-storage.log
> 2_max/failed/packagegroup-core-tools-profile.log
> 2_max/failed/proxy-libintl.log
> 2_max/failed/zeroc-ice.log
> 
> 3_min/failed/core-image-rt-sdk.log
> 3_min/failed/core-image-rt.log
> 3_min/failed/core-image-sato-dev.log
> 3_min/failed/core-image-sato-sdk-ptest.log
> 3_min/failed/core-image-sato-sdk.log
> 3_min/failed/cyrus-sasl.log
> 3_min/failed/fontforge.log
> 3_min/failed/gtkmathview.log
> 3_min/failed/meta-world-pkgdata.log
> 3_min/failed/nativesdk-zeroc-ice.log
> 3_min/failed/perf.log
> 3_min/failed/proxy-libintl.log
> 3_min/failed/python-pyparsing.log
> 3_min/failed/sblim-sfcb.log
> 3_min/failed/zeroc-ice.log
> 
> qemuarm:
> 
> Found differences: 
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependency?
> WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build dependency?
> WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?
> Found errors: 
> ERROR: 55 issues were found in these recipes: chkconfig-alternatives-native core-image-minimal-initramfs core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk core-image-sato-sdk-ptest core-image-testmaster-initramfs cyrus-sasl enchant fontforge gtkmathview ipmiutil libdrm meta-world-pkgdata nativesdk-zeroc-ice netmap-modules perf proxy-libintl remake samba sblim-sfcb zeroc-ice
> 
> 2_max/failed/chkconfig-alternatives-native.log
> 2_max/failed/core-image-minimal-initramfs.log
> 2_max/failed/core-image-rt-sdk.log
> 2_max/failed/core-image-rt.log
> 2_max/failed/core-image-sato-dev.log
> 2_max/failed/core-image-sato-sdk-ptest.log
> 2_max/failed/core-image-sato-sdk.log
> 2_max/failed/core-image-testmaster-initramfs.log
> 2_max/failed/cyrus-sasl.log
> 2_max/failed/fontforge.log
> 2_max/failed/ipmiutil.log
> 2_max/failed/meta-world-pkgdata.log
> 2_max/failed/nativesdk-zeroc-ice.log
> 2_max/failed/netmap-modules.log
> 2_max/failed/proxy-libintl.log
> 2_max/failed/remake.log
> 2_max/failed/zeroc-ice.log
> 
> 3_min/failed/core-image-minimal-initramfs.log
> 3_min/failed/core-image-rt-sdk.log
> 3_min/failed/core-image-rt.log
> 3_min/failed/core-image-sato-dev.log
> 3_min/failed/core-image-sato-sdk-ptest.log
> 3_min/failed/core-image-sato-sdk.log
> 3_min/failed/core-image-testmaster-initramfs.log
> 3_min/failed/cyrus-sasl.log
> 3_min/failed/fontforge.log
> 3_min/failed/gtkmathview.log
> 3_min/failed/ipmiutil.log
> 3_min/failed/meta-world-pkgdata.log
> 3_min/failed/nativesdk-zeroc-ice.log
> 3_min/failed/perf.log
> 3_min/failed/proxy-libintl.log
> 3_min/failed/remake.log
> 3_min/failed/sblim-sfcb.log
> 3_min/failed/zeroc-ice.log
> 
> 
> 

