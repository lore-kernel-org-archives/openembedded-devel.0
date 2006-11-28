Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1GozD8-0007WK-93
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2006 10:25:06 +0100
Received: by nf-out-0910.google.com with SMTP id l36so2553941nfa
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 01:24:55 -0800 (PST)
Received: by 10.82.114.3 with SMTP id m3mr121769buc.1164705894236;
	Tue, 28 Nov 2006 01:24:54 -0800 (PST)
Received: by 10.82.140.13 with HTTP; Tue, 28 Nov 2006 01:24:53 -0800 (PST)
Message-ID: <427d64720611280124u5444ece9g67d322d6449bcdda@mail.gmail.com>
Date: Tue, 28 Nov 2006 17:24:53 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Nov 2006 12:35:14 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: vlc-gpe fails to build ( CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/ffmpeg )
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
X-List-Received-Date: Tue, 28 Nov 2006 09:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
   I got below error message when build vlc-gpe .
Anyone has an idea about this error?
Thank you very much.
Axel


axel@kdc:/opt/oe/build$ bitbake vlc-gpe
NOTE: Using cache in '/opt/oe/build/tmp/cache/mainstone'
NOTE: Handling BitBake files: \ (4067/4067) [100 %]
NOTE: Parsing finished. 3899 cached, 0 parsed, 168 skipped, 0 masked.

NOTE: build 200611281713: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "aaef2980a4428dedfb31b38d6894621134b0faa8"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "mainstone"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061128"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package vlc-gpe-0.8.4: started
NOTE: package vlc-gpe-0.8.4-r1: task do_compile: started
NOTE: SITE files /opt/oe/org.openembedded.dev/site/endian-little
/opt/oe/org.openembedded.dev/site/arm-linux
ERROR: function do_compile failed
ERROR: log data follows
(/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1
/temp/log.do_compile.17695)
| NOTE: make
| srcdir=/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-
gpe-0.8.4-r1/vlc-0.8.4/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-
gpe-0.8.4-r1/vlc-0.8.4/toolbox --update-version
| make  all-recursive
| make[1]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4'
| Making all in intl
| make[2]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/intl'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/intl'
| Making all in loader
| make[2]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/loader'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/loader'
| Making all in modules
| make[2]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules'
| Making all in access
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make[4]: `libaccess_file.a' is up to date.
| make[4]: `libaccess_directory.a' is up to date.
| make[4]: `libaccess_udp.a' is up to date.
| make[4]: `libaccess_tcp.a' is up to date.
| make[4]: `libaccess_http.a' is up to date.
| make[4]: `libaccess_ftp.a' is up to date.
| make[4]: `libaccess_fake.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| Making all in dshow
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dshow'
| Making all in dvb
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/dvb'
| Making all in mms
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[6]: `libaccess_mms.a' is up to date.
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/mms'
| Making all in pvr
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/pvr'
| Making all in v4l
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/v4l'
| Making all in cdda
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/cdda'
| Making all in rtsp
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/rtsp'
| Making all in vcd
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcd'
| Making all in vcdx
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/vcdx'
| Making all in screen
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access/screen'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access'
| Making all in access_filter
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[4]: `libaccess_filter_timeshift.a' is up to date.
| make[4]: `libaccess_filter_record.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_filter'
| Making all in access_output
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[4]: `libaccess_output_dummy.a' is up to date.
| make[4]: `libaccess_output_file.a' is up to date.
| make[4]: `libaccess_output_udp.a' is up to date.
| make[4]: `libaccess_output_http.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/access_output'
| Making all in audio_filter
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make[4]: `libequalizer.a' is up to date.
| make[4]: `libnormvol.a' is up to date.
| make[4]: `libaudio_format.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| Making all in channel_mixer
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[6]: `libtrivial_channel_mixer.a' is up to date.
| make[6]: `libsimple_channel_mixer.a' is up to date.
| make[6]: `libheadphone_channel_mixer.a' is up to date.
| make[6]: `libdolby_surround_decoder.a' is up to date.
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/channel_mixer'
| Making all in converter
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[6]: `libfloat32tos16.a' is up to date.
| make[6]: `libfloat32tos8.a' is up to date.
| make[6]: `libfloat32tou16.a' is up to date.
| make[6]: `libfloat32tou8.a' is up to date.
| make[6]: `liba52tospdif.a' is up to date.
| make[6]: `liba52tofloat32.a' is up to date.
| make[6]: `libdtstospdif.a' is up to date.
| make[6]: `libfixed32tos16.a' is up to date.
| make[6]: `libs16tofixed32.a' is up to date.
| make[6]: `libfixed32tofloat32.a' is up to date.
| make[6]: `libs16tofloat32.a' is up to date.
| make[6]: `libs16tofloat32swab.a' is up to date.
| make[6]: `libs8tofloat32.a' is up to date.
| make[6]: `libu8tofixed32.a' is up to date.
| make[6]: `libu8tofloat32.a' is up to date.
| make[6]: `libmpgatofixed32.a' is up to date.
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/converter'
| Making all in resampler
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[6]: `libtrivial_resampler.a' is up to date.
| make[6]: `libugly_resampler.a' is up to date.
| make[6]: `liblinear_resampler.a' is up to date.
| make[6]: `libbandlimited_resampler.a' is up to date.
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter/resampler'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_filter'
| Making all in audio_mixer
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[4]: `libtrivial_mixer.a' is up to date.
| make[4]: `libfloat32_mixer.a' is up to date.
| make[4]: `libspdif_mixer.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_mixer'
| Making all in audio_output
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[4]: `libaout_file.a' is up to date.
| make[4]: `liboss.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/audio_output'
| Making all in codec
| make[3]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| make[4]: `liba52.a' is up to date.
| make[4]: `libcinepak.a' is up to date.
| make[4]: `libdts.a' is up to date.
| make[4]: `libflacdec.a' is up to date.
| make[4]: `liblpcm.a' is up to date.
| make[4]: `libaraw.a' is up to date.
| make[4]: `libtremor.a' is up to date.
| make[4]: `libadpcm.a' is up to date.
| make[4]: `libmpeg_audio.a' is up to date.
| make[4]: `liblibmpeg2.a' is up to date.
| make[4]: `librawvideo.a' is up to date.
| make[4]: `libsubsdec.a' is up to date.
| make[4]: `libfaad.a' is up to date.
| make[4]: `libdvbsub.a' is up to date.
| make[4]: `libsvcdsub.a' is up to date.
| make[4]: `libcvdsub.a' is up to date.
| make[4]: `libfake.a' is up to date.
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| make  all-recursive
| make[4]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| Making all in cmml
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/cmml'
| Making all in dmo
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| make  all-recursive
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| make[7]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| make[7]: Nothing to be done for `all-am'.
| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/dmo'
| Making all in ffmpeg
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/ffmpeg'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/ffmpeg'
| if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale
-DHAVE_CONFIG_H -I.
-I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1
/vlc-0.8.4/modules/codec/ffmpeg -I../../..
-isystem/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include
-DSYS_LINUX -I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-
gpe-0.8.4-r1/vlc-0.8.4/include `top_builddir="../../.." ../../../vlc-config
--cflags builtin ffmpeg` -Wsign-compare -Wall
-isystem/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include -O -g
-pipe -MT libffmpeg_a-ffmpeg.o -MD -MP -MF ".deps/libffmpeg_a-ffmpeg.Tpo" -c
-o libffmpeg_a-ffmpeg.o `test -f 'ffmpeg.c' || echo
'/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/ffmpeg/'`ffmpeg.c; \
|       then mv -f ".deps/libffmpeg_a-ffmpeg.Tpo" ".deps/libffmpeg_a-
ffmpeg.Po"; else rm -f ".deps/libffmpeg_a-ffmpeg.Tpo"; exit 1; fi
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/ffmpeg
| cc1: internal compiler error: in add_path, at c-incpath.c:362
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <URL:http://gcc.gnu.org/bugs.html> for instructions.
| make[6]: *** [libffmpeg_a-ffmpeg.o] Error 1
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/ffmpeg'
| make[5]: *** [all-modules] Error 1
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec/ffmpeg'
| make[4]: *** [all-recursive] Error 1
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| make[3]: *** [all] Error 2
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules/codec'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4/modules'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1/vlc-
0.8.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/vlc-gpe-0.8.4-r1
/temp/log.do_compile.17695
NOTE: package vlc-gpe-0.8.4-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package vlc-gpe-0.8.4: failed
ERROR: Build of vlc-gpe failed

