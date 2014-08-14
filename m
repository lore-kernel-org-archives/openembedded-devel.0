Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0899465C70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 03:14:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E3El6W003869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 20:14:47 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 13 Aug 2014 20:14:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 11:14:46 +0800
Message-ID: <1407986086-29096-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407986086-29096-1-git-send-email-rongqing.li@windriver.com>
References: <1407986086-29096-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] ntp: fix CVE-2013-5211
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
X-List-Received-Date: Thu, 14 Aug 2014 03:14:50 -0000
Content-Type: text/plain

From: Zhang Xiao <xiao.zhang@windriver.com>

The monlist feature in ntp_request.c in ntpd in NTP before
4.2.7p26 allows remote attackers to cause a denial of service
(traffic amplification) via forged (1) REQ_MON_GETLIST or
(2) REQ_MON_GETLIST_1 requests, as exploited in the wild
in December 2013.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../recipes-support/ntp/files/CVE-2013-5211.patch  |  112 ++++++++++++++++++++
 meta-networking/recipes-support/ntp/ntp.inc        |    1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch

diff --git a/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch b/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
new file mode 100644
index 0000000..ddcb044
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
@@ -0,0 +1,112 @@
+ntp: fix CVE-2013-5211
+
+Upstream-status: Backport
+
+The monlist feature in ntp_request.c in ntpd in NTP before
+4.2.7p26 allows remote attackers to cause a denial of service
+(traffic amplification) via forged (1) REQ_MON_GETLIST or
+(2) REQ_MON_GETLIST_1 requests, as exploited in the wild
+in December 2013.
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+
+--- a/ntpd/ntp_request.c
++++ b/ntpd/ntp_request.c
+@@ -1912,44 +1912,11 @@ mon_getlist_0(
+ 	struct req_pkt *inpkt
+ 	)
+ {
+-	register struct info_monitor *im;
+-	register struct mon_data *md;
+-	extern struct mon_data mon_mru_list;
+-	extern int mon_enabled;
+-
+ #ifdef DEBUG
+ 	if (debug > 2)
+ 	    printf("wants monitor 0 list\n");
+ #endif
+-	if (!mon_enabled) {
+-		req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
+-		return;
+-	}
+-	im = (struct info_monitor *)prepare_pkt(srcadr, inter, inpkt,
+-	    v6sizeof(struct info_monitor));
+-	for (md = mon_mru_list.mru_next; md != &mon_mru_list && im != 0;
+-	     md = md->mru_next) {
+-		im->lasttime = htonl((u_int32)((current_time -
+-		    md->firsttime) / md->count));
+-		im->firsttime = htonl((u_int32)(current_time - md->lasttime));
+-		im->restr = htonl((u_int32)md->flags);
+-		im->count = htonl((u_int32)(md->count));
+-		if (IS_IPV6(&md->rmtadr)) {
+-			if (!client_v6_capable)
+-				continue;
+-			im->addr6 = SOCK_ADDR6(&md->rmtadr);
+-			im->v6_flag = 1;
+-		} else {
+-			im->addr = NSRCADR(&md->rmtadr);
+-			if (client_v6_capable)
+-				im->v6_flag = 0;
+-		}
+-		im->port = md->rmtport;
+-		im->mode = md->mode;
+-		im->version = md->version;
+-		im = (struct info_monitor *)more_pkt();
+-	}
+-	flush_pkt();
++	req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
+ }
+ 
+ /*
+@@ -1962,50 +1929,7 @@ mon_getlist_1(
+ 	struct req_pkt *inpkt
+ 	)
+ {
+-	register struct info_monitor_1 *im;
+-	register struct mon_data *md;
+-	extern struct mon_data mon_mru_list;
+-	extern int mon_enabled;
+-
+-	if (!mon_enabled) {
+-		req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
+-		return;
+-	}
+-	im = (struct info_monitor_1 *)prepare_pkt(srcadr, inter, inpkt,
+-	    v6sizeof(struct info_monitor_1));
+-	for (md = mon_mru_list.mru_next; md != &mon_mru_list && im != 0;
+-	     md = md->mru_next) {
+-		im->lasttime = htonl((u_int32)((current_time -
+-		    md->firsttime) / md->count));
+-		im->firsttime = htonl((u_int32)(current_time - md->lasttime));
+-		im->restr = htonl((u_int32)md->flags);
+-		im->count = htonl((u_int32)md->count);
+-		if (IS_IPV6(&md->rmtadr)) {
+-			if (!client_v6_capable)
+-				continue;
+-			im->addr6 = SOCK_ADDR6(&md->rmtadr);
+-			im->v6_flag = 1;
+-			im->daddr6 = SOCK_ADDR6(&md->interface->sin);
+-		} else {
+-			im->addr = NSRCADR(&md->rmtadr);
+-			if (client_v6_capable)
+-				im->v6_flag = 0;
+-			if (MDF_BCAST == md->cast_flags)
+-				im->daddr = NSRCADR(&md->interface->bcast);
+-			else if (md->cast_flags) {
+-				im->daddr = NSRCADR(&md->interface->sin);
+-				if (!im->daddr)
+-					im->daddr = NSRCADR(&md->interface->bcast);
+-			} else
+-				im->daddr = 4;
+-		}
+-		im->flags = htonl(md->cast_flags);
+-		im->port = md->rmtport;
+-		im->mode = md->mode;
+-		im->version = md->version;
+-		im = (struct info_monitor_1 *)more_pkt();
+-	}
+-	flush_pkt();
++	req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
+ }
+ 
+ /*
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 2c8f488..b63f202 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp \
            file://ntpd.list \
            file://ntp-disable-debugging.patch \
+           file://CVE-2013-5211.patch \
 "
 
 inherit autotools update-rc.d useradd systemd
-- 
1.7.10.4


