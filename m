Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id C214E6013D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:36:14 +0000 (UTC)
Received: (qmail 31290 invoked by uid 1003); 31 Mar 2015 20:36:15 -0000
Received: from unknown (HELO ?10.16.37.72?)
	(philip@opensdr.com@209.234.137.234)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	31 Mar 2015 20:36:15 -0000
Message-ID: <551B0538.3080209@balister.org>
Date: Tue, 31 Mar 2015 13:36:08 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
References: <cover.1427426569.git.akuster808@gmail.com>
In-Reply-To: <cover.1427426569.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/18] Dizzy pull request
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
X-List-Received-Date: Tue, 31 Mar 2015 20:36:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Did you skip the last commit in this branch for a reason?

https://github.com/balister/meta-oe/commits/pyqt-dizzy

Philip

On 03/26/2015 08:26 PM, Armin Kuster wrote:
> Please consider this changes for meta-openembedded dizzy-next
> 
> The following changes since commit 853dcfa0d618dc26bd27b3a1b49494b98d6eee97:
> 
>   rsyslog: fix name of syslogd ua group (2015-03-03 21:13:17 +0100)
> 
> are available in the git repository at:
> 
>   https://github.com/akuster/meta-openembedded akuster/dizzy-next
>   https://github.com//tree/akuster/dizzy-next
> 
> Andre McCurdy (1):
>   log4c: fix undeclared dependency on expat
> 
> Andreas Müller (1):
>   samba: add mirrors
> 
> Armin Kuster (4):
>   wireshark: update to 1.12.3
>   wireshark: fix rdepends issue
>   wireshark: fix pcap-config issue
>   wireshark: update to 12.4
> 
> Ash Charles (2):
>   xfce4-xkb-plugin: Specify GPLv2 license
>   xfce4-diskperf-plugin: Specify BSD license
> 
> Bian Naimeng (1):
>   xbitmaps: fix build warning.
> 
> Dan McGregor (1):
>   lxdm: RDEPEND on libsvg-gtk
> 
> Paul Eggleton (1):
>   tmux: remove sed-native from DEPENDS
> 
> Philip Balister (4):
>   python-pyqt: Update to 4.11.3.
>   sip: Update to 4.14.2.
>   anki: python-sip package replaces with just sip.
>   sip: Split python into a new package for runtime support.
> 
> Sven Ebenfeld (2):
>   claws-mail: Fix SRC_URI
>   pxaregs: Add source file and fix SRC_URI
> 
> Zhenhua Luo (1):
>   python-pip: add python-distribute in RDEPENDS
> 
>  .../{wireshark_1.12.2.bb => wireshark_1.12.4.bb}   |   19 +-
>  meta-oe/recipes-connectivity/samba/samba.inc       |    9 +-
>  .../python/python-pyqt-4.9.6/pyqt-generated.patch  |   12 -
>  .../python-pyqt-4.9.6/qreal_float_support.diff     |  248 ---
>  .../recipes-devtools/python/python-pyqt_4.11.3.bb  |   54 +
>  .../recipes-devtools/python/python-pyqt_4.9.6.bb   |  103 -
>  .../recipes-devtools/python/python-sip_4.14.2.bb   |   46 -
>  meta-oe/recipes-extended/anki/anki_0.4.3.bb        |    2 +-
>  meta-oe/recipes-extended/sip/sip-native_4.14.2.bb  |   35 -
>  meta-oe/recipes-extended/sip/sip_4.16.4.bb         |   52 +
>  meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    2 +-
>  .../recipes-graphics/xorg-data/xbitmaps_1.1.1.bb   |    1 +
>  .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |    2 +-
>  .../log4c/log4c/fix_configure_with-expat.patch     |   21 +
>  meta-oe/recipes-support/log4c/log4c_1.2.4.bb       |   13 +-
>  .../recipes-support/pxaregs/pxaregs-1.14/pxaregs.c | 1975 ++++++++++++++++++++
>  meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |    4 +-
>  .../recipes-devtools/python/python-pip_1.3.1.bb    |    2 +-
>  .../diskperf/xfce4-diskperf-plugin_2.5.4.bb        |    2 +-
>  .../xkb/xfce4-xkb-plugin_0.7.0.bb                  |    2 +-
>  21 files changed, 2140 insertions(+), 466 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.2.bb => wireshark_1.12.4.bb} (63%)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
>  delete mode 100644 meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
>  delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
>  delete mode 100644 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
>  create mode 100644 meta-oe/recipes-extended/sip/sip_4.16.4.bb
>  create mode 100644 meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
>  create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/pxaregs.c
> 

