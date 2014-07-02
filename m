Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97C3360167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 10:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s62AYvae023180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 03:34:57 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 03:34:56 -0700
Message-ID: <53B3E04F.2010109@windriver.com>
Date: Wed, 2 Jul 2014 18:34:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
	<20140702101916.GK2437@jama>
In-Reply-To: <20140702101916.GK2437@jama>
Subject: Re: [PATCH 00/74] use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 10:35:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/2014 06:19 PM, Martin Jansa wrote:
> On Tue, Jul 01, 2014 at 11:56:27PM -0700, Robert Yang wrote:
>> Fixed SRC_URI:
>> * ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
>> * ${P} -> ${BP}
>>
>> Otherwise we would meet do_fetch errors when we do the multilib, native
>> or nativesdk build.
>
> Can you please upload it to some repo or squash them to single commit?
>

Thanks, will send it tomorrow.

// Robert

>> // Robert
>>
>> Robert Yang (74):
>>    sshfs-fuse: use BPN in SRC_URI
>>    unionfs-fuse: use BPN in SRC_URI
>>    physfs: use BPN in SRC_URI
>>    xfsprogs: use BPN in SRC_URI
>>    gmtk: use BPN in SRC_URI
>>    gnome-mplayer: use BPN in SRC_URI
>>    libgtkstylus: use BPN in SRC_URI
>>    gcalctool: use BPN in SRC_URI
>>    minilite: use BPN in SRC_URI
>>    coriander: use BPN in SRC_URI
>>    fluidsynth: use BPN in SRC_URI
>>    libmpd: use BPN in SRC_URI
>>    mpd: use BPN in SRC_URI
>>    openal-soft: use BPN in SRC_URI
>>    gpe.bbclass: use BPN in SRC_URI
>>    iperf: use BPN in SRC_URI
>>    nbench-byte: use BPN in SRC_URI
>>    tiobench: use BPN in SRC_URI
>>    gammu: use BPN in SRC_URI
>>    krb5: use BPN in SRC_URI
>>    libtorrent: use BPN in SRC_URI
>>    rfkill: use BPN in SRC_URI
>>    rtorrent: use BPN in SRC_URI
>>    wvdial: use BPN in SRC_URI
>>    wvstreams: use BPN in SRC_URI
>>    geany: use BPN in SRC_URI
>>    pyrtm: use BPN in SRC_URI
>>    python-dateutil: use BPN in SRC_URI
>>    python-ldap: use BPN in SRC_URI
>>    ddrescue: use BPN in SRC_URI
>>    gnuplot: use BPN in SRC_URI
>>    hexedit: use BPN in SRC_URI
>>    hplip: use BPN in SRC_URI
>>    iotop: use BPN in SRC_URI
>>    lcdproc5: use BPN in SRC_URI
>>    gtkmathview: use BPN in SRC_URI
>>    mozjs: use BPN in SRC_URI
>>    tmux: use BPN in SRC_URI
>>    gtkextra: use BPN in SRC_URI
>>    babl: use BPN in SRC_URI
>>    fbgrab: use BPN in SRC_URI
>>    gegl: use BPN in SRC_URI
>>    libsexy: use BPN in SRC_URI
>>    slim: use BPN in SRC_URI
>>    xterm: use BPN in SRC_URI
>>    xorg-data-common: use BPN in SRC_URI
>>    audiofile: use BPN in SRC_URI
>>    faad2: use BPN in SRC_URI
>>    libass: use BPN in SRC_URI
>>    libcdio: use BPN in SRC_URI
>>    minidlna: use BPN in SRC_URI
>>    xpext: use BPN in SRC_URI
>>    xsp: use BPN in SRC_URI
>>    foxtrotgps: use BPN in SRC_URI
>>    gdal: use BPN in SRC_URI
>>    gpsd: use BPN in SRC_URI
>>    asio: use BPN in SRC_URI
>>    farsight2: use BPN in SRC_URI
>>    iksemel: use BPN in SRC_URI
>>    libol: use BPN in SRC_URI
>>    libsmi: use BPN in SRC_URI
>>    syslog-ng: use BPN in SRC_URI
>>    openldap: use BPN in SRC_URI
>>    p11-kit: use BPN in SRC_URI
>>    libotr: use BPN in SRC_URI
>>    pidgin-otr: use BPN in SRC_URI
>>    poppler-data: use BPN in SRC_URI
>>    poppler: use BPN in SRC_URI
>>    rng-tools: use BPN in SRC_URI
>>    zile: use BPN in SRC_URI
>>    hiawatha: use BPN in SRC_URI
>>    xfce4-icon-theme: use BPN in SRC_URI
>>    xfwm4-themes: use BPN in SRC_URI
>>    thunar: use BPN in SRC_URI
>>
>>   .../sshfs-fuse/sshfs-fuse_2.5.bb                   |    2 +-
>>   .../unionfs-fuse/unionfs-fuse_0.26.bb              |    2 +-
>>   .../recipes-support/physfs/physfs_2.0.3.bb         |    2 +-
>>   .../recipes-utils/xfsprogs/xfsprogs_3.1.11.bb      |    2 +-
>>   .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |    2 +-
>>   .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |    2 +-
>>   .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
>>   .../nonworking/gcalctool/gcalctool_5.32.0.bb       |    2 +-
>>   .../recipes-graphics/minilite/minilite_0.50.bb     |    2 +-
>>   .../coriander/coriander_2.0.2.bb                   |    2 +-
>>   .../fluidsynth/fluidsynth_1.1.6.bb                 |    2 +-
>>   .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |    2 +-
>>   .../recipes-multimedia/musicpd/mpd_0.18.9.bb       |    2 +-
>>   .../openal/openal-soft_1.15.1.bb                   |    2 +-
>>   meta-oe/classes/gpe.bbclass                        |    2 +-
>>   meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |    2 +-
>>   .../nbench-byte/nbench-byte_2.2.3.bb               |    2 +-
>>   .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    2 +-
>>   meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |    2 +-
>>   meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb   |    2 +-
>>   .../libtorrent/libtorrent_0.13.3.bb                |    2 +-
>>   meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb  |    2 +-
>>   .../rtorrent/rtorrent_0.9.3.bb                     |    2 +-
>>   meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |    2 +-
>>   .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |    2 +-
>>   meta-oe/recipes-devtools/geany/geany_1.23.bb       |    2 +-
>>   meta-oe/recipes-devtools/python/pyrtm_0.2.bb       |    2 +-
>>   .../recipes-devtools/python/python-dateutil_1.5.bb |    2 +-
>>   .../recipes-devtools/python/python-ldap_2.3.9.bb   |    2 +-
>>   meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |    2 +-
>>   meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb  |    2 +-
>>   meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |    2 +-
>>   meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |    2 +-
>>   meta-oe/recipes-extended/iotop/iotop_0.4.4.bb      |    2 +-
>>   meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |    2 +-
>>   .../mml-widget/gtkmathview_0.8.0.bb                |    2 +-
>>   meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |    2 +-
>>   meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
>>   meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |    2 +-
>>   meta-oe/recipes-graphics/babl/babl_0.1.10.bb       |    2 +-
>>   meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb      |    2 +-
>>   meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb        |    2 +-
>>   meta-oe/recipes-graphics/libsexy/libsexy.inc       |    2 +-
>>   .../recipes-graphics/nonworking/slim/slim_1.3.2.bb |    2 +-
>>   meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |    2 +-
>>   .../xorg-data/xorg-data-common.inc                 |    2 +-
>>   .../audiofile/audiofile_0.2.7.bb                   |    2 +-
>>   meta-oe/recipes-multimedia/faad2/faad2_2.7.bb      |    2 +-
>>   meta-oe/recipes-multimedia/libass/libass.inc       |    2 +-
>>   meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    2 +-
>>   .../nonworking/minidlna/minidlna_1.0.25.bb         |    2 +-
>>   meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |    2 +-
>>   meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb      |    2 +-
>>   .../foxtrotgps/foxtrotgps_1.1.1.bb                 |    2 +-
>>   meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb     |    2 +-
>>   meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |    2 +-
>>   meta-oe/recipes-support/asio/asio.inc              |    2 +-
>>   .../recipes-support/farsight/farsight2_0.0.22.bb   |    2 +-
>>   meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |    2 +-
>>   meta-oe/recipes-support/libol/libol_0.3.18.bb      |    2 +-
>>   meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb     |    2 +-
>>   .../nonworking/syslog-ng/syslog-ng.inc             |    2 +-
>>   .../recipes-support/openldap/openldap_2.4.23.bb    |    2 +-
>>   meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb  |    2 +-
>>   meta-oe/recipes-support/pidgin/libotr_4.0.0.bb     |    2 +-
>>   meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb |    2 +-
>>   .../recipes-support/poppler/poppler-data_0.4.6.bb  |    2 +-
>>   meta-oe/recipes-support/poppler/poppler_0.22.4.bb  |    2 +-
>>   meta-oe/recipes-support/rng-tools/rng-tools_4.bb   |    2 +-
>>   meta-oe/recipes-support/zile/zile_2.4.9.bb         |    2 +-
>>   .../recipes-httpd/hiawatha/hiawatha_9.2.bb         |    2 +-
>>   .../xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb     |    2 +-
>>   .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |    2 +-
>>   meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb      |    2 +-
>>   74 files changed, 74 insertions(+), 74 deletions(-)
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

