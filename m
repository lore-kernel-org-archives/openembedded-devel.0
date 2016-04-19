Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id A4D1D6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:52:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u3JEjaaI020482 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:52:50 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 22bav19cvf-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:52:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E9F734
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:52:49 +0000 (GMT)
Received: from Webmail-eu.st.com (safex1hubcas2.st.com [10.75.90.16])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94FB31593
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:52:48 +0000 (GMT)
Received: from Safex1mail3.st.com ([fe80::e48c:97a7:3b08:899e]) by
	safex1hubcas2.st.com ([::1]) with mapi; Tue, 19 Apr 2016 16:52:48 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Apr 2016 16:52:44 +0200
Thread-Topic: [meta-webserver][PATCH v2] netdata: add new recipe
Thread-Index: AdGaSyNSHsgcNZJcS/SX3TA7IWJGyw==
Message-ID: <1461077564-25584-1-git-send-email-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-19_11:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-webserver][PATCH v2] netdata: add new recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 14:52:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Netdata are a performance monitoring tools for Linux systems, applications.
Netdata interface are available via http on port 19999:
 http://<ip address>:19999

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../netdata/0001-Correct-Timeout-issue.patch       |   35 +
 .../recipes-webadmin/netdata/netdata/netdata.conf  | 5083 ++++++++++++++++=
++++
 .../netdata/netdata/netdata.service                |   13 +
 .../recipes-webadmin/netdata/netdata_git.bb        |   46 +
 4 files changed, 5177 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Co=
rrect-Timeout-issue.patch
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netdata=
.conf
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netdata=
.service
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata_git.bb

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-T=
imeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-C=
orrect-Timeout-issue.patch
new file mode 100644
index 0000000..c1ff5c0
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-=
issue.patch
@@ -0,0 +1,35 @@
+From 851761581ade11a4ce4a450908540f9d0086b9e1 Mon Sep 17 00:00:00 2001
+From: Christophe Priouzeau <christophe.priouzeau@linaro.org>
+Date: Tue, 5 Apr 2016 13:45:22 +0200
+Subject: [PATCH 1/2] Correct Timeout issue
+
+The actual version of coreutils does not provide timeout
+tools.
+
+Signed-off-by: Christophe Priouzeau <christophe.priouzeau@linaro.org>
+---
+ plugins.d/charts.d.plugin | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/plugins.d/charts.d.plugin b/plugins.d/charts.d.plugin
+index 40c0356..bca57b3 100755
+--- a/plugins.d/charts.d.plugin
++++ b/plugins.d/charts.d.plugin
+@@ -184,10 +184,10 @@ fi
+ # timeout command we use, providing a function that
+ # can emulate the timeout command we need:
+ # > timeout SECONDS command ...
+-if [ $check_for_timeout -eq 1 ]
+-      then
+-      require_cmd timeout || exit 1
+-fi
++#if [ $check_for_timeout -eq 1 ]
++#     then
++#     require_cmd timeout || exit 1
++#fi
+
+ # -----------------------------------------------------------------------=
------
+ # internal checks
+--
+1.9.1
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.conf b=
/meta-webserver/recipes-webadmin/netdata/netdata/netdata.conf
new file mode 100644
index 0000000..be90057
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.conf
@@ -0,0 +1,5083 @@
+# NetData Configuration
+# You can uncomment and change any of the options below.
+# The value shown in the commented settings, is the default value.
+
+# global netdata configuration
+
+[global]
+       debug flags =3D 0x10000000
+       hostname =3D netdata
+       history =3D 86400
+       config directory =3D /etc/netdata
+       plugins directory =3D /usr/lib/netdata/netdata/plugins.d
+       web files directory =3D /usr/share/netdata/web
+       cache directory =3D /var/cache/netdata
+       log directory =3D /var/log/netdata
+       # host access prefix =3D
+       # memory deduplication (ksm) =3D yes
+       # debug log =3D /var/log/netdata/debug.log
+       # error log =3D /var/log/netdata/error.log
+       # access log =3D /var/log/netdata/access.log
+       # memory mode =3D save
+       # update every =3D 1
+       # pthread stack size =3D 8388608
+       # run as user =3D netdata
+       # web files owner =3D netdata
+       # http port listen backlog =3D 100
+       # port =3D 19999
+       # ip version =3D any
+       # disconnect idle web clients after seconds =3D 60
+       # enable web responses gzip compression =3D yes
+
+[plugins]
+       # tc =3D yes
+       tc =3D no
+       # idlejitter =3D yes
+       proc =3D yes
+       checks =3D no
+       plugins directory =3D /usr/lib/netdata/netdata/plugins.d
+       nable running new plugins =3D yes
+       check for new plugins every =3D 60
+       charts.d =3D yes
+       sma_webbox =3D no
+       apps =3D yes
+       node.d =3D yes
+
+
+# per plugin configuration
+
+[plugin:proc:/proc/net/dev]
+       # filename to monitor =3D /proc/net/dev
+       # enable new interfaces detected at runtime =3D on demand
+       # enable ifb interfaces =3D no
+       # bandwidth for all interfaces =3D on demand
+       # packets for all interfaces =3D on demand
+       # errors for all interfaces =3D on demand
+       # drops for all interfaces =3D on demand
+       # fifo for all interfaces =3D on demand
+       # compressed packets for all interfaces =3D on demand
+       # frames, collisions, carrier counters for all interfaces =3D on de=
mand
+
+[plugin:proc]
+       # /proc/net/dev =3D yes
+       # /proc/diskstats =3D yes
+       # /proc/net/snmp =3D yes
+       # /proc/net/snmp6 =3D yes
+       # /proc/net/netstat =3D yes
+       # /proc/net/stat/conntrack =3D yes
+       # /proc/net/ip_vs/stats =3D yes
+       # /proc/stat =3D yes
+       # /proc/meminfo =3D yes
+       # /proc/vmstat =3D yes
+       # /proc/net/rpc/nfsd =3D yes
+       # /proc/sys/kernel/random/entropy_avail =3D yes
+       # /proc/interrupts =3D yes
+       # /proc/softirqs =3D yes
+       # /proc/loadavg =3D yes
+       # /sys/kernel/mm/ksm =3D yes
+       # netdata server resources =3D yes
+
+[plugin:tc]
+       # script to run to get tc values =3D /usr/lib/netdata/netdata/plugi=
ns.d/tc-qos-helper.sh
+       # enable new interfaces detected at runtime =3D yes
+       # qos for eth1-ifb =3D yes
+       # cleanup unused classes every =3D 60
+       # qos for eth0 =3D yes
+       # qos for eth1 =3D yes
+       # qos for eth0-ifb =3D yes
+
+[plugin:charts.d]
+       # update every =3D 1
+       # command options =3D
+
+[plugin:apps]
+       # update every =3D 1
+       # command options =3D
+
+[plugin:idlejitter]
+       # loop time in ms =3D 20
+
+[plugin:proc:/proc/interrupts]
+       # interrupts per core =3D yes
+       # filename to monitor =3D /proc/interrupts
+
+[plugin:proc:/proc/sys/kernel/random/entropy_avail]
+       # filename to monitor =3D /proc/sys/kernel/random/entropy_avail
+
+[plugin:proc:/proc/diskstats]
+       # enable new disks detected at runtime =3D on demand
+       # bandwidth for all disks =3D on demand
+       # operations for all disks =3D on demand
+       # merged operations for all disks =3D on demand
+       # i/o time for all disks =3D on demand
+       # queued operations for all disks =3D on demand
+       # utilization percentage for all disks =3D on demand
+       # backlog for all disks =3D on demand
+       # filename to monitor =3D /proc/diskstats
+       # path to get h/w sector size =3D /sys/block/%s/queue/hw_sector_siz=
e
+
+[plugin:proc:/proc/net/snmp]
+       # ipv4 packets =3D yes
+       # ipv4 fragments sent =3D yes
+       # ipv4 fragments assembly =3D yes
+       # ipv4 errors =3D yes
+       # ipv4 TCP connections =3D yes
+       # ipv4 TCP packets =3D yes
+       # ipv4 TCP errors =3D yes
+       # ipv4 TCP handshake issues =3D yes
+       # ipv4 UDP packets =3D yes
+       # ipv4 UDP errors =3D yes
+       # filename to monitor =3D /proc/net/snmp
+
+[plugin:proc:/proc/net/netstat]
+       # bandwidth =3D on demand
+       # input errors =3D on demand
+       # multicast bandwidth =3D on demand
+       # broadcast bandwidth =3D on demand
+       # multicast packets =3D on demand
+       # broadcast packets =3D on demand
+       # filename to monitor =3D /proc/net/netstat
+
+[plugin:proc:/proc/net/stat/nf_conntrack]
+       # netfilter connections =3D yes
+       # netfilter new connections =3D yes
+       # netfilter connection changes =3D yes
+       # netfilter connection expectations =3D yes
+       # netfilter connection searches =3D yes
+       # netfilter errors =3D yes
+       # filename to monitor =3D /proc/net/stat/nf_conntrack
+
+[plugin:proc:/proc/net/ip_vs_stats]
+       # IPVS bandwidth =3D yes
+       # IPVS connections =3D yes
+       # IPVS packets =3D yes
+       # filename to monitor =3D /proc/net/ip_vs_stats
+
+[plugin:proc:/proc/stat]
+       # cpu utilization =3D yes
+       # per cpu core utilization =3D yes
+       # cpu interrupts =3D yes
+       # context switches =3D yes
+       # processes started =3D yes
+       # processes running =3D yes
+       # filename to monitor =3D /proc/stat
+
+[plugin:proc:/proc/meminfo]
+       # system ram =3D yes
+       # system swap =3D yes
+       # hardware corrupted ECC =3D on demand
+       # committed memory =3D yes
+       # writeback memory =3D yes
+       # kernel memory =3D yes
+       # slab memory =3D yes
+       # filename to monitor =3D /proc/meminfo
+
+[plugin:proc:/proc/vmstat]
+       # swap i/o =3D yes
+       # disk i/o =3D yes
+       # memory page faults =3D yes
+       # filename to monitor =3D /proc/vmstat
+
+[plugin:proc:/proc/net/rpc/nfsd]
+       # filename to monitor =3D /proc/net/rpc/nfsd
+       # read cache =3D yes
+       # file handles =3D yes
+       # I/O =3D yes
+       # threads =3D yes
+       # read ahead =3D yes
+       # network =3D yes
+       # rpc =3D yes
+       # NFS v2 procedures =3D yes
+       # NFS v3 procedures =3D yes
+       # NFS v4 procedures =3D yes
+       # NFS v4 operations =3D yes
+
+[plugin:proc:/proc/net/dev:lo]
+       # enabled =3D no
+
+[plugin:proc:/proc/net/dev:fireqos_monitor]
+       # enabled =3D no
+
+[plugin:sma_webbox]
+       # update every =3D 1
+       # command options =3D
+
+[plugin:node.d]
+       # update every =3D 1
+       # command options =3D
+
+[plugin:proc:/sys/kernel/mm/ksm]
+       # /sys/kernel/mm/ksm/pages_shared =3D /sys/kernel/mm/ksm/pages_shar=
ed
+       # /sys/kernel/mm/ksm/pages_sharing =3D /sys/kernel/mm/ksm/pages_sha=
ring
+       # /sys/kernel/mm/ksm/pages_unshared =3D /sys/kernel/mm/ksm/pages_un=
shared
+       # /sys/kernel/mm/ksm/pages_volatile =3D /sys/kernel/mm/ksm/pages_vo=
latile
+       # /sys/kernel/mm/ksm/pages_to_scan =3D /sys/kernel/mm/ksm/pages_to_=
scan
+
+[plugin:proc:/proc/loadavg]
+       # filename to monitor =3D /proc/loadavg
+       # enable load average =3D yes
+       # enable total processes =3D yes
+
+[plugin:proc:/proc/softirqs]
+       # interrupts per core =3D yes
+       # filename to monitor =3D /proc/softirqs
+
+[plugin:proc:/proc/net/dev:eth1-ifb]
+       # enabled =3D no
+
+[plugin:proc:/proc/net/dev:eth0]
+       # enabled =3D on demand
+       # bandwidth =3D on demand
+       # packets =3D on demand
+       # errors =3D on demand
+       # drops =3D on demand
+       # fifo =3D on demand
+       # compressed =3D on demand
+       # events =3D on demand
+
+[plugin:proc:/proc/net/dev:eth1]
+       # enabled =3D on demand
+       # bandwidth =3D on demand
+       # packets =3D on demand
+       # errors =3D on demand
+       # drops =3D on demand
+       # fifo =3D on demand
+       # compressed =3D on demand
+       # events =3D on demand
+
+[plugin:proc:/proc/net/dev:eth0-ifb]
+       # enabled =3D no
+
+[plugin:proc:/proc/diskstats:fd0]
+       # enabled =3D no
+
+[plugin:proc:/proc/diskstats:sda]
+       # enabled =3D on demand
+       # bandwidth =3D on demand
+       # operations =3D on demand
+       # merged operations =3D on demand
+       # i/o time =3D on demand
+       queued operations =3D yes
+       # utilization percentage =3D on demand
+       # backlog =3D on demand
+
+[plugin:proc:/proc/diskstats:sda1]
+       # enabled =3D no
+
+[plugin:proc:/proc/diskstats:sda2]
+       # enabled =3D no
+
+[plugin:proc:/proc/diskstats:sda5]
+       # enabled =3D no
+
+[plugin:proc:/proc/diskstats:sr0]
+       # enabled =3D no
+
+[plugin:proc:/proc/net/snmp6]
+       # ipv6 packets =3D on demand
+       # ipv6 fragments sent =3D on demand
+       # ipv6 fragments assembly =3D on demand
+       # ipv6 errors =3D on demand
+       # ipv6 UDP packets =3D on demand
+       # ipv6 UDP errors =3D on demand
+       # ipv6 UDPlite packets =3D on demand
+       # ipv6 UDPlite errors =3D on demand
+       # bandwidth =3D on demand
+       # multicast bandwidth =3D on demand
+       # broadcast bandwidth =3D on demand
+       # multicast packets =3D on demand
+       # icmp =3D on demand
+       # icmp redirects =3D on demand
+       # icmp errors =3D on demand
+       # icmp echos =3D on demand
+       # icmp group membership =3D on demand
+       # icmp router =3D on demand
+       # icmp neighbor =3D on demand
+       # icmp mldv2 =3D on demand
+       # icmp types =3D on demand
+       # ect =3D on demand
+       # filename to monitor =3D /proc/net/snmp6
+
+
+# per chart configuration
+
+[system.idlejitter]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/system.idlejitter
+       # chart type =3D line
+       # type =3D system
+       # family =3D processes
+       # context =3D system.idlejitter
+       # units =3D microseconds lost/s
+       # priority =3D 9999
+       # gap when lost iterations above =3D 1
+       # name =3D system.idlejitter
+       # title =3D CPU Idle Jitter (system.idlejitter)
+       # dim jitter name =3D jitter
+       # dim jitter algorithm =3D absolute
+       # dim jitter multiplier =3D 1
+       # dim jitter divisor =3D 1
+
+[system.interrupts]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.interrupts
+       # chart type =3D stacked
+       # type =3D system
+       # family =3D interrupts
+       # context =3D system.interrupts
+       # units =3D interrupts/s
+       # priority =3D 1000
+       # gap when lost iterations above =3D 1
+       # name =3D system.interrupts
+       # title =3D System interrupts (system.interrupts)
+       # dim 0 name =3D timer_0
+       # dim 0 algorithm =3D incremental
+       # dim 0 multiplier =3D 1
+       # dim 0 divisor =3D 1
+       # dim 1 name =3D i8042_1
+       # dim 1 algorithm =3D incremental
+       # dim 1 multiplier =3D 1
+       # dim 1 divisor =3D 1
+       # dim 6 name =3D floppy_6
+       # dim 6 algorithm =3D incremental
+       # dim 6 multiplier =3D 1
+       # dim 6 divisor =3D 1
+       # dim 8 name =3D rtc0_8
+       # dim 8 algorithm =3D incremental
+       # dim 8 multiplier =3D 1
+       # dim 8 divisor =3D 1
+       # dim 9 name =3D acpi_9
+       # dim 9 algorithm =3D incremental
+       # dim 9 multiplier =3D 1
+       # dim 9 divisor =3D 1
+       # dim 12 name =3D i8042_12
+       # dim 12 algorithm =3D incremental
+       # dim 12 multiplier =3D 1
+       # dim 12 divisor =3D 1
+       # dim 14 name =3D ata_piix_14
+       # dim 14 algorithm =3D incremental
+       # dim 14 multiplier =3D 1
+       # dim 14 divisor =3D 1
+       # dim 15 name =3D ata_piix_15
+       # dim 15 algorithm =3D incremental
+       # dim 15 multiplier =3D 1
+       # dim 15 divisor =3D 1
+       # dim NMI name =3D NMI
+       # dim NMI algorithm =3D incremental
+       # dim NMI multiplier =3D 1
+       # dim NMI divisor =3D 1
+       # dim LOC name =3D LOC
+       # dim LOC algorithm =3D incremental
+       # dim LOC multiplier =3D 1
+       # dim LOC divisor =3D 1
+       # dim SPU name =3D SPU
+       # dim SPU algorithm =3D incremental
+       # dim SPU multiplier =3D 1
+       # dim SPU divisor =3D 1
+       # dim PMI name =3D PMI
+       # dim PMI algorithm =3D incremental
+       # dim PMI multiplier =3D 1
+       # dim PMI divisor =3D 1
+       # dim IWI name =3D IWI
+       # dim IWI algorithm =3D incremental
+       # dim IWI multiplier =3D 1
+       # dim IWI divisor =3D 1
+       # dim RTR name =3D RTR
+       # dim RTR algorithm =3D incremental
+       # dim RTR multiplier =3D 1
+       # dim RTR divisor =3D 1
+       # dim RES name =3D RES
+       # dim RES algorithm =3D incremental
+       # dim RES multiplier =3D 1
+       # dim RES divisor =3D 1
+       # dim CAL name =3D CAL
+       # dim CAL algorithm =3D incremental
+       # dim CAL multiplier =3D 1
+       # dim CAL divisor =3D 1
+       # dim TLB name =3D TLB
+       # dim TLB algorithm =3D incremental
+       # dim TLB multiplier =3D 1
+       # dim TLB divisor =3D 1
+       # dim TRM name =3D TRM
+       # dim TRM algorithm =3D incremental
+       # dim TRM multiplier =3D 1
+       # dim TRM divisor =3D 1
+       # dim THR name =3D THR
+       # dim THR algorithm =3D incremental
+       # dim THR multiplier =3D 1
+       # dim THR divisor =3D 1
+       # dim MCE name =3D MCE
+       # dim MCE algorithm =3D incremental
+       # dim MCE multiplier =3D 1
+       # dim MCE divisor =3D 1
+       # dim MCP name =3D MCP
+       # dim MCP algorithm =3D incremental
+       # dim MCP multiplier =3D 1
+       # dim MCP divisor =3D 1
+       # dim HYP name =3D HYP
+       # dim HYP algorithm =3D incremental
+       # dim HYP multiplier =3D 1
+       # dim HYP divisor =3D 1
+       # dim ERR name =3D ERR
+       # dim ERR algorithm =3D incremental
+       # dim ERR multiplier =3D 1
+       # dim ERR divisor =3D 1
+       # dim MIS name =3D MIS
+       # dim MIS algorithm =3D incremental
+       # dim MIS multiplier =3D 1
+       # dim MIS divisor =3D 1
+
+[system.entropy]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/system.entropy
+       # chart type =3D line
+       # type =3D system
+       # family =3D entropy
+       # context =3D system.entropy
+       # units =3D entropy
+       # priority =3D 1000
+       # gap when lost iterations above =3D 1
+       # name =3D system.entropy
+       # title =3D Available Entropy (system.entropy)
+       # dim entropy name =3D entropy
+       # dim entropy algorithm =3D absolute
+       # dim entropy multiplier =3D 1
+       # dim entropy divisor =3D 1
+
+[net.eth0]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/net.eth0
+       # chart type =3D area
+       # type =3D net
+       # family =3D eth0
+       # context =3D net.net
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D net.eth0
+       # title =3D Bandwidth (net.eth0)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[net_packets.eth0]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/net_packets.eth0
+       # chart type =3D line
+       # type =3D net_packets
+       # family =3D eth0
+       # context =3D net.packets
+       # units =3D packets/s
+       # priority =3D 7001
+       # gap when lost iterations above =3D 1
+       # name =3D net_packets.eth0
+       # title =3D Packets (net_packets.eth0)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+       # dim multicast name =3D multicast
+       # dim multicast algorithm =3D incremental
+       # dim multicast multiplier =3D 1
+       # dim multicast divisor =3D 1
+
+[net_drops.eth0]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/net_drops.eth0
+       # chart type =3D line
+       # type =3D net_drops
+       # family =3D eth0
+       # context =3D net.drops
+       # units =3D drops/s
+       # priority =3D 7003
+       # gap when lost iterations above =3D 1
+       # name =3D net_drops.eth0
+       # title =3D Interface Drops (net_drops.eth0)
+       # dim inbound name =3D inbound
+       # dim inbound algorithm =3D incremental
+       # dim inbound multiplier =3D 1
+       # dim inbound divisor =3D 1
+       # dim outbound name =3D outbound
+       # dim outbound algorithm =3D incremental
+       # dim outbound multiplier =3D -1
+       # dim outbound divisor =3D 1
+
+[net.eth1]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/net.eth1
+       # chart type =3D area
+       # type =3D net
+       # family =3D eth1
+       # context =3D net.net
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D net.eth1
+       # title =3D Bandwidth (net.eth1)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[net_packets.eth1]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/net_packets.eth1
+       # chart type =3D line
+       # type =3D net_packets
+       # family =3D eth1
+       # context =3D net.packets
+       # units =3D packets/s
+       # priority =3D 7001
+       # gap when lost iterations above =3D 1
+       # name =3D net_packets.eth1
+       # title =3D Packets (net_packets.eth1)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+       # dim multicast name =3D multicast
+       # dim multicast algorithm =3D incremental
+       # dim multicast multiplier =3D 1
+       # dim multicast divisor =3D 1
+
+[disk.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk.sda
+       # chart type =3D area
+       # type =3D disk
+       # family =3D sda
+       # context =3D disk.io
+       # units =3D kilobytes/s
+       # priority =3D 2000
+       # gap when lost iterations above =3D 1
+       # name =3D disk.sda
+       # title =3D Disk I/O Bandwidth (disk.sda)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D incremental
+       # dim reads multiplier =3D 512
+       # dim reads divisor =3D 1024
+       # dim writes name =3D writes
+       # dim writes algorithm =3D incremental
+       # dim writes multiplier =3D -512
+       # dim writes divisor =3D 1024
+
+[disk_ops.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_ops.sda
+       # chart type =3D line
+       # type =3D disk_ops
+       # family =3D sda
+       # context =3D disk.ops
+       # units =3D operations/s
+       # priority =3D 2001
+       # gap when lost iterations above =3D 1
+       # name =3D disk_ops.sda
+       # title =3D Disk Completed I/O Operations (disk_ops.sda)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D incremental
+       # dim reads multiplier =3D 1
+       # dim reads divisor =3D 1
+       # dim writes name =3D writes
+       # dim writes algorithm =3D incremental
+       # dim writes multiplier =3D -1
+       # dim writes divisor =3D 1
+
+[disk_qops.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_qops.sda
+       # chart type =3D line
+       # type =3D disk_qops
+       # family =3D sda
+       # context =3D disk.qops
+       # units =3D operations
+       # priority =3D 2002
+       # gap when lost iterations above =3D 1
+       # name =3D disk_qops.sda
+       # title =3D Disk Current I/O Operations (disk_qops.sda)
+       # dim operations name =3D operations
+       # dim operations algorithm =3D absolute
+       # dim operations multiplier =3D 1
+       # dim operations divisor =3D 1
+
+[disk_backlog.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_backlog.sda
+       # chart type =3D area
+       # type =3D disk_backlog
+       # family =3D sda
+       # context =3D disk.backlog
+       # units =3D backlog (ms)
+       # priority =3D 2003
+       # gap when lost iterations above =3D 1
+       # name =3D disk_backlog.sda
+       # title =3D Disk Backlog (disk_backlog.sda)
+       # dim backlog name =3D backlog
+       # dim backlog algorithm =3D incremental
+       # dim backlog multiplier =3D 1
+       # dim backlog divisor =3D 10
+
+[disk_util.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_util.sda
+       # chart type =3D area
+       # type =3D disk_util
+       # family =3D sda
+       # context =3D disk.util
+       # units =3D % of time working
+       # priority =3D 2004
+       # gap when lost iterations above =3D 1
+       # name =3D disk_util.sda
+       # title =3D Disk Utilization Time (disk_util.sda)
+       # dim utilization name =3D utilization
+       # dim utilization algorithm =3D incremental
+       # dim utilization multiplier =3D 1
+       # dim utilization divisor =3D 10
+
+[disk_mops.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_mops.sda
+       # chart type =3D line
+       # type =3D disk_mops
+       # family =3D sda
+       # context =3D disk.mops
+       # units =3D merged operations/s
+       # priority =3D 2021
+       # gap when lost iterations above =3D 1
+       # name =3D disk_mops.sda
+       # title =3D Disk Merged Operations (disk_mops.sda)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D incremental
+       # dim reads multiplier =3D 1
+       # dim reads divisor =3D 1
+       # dim writes name =3D writes
+       # dim writes algorithm =3D incremental
+       # dim writes multiplier =3D -1
+       # dim writes divisor =3D 1
+
+[disk_iotime.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_iotime.sda
+       # chart type =3D line
+       # type =3D disk_iotime
+       # family =3D sda
+       # context =3D disk.iotime
+       # units =3D milliseconds/s
+       # priority =3D 2022
+       # gap when lost iterations above =3D 1
+       # name =3D disk_iotime.sda
+       # title =3D Disk Total I/O Time (disk_iotime.sda)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D incremental
+       # dim reads multiplier =3D 1
+       # dim reads divisor =3D 1
+       # dim writes name =3D writes
+       # dim writes algorithm =3D incremental
+       # dim writes multiplier =3D -1
+       # dim writes divisor =3D 1
+
+[ipv4.packets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/ipv4.packets
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D packets
+       # context =3D ipv4.packets
+       # units =3D packets/s
+       # priority =3D 3000
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.packets
+       # title =3D IPv4 Packets (ipv4.packets)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+       # dim forwarded name =3D forwarded
+       # dim forwarded algorithm =3D incremental
+       # dim forwarded multiplier =3D 1
+       # dim forwarded divisor =3D 1
+
+[ipv4.fragsout]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.fragsout
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D fragments
+       # context =3D ipv4.fragsout
+       # units =3D packets/s
+       # priority =3D 3010
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.fragsout
+       # title =3D IPv4 Fragments Sent (ipv4.fragsout)
+       # dim ok name =3D ok
+       # dim ok algorithm =3D incremental
+       # dim ok multiplier =3D 1
+       # dim ok divisor =3D 1
+       # dim failed name =3D failed
+       # dim failed algorithm =3D incremental
+       # dim failed multiplier =3D -1
+       # dim failed divisor =3D 1
+       # dim all name =3D all
+       # dim all algorithm =3D incremental
+       # dim all multiplier =3D 1
+       # dim all divisor =3D 1
+
+[ipv4.fragsin]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.fragsin
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D fragments
+       # context =3D ipv4.fragsin
+       # units =3D packets/s
+       # priority =3D 3011
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.fragsin
+       # title =3D IPv4 Fragments Reassembly (ipv4.fragsin)
+       # dim ok name =3D ok
+       # dim ok algorithm =3D incremental
+       # dim ok multiplier =3D 1
+       # dim ok divisor =3D 1
+       # dim failed name =3D failed
+       # dim failed algorithm =3D incremental
+       # dim failed multiplier =3D -1
+       # dim failed divisor =3D 1
+       # dim all name =3D all
+       # dim all algorithm =3D incremental
+       # dim all multiplier =3D 1
+       # dim all divisor =3D 1
+
+[ipv4.errors]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.errors
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D errors
+       # context =3D ipv4.errors
+       # units =3D packets/s
+       # priority =3D 3002
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.errors
+       # title =3D IPv4 Errors (ipv4.errors)
+       # dim InDiscards name =3D InDiscards
+       # dim InDiscards algorithm =3D incremental
+       # dim InDiscards multiplier =3D 1
+       # dim InDiscards divisor =3D 1
+       # dim OutDiscards name =3D OutDiscards
+       # dim OutDiscards algorithm =3D incremental
+       # dim OutDiscards multiplier =3D -1
+       # dim OutDiscards divisor =3D 1
+       # dim InHdrErrors name =3D InHdrErrors
+       # dim InHdrErrors algorithm =3D incremental
+       # dim InHdrErrors multiplier =3D 1
+       # dim InHdrErrors divisor =3D 1
+       # dim InAddrErrors name =3D InAddrErrors
+       # dim InAddrErrors algorithm =3D incremental
+       # dim InAddrErrors multiplier =3D 1
+       # dim InAddrErrors divisor =3D 1
+       # dim InUnknownProtos name =3D InUnknownProtos
+       # dim InUnknownProtos algorithm =3D incremental
+       # dim InUnknownProtos multiplier =3D 1
+       # dim InUnknownProtos divisor =3D 1
+       # dim OutNoRoutes name =3D OutNoRoutes
+       # dim OutNoRoutes algorithm =3D incremental
+       # dim OutNoRoutes multiplier =3D -1
+       # dim OutNoRoutes divisor =3D 1
+
+[ipv4.tcpsock]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.tcpsock
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D tcp
+       # context =3D ipv4.tcpsock
+       # units =3D active connections
+       # priority =3D 2500
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.tcpsock
+       # title =3D IPv4 TCP Connections (ipv4.tcpsock)
+       # dim connections name =3D connections
+       # dim connections algorithm =3D absolute
+       # dim connections multiplier =3D 1
+       # dim connections divisor =3D 1
+
+[ipv4.tcppackets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.tcppackets
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D tcp
+       # context =3D ipv4.tcppackets
+       # units =3D packets/s
+       # priority =3D 2600
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.tcppackets
+       # title =3D IPv4 TCP Packets (ipv4.tcppackets)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[ipv4.tcperrors]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.tcperrors
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D tcp
+       # context =3D ipv4.tcperrors
+       # units =3D packets/s
+       # priority =3D 2700
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.tcperrors
+       # title =3D IPv4 TCP Errors (ipv4.tcperrors)
+       # dim InErrs name =3D InErrs
+       # dim InErrs algorithm =3D incremental
+       # dim InErrs multiplier =3D 1
+       # dim InErrs divisor =3D 1
+       # dim RetransSegs name =3D RetransSegs
+       # dim RetransSegs algorithm =3D incremental
+       # dim RetransSegs multiplier =3D -1
+       # dim RetransSegs divisor =3D 1
+
+[ipv4.tcphandshake]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.tcphandshake
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D tcp
+       # context =3D ipv4.tcphandshake
+       # units =3D events/s
+       # priority =3D 2900
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.tcphandshake
+       # title =3D IPv4 TCP Handshake Issues (ipv4.tcphandshake)
+       # dim EstabResets name =3D EstabResets
+       # dim EstabResets algorithm =3D incremental
+       # dim EstabResets multiplier =3D 1
+       # dim EstabResets divisor =3D 1
+       # dim OutRsts name =3D OutRsts
+       # dim OutRsts algorithm =3D incremental
+       # dim OutRsts multiplier =3D -1
+       # dim OutRsts divisor =3D 1
+       # dim ActiveOpens name =3D ActiveOpens
+       # dim ActiveOpens algorithm =3D incremental
+       # dim ActiveOpens multiplier =3D 1
+       # dim ActiveOpens divisor =3D 1
+       # dim PassiveOpens name =3D PassiveOpens
+       # dim PassiveOpens algorithm =3D incremental
+       # dim PassiveOpens multiplier =3D 1
+       # dim PassiveOpens divisor =3D 1
+       # dim AttemptFails name =3D AttemptFails
+       # dim AttemptFails algorithm =3D incremental
+       # dim AttemptFails multiplier =3D 1
+       # dim AttemptFails divisor =3D 1
+
+[ipv4.udppackets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.udppackets
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D udp
+       # context =3D ipv4.udppackets
+       # units =3D packets/s
+       # priority =3D 2601
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.udppackets
+       # title =3D IPv4 UDP Packets (ipv4.udppackets)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[ipv4.udperrors]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.udperrors
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D udp
+       # context =3D ipv4.udperrors
+       # units =3D events/s
+       # priority =3D 2701
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.udperrors
+       # title =3D IPv4 UDP Errors (ipv4.udperrors)
+       # dim RcvbufErrors name =3D RcvbufErrors
+       # dim RcvbufErrors algorithm =3D incremental
+       # dim RcvbufErrors multiplier =3D 1
+       # dim RcvbufErrors divisor =3D 1
+       # dim SndbufErrors name =3D SndbufErrors
+       # dim SndbufErrors algorithm =3D incremental
+       # dim SndbufErrors multiplier =3D -1
+       # dim SndbufErrors divisor =3D 1
+       # dim InErrors name =3D InErrors
+       # dim InErrors algorithm =3D incremental
+       # dim InErrors multiplier =3D 1
+       # dim InErrors divisor =3D 1
+       # dim NoPorts name =3D NoPorts
+       # dim NoPorts algorithm =3D incremental
+       # dim NoPorts multiplier =3D 1
+       # dim NoPorts divisor =3D 1
+
+[system.ipv4]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.ipv4
+       # chart type =3D area
+       # type =3D system
+       # family =3D network
+       # context =3D system.ipv4
+       # units =3D kilobits/s
+       # priority =3D 500
+       # gap when lost iterations above =3D 1
+       # name =3D system.ipv4
+       # title =3D IPv4 Bandwidth (system.ipv4)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[ipv4.bcast]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.bcast
+       # chart type =3D area
+       # type =3D ipv4
+       # family =3D broadcast
+       # context =3D ipv4.bcast
+       # units =3D kilobits/s
+       # priority =3D 8000
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.bcast
+       # title =3D IPv4 Broadcast Bandwidth (ipv4.bcast)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[ipv4.bcastpkts]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv4.bcastpkts
+       # chart type =3D line
+       # type =3D ipv4
+       # family =3D broadcast
+       # context =3D ipv4.bcastpkts
+       # units =3D packets/s
+       # priority =3D 8500
+       # gap when lost iterations above =3D 1
+       # name =3D ipv4.bcastpkts
+       # title =3D IPv4 Broadcast Packets (ipv4.bcastpkts)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[system.cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.cpu
+       # chart type =3D stacked
+       # type =3D system
+       # family =3D cpu
+       # context =3D system.cpu
+       # units =3D percentage
+       # priority =3D 100
+       # gap when lost iterations above =3D 1
+       # name =3D system.cpu
+       # title =3D Total CPU utilization (system.cpu)
+       # dim guest_nice name =3D guest_nice
+       # dim guest_nice algorithm =3D percentage-of-incremental-row
+       # dim guest_nice multiplier =3D 1
+       # dim guest_nice divisor =3D 1
+       # dim guest name =3D guest
+       # dim guest algorithm =3D percentage-of-incremental-row
+       # dim guest multiplier =3D 1
+       # dim guest divisor =3D 1
+       # dim steal name =3D steal
+       # dim steal algorithm =3D percentage-of-incremental-row
+       # dim steal multiplier =3D 1
+       # dim steal divisor =3D 1
+       # dim softirq name =3D softirq
+       # dim softirq algorithm =3D percentage-of-incremental-row
+       # dim softirq multiplier =3D 1
+       # dim softirq divisor =3D 1
+       # dim irq name =3D irq
+       # dim irq algorithm =3D percentage-of-incremental-row
+       # dim irq multiplier =3D 1
+       # dim irq divisor =3D 1
+       # dim user name =3D user
+       # dim user algorithm =3D percentage-of-incremental-row
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D percentage-of-incremental-row
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim nice name =3D nice
+       # dim nice algorithm =3D percentage-of-incremental-row
+       # dim nice multiplier =3D 1
+       # dim nice divisor =3D 1
+       # dim iowait name =3D iowait
+       # dim iowait algorithm =3D percentage-of-incremental-row
+       # dim iowait multiplier =3D 1
+       # dim iowait divisor =3D 1
+       # dim idle name =3D idle
+       # dim idle algorithm =3D percentage-of-incremental-row
+       # dim idle multiplier =3D 1
+       # dim idle divisor =3D 1
+
+[cpu.cpu0]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu0
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D utilization
+       # context =3D cpu.cpu
+       # units =3D percentage
+       # priority =3D 1000
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu0
+       # title =3D Core utilization (cpu.cpu0)
+       # dim guest_nice name =3D guest_nice
+       # dim guest_nice algorithm =3D percentage-of-incremental-row
+       # dim guest_nice multiplier =3D 1
+       # dim guest_nice divisor =3D 1
+       # dim guest name =3D guest
+       # dim guest algorithm =3D percentage-of-incremental-row
+       # dim guest multiplier =3D 1
+       # dim guest divisor =3D 1
+       # dim steal name =3D steal
+       # dim steal algorithm =3D percentage-of-incremental-row
+       # dim steal multiplier =3D 1
+       # dim steal divisor =3D 1
+       # dim softirq name =3D softirq
+       # dim softirq algorithm =3D percentage-of-incremental-row
+       # dim softirq multiplier =3D 1
+       # dim softirq divisor =3D 1
+       # dim irq name =3D irq
+       # dim irq algorithm =3D percentage-of-incremental-row
+       # dim irq multiplier =3D 1
+       # dim irq divisor =3D 1
+       # dim user name =3D user
+       # dim user algorithm =3D percentage-of-incremental-row
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D percentage-of-incremental-row
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim nice name =3D nice
+       # dim nice algorithm =3D percentage-of-incremental-row
+       # dim nice multiplier =3D 1
+       # dim nice divisor =3D 1
+       # dim iowait name =3D iowait
+       # dim iowait algorithm =3D percentage-of-incremental-row
+       # dim iowait multiplier =3D 1
+       # dim iowait divisor =3D 1
+       # dim idle name =3D idle
+       # dim idle algorithm =3D percentage-of-incremental-row
+       # dim idle multiplier =3D 1
+       # dim idle divisor =3D 1
+
+[cpu.cpu1]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu1
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D utilization
+       # context =3D cpu.cpu
+       # units =3D percentage
+       # priority =3D 1000
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu1
+       # title =3D Core utilization (cpu.cpu1)
+       # dim guest_nice name =3D guest_nice
+       # dim guest_nice algorithm =3D percentage-of-incremental-row
+       # dim guest_nice multiplier =3D 1
+       # dim guest_nice divisor =3D 1
+       # dim guest name =3D guest
+       # dim guest algorithm =3D percentage-of-incremental-row
+       # dim guest multiplier =3D 1
+       # dim guest divisor =3D 1
+       # dim steal name =3D steal
+       # dim steal algorithm =3D percentage-of-incremental-row
+       # dim steal multiplier =3D 1
+       # dim steal divisor =3D 1
+       # dim softirq name =3D softirq
+       # dim softirq algorithm =3D percentage-of-incremental-row
+       # dim softirq multiplier =3D 1
+       # dim softirq divisor =3D 1
+       # dim irq name =3D irq
+       # dim irq algorithm =3D percentage-of-incremental-row
+       # dim irq multiplier =3D 1
+       # dim irq divisor =3D 1
+       # dim user name =3D user
+       # dim user algorithm =3D percentage-of-incremental-row
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D percentage-of-incremental-row
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim nice name =3D nice
+       # dim nice algorithm =3D percentage-of-incremental-row
+       # dim nice multiplier =3D 1
+       # dim nice divisor =3D 1
+       # dim iowait name =3D iowait
+       # dim iowait algorithm =3D percentage-of-incremental-row
+       # dim iowait multiplier =3D 1
+       # dim iowait divisor =3D 1
+       # dim idle name =3D idle
+       # dim idle algorithm =3D percentage-of-incremental-row
+       # dim idle multiplier =3D 1
+       # dim idle divisor =3D 1
+
+[system.intr]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.intr
+       # chart type =3D line
+       # type =3D system
+       # family =3D interrupts
+       # context =3D system.intr
+       # units =3D interrupts/s
+       # priority =3D 900
+       # gap when lost iterations above =3D 1
+       # name =3D system.intr
+       # title =3D CPU Interrupts (system.intr)
+       # dim interrupts name =3D interrupts
+       # dim interrupts algorithm =3D incremental
+       # dim interrupts multiplier =3D 1
+       # dim interrupts divisor =3D 1
+
+[system.ctxt]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.ctxt
+       # chart type =3D line
+       # type =3D system
+       # family =3D processes
+       # context =3D system.ctxt
+       # units =3D context switches/s
+       # priority =3D 800
+       # gap when lost iterations above =3D 1
+       # name =3D system.ctxt
+       # title =3D CPU Context Switches (system.ctxt)
+       # dim switches name =3D switches
+       # dim switches algorithm =3D incremental
+       # dim switches multiplier =3D 1
+       # dim switches divisor =3D 1
+
+[system.forks]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.forks
+       # chart type =3D line
+       # type =3D system
+       # family =3D processes
+       # context =3D system.forks
+       # units =3D processes/s
+       # priority =3D 700
+       # gap when lost iterations above =3D 1
+       # name =3D system.forks
+       # title =3D Started Processes (system.forks)
+       # dim started name =3D started
+       # dim started algorithm =3D incremental
+       # dim started multiplier =3D 1
+       # dim started divisor =3D 1
+
+[system.processes]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.processes
+       # chart type =3D line
+       # type =3D system
+       # family =3D processes
+       # context =3D system.processes
+       # units =3D processes
+       # priority =3D 600
+       # gap when lost iterations above =3D 1
+       # name =3D system.processes
+       # title =3D System Processes (system.processes)
+       # dim running name =3D running
+       # dim running algorithm =3D absolute
+       # dim running multiplier =3D 1
+       # dim running divisor =3D 1
+       # dim blocked name =3D blocked
+       # dim blocked algorithm =3D absolute
+       # dim blocked multiplier =3D -1
+       # dim blocked divisor =3D 1
+
+[system.ram]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.ram
+       # chart type =3D stacked
+       # type =3D system
+       # family =3D ram
+       # context =3D system.ram
+       # units =3D MB
+       # priority =3D 200
+       # gap when lost iterations above =3D 1
+       # name =3D system.ram
+       # title =3D System RAM (system.ram)
+       # dim buffers name =3D buffers
+       # dim buffers algorithm =3D absolute
+       # dim buffers multiplier =3D 1
+       # dim buffers divisor =3D 1024
+       # dim used name =3D used
+       # dim used algorithm =3D absolute
+       # dim used multiplier =3D 1
+       # dim used divisor =3D 1024
+       # dim cached name =3D cached
+       # dim cached algorithm =3D absolute
+       # dim cached multiplier =3D 1
+       # dim cached divisor =3D 1024
+       # dim free name =3D free
+       # dim free algorithm =3D absolute
+       # dim free multiplier =3D 1
+       # dim free divisor =3D 1024
+
+[system.swap]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.swap
+       # chart type =3D stacked
+       # type =3D system
+       # family =3D swap
+       # context =3D system.swap
+       # units =3D MB
+       # priority =3D 201
+       # gap when lost iterations above =3D 1
+       # name =3D system.swap
+       # title =3D System Swap (system.swap)
+       # dim free name =3D free
+       # dim free algorithm =3D absolute
+       # dim free multiplier =3D 1
+       # dim free divisor =3D 1024
+       # dim used name =3D used
+       # dim used algorithm =3D absolute
+       # dim used multiplier =3D 1
+       # dim used divisor =3D 1024
+
+[mem.committed]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/mem.committed
+       # chart type =3D area
+       # type =3D mem
+       # family =3D system
+       # context =3D mem.committed
+       # units =3D MB
+       # priority =3D 5000
+       # gap when lost iterations above =3D 1
+       # name =3D mem.committed
+       # title =3D Committed (Allocated) Memory (mem.committed)
+       # dim Committed_AS name =3D Committed_AS
+       # dim Committed_AS algorithm =3D absolute
+       # dim Committed_AS multiplier =3D 1
+       # dim Committed_AS divisor =3D 1024
+
+[mem.writeback]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mem.writeback
+       # chart type =3D line
+       # type =3D mem
+       # family =3D kernel
+       # context =3D mem.writeback
+       # units =3D MB
+       # priority =3D 4000
+       # gap when lost iterations above =3D 1
+       # name =3D mem.writeback
+       # title =3D Writeback Memory (mem.writeback)
+       # dim Dirty name =3D Dirty
+       # dim Dirty algorithm =3D absolute
+       # dim Dirty multiplier =3D 1
+       # dim Dirty divisor =3D 1024
+       # dim Writeback name =3D Writeback
+       # dim Writeback algorithm =3D absolute
+       # dim Writeback multiplier =3D 1
+       # dim Writeback divisor =3D 1024
+       # dim FuseWriteback name =3D FuseWriteback
+       # dim FuseWriteback algorithm =3D absolute
+       # dim FuseWriteback multiplier =3D 1
+       # dim FuseWriteback divisor =3D 1024
+       # dim NfsWriteback name =3D NfsWriteback
+       # dim NfsWriteback algorithm =3D absolute
+       # dim NfsWriteback multiplier =3D 1
+       # dim NfsWriteback divisor =3D 1024
+       # dim Bounce name =3D Bounce
+       # dim Bounce algorithm =3D absolute
+       # dim Bounce multiplier =3D 1
+       # dim Bounce divisor =3D 1024
+
+[mem.kernel]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/mem.kernel
+       # chart type =3D stacked
+       # type =3D mem
+       # family =3D kernel
+       # context =3D mem.kernel
+       # units =3D MB
+       # priority =3D 6000
+       # gap when lost iterations above =3D 1
+       # name =3D mem.kernel
+       # title =3D Memory Used by Kernel (mem.kernel)
+       # dim Slab name =3D Slab
+       # dim Slab algorithm =3D absolute
+       # dim Slab multiplier =3D 1
+       # dim Slab divisor =3D 1024
+       # dim KernelStack name =3D KernelStack
+       # dim KernelStack algorithm =3D absolute
+       # dim KernelStack multiplier =3D 1
+       # dim KernelStack divisor =3D 1024
+       # dim PageTables name =3D PageTables
+       # dim PageTables algorithm =3D absolute
+       # dim PageTables multiplier =3D 1
+       # dim PageTables divisor =3D 1024
+       # dim VmallocUsed name =3D VmallocUsed
+       # dim VmallocUsed algorithm =3D absolute
+       # dim VmallocUsed multiplier =3D 1
+       # dim VmallocUsed divisor =3D 1024
+
+[mem.slab]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mem.slab
+       # chart type =3D stacked
+       # type =3D mem
+       # family =3D slab
+       # context =3D mem.slab
+       # units =3D MB
+       # priority =3D 6500
+       # gap when lost iterations above =3D 1
+       # name =3D mem.slab
+       # title =3D Reclaimable Kernel Memory (mem.slab)
+       # dim reclaimable name =3D reclaimable
+       # dim reclaimable algorithm =3D absolute
+       # dim reclaimable multiplier =3D 1
+       # dim reclaimable divisor =3D 1024
+       # dim unreclaimable name =3D unreclaimable
+       # dim unreclaimable algorithm =3D absolute
+       # dim unreclaimable multiplier =3D 1
+       # dim unreclaimable divisor =3D 1024
+
+[system.swapio]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/system.swapio
+       # chart type =3D area
+       # type =3D system
+       # family =3D swap
+       # context =3D system.swapio
+       # units =3D kilobytes/s
+       # priority =3D 250
+       # gap when lost iterations above =3D 1
+       # name =3D system.swapio
+       # title =3D Swap I/O (system.swapio)
+       # dim in name =3D in
+       # dim in algorithm =3D incremental
+       # dim in multiplier =3D 4096
+       # dim in divisor =3D 1024
+       # dim out name =3D out
+       # dim out algorithm =3D incremental
+       # dim out multiplier =3D -4096
+       # dim out divisor =3D 1024
+
+[system.io]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.io
+       # chart type =3D area
+       # type =3D system
+       # family =3D disk
+       # context =3D system.io
+       # units =3D kilobytes/s
+       # priority =3D 150
+       # gap when lost iterations above =3D 1
+       # name =3D system.io
+       # title =3D Disk I/O (system.io)
+       # dim in name =3D in
+       # dim in algorithm =3D incremental
+       # dim in multiplier =3D 1
+       # dim in divisor =3D 1
+       # dim out name =3D out
+       # dim out algorithm =3D incremental
+       # dim out multiplier =3D -1
+       # dim out divisor =3D 1
+
+[netdata.plugin_proc_cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.plugin_proc_cpu
+       # chart type =3D stacked
+       # type =3D netdata
+       # family =3D proc.internal
+       # context =3D netdata.plugin_proc_cpu
+       # units =3D milliseconds/s
+       # priority =3D 131000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_proc_cpu
+       # title =3D NetData Proc Plugin CPU usage (netdata.plugin_proc_cpu)
+       # dim user name =3D user
+       # dim user algorithm =3D incremental
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1000
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1000
+
+[netdata.server_cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.server_cpu
+       # chart type =3D stacked
+       # type =3D netdata
+       # family =3D netdata
+       # context =3D netdata.server_cpu
+       # units =3D milliseconds/s
+       # priority =3D 130000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.server_cpu
+       # title =3D NetData CPU usage (netdata.server_cpu)
+       # dim user name =3D user
+       # dim user algorithm =3D incremental
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1000
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1000
+
+[netdata.clients]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.clients
+       # chart type =3D line
+       # type =3D netdata
+       # family =3D netdata
+       # context =3D netdata.clients
+       # units =3D connected clients
+       # priority =3D 131000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.clients
+       # title =3D NetData Web Clients (netdata.clients)
+       # dim clients name =3D clients
+       # dim clients algorithm =3D absolute
+       # dim clients multiplier =3D 1
+       # dim clients divisor =3D 1
+
+[netdata.requests]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.requests
+       # chart type =3D line
+       # type =3D netdata
+       # family =3D netdata
+       # context =3D netdata.requests
+       # units =3D requests/s
+       # priority =3D 131100
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.requests
+       # title =3D NetData Web Requests (netdata.requests)
+       # dim requests name =3D requests
+       # dim requests algorithm =3D incremental
+       # dim requests multiplier =3D 1
+       # dim requests divisor =3D 1
+
+[netdata.net]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.net
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D netdata
+       # context =3D netdata.net
+       # units =3D kilobits/s
+       # priority =3D 131200
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.net
+       # title =3D NetData Network Traffic (netdata.net)
+       # dim in name =3D in
+       # dim in algorithm =3D incremental
+       # dim in multiplier =3D 8
+       # dim in divisor =3D 1024
+       # dim out name =3D out
+       # dim out algorithm =3D incremental
+       # dim out multiplier =3D -8
+       # dim out divisor =3D 1024
+
+[apps.cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.cpu
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D cpu
+       # context =3D apps.cpu
+       # units =3D cpu time %
+       # priority =3D 20001
+       # gap when lost iterations above =3D 1
+       # name =3D apps.cpu
+       # title =3D Apps CPU Time (200% =3D 2 cores) (apps.cpu)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 100
+       # dim other divisor =3D 100
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 100
+       # dim ksmd divisor =3D 100
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 100
+       # dim system divisor =3D 100
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 100
+       # dim netdata divisor =3D 100
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 100
+       # dim kernel divisor =3D 100
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 100
+       # dim cron divisor =3D 100
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 100
+       # dim inetd divisor =3D 100
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 100
+       # dim nms divisor =3D 100
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 100
+       # dim log divisor =3D 100
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 100
+       # dim ntp divisor =3D 100
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 100
+       # dim named divisor =3D 100
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 100
+       # dim ssh divisor =3D 100
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 100
+       # dim nfs divisor =3D 100
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 100
+       # dim nginx divisor =3D 100
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 100
+       # dim postfix divisor =3D 100
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 100
+       # dim mysql divisor =3D 100
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 100
+       # dim rsync divisor =3D 100
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 100
+       # dim compile divisor =3D 100
+
+[apps.mem]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.mem
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D mem
+       # context =3D apps.mem
+       # units =3D MB
+       # priority =3D 20003
+       # gap when lost iterations above =3D 1
+       # name =3D apps.mem
+       # title =3D Apps Dedicated Memory (w/o shared) (apps.mem)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 4096
+       # dim other divisor =3D 1048576
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 4096
+       # dim ksmd divisor =3D 1048576
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 4096
+       # dim system divisor =3D 1048576
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 4096
+       # dim netdata divisor =3D 1048576
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 4096
+       # dim kernel divisor =3D 1048576
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 4096
+       # dim cron divisor =3D 1048576
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 4096
+       # dim inetd divisor =3D 1048576
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 4096
+       # dim nms divisor =3D 1048576
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 4096
+       # dim log divisor =3D 1048576
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 4096
+       # dim ntp divisor =3D 1048576
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 4096
+       # dim named divisor =3D 1048576
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 4096
+       # dim ssh divisor =3D 1048576
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 4096
+       # dim nfs divisor =3D 1048576
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 4096
+       # dim nginx divisor =3D 1048576
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 4096
+       # dim postfix divisor =3D 1048576
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 4096
+       # dim mysql divisor =3D 1048576
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 4096
+       # dim rsync divisor =3D 1048576
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 4096
+       # dim compile divisor =3D 1048576
+
+[apps.threads]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.threads
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D processes
+       # context =3D apps.threads
+       # units =3D threads
+       # priority =3D 20005
+       # gap when lost iterations above =3D 1
+       # name =3D apps.threads
+       # title =3D Apps Threads (apps.threads)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.processes]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.processes
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D processes
+       # context =3D apps.processes
+       # units =3D processes
+       # priority =3D 20004
+       # gap when lost iterations above =3D 1
+       # name =3D apps.processes
+       # title =3D Apps Processes (apps.processes)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.cpu_user]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.cpu_user
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D cpu
+       # context =3D apps.cpu_user
+       # units =3D cpu time %
+       # priority =3D 20020
+       # gap when lost iterations above =3D 1
+       # name =3D apps.cpu_user
+       # title =3D Apps CPU User Time (200% =3D 2 cores) (apps.cpu_user)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 100
+       # dim other divisor =3D 200
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 100
+       # dim ksmd divisor =3D 200
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 100
+       # dim system divisor =3D 200
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 100
+       # dim netdata divisor =3D 200
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 100
+       # dim kernel divisor =3D 200
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 100
+       # dim cron divisor =3D 200
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 100
+       # dim inetd divisor =3D 200
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 100
+       # dim nms divisor =3D 200
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 100
+       # dim log divisor =3D 200
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 100
+       # dim ntp divisor =3D 200
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 100
+       # dim named divisor =3D 200
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 100
+       # dim ssh divisor =3D 200
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 100
+       # dim nfs divisor =3D 200
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 100
+       # dim nginx divisor =3D 200
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 100
+       # dim postfix divisor =3D 200
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 100
+       # dim mysql divisor =3D 200
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 100
+       # dim rsync divisor =3D 200
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 100
+       # dim compile divisor =3D 200
+
+[apps.cpu_system]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.cpu_system
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D cpu
+       # context =3D apps.cpu_system
+       # units =3D cpu time %
+       # priority =3D 20021
+       # gap when lost iterations above =3D 1
+       # name =3D apps.cpu_system
+       # title =3D Apps CPU System Time (200% =3D 2 cores) (apps.cpu_syste=
m)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 100
+       # dim other divisor =3D 200
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 100
+       # dim ksmd divisor =3D 200
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 100
+       # dim system divisor =3D 200
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 100
+       # dim netdata divisor =3D 200
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 100
+       # dim kernel divisor =3D 200
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 100
+       # dim cron divisor =3D 200
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 100
+       # dim inetd divisor =3D 200
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 100
+       # dim nms divisor =3D 200
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 100
+       # dim log divisor =3D 200
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 100
+       # dim ntp divisor =3D 200
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 100
+       # dim named divisor =3D 200
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 100
+       # dim ssh divisor =3D 200
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 100
+       # dim nfs divisor =3D 200
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 100
+       # dim nginx divisor =3D 200
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 100
+       # dim postfix divisor =3D 200
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 100
+       # dim mysql divisor =3D 200
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 100
+       # dim rsync divisor =3D 200
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 100
+       # dim compile divisor =3D 200
+
+[apps.major_faults]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.major_faults
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D swap
+       # context =3D apps.major_faults
+       # units =3D page faults/s
+       # priority =3D 20010
+       # gap when lost iterations above =3D 1
+       # name =3D apps.major_faults
+       # title =3D Apps Major Page Faults (swap read) (apps.major_faults)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.minor_faults]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/apps.minor_faults
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D mem
+       # context =3D apps.minor_faults
+       # units =3D page faults/s
+       # priority =3D 20011
+       # gap when lost iterations above =3D 1
+       # name =3D apps.minor_faults
+       # title =3D Apps Minor Page Faults (apps.minor_faults)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.lreads]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.lreads
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D disk
+       # context =3D apps.lreads
+       # units =3D kilobytes/s
+       # priority =3D 20042
+       # gap when lost iterations above =3D 1
+       # name =3D apps.lreads
+       # title =3D Apps Disk Logical Reads (apps.lreads)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1024
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1024
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1024
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1024
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1024
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1024
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1024
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1024
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1024
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1024
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1024
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1024
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1024
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1024
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1024
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1024
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1024
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1024
+
+[apps.lwrites]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.lwrites
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D disk
+       # context =3D apps.lwrites
+       # units =3D kilobytes/s
+       # priority =3D 20042
+       # gap when lost iterations above =3D 1
+       # name =3D apps.lwrites
+       # title =3D Apps I/O Logical Writes (apps.lwrites)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1024
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1024
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1024
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1024
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1024
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1024
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1024
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1024
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1024
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1024
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1024
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1024
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1024
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1024
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1024
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1024
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1024
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1024
+
+[apps.preads]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.preads
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D disk
+       # context =3D apps.preads
+       # units =3D kilobytes/s
+       # priority =3D 20002
+       # gap when lost iterations above =3D 1
+       # name =3D apps.preads
+       # title =3D Apps Disk Reads (apps.preads)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1024
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1024
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1024
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1024
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1024
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1024
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1024
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1024
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1024
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1024
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1024
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1024
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1024
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1024
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1024
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1024
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1024
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1024
+
+[apps.pwrites]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.pwrites
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D disk
+       # context =3D apps.pwrites
+       # units =3D kilobytes/s
+       # priority =3D 20002
+       # gap when lost iterations above =3D 1
+       # name =3D apps.pwrites
+       # title =3D Apps Disk Writes (apps.pwrites)
+       # dim other name =3D other
+       # dim other algorithm =3D incremental
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1024
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D incremental
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1024
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1024
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D incremental
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1024
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D incremental
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1024
+       # dim cron name =3D cron
+       # dim cron algorithm =3D incremental
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1024
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D incremental
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1024
+       # dim nms name =3D nms
+       # dim nms algorithm =3D incremental
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1024
+       # dim log name =3D log
+       # dim log algorithm =3D incremental
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1024
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D incremental
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1024
+       # dim named name =3D named
+       # dim named algorithm =3D incremental
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1024
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D incremental
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1024
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D incremental
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1024
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D incremental
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1024
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D incremental
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1024
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D incremental
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1024
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D incremental
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1024
+       # dim compile name =3D compile
+       # dim compile algorithm =3D incremental
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1024
+
+[apps.files]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.files
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D disk
+       # context =3D apps.files
+       # units =3D open files
+       # priority =3D 20050
+       # gap when lost iterations above =3D 1
+       # name =3D apps.files
+       # title =3D Apps Open Files (apps.files)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.sockets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.sockets
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D net
+       # context =3D apps.sockets
+       # units =3D open sockets
+       # priority =3D 20051
+       # gap when lost iterations above =3D 1
+       # name =3D apps.sockets
+       # title =3D Apps Open Sockets (apps.sockets)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[apps.pipes]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/apps.pipes
+       # chart type =3D stacked
+       # type =3D apps
+       # family =3D processes
+       # context =3D apps.pipes
+       # units =3D open pipes
+       # priority =3D 20053
+       # gap when lost iterations above =3D 1
+       # name =3D apps.pipes
+       # title =3D Apps Pipes (apps.pipes)
+       # dim other name =3D other
+       # dim other algorithm =3D absolute
+       # dim other multiplier =3D 1
+       # dim other divisor =3D 1
+       # dim ksmd name =3D ksmd
+       # dim ksmd algorithm =3D absolute
+       # dim ksmd multiplier =3D 1
+       # dim ksmd divisor =3D 1
+       # dim system name =3D system
+       # dim system algorithm =3D absolute
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1
+       # dim netdata name =3D netdata
+       # dim netdata algorithm =3D absolute
+       # dim netdata multiplier =3D 1
+       # dim netdata divisor =3D 1
+       # dim kernel name =3D kernel
+       # dim kernel algorithm =3D absolute
+       # dim kernel multiplier =3D 1
+       # dim kernel divisor =3D 1
+       # dim cron name =3D cron
+       # dim cron algorithm =3D absolute
+       # dim cron multiplier =3D 1
+       # dim cron divisor =3D 1
+       # dim inetd name =3D inetd
+       # dim inetd algorithm =3D absolute
+       # dim inetd multiplier =3D 1
+       # dim inetd divisor =3D 1
+       # dim nms name =3D nms
+       # dim nms algorithm =3D absolute
+       # dim nms multiplier =3D 1
+       # dim nms divisor =3D 1
+       # dim log name =3D log
+       # dim log algorithm =3D absolute
+       # dim log multiplier =3D 1
+       # dim log divisor =3D 1
+       # dim ntp name =3D ntp
+       # dim ntp algorithm =3D absolute
+       # dim ntp multiplier =3D 1
+       # dim ntp divisor =3D 1
+       # dim named name =3D named
+       # dim named algorithm =3D absolute
+       # dim named multiplier =3D 1
+       # dim named divisor =3D 1
+       # dim ssh name =3D ssh
+       # dim ssh algorithm =3D absolute
+       # dim ssh multiplier =3D 1
+       # dim ssh divisor =3D 1
+       # dim nfs name =3D nfs
+       # dim nfs algorithm =3D absolute
+       # dim nfs multiplier =3D 1
+       # dim nfs divisor =3D 1
+       # dim nginx name =3D nginx
+       # dim nginx algorithm =3D absolute
+       # dim nginx multiplier =3D 1
+       # dim nginx divisor =3D 1
+       # dim postfix name =3D postfix
+       # dim postfix algorithm =3D absolute
+       # dim postfix multiplier =3D 1
+       # dim postfix divisor =3D 1
+       # dim mysql name =3D mysql
+       # dim mysql algorithm =3D absolute
+       # dim mysql multiplier =3D 1
+       # dim mysql divisor =3D 1
+       # dim rsync name =3D rsync
+       # dim rsync algorithm =3D absolute
+       # dim rsync multiplier =3D 1
+       # dim rsync divisor =3D 1
+       # dim compile name =3D compile
+       # dim compile algorithm =3D absolute
+       # dim compile multiplier =3D 1
+       # dim compile divisor =3D 1
+
+[netdata.apps_cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.apps_cpu
+       # chart type =3D stacked
+       # type =3D netdata
+       # family =3D apps.plugin
+       # context =3D netdata.apps_cpu
+       # units =3D milliseconds/s
+       # priority =3D 140000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.apps_cpu
+       # title =3D Apps Plugin CPU (netdata.apps_cpu)
+       # dim user name =3D user
+       # dim user algorithm =3D incremental
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1000
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1000
+
+[netdata.apps_files]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.apps_files
+       # chart type =3D line
+       # type =3D netdata
+       # family =3D apps.plugin
+       # context =3D netdata.apps_files
+       # units =3D files/s
+       # priority =3D 140001
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.apps_files
+       # title =3D Apps Plugin Files (netdata.apps_files)
+       # dim files name =3D files
+       # dim files algorithm =3D incremental
+       # dim files multiplier =3D 1
+       # dim files divisor =3D 1
+       # dim pids name =3D pids
+       # dim pids algorithm =3D absolute
+       # dim pids multiplier =3D 1
+       # dim pids divisor =3D 1
+       # dim fds name =3D fds
+       # dim fds algorithm =3D absolute
+       # dim fds multiplier =3D 1
+       # dim fds divisor =3D 1
+       # dim targets name =3D targets
+       # dim targets algorithm =3D absolute
+       # dim targets multiplier =3D 1
+       # dim targets divisor =3D 1
+
+[netdata.plugin_tc_cpu]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.plugin_tc_cpu
+       # chart type =3D stacked
+       # type =3D netdata
+       # family =3D tc.helper
+       # context =3D netdata.plugin_tc_cpu
+       # units =3D milliseconds/s
+       # priority =3D 135000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_tc_cpu
+       # title =3D NetData TC CPU usage (netdata.plugin_tc_cpu)
+       # dim user name =3D user
+       # dim user algorithm =3D incremental
+       # dim user multiplier =3D 1
+       # dim user divisor =3D 1000
+       # dim system name =3D system
+       # dim system algorithm =3D incremental
+       # dim system multiplier =3D 1
+       # dim system divisor =3D 1000
+
+[netdata.plugin_tc_time]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.plugin_tc_time
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D tc.helper
+       # context =3D netdata.plugin_tc_time
+       # units =3D milliseconds/run
+       # priority =3D 135001
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_tc_time
+       # title =3D NetData TC script execution (netdata.plugin_tc_time)
+       # dim run_time name =3D run time
+       # dim run_time algorithm =3D absolute
+       # dim run_time multiplier =3D 1
+       # dim run_time divisor =3D 1
+
+[example.random]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/example.random
+       # chart type =3D stacked
+       # type =3D example
+       # family =3D random
+       # context =3D random
+       # units =3D % of random numbers
+       # priority =3D 150000
+       # gap when lost iterations above =3D 1
+       # name =3D example.random
+       # title =3D Random Numbers Stacked Chart (example.random)
+       # dim random1 name =3D random1
+       # dim random1 algorithm =3D percentage-of-absolute-row
+       # dim random1 multiplier =3D 1
+       # dim random1 divisor =3D 1
+       # dim random2 name =3D random2
+       # dim random2 algorithm =3D percentage-of-absolute-row
+       # dim random2 multiplier =3D 1
+       # dim random2 divisor =3D 1
+       # dim random3 name =3D random3
+       # dim random3 algorithm =3D percentage-of-absolute-row
+       # dim random3 multiplier =3D 1
+       # dim random3 divisor =3D 1
+
+[postfix.qemails]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/postfix.qemails
+       # chart type =3D line
+       # type =3D postfix
+       # family =3D queue
+       # context =3D postfix.queued.emails
+       # units =3D emails
+       # priority =3D 60001
+       # gap when lost iterations above =3D 1
+       # name =3D postfix.qemails
+       # title =3D Postfix Queue Emails (postfix.qemails)
+       # dim emails name =3D emails
+       # dim emails algorithm =3D absolute
+       # dim emails multiplier =3D 1
+       # dim emails divisor =3D 1
+
+[postfix.qsize]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/postfix.qsize
+       # chart type =3D area
+       # type =3D postfix
+       # family =3D queue
+       # context =3D postfix.queued.size
+       # units =3D emails size in KB
+       # priority =3D 60002
+       # gap when lost iterations above =3D 1
+       # name =3D postfix.qsize
+       # title =3D Postfix Queue Emails Size (postfix.qsize)
+       # dim size name =3D size
+       # dim size algorithm =3D absolute
+       # dim size multiplier =3D 1
+       # dim size divisor =3D 1
+
+[disk_await.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_await.sda
+       # chart type =3D line
+       # type =3D disk_await
+       # family =3D sda
+       # context =3D disk.await
+       # units =3D ms per operation
+       # priority =3D 2005
+       # gap when lost iterations above =3D 1
+       # name =3D disk_await.sda
+       # title =3D Average Completed I/O Operation Time (disk_await.sda)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D absolute
+       # dim reads multiplier =3D 1
+       # dim reads divisor =3D 1
+       # dim writes name =3D writes
+       # dim writes algorithm =3D absolute
+       # dim writes multiplier =3D -1
+       # dim writes divisor =3D 1
+
+[disk_avgsz.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_avgsz.sda
+       # chart type =3D area
+       # type =3D disk_avgsz
+       # family =3D sda
+       # context =3D disk.avgsz
+       # units =3D kilobytes per operation
+       # priority =3D 2006
+       # gap when lost iterations above =3D 1
+       # name =3D disk_avgsz.sda
+       # title =3D Average Completed I/O Operation Bandwidth (disk_avgsz.s=
da)
+       # dim reads name =3D reads
+       # dim reads algorithm =3D absolute
+       # dim reads multiplier =3D 512
+       # dim reads divisor =3D 1024
+       # dim writes name =3D writes
+       # dim writes algorithm =3D absolute
+       # dim writes multiplier =3D -512
+       # dim writes divisor =3D 1024
+
+[disk_svctm.sda]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/disk_svctm.sda
+       # chart type =3D line
+       # type =3D disk_svctm
+       # family =3D sda
+       # context =3D disk.svctm
+       # units =3D ms per operation
+       # priority =3D 2007
+       # gap when lost iterations above =3D 1
+       # name =3D disk_svctm.sda
+       # title =3D Average Service Time (disk_svctm.sda)
+       # dim svctm name =3D svctm
+       # dim svctm algorithm =3D absolute
+       # dim svctm multiplier =3D 1
+       # dim svctm divisor =3D 1
+
+[tc.eth1-ifb]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/tc.eth1_ifb
+       # chart type =3D stacked
+       # type =3D tc
+       # family =3D eth1
+       # context =3D tc.qos
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D tc.mng_in
+       # title =3D Class Usage (tc.mng_in)
+       # dim 1:18 name =3D client
+       # dim 1:18 algorithm =3D incremental
+       # dim 1:18 multiplier =3D 8
+       # dim 1:18 divisor =3D 1024
+       # dim 1:19 name =3D nms
+       # dim 1:19 algorithm =3D incremental
+       # dim 1:19 multiplier =3D 8
+       # dim 1:19 divisor =3D 1024
+       # dim 1:8000 name =3D default
+       # dim 1:8000 algorithm =3D incremental
+       # dim 1:8000 multiplier =3D 8
+       # dim 1:8000 divisor =3D 1024
+       # dim 1:16 name =3D rsync
+       # dim 1:16 algorithm =3D incremental
+       # dim 1:16 multiplier =3D 8
+       # dim 1:16 divisor =3D 1024
+       # dim 1:17 name =3D web_server
+       # dim 1:17 algorithm =3D incremental
+       # dim 1:17 multiplier =3D 8
+       # dim 1:17 divisor =3D 1024
+       # dim 1:14 name =3D ntp
+       # dim 1:14 algorithm =3D incremental
+       # dim 1:14 multiplier =3D 8
+       # dim 1:14 divisor =3D 1024
+       # dim 1:15 name =3D ssh
+       # dim 1:15 algorithm =3D incremental
+       # dim 1:15 multiplier =3D 8
+       # dim 1:15 divisor =3D 1024
+       # dim 1:12 name =3D icmp
+       # dim 1:12 algorithm =3D incremental
+       # dim 1:12 multiplier =3D 8
+       # dim 1:12 divisor =3D 1024
+       # dim 1:13 name =3D dns
+       # dim 1:13 algorithm =3D incremental
+       # dim 1:13 multiplier =3D 8
+       # dim 1:13 divisor =3D 1024
+       # dim 1:11 name =3D arp
+       # dim 1:11 algorithm =3D incremental
+       # dim 1:11 multiplier =3D 8
+       # dim 1:11 divisor =3D 1024
+
+[tc.eth0]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/tc.eth0
+       # chart type =3D stacked
+       # type =3D tc
+       # family =3D eth0
+       # context =3D tc.qos
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D tc.world_out
+       # title =3D Class Usage (tc.world_out)
+       # dim 1:18 name =3D client
+       # dim 1:18 algorithm =3D incremental
+       # dim 1:18 multiplier =3D 8
+       # dim 1:18 divisor =3D 1024
+       # dim 1:19 name =3D nms
+       # dim 1:19 algorithm =3D incremental
+       # dim 1:19 multiplier =3D 8
+       # dim 1:19 divisor =3D 1024
+       # dim 1:8000 name =3D default
+       # dim 1:8000 algorithm =3D incremental
+       # dim 1:8000 multiplier =3D 8
+       # dim 1:8000 divisor =3D 1024
+       # dim 1:16 name =3D rsync
+       # dim 1:16 algorithm =3D incremental
+       # dim 1:16 multiplier =3D 8
+       # dim 1:16 divisor =3D 1024
+       # dim 1:17 name =3D web_server
+       # dim 1:17 algorithm =3D incremental
+       # dim 1:17 multiplier =3D 8
+       # dim 1:17 divisor =3D 1024
+       # dim 1:14 name =3D ntp
+       # dim 1:14 algorithm =3D incremental
+       # dim 1:14 multiplier =3D 8
+       # dim 1:14 divisor =3D 1024
+       # dim 1:15 name =3D ssh
+       # dim 1:15 algorithm =3D incremental
+       # dim 1:15 multiplier =3D 8
+       # dim 1:15 divisor =3D 1024
+       # dim 1:12 name =3D icmp
+       # dim 1:12 algorithm =3D incremental
+       # dim 1:12 multiplier =3D 8
+       # dim 1:12 divisor =3D 1024
+       # dim 1:13 name =3D dns
+       # dim 1:13 algorithm =3D incremental
+       # dim 1:13 multiplier =3D 8
+       # dim 1:13 divisor =3D 1024
+       # dim 1:11 name =3D arp
+       # dim 1:11 algorithm =3D incremental
+       # dim 1:11 multiplier =3D 8
+       # dim 1:11 divisor =3D 1024
+
+[tc.eth1]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/tc.eth1
+       # chart type =3D stacked
+       # type =3D tc
+       # family =3D eth1
+       # context =3D tc.qos
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D tc.mng_out
+       # title =3D Class Usage (tc.mng_out)
+       # dim 1:18 name =3D client
+       # dim 1:18 algorithm =3D incremental
+       # dim 1:18 multiplier =3D 8
+       # dim 1:18 divisor =3D 1024
+       # dim 1:19 name =3D nms
+       # dim 1:19 algorithm =3D incremental
+       # dim 1:19 multiplier =3D 8
+       # dim 1:19 divisor =3D 1024
+       # dim 1:8000 name =3D default
+       # dim 1:8000 algorithm =3D incremental
+       # dim 1:8000 multiplier =3D 8
+       # dim 1:8000 divisor =3D 1024
+       # dim 1:16 name =3D rsync
+       # dim 1:16 algorithm =3D incremental
+       # dim 1:16 multiplier =3D 8
+       # dim 1:16 divisor =3D 1024
+       # dim 1:17 name =3D web_server
+       # dim 1:17 algorithm =3D incremental
+       # dim 1:17 multiplier =3D 8
+       # dim 1:17 divisor =3D 1024
+       # dim 1:14 name =3D ntp
+       # dim 1:14 algorithm =3D incremental
+       # dim 1:14 multiplier =3D 8
+       # dim 1:14 divisor =3D 1024
+       # dim 1:15 name =3D ssh
+       # dim 1:15 algorithm =3D incremental
+       # dim 1:15 multiplier =3D 8
+       # dim 1:15 divisor =3D 1024
+       # dim 1:12 name =3D icmp
+       # dim 1:12 algorithm =3D incremental
+       # dim 1:12 multiplier =3D 8
+       # dim 1:12 divisor =3D 1024
+       # dim 1:13 name =3D dns
+       # dim 1:13 algorithm =3D incremental
+       # dim 1:13 multiplier =3D 8
+       # dim 1:13 divisor =3D 1024
+       # dim 1:11 name =3D arp
+       # dim 1:11 algorithm =3D incremental
+       # dim 1:11 multiplier =3D 8
+       # dim 1:11 divisor =3D 1024
+
+[mem.ksm]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/mem.ksm
+       # chart type =3D area
+       # type =3D mem
+       # family =3D ksm
+       # context =3D mem.ksm
+       # units =3D MB
+       # priority =3D 5000
+       # gap when lost iterations above =3D 1
+       # name =3D mem.ksm
+       # title =3D Kernel Same Page Merging (mem.ksm)
+       # dim shared name =3D shared
+       # dim shared algorithm =3D absolute
+       # dim shared multiplier =3D 1
+       # dim shared divisor =3D 1048576
+       # dim unshared name =3D unshared
+       # dim unshared algorithm =3D absolute
+       # dim unshared multiplier =3D -1
+       # dim unshared divisor =3D 1048576
+       # dim sharing name =3D sharing
+       # dim sharing algorithm =3D absolute
+       # dim sharing multiplier =3D 1
+       # dim sharing divisor =3D 1048576
+       # dim volatile name =3D volatile
+       # dim volatile algorithm =3D absolute
+       # dim volatile multiplier =3D -1
+       # dim volatile divisor =3D 1048576
+       # dim to_scan name =3D to scan
+       # dim to_scan algorithm =3D absolute
+       # dim to_scan multiplier =3D -1
+       # dim to_scan divisor =3D 1048576
+
+[mem.ksm_savings]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/mem.ksm_savings
+       # chart type =3D area
+       # type =3D mem
+       # family =3D ksm
+       # context =3D mem.ksm_savings
+       # units =3D MB
+       # priority =3D 5001
+       # gap when lost iterations above =3D 1
+       # name =3D mem.ksm_savings
+       # title =3D Kernel Same Page Merging Savings (mem.ksm_savings)
+       # dim savings name =3D savings
+       # dim savings algorithm =3D absolute
+       # dim savings multiplier =3D -1
+       # dim savings divisor =3D 1048576
+       # dim offered name =3D offered
+       # dim offered algorithm =3D absolute
+       # dim offered multiplier =3D 1
+       # dim offered divisor =3D 1048576
+
+[mem.ksm_ratios]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/mem.ksm_ratios
+       # chart type =3D line
+       # type =3D mem
+       # family =3D ksm
+       # context =3D mem.ksm_ratios
+       # units =3D percentage
+       # priority =3D 5002
+       # gap when lost iterations above =3D 1
+       # name =3D mem.ksm_ratios
+       # title =3D Kernel Same Page Merging Effectiveness (mem.ksm_ratios)
+       # dim savings name =3D savings
+       # dim savings algorithm =3D absolute
+       # dim savings multiplier =3D 1
+       # dim savings divisor =3D 10000
+
+[system.load]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.load
+       # chart type =3D line
+       # type =3D system
+       # family =3D load
+       # context =3D system.load
+       # units =3D load
+       # priority =3D 100
+       # gap when lost iterations above =3D 1
+       # name =3D system.load
+       # title =3D System Load Average (system.load)
+       # dim load1 name =3D load1
+       # dim load1 algorithm =3D absolute
+       # dim load1 multiplier =3D 1
+       # dim load1 divisor =3D 1000
+       # dim load5 name =3D load5
+       # dim load5 algorithm =3D absolute
+       # dim load5 multiplier =3D 1
+       # dim load5 divisor =3D 1000
+       # dim load15 name =3D load15
+       # dim load15 algorithm =3D absolute
+       # dim load15 multiplier =3D 1
+       # dim load15 divisor =3D 1000
+
+[tc.eth0-ifb]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/tc.eth0_ifb
+       # chart type =3D stacked
+       # type =3D tc
+       # family =3D eth0
+       # context =3D tc.qos
+       # units =3D kilobits/s
+       # priority =3D 7000
+       # gap when lost iterations above =3D 1
+       # name =3D tc.world_in
+       # title =3D Class Usage (tc.world_in)
+       # dim 1:18 name =3D client
+       # dim 1:18 algorithm =3D incremental
+       # dim 1:18 multiplier =3D 8
+       # dim 1:18 divisor =3D 1024
+       # dim 1:19 name =3D nms
+       # dim 1:19 algorithm =3D incremental
+       # dim 1:19 multiplier =3D 8
+       # dim 1:19 divisor =3D 1024
+       # dim 1:8000 name =3D default
+       # dim 1:8000 algorithm =3D incremental
+       # dim 1:8000 multiplier =3D 8
+       # dim 1:8000 divisor =3D 1024
+       # dim 1:16 name =3D rsync
+       # dim 1:16 algorithm =3D incremental
+       # dim 1:16 multiplier =3D 8
+       # dim 1:16 divisor =3D 1024
+       # dim 1:17 name =3D web_server
+       # dim 1:17 algorithm =3D incremental
+       # dim 1:17 multiplier =3D 8
+       # dim 1:17 divisor =3D 1024
+       # dim 1:14 name =3D ntp
+       # dim 1:14 algorithm =3D incremental
+       # dim 1:14 multiplier =3D 8
+       # dim 1:14 divisor =3D 1024
+       # dim 1:15 name =3D ssh
+       # dim 1:15 algorithm =3D incremental
+       # dim 1:15 multiplier =3D 8
+       # dim 1:15 divisor =3D 1024
+       # dim 1:12 name =3D icmp
+       # dim 1:12 algorithm =3D incremental
+       # dim 1:12 multiplier =3D 8
+       # dim 1:12 divisor =3D 1024
+       # dim 1:13 name =3D dns
+       # dim 1:13 algorithm =3D incremental
+       # dim 1:13 multiplier =3D 8
+       # dim 1:13 divisor =3D 1024
+       # dim 1:11 name =3D arp
+       # dim 1:11 algorithm =3D incremental
+       # dim 1:11 multiplier =3D 8
+       # dim 1:11 divisor =3D 1024
+
+[system.active_processes]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.active_processes
+       # chart type =3D line
+       # type =3D system
+       # family =3D processes
+       # context =3D system.active_processes
+       # units =3D processes
+       # priority =3D 750
+       # gap when lost iterations above =3D 1
+       # name =3D system.active_processes
+       # title =3D System Active Processes (system.active_processes)
+       # dim active name =3D active
+       # dim active algorithm =3D absolute
+       # dim active multiplier =3D 1
+       # dim active divisor =3D 1
+
+[cpu.cpu0_interrupts]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu0_interrupts
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D interrupts
+       # context =3D cpu.interrupts
+       # units =3D interrupts/s
+       # priority =3D 2000
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu0_interrupts
+       # title =3D CPU0 Interrupts (cpu.cpu0_interrupts)
+       # dim 0 name =3D timer_0
+       # dim 0 algorithm =3D incremental
+       # dim 0 multiplier =3D 1
+       # dim 0 divisor =3D 1
+       # dim 1 name =3D i8042_1
+       # dim 1 algorithm =3D incremental
+       # dim 1 multiplier =3D 1
+       # dim 1 divisor =3D 1
+       # dim 6 name =3D floppy_6
+       # dim 6 algorithm =3D incremental
+       # dim 6 multiplier =3D 1
+       # dim 6 divisor =3D 1
+       # dim 8 name =3D rtc0_8
+       # dim 8 algorithm =3D incremental
+       # dim 8 multiplier =3D 1
+       # dim 8 divisor =3D 1
+       # dim 9 name =3D acpi_9
+       # dim 9 algorithm =3D incremental
+       # dim 9 multiplier =3D 1
+       # dim 9 divisor =3D 1
+       # dim 12 name =3D i8042_12
+       # dim 12 algorithm =3D incremental
+       # dim 12 multiplier =3D 1
+       # dim 12 divisor =3D 1
+       # dim 14 name =3D ata_piix_14
+       # dim 14 algorithm =3D incremental
+       # dim 14 multiplier =3D 1
+       # dim 14 divisor =3D 1
+       # dim 15 name =3D ata_piix_15
+       # dim 15 algorithm =3D incremental
+       # dim 15 multiplier =3D 1
+       # dim 15 divisor =3D 1
+       # dim NMI name =3D NMI
+       # dim NMI algorithm =3D incremental
+       # dim NMI multiplier =3D 1
+       # dim NMI divisor =3D 1
+       # dim LOC name =3D LOC
+       # dim LOC algorithm =3D incremental
+       # dim LOC multiplier =3D 1
+       # dim LOC divisor =3D 1
+       # dim SPU name =3D SPU
+       # dim SPU algorithm =3D incremental
+       # dim SPU multiplier =3D 1
+       # dim SPU divisor =3D 1
+       # dim PMI name =3D PMI
+       # dim PMI algorithm =3D incremental
+       # dim PMI multiplier =3D 1
+       # dim PMI divisor =3D 1
+       # dim IWI name =3D IWI
+       # dim IWI algorithm =3D incremental
+       # dim IWI multiplier =3D 1
+       # dim IWI divisor =3D 1
+       # dim RTR name =3D RTR
+       # dim RTR algorithm =3D incremental
+       # dim RTR multiplier =3D 1
+       # dim RTR divisor =3D 1
+       # dim RES name =3D RES
+       # dim RES algorithm =3D incremental
+       # dim RES multiplier =3D 1
+       # dim RES divisor =3D 1
+       # dim CAL name =3D CAL
+       # dim CAL algorithm =3D incremental
+       # dim CAL multiplier =3D 1
+       # dim CAL divisor =3D 1
+       # dim TLB name =3D TLB
+       # dim TLB algorithm =3D incremental
+       # dim TLB multiplier =3D 1
+       # dim TLB divisor =3D 1
+       # dim TRM name =3D TRM
+       # dim TRM algorithm =3D incremental
+       # dim TRM multiplier =3D 1
+       # dim TRM divisor =3D 1
+       # dim THR name =3D THR
+       # dim THR algorithm =3D incremental
+       # dim THR multiplier =3D 1
+       # dim THR divisor =3D 1
+       # dim MCE name =3D MCE
+       # dim MCE algorithm =3D incremental
+       # dim MCE multiplier =3D 1
+       # dim MCE divisor =3D 1
+       # dim MCP name =3D MCP
+       # dim MCP algorithm =3D incremental
+       # dim MCP multiplier =3D 1
+       # dim MCP divisor =3D 1
+       # dim HYP name =3D HYP
+       # dim HYP algorithm =3D incremental
+       # dim HYP multiplier =3D 1
+       # dim HYP divisor =3D 1
+       # dim ERR name =3D ERR
+       # dim ERR algorithm =3D incremental
+       # dim ERR multiplier =3D 1
+       # dim ERR divisor =3D 1
+       # dim MIS name =3D MIS
+       # dim MIS algorithm =3D incremental
+       # dim MIS multiplier =3D 1
+       # dim MIS divisor =3D 1
+
+[cpu.cpu1_interrupts]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu1_interrupts
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D interrupts
+       # context =3D cpu.interrupts
+       # units =3D interrupts/s
+       # priority =3D 2001
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu1_interrupts
+       # title =3D CPU1 Interrupts (cpu.cpu1_interrupts)
+       # dim 0 name =3D timer_0
+       # dim 0 algorithm =3D incremental
+       # dim 0 multiplier =3D 1
+       # dim 0 divisor =3D 1
+       # dim 1 name =3D i8042_1
+       # dim 1 algorithm =3D incremental
+       # dim 1 multiplier =3D 1
+       # dim 1 divisor =3D 1
+       # dim 6 name =3D floppy_6
+       # dim 6 algorithm =3D incremental
+       # dim 6 multiplier =3D 1
+       # dim 6 divisor =3D 1
+       # dim 8 name =3D rtc0_8
+       # dim 8 algorithm =3D incremental
+       # dim 8 multiplier =3D 1
+       # dim 8 divisor =3D 1
+       # dim 9 name =3D acpi_9
+       # dim 9 algorithm =3D incremental
+       # dim 9 multiplier =3D 1
+       # dim 9 divisor =3D 1
+       # dim 12 name =3D i8042_12
+       # dim 12 algorithm =3D incremental
+       # dim 12 multiplier =3D 1
+       # dim 12 divisor =3D 1
+       # dim 14 name =3D ata_piix_14
+       # dim 14 algorithm =3D incremental
+       # dim 14 multiplier =3D 1
+       # dim 14 divisor =3D 1
+       # dim 15 name =3D ata_piix_15
+       # dim 15 algorithm =3D incremental
+       # dim 15 multiplier =3D 1
+       # dim 15 divisor =3D 1
+       # dim NMI name =3D NMI
+       # dim NMI algorithm =3D incremental
+       # dim NMI multiplier =3D 1
+       # dim NMI divisor =3D 1
+       # dim LOC name =3D LOC
+       # dim LOC algorithm =3D incremental
+       # dim LOC multiplier =3D 1
+       # dim LOC divisor =3D 1
+       # dim SPU name =3D SPU
+       # dim SPU algorithm =3D incremental
+       # dim SPU multiplier =3D 1
+       # dim SPU divisor =3D 1
+       # dim PMI name =3D PMI
+       # dim PMI algorithm =3D incremental
+       # dim PMI multiplier =3D 1
+       # dim PMI divisor =3D 1
+       # dim IWI name =3D IWI
+       # dim IWI algorithm =3D incremental
+       # dim IWI multiplier =3D 1
+       # dim IWI divisor =3D 1
+       # dim RTR name =3D RTR
+       # dim RTR algorithm =3D incremental
+       # dim RTR multiplier =3D 1
+       # dim RTR divisor =3D 1
+       # dim RES name =3D RES
+       # dim RES algorithm =3D incremental
+       # dim RES multiplier =3D 1
+       # dim RES divisor =3D 1
+       # dim CAL name =3D CAL
+       # dim CAL algorithm =3D incremental
+       # dim CAL multiplier =3D 1
+       # dim CAL divisor =3D 1
+       # dim TLB name =3D TLB
+       # dim TLB algorithm =3D incremental
+       # dim TLB multiplier =3D 1
+       # dim TLB divisor =3D 1
+       # dim TRM name =3D TRM
+       # dim TRM algorithm =3D incremental
+       # dim TRM multiplier =3D 1
+       # dim TRM divisor =3D 1
+       # dim THR name =3D THR
+       # dim THR algorithm =3D incremental
+       # dim THR multiplier =3D 1
+       # dim THR divisor =3D 1
+       # dim MCE name =3D MCE
+       # dim MCE algorithm =3D incremental
+       # dim MCE multiplier =3D 1
+       # dim MCE divisor =3D 1
+       # dim MCP name =3D MCP
+       # dim MCP algorithm =3D incremental
+       # dim MCP multiplier =3D 1
+       # dim MCP divisor =3D 1
+       # dim HYP name =3D HYP
+       # dim HYP algorithm =3D incremental
+       # dim HYP multiplier =3D 1
+       # dim HYP divisor =3D 1
+       # dim ERR name =3D ERR
+       # dim ERR algorithm =3D incremental
+       # dim ERR multiplier =3D 1
+       # dim ERR divisor =3D 1
+       # dim MIS name =3D MIS
+       # dim MIS algorithm =3D incremental
+       # dim MIS multiplier =3D 1
+       # dim MIS divisor =3D 1
+
+[example.random2]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/example.random2
+       # chart type =3D area
+       # type =3D example
+       # family =3D random
+       # context =3D random
+       # units =3D random number
+       # priority =3D 150001
+       # gap when lost iterations above =3D 1
+       # name =3D example.random2
+       # title =3D A random number (example.random2)
+       # dim random name =3D random
+       # dim random algorithm =3D absolute
+       # dim random multiplier =3D 1
+       # dim random divisor =3D 1
+
+[mysql_local.net]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.net
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D bandwidth
+       # context =3D mysql.net
+       # units =3D kilobits/s
+       # priority =3D 60001
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.net
+       # title =3D mysql Bandwidth (mysql_local.net)
+       # dim Bytes_received name =3D in
+       # dim Bytes_received algorithm =3D incremental
+       # dim Bytes_received multiplier =3D 8
+       # dim Bytes_received divisor =3D 1024
+       # dim Bytes_sent name =3D out
+       # dim Bytes_sent algorithm =3D incremental
+       # dim Bytes_sent multiplier =3D -8
+       # dim Bytes_sent divisor =3D 1024
+
+[mysql_local.queries]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.queries
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D queries
+       # context =3D mysql.queries
+       # units =3D queries/s
+       # priority =3D 60002
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.queries
+       # title =3D mysql Queries (mysql_local.queries)
+       # dim Queries name =3D queries
+       # dim Queries algorithm =3D incremental
+       # dim Queries multiplier =3D 1
+       # dim Queries divisor =3D 1
+       # dim Questions name =3D questions
+       # dim Questions algorithm =3D incremental
+       # dim Questions multiplier =3D 1
+       # dim Questions divisor =3D 1
+       # dim Slow_queries name =3D slow_queries
+       # dim Slow_queries algorithm =3D incremental
+       # dim Slow_queries multiplier =3D -1
+       # dim Slow_queries divisor =3D 1
+
+[mysql_local.handlers]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.handlers
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D handlers
+       # context =3D mysql.handlers
+       # units =3D handlers/s
+       # priority =3D 60003
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.handlers
+       # title =3D mysql Handlers (mysql_local.handlers)
+       # dim Handler_commit name =3D commit
+       # dim Handler_commit algorithm =3D incremental
+       # dim Handler_commit multiplier =3D 1
+       # dim Handler_commit divisor =3D 1
+       # dim Handler_delete name =3D delete
+       # dim Handler_delete algorithm =3D incremental
+       # dim Handler_delete multiplier =3D 1
+       # dim Handler_delete divisor =3D 1
+       # dim Handler_prepare name =3D prepare
+       # dim Handler_prepare algorithm =3D incremental
+       # dim Handler_prepare multiplier =3D 1
+       # dim Handler_prepare divisor =3D 1
+       # dim Handler_read_first name =3D read_first
+       # dim Handler_read_first algorithm =3D incremental
+       # dim Handler_read_first multiplier =3D 1
+       # dim Handler_read_first divisor =3D 1
+       # dim Handler_read_key name =3D read_key
+       # dim Handler_read_key algorithm =3D incremental
+       # dim Handler_read_key multiplier =3D 1
+       # dim Handler_read_key divisor =3D 1
+       # dim Handler_read_next name =3D read_next
+       # dim Handler_read_next algorithm =3D incremental
+       # dim Handler_read_next multiplier =3D 1
+       # dim Handler_read_next divisor =3D 1
+       # dim Handler_read_prev name =3D read_prev
+       # dim Handler_read_prev algorithm =3D incremental
+       # dim Handler_read_prev multiplier =3D 1
+       # dim Handler_read_prev divisor =3D 1
+       # dim Handler_read_rnd name =3D read_rnd
+       # dim Handler_read_rnd algorithm =3D incremental
+       # dim Handler_read_rnd multiplier =3D 1
+       # dim Handler_read_rnd divisor =3D 1
+       # dim Handler_read_rnd_next name =3D read_rnd_next
+       # dim Handler_read_rnd_next algorithm =3D incremental
+       # dim Handler_read_rnd_next multiplier =3D 1
+       # dim Handler_read_rnd_next divisor =3D 1
+       # dim Handler_rollback name =3D rollback
+       # dim Handler_rollback algorithm =3D incremental
+       # dim Handler_rollback multiplier =3D 1
+       # dim Handler_rollback divisor =3D 1
+       # dim Handler_savepoint name =3D savepoint
+       # dim Handler_savepoint algorithm =3D incremental
+       # dim Handler_savepoint multiplier =3D 1
+       # dim Handler_savepoint divisor =3D 1
+       # dim Handler_savepoint_rollback name =3D savepoint_rollback
+       # dim Handler_savepoint_rollback algorithm =3D incremental
+       # dim Handler_savepoint_rollback multiplier =3D 1
+       # dim Handler_savepoint_rollback divisor =3D 1
+       # dim Handler_update name =3D update
+       # dim Handler_update algorithm =3D incremental
+       # dim Handler_update multiplier =3D 1
+       # dim Handler_update divisor =3D 1
+       # dim Handler_write name =3D write
+       # dim Handler_write algorithm =3D incremental
+       # dim Handler_write multiplier =3D 1
+       # dim Handler_write divisor =3D 1
+
+[system.softirqs]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.softirqs
+       # chart type =3D stacked
+       # type =3D system
+       # family =3D softirqs
+       # context =3D system.softirqs
+       # units =3D softirqs/s
+       # priority =3D 950
+       # gap when lost iterations above =3D 1
+       # name =3D system.softirqs
+       # title =3D System softirqs (system.softirqs)
+       # dim HI name =3D HI
+       # dim HI algorithm =3D incremental
+       # dim HI multiplier =3D 1
+       # dim HI divisor =3D 1
+       # dim TIMER name =3D TIMER
+       # dim TIMER algorithm =3D incremental
+       # dim TIMER multiplier =3D 1
+       # dim TIMER divisor =3D 1
+       # dim NET_TX name =3D NET_TX
+       # dim NET_TX algorithm =3D incremental
+       # dim NET_TX multiplier =3D 1
+       # dim NET_TX divisor =3D 1
+       # dim NET_RX name =3D NET_RX
+       # dim NET_RX algorithm =3D incremental
+       # dim NET_RX multiplier =3D 1
+       # dim NET_RX divisor =3D 1
+       # dim BLOCK name =3D BLOCK
+       # dim BLOCK algorithm =3D incremental
+       # dim BLOCK multiplier =3D 1
+       # dim BLOCK divisor =3D 1
+       # dim BLOCK_IOPOLL name =3D BLOCK_IOPOLL
+       # dim BLOCK_IOPOLL algorithm =3D incremental
+       # dim BLOCK_IOPOLL multiplier =3D 1
+       # dim BLOCK_IOPOLL divisor =3D 1
+       # dim TASKLET name =3D TASKLET
+       # dim TASKLET algorithm =3D incremental
+       # dim TASKLET multiplier =3D 1
+       # dim TASKLET divisor =3D 1
+       # dim SCHED name =3D SCHED
+       # dim SCHED algorithm =3D incremental
+       # dim SCHED multiplier =3D 1
+       # dim SCHED divisor =3D 1
+       # dim HRTIMER name =3D HRTIMER
+       # dim HRTIMER algorithm =3D incremental
+       # dim HRTIMER multiplier =3D 1
+       # dim HRTIMER divisor =3D 1
+       # dim RCU name =3D RCU
+       # dim RCU algorithm =3D incremental
+       # dim RCU multiplier =3D 1
+       # dim RCU divisor =3D 1
+
+[cpu.cpu0_softirqs]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu0_softirqs
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D softirqs
+       # context =3D cpu.softirqs
+       # units =3D softirqs/s
+       # priority =3D 3000
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu0_softirqs
+       # title =3D CPU0 softirqs (cpu.cpu0_softirqs)
+       # dim HI name =3D HI
+       # dim HI algorithm =3D incremental
+       # dim HI multiplier =3D 1
+       # dim HI divisor =3D 1
+       # dim TIMER name =3D TIMER
+       # dim TIMER algorithm =3D incremental
+       # dim TIMER multiplier =3D 1
+       # dim TIMER divisor =3D 1
+       # dim NET_TX name =3D NET_TX
+       # dim NET_TX algorithm =3D incremental
+       # dim NET_TX multiplier =3D 1
+       # dim NET_TX divisor =3D 1
+       # dim NET_RX name =3D NET_RX
+       # dim NET_RX algorithm =3D incremental
+       # dim NET_RX multiplier =3D 1
+       # dim NET_RX divisor =3D 1
+       # dim BLOCK name =3D BLOCK
+       # dim BLOCK algorithm =3D incremental
+       # dim BLOCK multiplier =3D 1
+       # dim BLOCK divisor =3D 1
+       # dim BLOCK_IOPOLL name =3D BLOCK_IOPOLL
+       # dim BLOCK_IOPOLL algorithm =3D incremental
+       # dim BLOCK_IOPOLL multiplier =3D 1
+       # dim BLOCK_IOPOLL divisor =3D 1
+       # dim TASKLET name =3D TASKLET
+       # dim TASKLET algorithm =3D incremental
+       # dim TASKLET multiplier =3D 1
+       # dim TASKLET divisor =3D 1
+       # dim SCHED name =3D SCHED
+       # dim SCHED algorithm =3D incremental
+       # dim SCHED multiplier =3D 1
+       # dim SCHED divisor =3D 1
+       # dim HRTIMER name =3D HRTIMER
+       # dim HRTIMER algorithm =3D incremental
+       # dim HRTIMER multiplier =3D 1
+       # dim HRTIMER divisor =3D 1
+       # dim RCU name =3D RCU
+       # dim RCU algorithm =3D incremental
+       # dim RCU multiplier =3D 1
+       # dim RCU divisor =3D 1
+
+[mysql_local.table_locks]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.table_locks
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D locks
+       # context =3D mysql.table_locks
+       # units =3D locks/s
+       # priority =3D 60004
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.table_locks
+       # title =3D mysql Tables Locks (mysql_local.table_locks)
+       # dim Table_locks_immediate name =3D immediate
+       # dim Table_locks_immediate algorithm =3D incremental
+       # dim Table_locks_immediate multiplier =3D 1
+       # dim Table_locks_immediate divisor =3D 1
+       # dim Table_locks_waited name =3D waited
+       # dim Table_locks_waited algorithm =3D incremental
+       # dim Table_locks_waited multiplier =3D -1
+       # dim Table_locks_waited divisor =3D 1
+
+[mysql_local.join_issues]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.join_issues
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D issues
+       # context =3D mysql.join_issues
+       # units =3D joins/s
+       # priority =3D 60005
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.join_issues
+       # title =3D mysql Select Join Issues (mysql_local.join_issues)
+       # dim Select_full_join name =3D full_join
+       # dim Select_full_join algorithm =3D incremental
+       # dim Select_full_join multiplier =3D 1
+       # dim Select_full_join divisor =3D 1
+       # dim Select_full_range_join name =3D full_range_join
+       # dim Select_full_range_join algorithm =3D incremental
+       # dim Select_full_range_join multiplier =3D 1
+       # dim Select_full_range_join divisor =3D 1
+       # dim Select_range name =3D range
+       # dim Select_range algorithm =3D incremental
+       # dim Select_range multiplier =3D 1
+       # dim Select_range divisor =3D 1
+       # dim Select_range_check name =3D range_check
+       # dim Select_range_check algorithm =3D incremental
+       # dim Select_range_check multiplier =3D 1
+       # dim Select_range_check divisor =3D 1
+       # dim Select_scan name =3D scan
+       # dim Select_scan algorithm =3D incremental
+       # dim Select_scan multiplier =3D 1
+       # dim Select_scan divisor =3D 1
+
+[cpu.cpu1_softirqs]
+       # history =3D 86400
+       # enabled =3D yes
+       # cache directory =3D /var/cache/netdata/cpu.cpu1_softirqs
+       # chart type =3D stacked
+       # type =3D cpu
+       # family =3D softirqs
+       # context =3D cpu.softirqs
+       # units =3D softirqs/s
+       # priority =3D 3001
+       # gap when lost iterations above =3D 1
+       # name =3D cpu.cpu1_softirqs
+       # title =3D CPU1 softirqs (cpu.cpu1_softirqs)
+       # dim HI name =3D HI
+       # dim HI algorithm =3D incremental
+       # dim HI multiplier =3D 1
+       # dim HI divisor =3D 1
+       # dim TIMER name =3D TIMER
+       # dim TIMER algorithm =3D incremental
+       # dim TIMER multiplier =3D 1
+       # dim TIMER divisor =3D 1
+       # dim NET_TX name =3D NET_TX
+       # dim NET_TX algorithm =3D incremental
+       # dim NET_TX multiplier =3D 1
+       # dim NET_TX divisor =3D 1
+       # dim NET_RX name =3D NET_RX
+       # dim NET_RX algorithm =3D incremental
+       # dim NET_RX multiplier =3D 1
+       # dim NET_RX divisor =3D 1
+       # dim BLOCK name =3D BLOCK
+       # dim BLOCK algorithm =3D incremental
+       # dim BLOCK multiplier =3D 1
+       # dim BLOCK divisor =3D 1
+       # dim BLOCK_IOPOLL name =3D BLOCK_IOPOLL
+       # dim BLOCK_IOPOLL algorithm =3D incremental
+       # dim BLOCK_IOPOLL multiplier =3D 1
+       # dim BLOCK_IOPOLL divisor =3D 1
+       # dim TASKLET name =3D TASKLET
+       # dim TASKLET algorithm =3D incremental
+       # dim TASKLET multiplier =3D 1
+       # dim TASKLET divisor =3D 1
+       # dim SCHED name =3D SCHED
+       # dim SCHED algorithm =3D incremental
+       # dim SCHED multiplier =3D 1
+       # dim SCHED divisor =3D 1
+       # dim HRTIMER name =3D HRTIMER
+       # dim HRTIMER algorithm =3D incremental
+       # dim HRTIMER multiplier =3D 1
+       # dim HRTIMER divisor =3D 1
+       # dim RCU name =3D RCU
+       # dim RCU algorithm =3D incremental
+       # dim RCU multiplier =3D 1
+       # dim RCU divisor =3D 1
+
+[mysql_local.sort_issues]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.sort_issues
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D issues
+       # context =3D mysql.sort.issues
+       # units =3D issues/s
+       # priority =3D 60006
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.sort_issues
+       # title =3D mysql Sort Issues (mysql_local.sort_issues)
+       # dim Sort_merge_passes name =3D merge_passes
+       # dim Sort_merge_passes algorithm =3D incremental
+       # dim Sort_merge_passes multiplier =3D 1
+       # dim Sort_merge_passes divisor =3D 1
+       # dim Sort_range name =3D range
+       # dim Sort_range algorithm =3D incremental
+       # dim Sort_range multiplier =3D 1
+       # dim Sort_range divisor =3D 1
+       # dim Sort_scan name =3D scan
+       # dim Sort_scan algorithm =3D incremental
+       # dim Sort_scan multiplier =3D 1
+       # dim Sort_scan divisor =3D 1
+
+[mysql_local.tmp]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.tmp
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D temporaries
+       # context =3D mysql.tmp
+       # units =3D counter
+       # priority =3D 60007
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.tmp
+       # title =3D mysql Tmp Operations (mysql_local.tmp)
+       # dim Created_tmp_disk_tables name =3D disk_tables
+       # dim Created_tmp_disk_tables algorithm =3D incremental
+       # dim Created_tmp_disk_tables multiplier =3D 1
+       # dim Created_tmp_disk_tables divisor =3D 1
+       # dim Created_tmp_files name =3D files
+       # dim Created_tmp_files algorithm =3D incremental
+       # dim Created_tmp_files multiplier =3D 1
+       # dim Created_tmp_files divisor =3D 1
+       # dim Created_tmp_tables name =3D tables
+       # dim Created_tmp_tables algorithm =3D incremental
+       # dim Created_tmp_tables multiplier =3D 1
+       # dim Created_tmp_tables divisor =3D 1
+
+[mysql_local.connections]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.connections
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D connections
+       # context =3D mysql.connections
+       # units =3D connections/s
+       # priority =3D 60008
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.connections
+       # title =3D mysql Connections (mysql_local.connections)
+       # dim Connections name =3D all
+       # dim Connections algorithm =3D incremental
+       # dim Connections multiplier =3D 1
+       # dim Connections divisor =3D 1
+       # dim Aborted_connects name =3D aborded
+       # dim Aborted_connects algorithm =3D incremental
+       # dim Aborted_connects multiplier =3D 1
+       # dim Aborted_connects divisor =3D 1
+
+[mysql_local.binlog_cache]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.binlog_cache
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D binlog
+       # context =3D mysql.binlog_cache
+       # units =3D transactions/s
+       # priority =3D 60009
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.binlog_cache
+       # title =3D mysql Binlog Cache (mysql_local.binlog_cache)
+       # dim Binlog_cache_disk_use name =3D disk
+       # dim Binlog_cache_disk_use algorithm =3D incremental
+       # dim Binlog_cache_disk_use multiplier =3D 1
+       # dim Binlog_cache_disk_use divisor =3D 1
+       # dim Binlog_cache_use name =3D all
+       # dim Binlog_cache_use algorithm =3D incremental
+       # dim Binlog_cache_use multiplier =3D 1
+       # dim Binlog_cache_use divisor =3D 1
+
+[mysql_local.threads]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.threads
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D threads
+       # context =3D mysql.threads
+       # units =3D threads
+       # priority =3D 60010
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.threads
+       # title =3D mysql Threads (mysql_local.threads)
+       # dim Threads_connected name =3D connected
+       # dim Threads_connected algorithm =3D absolute
+       # dim Threads_connected multiplier =3D 1
+       # dim Threads_connected divisor =3D 1
+       # dim Threads_created name =3D created
+       # dim Threads_created algorithm =3D incremental
+       # dim Threads_created multiplier =3D 1
+       # dim Threads_created divisor =3D 1
+       # dim Threads_cached name =3D cached
+       # dim Threads_cached algorithm =3D absolute
+       # dim Threads_cached multiplier =3D -1
+       # dim Threads_cached divisor =3D 1
+       # dim Threads_running name =3D running
+       # dim Threads_running algorithm =3D absolute
+       # dim Threads_running multiplier =3D 1
+       # dim Threads_running divisor =3D 1
+
+[mysql_local.thread_cache_misses]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.thread_cache_m=
isses
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D threads
+       # context =3D mysql.thread_cache_misses
+       # units =3D misses
+       # priority =3D 60011
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.thread_cache_misses
+       # title =3D mysql Threads Cache Misses (mysql_local.thread_cache_mi=
sses)
+       # dim misses name =3D misses
+       # dim misses algorithm =3D absolute
+       # dim misses multiplier =3D 1
+       # dim misses divisor =3D 100
+
+[mysql_local.innodb_io]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_io
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_io
+       # units =3D kilobytes/s
+       # priority =3D 60012
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_io
+       # title =3D mysql InnoDB I/O Bandwidth (mysql_local.innodb_io)
+       # dim Innodb_data_read name =3D read
+       # dim Innodb_data_read algorithm =3D incremental
+       # dim Innodb_data_read multiplier =3D 1
+       # dim Innodb_data_read divisor =3D 1024
+       # dim Innodb_data_written name =3D write
+       # dim Innodb_data_written algorithm =3D incremental
+       # dim Innodb_data_written multiplier =3D -1
+       # dim Innodb_data_written divisor =3D 1024
+
+[mysql_local.innodb_io_ops]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_io_ops
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_io_ops
+       # units =3D operations/s
+       # priority =3D 60013
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_io_ops
+       # title =3D mysql InnoDB I/O Operations (mysql_local.innodb_io_ops)
+       # dim Innodb_data_reads name =3D reads
+       # dim Innodb_data_reads algorithm =3D incremental
+       # dim Innodb_data_reads multiplier =3D 1
+       # dim Innodb_data_reads divisor =3D 1
+       # dim Innodb_data_writes name =3D writes
+       # dim Innodb_data_writes algorithm =3D incremental
+       # dim Innodb_data_writes multiplier =3D -1
+       # dim Innodb_data_writes divisor =3D 1
+       # dim Innodb_data_fsyncs name =3D fsyncs
+       # dim Innodb_data_fsyncs algorithm =3D incremental
+       # dim Innodb_data_fsyncs multiplier =3D 1
+       # dim Innodb_data_fsyncs divisor =3D 1
+
+[mysql_local.innodb_io_pending_ops]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_io_pend=
ing_ops
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_io_pending_ops
+       # units =3D operations
+       # priority =3D 60014
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_io_pending_ops
+       # title =3D mysql InnoDB Pending I/O Operations (mysql_local.innodb=
_io_pending_ops)
+       # dim Innodb_data_pending_reads name =3D reads
+       # dim Innodb_data_pending_reads algorithm =3D absolute
+       # dim Innodb_data_pending_reads multiplier =3D 1
+       # dim Innodb_data_pending_reads divisor =3D 1
+       # dim Innodb_data_pending_writes name =3D writes
+       # dim Innodb_data_pending_writes algorithm =3D absolute
+       # dim Innodb_data_pending_writes multiplier =3D -1
+       # dim Innodb_data_pending_writes divisor =3D 1
+       # dim Innodb_data_pending_fsyncs name =3D fsyncs
+       # dim Innodb_data_pending_fsyncs algorithm =3D absolute
+       # dim Innodb_data_pending_fsyncs multiplier =3D 1
+       # dim Innodb_data_pending_fsyncs divisor =3D 1
+
+[mysql_local.innodb_log]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_log
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_log
+       # units =3D operations/s
+       # priority =3D 60015
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_log
+       # title =3D mysql InnoDB Log Operations (mysql_local.innodb_log)
+       # dim Innodb_log_waits name =3D waits
+       # dim Innodb_log_waits algorithm =3D incremental
+       # dim Innodb_log_waits multiplier =3D 1
+       # dim Innodb_log_waits divisor =3D 1
+       # dim Innodb_log_write_requests name =3D write_requests
+       # dim Innodb_log_write_requests algorithm =3D incremental
+       # dim Innodb_log_write_requests multiplier =3D -1
+       # dim Innodb_log_write_requests divisor =3D 1
+       # dim Innodb_log_writes name =3D writes
+       # dim Innodb_log_writes algorithm =3D incremental
+       # dim Innodb_log_writes multiplier =3D -1
+       # dim Innodb_log_writes divisor =3D 1
+
+[mysql_local.innodb_os_log]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_os_log
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_os_log
+       # units =3D operations
+       # priority =3D 60016
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_os_log
+       # title =3D mysql InnoDB OS Log Operations (mysql_local.innodb_os_l=
og)
+       # dim Innodb_os_log_fsyncs name =3D fsyncs
+       # dim Innodb_os_log_fsyncs algorithm =3D incremental
+       # dim Innodb_os_log_fsyncs multiplier =3D 1
+       # dim Innodb_os_log_fsyncs divisor =3D 1
+       # dim Innodb_os_log_pending_fsyncs name =3D pending_fsyncs
+       # dim Innodb_os_log_pending_fsyncs algorithm =3D absolute
+       # dim Innodb_os_log_pending_fsyncs multiplier =3D 1
+       # dim Innodb_os_log_pending_fsyncs divisor =3D 1
+       # dim Innodb_os_log_pending_writes name =3D pending_writes
+       # dim Innodb_os_log_pending_writes algorithm =3D absolute
+       # dim Innodb_os_log_pending_writes multiplier =3D -1
+       # dim Innodb_os_log_pending_writes divisor =3D 1
+
+[mysql_local.innodb_os_log_io]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_os_log_=
io
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_os_log_io
+       # units =3D kilobytes/s
+       # priority =3D 60017
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_os_log_io
+       # title =3D mysql InnoDB OS Log Bandwidth (mysql_local.innodb_os_lo=
g_io)
+       # dim Innodb_os_log_written name =3D write
+       # dim Innodb_os_log_written algorithm =3D incremental
+       # dim Innodb_os_log_written multiplier =3D -1
+       # dim Innodb_os_log_written divisor =3D 1024
+
+[mysql_local.innodb_cur_row_lock]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_cur_row=
_lock
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_cur_row_lock
+       # units =3D operations
+       # priority =3D 60018
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_cur_row_lock
+       # title =3D mysql InnoDB Current Row Locks (mysql_local.innodb_cur_=
row_lock)
+       # dim Innodb_row_lock_current_waits name =3D current_waits
+       # dim Innodb_row_lock_current_waits algorithm =3D absolute
+       # dim Innodb_row_lock_current_waits multiplier =3D 1
+       # dim Innodb_row_lock_current_waits divisor =3D 1
+
+[mysql_local.innodb_rows]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.innodb_rows
+       # chart type =3D area
+       # type =3D mysql_local
+       # family =3D innodb
+       # context =3D mysql.innodb_rows
+       # units =3D operations/s
+       # priority =3D 60019
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.innodb_rows
+       # title =3D mysql InnoDB Row Operations (mysql_local.innodb_rows)
+       # dim Innodb_rows_read name =3D read
+       # dim Innodb_rows_read algorithm =3D incremental
+       # dim Innodb_rows_read multiplier =3D 1
+       # dim Innodb_rows_read divisor =3D 1
+       # dim Innodb_rows_deleted name =3D deleted
+       # dim Innodb_rows_deleted algorithm =3D incremental
+       # dim Innodb_rows_deleted multiplier =3D -1
+       # dim Innodb_rows_deleted divisor =3D 1
+       # dim Innodb_rows_inserted name =3D inserted
+       # dim Innodb_rows_inserted algorithm =3D incremental
+       # dim Innodb_rows_inserted multiplier =3D 1
+       # dim Innodb_rows_inserted divisor =3D 1
+       # dim Innodb_rows_updated name =3D updated
+       # dim Innodb_rows_updated algorithm =3D incremental
+       # dim Innodb_rows_updated multiplier =3D -1
+       # dim Innodb_rows_updated divisor =3D 1
+
+[mysql_local.binlog_stmt_cache]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mysql_local.binlog_stmt_ca=
che
+       # chart type =3D line
+       # type =3D mysql_local
+       # family =3D binlog
+       # context =3D mysql.binlog_stmt_cache
+       # units =3D statements/s
+       # priority =3D 60020
+       # gap when lost iterations above =3D 1
+       # name =3D mysql_local.binlog_stmt_cache
+       # title =3D mysql Binlog Statement Cache (mysql_local.binlog_stmt_c=
ache)
+       # dim Binlog_stmt_cache_disk_use name =3D disk
+       # dim Binlog_stmt_cache_disk_use algorithm =3D incremental
+       # dim Binlog_stmt_cache_disk_use multiplier =3D 1
+       # dim Binlog_stmt_cache_disk_use divisor =3D 1
+       # dim Binlog_stmt_cache_use name =3D all
+       # dim Binlog_stmt_cache_use algorithm =3D incremental
+       # dim Binlog_stmt_cache_use multiplier =3D 1
+       # dim Binlog_stmt_cache_use divisor =3D 1
+
+[system.ipv6]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/system.ipv6
+       # chart type =3D area
+       # type =3D system
+       # family =3D network
+       # context =3D system.ipv6
+       # units =3D kilobits/s
+       # priority =3D 500
+       # gap when lost iterations above =3D 1
+       # name =3D system.ipv6
+       # title =3D IPv6 Bandwidth (system.ipv6)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[ipv6.packets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/ipv6.packets
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D packets
+       # context =3D ipv6.packets
+       # units =3D packets/s
+       # priority =3D 3000
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.packets
+       # title =3D IPv6 Packets (ipv6.packets)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+       # dim forwarded name =3D forwarded
+       # dim forwarded algorithm =3D incremental
+       # dim forwarded multiplier =3D 1
+       # dim forwarded divisor =3D 1
+       # dim delivers name =3D delivers
+       # dim delivers algorithm =3D incremental
+       # dim delivers multiplier =3D -1
+       # dim delivers divisor =3D 1
+
+[ipv6.udppackets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.udppackets
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D udp
+       # context =3D ipv6.udppackets
+       # units =3D packets/s
+       # priority =3D 3601
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.udppackets
+       # title =3D IPv6 UDP Packets (ipv6.udppackets)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[ipv6.mcast]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.mcast
+       # chart type =3D area
+       # type =3D ipv6
+       # family =3D multicast
+       # context =3D ipv6.mcast
+       # units =3D kilobits/s
+       # priority =3D 9000
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.mcast
+       # title =3D IPv6 Multicast Bandwidth (ipv6.mcast)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 8
+       # dim received divisor =3D 1024
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -8
+       # dim sent divisor =3D 1024
+
+[ipv6.mcastpkts]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.mcastpkts
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D multicast
+       # context =3D ipv6.mcastpkts
+       # units =3D packets/s
+       # priority =3D 9500
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.mcastpkts
+       # title =3D IPv6 Multicast Packets (ipv6.mcastpkts)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[nginx.connections]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/nginx.connections
+       # chart type =3D line
+       # type =3D nginx
+       # family =3D nginx
+       # context =3D nginx.connections
+       # units =3D connections
+       # priority =3D 60001
+       # gap when lost iterations above =3D 1
+       # name =3D nginx.connections
+       # title =3D nginx Active Connections (nginx.connections)
+       # dim active name =3D active
+       # dim active algorithm =3D absolute
+       # dim active multiplier =3D 1
+       # dim active divisor =3D 1
+
+[ipv6.icmp]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.icmp
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D icmp
+       # context =3D ipv6.icmp
+       # units =3D messages/s
+       # priority =3D 10000
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.icmp
+       # title =3D IPv6 ICMP Messages (ipv6.icmp)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[ipv6.icmprouter]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.icmprouter
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D icmp
+       # context =3D ipv6.icmprouter
+       # units =3D messages/s
+       # priority =3D 10400
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.icmprouter
+       # title =3D IPv6 Router Messages (ipv6.icmprouter)
+       # dim InSolicits name =3D InSolicits
+       # dim InSolicits algorithm =3D incremental
+       # dim InSolicits multiplier =3D 1
+       # dim InSolicits divisor =3D 1
+       # dim OutSolicits name =3D OutSolicits
+       # dim OutSolicits algorithm =3D incremental
+       # dim OutSolicits multiplier =3D -1
+       # dim OutSolicits divisor =3D 1
+       # dim InAdvertisements name =3D InAdvertisements
+       # dim InAdvertisements algorithm =3D incremental
+       # dim InAdvertisements multiplier =3D 1
+       # dim InAdvertisements divisor =3D 1
+       # dim OutAdvertisements name =3D OutAdvertisements
+       # dim OutAdvertisements algorithm =3D incremental
+       # dim OutAdvertisements multiplier =3D -1
+       # dim OutAdvertisements divisor =3D 1
+
+[ipv6.icmpneighbor]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.icmpneighbor
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D icmp
+       # context =3D ipv6.icmpneighbor
+       # units =3D messages/s
+       # priority =3D 10500
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.icmpneighbor
+       # title =3D IPv6 Neighbor Messages (ipv6.icmpneighbor)
+       # dim InSolicits name =3D InSolicits
+       # dim InSolicits algorithm =3D incremental
+       # dim InSolicits multiplier =3D 1
+       # dim InSolicits divisor =3D 1
+       # dim OutSolicits name =3D OutSolicits
+       # dim OutSolicits algorithm =3D incremental
+       # dim OutSolicits multiplier =3D -1
+       # dim OutSolicits divisor =3D 1
+       # dim InAdvertisements name =3D InAdvertisements
+       # dim InAdvertisements algorithm =3D incremental
+       # dim InAdvertisements multiplier =3D 1
+       # dim InAdvertisements divisor =3D 1
+       # dim OutAdvertisements name =3D OutAdvertisements
+       # dim OutAdvertisements algorithm =3D incremental
+       # dim OutAdvertisements multiplier =3D -1
+       # dim OutAdvertisements divisor =3D 1
+
+[ipv6.icmpmldv2]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.icmpmldv2
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D icmp
+       # context =3D ipv6.icmpmldv2
+       # units =3D reports/s
+       # priority =3D 10600
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.icmpmldv2
+       # title =3D IPv6 ICMP MLDv2 Reports (ipv6.icmpmldv2)
+       # dim received name =3D received
+       # dim received algorithm =3D incremental
+       # dim received multiplier =3D 1
+       # dim received divisor =3D 1
+       # dim sent name =3D sent
+       # dim sent algorithm =3D incremental
+       # dim sent multiplier =3D -1
+       # dim sent divisor =3D 1
+
+[ipv6.icmptypes]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.icmptypes
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D icmp
+       # context =3D ipv6.icmptypes
+       # units =3D messages/s
+       # priority =3D 10700
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.icmptypes
+       # title =3D IPv6 ICMP Types (ipv6.icmptypes)
+       # dim InType1 name =3D InType1
+       # dim InType1 algorithm =3D incremental
+       # dim InType1 multiplier =3D 1
+       # dim InType1 divisor =3D 1
+       # dim InType128 name =3D InType128
+       # dim InType128 algorithm =3D incremental
+       # dim InType128 multiplier =3D 1
+       # dim InType128 divisor =3D 1
+       # dim InType129 name =3D InType129
+       # dim InType129 algorithm =3D incremental
+       # dim InType129 multiplier =3D 1
+       # dim InType129 divisor =3D 1
+       # dim InType136 name =3D InType136
+       # dim InType136 algorithm =3D incremental
+       # dim InType136 multiplier =3D 1
+       # dim InType136 divisor =3D 1
+       # dim OutType1 name =3D OutType1
+       # dim OutType1 algorithm =3D incremental
+       # dim OutType1 multiplier =3D -1
+       # dim OutType1 divisor =3D 1
+       # dim OutType128 name =3D OutType128
+       # dim OutType128 algorithm =3D incremental
+       # dim OutType128 multiplier =3D -1
+       # dim OutType128 divisor =3D 1
+       # dim OutType129 name =3D OutType129
+       # dim OutType129 algorithm =3D incremental
+       # dim OutType129 multiplier =3D -1
+       # dim OutType129 divisor =3D 1
+       # dim OutType133 name =3D OutType133
+       # dim OutType133 algorithm =3D incremental
+       # dim OutType133 multiplier =3D -1
+       # dim OutType133 divisor =3D 1
+       # dim OutType135 name =3D OutType135
+       # dim OutType135 algorithm =3D incremental
+       # dim OutType135 multiplier =3D -1
+       # dim OutType135 divisor =3D 1
+       # dim OutType143 name =3D OutType143
+       # dim OutType143 algorithm =3D incremental
+       # dim OutType143 multiplier =3D -1
+       # dim OutType143 divisor =3D 1
+
+[ipv6.ect]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/ipv6.ect
+       # chart type =3D line
+       # type =3D ipv6
+       # family =3D packets
+       # context =3D ipv6.ect
+       # units =3D packets/s
+       # priority =3D 10800
+       # gap when lost iterations above =3D 1
+       # name =3D ipv6.ect
+       # title =3D IPv6 ECT Packets (ipv6.ect)
+       # dim InNoECTPkts name =3D InNoECTPkts
+       # dim InNoECTPkts algorithm =3D incremental
+       # dim InNoECTPkts multiplier =3D 1
+       # dim InNoECTPkts divisor =3D 1
+       # dim InECT1Pkts name =3D InECT1Pkts
+       # dim InECT1Pkts algorithm =3D incremental
+       # dim InECT1Pkts multiplier =3D 1
+       # dim InECT1Pkts divisor =3D 1
+       # dim InECT0Pkts name =3D InECT0Pkts
+       # dim InECT0Pkts algorithm =3D incremental
+       # dim InECT0Pkts multiplier =3D 1
+       # dim InECT0Pkts divisor =3D 1
+       # dim InCEPkts name =3D InCEPkts
+       # dim InCEPkts algorithm =3D incremental
+       # dim InCEPkts multiplier =3D 1
+       # dim InCEPkts divisor =3D 1
+
+[nginx.requests]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/nginx.requests
+       # chart type =3D line
+       # type =3D nginx
+       # family =3D nginx
+       # context =3D nginx.requests
+       # units =3D requests/s
+       # priority =3D 60002
+       # gap when lost iterations above =3D 1
+       # name =3D nginx.requests
+       # title =3D nginx Requests (nginx.requests)
+       # dim requests name =3D requests
+       # dim requests algorithm =3D incremental
+       # dim requests multiplier =3D 1
+       # dim requests divisor =3D 1
+
+[nginx.connections_status]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/nginx.connections_status
+       # chart type =3D line
+       # type =3D nginx
+       # family =3D nginx
+       # context =3D nginx.connections.status
+       # units =3D connections
+       # priority =3D 60003
+       # gap when lost iterations above =3D 1
+       # name =3D nginx.connections_status
+       # title =3D nginx Active Connections by Status (nginx.connections_s=
tatus)
+       # dim reading name =3D reading
+       # dim reading algorithm =3D absolute
+       # dim reading multiplier =3D 1
+       # dim reading divisor =3D 1
+       # dim writing name =3D writing
+       # dim writing algorithm =3D absolute
+       # dim writing multiplier =3D 1
+       # dim writing divisor =3D 1
+       # dim waiting name =3D idle
+       # dim waiting algorithm =3D absolute
+       # dim waiting multiplier =3D 1
+       # dim waiting divisor =3D 1
+
+[netfilter.sockets]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.sockets
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.sockets
+       # units =3D active connections
+       # priority =3D 1000
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.sockets
+       # title =3D Netfilter Connections (netfilter.sockets)
+       # dim connections name =3D connections
+       # dim connections algorithm =3D absolute
+       # dim connections multiplier =3D 1
+       # dim connections divisor =3D 1
+
+[nginx.connect_rate]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/nginx.connect_rate
+       # chart type =3D line
+       # type =3D nginx
+       # family =3D nginx
+       # context =3D nginx.connections.rate
+       # units =3D connections/s
+       # priority =3D 60004
+       # gap when lost iterations above =3D 1
+       # name =3D nginx.connect_rate
+       # title =3D nginx Connections Rate (nginx.connect_rate)
+       # dim accepts name =3D accepted
+       # dim accepts algorithm =3D incremental
+       # dim accepts multiplier =3D 1
+       # dim accepts divisor =3D 1
+       # dim handled name =3D handled
+       # dim handled algorithm =3D incremental
+       # dim handled multiplier =3D 1
+       # dim handled divisor =3D 1
+
+[netfilter.new]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.new
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.new
+       # units =3D connections/s
+       # priority =3D 1001
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.new
+       # title =3D Netfilter New Connections (netfilter.new)
+       # dim new name =3D new
+       # dim new algorithm =3D incremental
+       # dim new multiplier =3D 1
+       # dim new divisor =3D 1
+       # dim ignore name =3D ignore
+       # dim ignore algorithm =3D incremental
+       # dim ignore multiplier =3D -1
+       # dim ignore divisor =3D 1
+       # dim invalid name =3D invalid
+       # dim invalid algorithm =3D incremental
+       # dim invalid multiplier =3D -1
+       # dim invalid divisor =3D 1
+
+[netfilter.changes]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.changes
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.changes
+       # units =3D changes/s
+       # priority =3D 1002
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.changes
+       # title =3D Netfilter Connection Changes (netfilter.changes)
+       # dim inserted name =3D inserted
+       # dim inserted algorithm =3D incremental
+       # dim inserted multiplier =3D 1
+       # dim inserted divisor =3D 1
+       # dim deleted name =3D deleted
+       # dim deleted algorithm =3D incremental
+       # dim deleted multiplier =3D -1
+       # dim deleted divisor =3D 1
+       # dim delete_list name =3D delete_list
+       # dim delete_list algorithm =3D incremental
+       # dim delete_list multiplier =3D -1
+       # dim delete_list divisor =3D 1
+
+[netdata.plugin_chartsd_example]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D yes
+       # cache directory =3D /var/cache/netdata/netdata.plugin_chartsd_exa=
mple
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D charts.d
+       # context =3D netdata.plugin_charts
+       # units =3D milliseconds / run
+       # priority =3D 145000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_chartsd_example
+       # title =3D Execution time for example plugin (netdata.plugin_chart=
sd_example)
+       # dim run_time name =3D run time
+       # dim run_time algorithm =3D absolute
+       # dim run_time multiplier =3D 1
+       # dim run_time divisor =3D 1
+
+[netdata.plugin_chartsd_mysql]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.plugin_chartsd_mys=
ql
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D charts.d
+       # context =3D netdata.plugin_charts
+       # units =3D milliseconds / run
+       # priority =3D 145000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_chartsd_mysql
+       # title =3D Execution time for mysql plugin (netdata.plugin_chartsd=
_mysql)
+       # dim run_time name =3D run time
+       # dim run_time algorithm =3D absolute
+       # dim run_time multiplier =3D 1
+       # dim run_time divisor =3D 1
+
+[netdata.plugin_chartsd_nginx]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.plugin_chartsd_ngi=
nx
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D charts.d
+       # context =3D netdata.plugin_charts
+       # units =3D milliseconds / run
+       # priority =3D 145000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_chartsd_nginx
+       # title =3D Execution time for nginx plugin (netdata.plugin_chartsd=
_nginx)
+       # dim run_time name =3D run time
+       # dim run_time algorithm =3D absolute
+       # dim run_time multiplier =3D 1
+       # dim run_time divisor =3D 1
+
+[netfilter.expect]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.expect
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.expect
+       # units =3D expectations/s
+       # priority =3D 1003
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.expect
+       # title =3D Netfilter Connection Expectations (netfilter.expect)
+       # dim created name =3D created
+       # dim created algorithm =3D incremental
+       # dim created multiplier =3D 1
+       # dim created divisor =3D 1
+       # dim deleted name =3D deleted
+       # dim deleted algorithm =3D incremental
+       # dim deleted multiplier =3D -1
+       # dim deleted divisor =3D 1
+       # dim new name =3D new
+       # dim new algorithm =3D incremental
+       # dim new multiplier =3D 1
+       # dim new divisor =3D 1
+
+[netdata.plugin_chartsd_postfix]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netdata.plugin_chartsd_pos=
tfix
+       # chart type =3D area
+       # type =3D netdata
+       # family =3D charts.d
+       # context =3D netdata.plugin_charts
+       # units =3D milliseconds / run
+       # priority =3D 145000
+       # gap when lost iterations above =3D 1
+       # name =3D netdata.plugin_chartsd_postfix
+       # title =3D Execution time for postfix plugin (netdata.plugin_chart=
sd_postfix)
+       # dim run_time name =3D run time
+       # dim run_time algorithm =3D absolute
+       # dim run_time multiplier =3D 1
+       # dim run_time divisor =3D 1
+
+[netfilter.search]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.search
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.search
+       # units =3D searches/s
+       # priority =3D 1010
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.search
+       # title =3D Netfilter Connection Searches (netfilter.search)
+       # dim searched name =3D searched
+       # dim searched algorithm =3D incremental
+       # dim searched multiplier =3D 1
+       # dim searched divisor =3D 1
+       # dim restarted name =3D restarted
+       # dim restarted algorithm =3D incremental
+       # dim restarted multiplier =3D -1
+       # dim restarted divisor =3D 1
+       # dim found name =3D found
+       # dim found algorithm =3D incremental
+       # dim found multiplier =3D 1
+       # dim found divisor =3D 1
+
+[netfilter.errors]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/netfilter.errors
+       # chart type =3D line
+       # type =3D netfilter
+       # family =3D netfilter
+       # context =3D netfilter.errors
+       # units =3D events/s
+       # priority =3D 1005
+       # gap when lost iterations above =3D 1
+       # name =3D netfilter.errors
+       # title =3D Netfilter Errors (netfilter.errors)
+       # dim icmp_error name =3D icmp_error
+       # dim icmp_error algorithm =3D incremental
+       # dim icmp_error multiplier =3D 1
+       # dim icmp_error divisor =3D 1
+       # dim insert_failed name =3D insert_failed
+       # dim insert_failed algorithm =3D incremental
+       # dim insert_failed multiplier =3D -1
+       # dim insert_failed divisor =3D 1
+       # dim drop name =3D drop
+       # dim drop algorithm =3D incremental
+       # dim drop multiplier =3D -1
+       # dim drop divisor =3D 1
+       # dim early_drop name =3D early_drop
+       # dim early_drop algorithm =3D incremental
+       # dim early_drop multiplier =3D -1
+       # dim early_drop divisor =3D 1
+
+[mem.pgfaults]
+       # history =3D 86400
+       # enabled =3D yes
+       enabled =3D no
+       # cache directory =3D /var/cache/netdata/mem.pgfaults
+       # chart type =3D line
+       # type =3D mem
+       # family =3D system
+       # context =3D mem.pgfaults
+       # units =3D page faults/s
+       # priority =3D 500
+       # gap when lost iterations above =3D 1
+       # name =3D mem.pgfaults
+       # title =3D Memory Page Faults (mem.pgfaults)
+       # dim minor name =3D minor
+       # dim minor algorithm =3D incremental
+       # dim minor multiplier =3D 1
+       # dim minor divisor =3D 1
+       # dim major name =3D major
+       # dim major algorithm =3D incremental
+       # dim major multiplier =3D -1
+       # dim major divisor =3D 1
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.servic=
e b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
new file mode 100644
index 0000000..bd696b6
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DNetdata, Real-time performance monitoring
+RequiresMountsFor=3D/var
+
+[Service]
+User=3Droot
+ExecStartPre=3D/bin/mkdir -p /var/log/netdata
+ExecStartPre=3D/bin/chown -R nobody.netdata /usr/share/netdata/web
+ExecStartPre=3D/bin/chown -R nobody.netdata /var/cache/netdata
+ExecStart=3D/usr/sbin/netdata -nd
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-=
webserver/recipes-webadmin/netdata/netdata_git.bb
new file mode 100644
index 0000000..b4161af
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -0,0 +1,46 @@
+HOMEPAGE =3D "https://github.com/firehol/netdata/"
+SUMMARY =3D "Real-time performance monitoring"
+LICENSE =3D "GPLv3"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D747afe070ea9d6c2be0a31353609=
a35b"
+
+SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps"
+SRCREV =3D "36c1304e37094174ea51001903058e65053107ca"
+
+# patch to disable timeout because timeout are not available with actual v=
ersion
+# of core-utils
+SRC_URI +=3D "file://0001-Correct-Timeout-issue.patch"
+
+# default netdata.conf for netdata configuration
+SRC_URI +=3D "file://netdata.conf"
+
+# file for providing systemd service support
+SRC_URI +=3D "file://netdata.service"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig autotools useradd systemd
+
+#systemd
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE_${PN} =3D "netdata.service"
+SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
+
+#User specific
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM_${PN} =3D "--system netdata"
+
+do_install_append() {
+    #set S UID for plugins
+    chmod 4755 ${D}/usr/lib/netdata/netdata/plugins.d/apps.plugin
+
+    # Install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/netdata.service ${D}${systemd_unitdir}/syst=
em
+
+    # Install default netdata.conf
+    install -d ${D}/etc/netdata
+    install -m 0644 ${WORKDIR}/netdata.conf ${D}/etc/netdata/
+}
+
+FILES_${PN}-dbg +=3D "/usr/lib/netdata/netdata/plugins.d/.debug"
+RDEPENDS_${PN} =3D "bash"
--
1.9.1

