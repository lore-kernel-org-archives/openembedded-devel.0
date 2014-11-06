Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 4620 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Nov 2014 05:11:47 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0115.outbound.protection.outlook.com [157.56.110.115])
	by mail.openembedded.org (Postfix) with ESMTP id 139EB72022
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:11:47 +0000 (UTC)
Received: from CH1PR03CA009.namprd03.prod.outlook.com (10.255.156.154) by
	BN1PR0301MB0756.namprd03.prod.outlook.com (25.160.78.150) with
	Microsoft SMTP
	Server (TLS) id 15.1.11.14; Thu, 6 Nov 2014 03:40:10 +0000
Received: from BN1AFFO11FD013.protection.gbl (10.255.156.132) by
	CH1PR03CA009.outlook.office365.com (10.255.156.154) with Microsoft SMTP
	Server (TLS) id 15.1.11.14 via Frontend Transport;
	Thu, 6 Nov 2014 03:40:09 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD013.mail.protection.outlook.com (10.58.52.73) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Thu, 6 Nov 2014 03:40:09 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.19])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	sA63e6ew007737; Wed, 5 Nov 2014 20:40:07 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Nov 2014 11:40:46 +0800
Message-ID: <1415245246-31082-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.9.3
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(120916001)(15975445006)(50986999)(86362001)(19580395003)(575784001)(46102003)(99396003)(68736004)(19580405001)(44976005)(69596002)(6806004)(77156002)(15395725005)(92566001)(450100001)(33646002)(102836001)(93916002)(36756003)(229853001)(105606002)(84676001)(104166001)(81156004)(92726001)(50226001)(95666004)(4396001)(97736003)(21056001)(106466001)(89996001)(48376002)(110136001)(87936001)(88136002)(47776003)(87286001)(104016003)(50466002)(107046002)(2351001)(31966008)(64706001)(20776003)(62966003)(15202345003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0756;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1PR0301MB0756;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Forefront-PRVS: 0387D64A71
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=zhenhua.luo@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: X.Xie@freescale.com, yangbo.lu@freescale.com
Subject: [PATCH] ptpd; add FSL QorIQ DPAA and eTSEC support
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
X-List-Received-Date: Thu, 06 Nov 2014 05:11:57 -0000
Content-Type: text/plain

This patch is for Freescale QorIQ DPAA and eTSEC which support 1588 hardware
assist module, and mainly uses SO_TIMESTAMPING API for HW timestamp and PHC
API.

Signed-off-by: Yangbo Lu <yangbo.lu@freescale.com>
Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../ptpd/ptpd/ptpd-add-dpaa-etsec-support.patch    | 621 +++++++++++++++++++++
 .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb         |   4 +-
 2 files changed, 624 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/ptpd-add-dpaa-etsec-support.patch

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-add-dpaa-etsec-support.patch b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-add-dpaa-etsec-support.patch
new file mode 100644
index 0000000..abb3933
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-add-dpaa-etsec-support.patch
@@ -0,0 +1,621 @@
+Add FSL QorIQ DPAA and eTSEC support
+
+This patch is for Freescale QorIQ DPAA and eTSEC which support 1588 hardware
+assist module, and mainly uses SO_TIMESTAMPING API for HW timestamp and PHC
+API.
+
+Signed-off-by: Lu Yangbo <yangbo.lu@freescale.com>
+Upstream-Status: Submitted [http://sourceforge.net/p/ptpd/patches/56/]
+
+diff --git a/src/bmc.c b/src/bmc.c
+index f4c74bd..925daba 100644
+--- a/src/bmc.c
++++ b/src/bmc.c
+@@ -249,6 +249,7 @@ void s1(MsgHeader *header,MsgAnnounce *announce,PtpClock *ptpClock, const RunTim
+         ptpClock->timePropertiesDS.ptpTimescale = IS_SET(header->flagField1, PTPT);
+         ptpClock->timePropertiesDS.timeSource = announce->timeSource;
+ 
++#ifndef FSL_1588
+ #if defined(MOD_TAI) &&  NTP_API == 4
+ 	/*
+ 	 * update kernel TAI offset, but only if timescale is
+@@ -261,6 +262,7 @@ void s1(MsgHeader *header,MsgAnnounce *announce,PtpClock *ptpClock, const RunTim
+ 		INFO("Set kernel UTC offset to %d\n", ptpClock->timePropertiesDS.currentUtcOffset);
+         }
+ #endif /* MOD_TAI */
++#endif
+ 
+ 	/* Leap second handling */
+ 
+@@ -280,9 +282,11 @@ void s1(MsgHeader *header,MsgAnnounce *announce,PtpClock *ptpClock, const RunTim
+ 			ptpClock->leapSecondPending = FALSE;
+ 			ptpClock->leapSecondInProgress = FALSE;
+ 			timerStop(LEAP_SECOND_PAUSE_TIMER, ptpClock->itimer);
++#ifndef FSL_1588
+ #ifdef HAVE_SYS_TIMEX_H
+ 			unsetTimexFlags(STA_INS | STA_DEL,TRUE);
+ #endif /* HAVE_SYS_TIMEX_H */
++#endif /* FSL_1588 */
+ 		}
+ 
+ 		/*
+@@ -295,6 +299,7 @@ void s1(MsgHeader *header,MsgAnnounce *announce,PtpClock *ptpClock, const RunTim
+ 		    ((!previousLeap59 && ptpClock->timePropertiesDS.leap59) ||
+ 		    (!previousLeap61 && ptpClock->timePropertiesDS.leap61)))) {
+ #ifdef HAVE_SYS_TIMEX_H
++#ifndef FSL_1588
+ 			WARNING("Leap second pending! Setting kernel to %s "
+ 				"one second at midnight\n",
+ 				ptpClock->timePropertiesDS.leap61 ? "add" : "delete");
+@@ -304,6 +309,7 @@ void s1(MsgHeader *header,MsgAnnounce *announce,PtpClock *ptpClock, const RunTim
+ 			    setTimexFlags(ptpClock->timePropertiesDS.leap61 ? STA_INS : STA_DEL,
+ 					  FALSE);
+ 		    }
++#endif
+ #else
+ 			WARNING("Leap second pending! No kernel leap second "
+ 				"API support - expect a clock jump at "
+diff --git a/src/dep/net.c b/src/dep/net.c
+index 34d23ad..9075847 100644
+--- a/src/dep/net.c
++++ b/src/dep/net.c
+@@ -85,6 +85,9 @@
+ #include <linux/ethtool.h>
+ #endif /* SO_TIMESTAMPING */
+ 
++#if defined(FSL_1588)
++char fsl_1588_if_name[IFACE_NAME_LENGTH];
++#endif
+ /**
+  * shutdown the IPv4 multicast for specific address
+  *
+@@ -461,6 +464,9 @@ testInterface(char * ifaceName, RunTimeOpts* rtOpts)
+ 	if(getInterfaceInfo(ifaceName, &info) != 1)
+ 		return FALSE;
+ 
++#if defined(FSL_1588)
++	memcpy(fsl_1588_if_name, ifaceName, IFACE_NAME_LENGTH);
++#endif
+ 	switch(rtOpts->transport) {
+ 
+ 	    case UDP_IPV4:
+@@ -666,6 +672,27 @@ end:
+ }
+ #endif /* SO_TIMESTAMPING */
+ 
++#if defined(FSL_1588)
++/* select HWTSTAMP_TX_ON or HWTSTAMP_TX_OFF */
++void hwtstamp_tx_ctl(NetPath *netPath, Boolean enable)
++{
++	struct ifreq hwtstamp;
++	struct hwtstamp_config hwconfig;
++
++	memset(&hwtstamp, 0, sizeof(hwtstamp));
++	strncpy(hwtstamp.ifr_name, fsl_1588_if_name, sizeof(hwtstamp.ifr_name));
++	hwtstamp.ifr_data = (void *)&hwconfig;
++	memset(&hwconfig, 0, sizeof(hwconfig));
++	hwconfig.tx_type =
++		enable ?
++		HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
++	hwconfig.rx_filter = HWTSTAMP_FILTER_PTP_V1_L4_SYNC;
++	if (ioctl(netPath->eventSock, SIOCSHWTSTAMP, &hwtstamp) < 0
++		|| ioctl(netPath->generalSock, SIOCSHWTSTAMP, &hwtstamp) < 0)
++			printf("error:hwtstamp_tx_ctl\n");
++}
++#endif
++
+ 
+ /**
+  * Initialize timestamping of packets
+@@ -682,10 +709,17 @@ netInitTimestamping(NetPath * netPath, RunTimeOpts * rtOpts)
+ 	Boolean result = TRUE;
+ #if defined(SO_TIMESTAMPING) && defined(SO_TIMESTAMPNS)/* Linux - current API */
+ 	DBG("netInitTimestamping: trying to use SO_TIMESTAMPING\n");
++#if defined(FSL_1588)
++	val = SOF_TIMESTAMPING_TX_HARDWARE |
++	    SOF_TIMESTAMPING_RX_HARDWARE |
++	    SOF_TIMESTAMPING_RAW_HARDWARE;
++#else
+ 	val = SOF_TIMESTAMPING_TX_SOFTWARE |
+ 	    SOF_TIMESTAMPING_RX_SOFTWARE |
+ 	    SOF_TIMESTAMPING_SOFTWARE;
++#endif
+ 
++#ifndef FSL_1588
+ /* unless compiled with PTPD_EXPERIMENTAL, check if we support the desired tstamp capabilities */
+ #ifndef PTPD_EXPERIMENTAL
+ #ifdef ETHTOOL_GET_TS_INFO
+@@ -716,6 +750,7 @@ netInitTimestamping(NetPath * netPath, RunTimeOpts * rtOpts)
+ 	val = 1;
+ #endif /* ETHTOOL_GET_TS_INFO */
+ #endif /* PTPD_EXPERIMENTAL */
++#endif /* FSL_1588 */
+ 
+ 	if(val == 1) {
+ 	    if (setsockopt(netPath->eventSock, SOL_SOCKET, SO_TIMESTAMPNS, &val, sizeof(int)) < 0) {
+@@ -902,6 +937,9 @@ netInit(NetPath * netPath, RunTimeOpts * rtOpts, PtpClock * ptpClock)
+ 
+ 	DBG("Listening on IP: %s\n",inet_ntoa(
+ 		((struct sockaddr_in*)&(netPath->interfaceInfo.afAddress))->sin_addr));
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(&ptpClock->netPath, FALSE);/* HWTSTAMP_TX_OFF */
++#endif
+ 
+ #ifdef PTPD_PCAP
+ 	if (rtOpts->pcap == TRUE) {
+@@ -1319,7 +1357,11 @@ netRecvEvent(Octet * buf, TimeInternal * time, NetPath * netPath, int flags)
+ #if defined(SO_TIMESTAMPING) && defined(SO_TIMESTAMPNS)
+ 				if(cmsg->cmsg_type == SO_TIMESTAMPING || 
+ 				    cmsg->cmsg_type == SO_TIMESTAMPNS) {
++#if defined(FSL_1588)
++					ts = (struct timespec *)CMSG_DATA(cmsg) + 2;
++#else
+ 					ts = (struct timespec *)CMSG_DATA(cmsg);
++#endif
+ 					time->seconds = ts->tv_sec;
+ 					time->nanoseconds = ts->tv_nsec;
+ 					timestampValid = TRUE;
+@@ -1520,6 +1562,9 @@ netSendEvent(Octet * buf, UInteger16 length, NetPath * netPath,
+ 	ssize_t ret;
+ 	struct sockaddr_in addr;
+ 
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(netPath, TRUE);/* HWTSTAMP_TX_ON */
++#endif
+ 	addr.sin_family = AF_INET;
+ 	addr.sin_port = htons(PTP_EVENT_PORT);
+ 
+@@ -1559,6 +1604,9 @@ netSendEvent(Octet * buf, UInteger16 length, NetPath * netPath,
+ 				DBG("Error sending unicast event message\n");
+ 			else
+ 				netPath->sentPackets++;
++#if defined(FSL_1588)
++			usleep(100);
++#endif
+ #ifndef SO_TIMESTAMPING
+ 			/* 
+ 			 * Need to forcibly loop back the packet since
+@@ -1574,10 +1622,14 @@ netSendEvent(Octet * buf, UInteger16 length, NetPath * netPath,
+ #else
+ 			if(!netPath->txTimestampFailure) {
+ 				if(!getTxTimestamp(netPath, tim)) {
++#if defined(FSL_1588)
++					printf("getTxTimestamp: get tx timestamp error\n");
++#else
+ 					netPath->txTimestampFailure = TRUE;
+ 					if (tim) {
+ 						clearTime(tim);
+ 					}
++#endif
+ 				}
+ 			}
+ 
+@@ -1609,9 +1661,15 @@ netSendEvent(Octet * buf, UInteger16 length, NetPath * netPath,
+ 				DBG("Error sending multicast event message\n");
+ 			else
+ 				netPath->sentPackets++;
++#if defined(FSL_1588)
++			usleep(100);
++#endif
+ #ifdef SO_TIMESTAMPING
+ 			if(!netPath->txTimestampFailure) {
+ 				if(!getTxTimestamp(netPath, tim)) {
++#if defined(FSL_1588)
++					printf("getTxTimestamp: get tx timestamp error\n");
++#else
+ 					if (tim) {
+ 						clearTime(tim);
+ 					}
+@@ -1620,6 +1678,7 @@ netSendEvent(Octet * buf, UInteger16 length, NetPath * netPath,
+ 
+ 					/* Try re-enabling MULTICAST_LOOP */
+ 					netSetMulticastLoopback(netPath, TRUE);
++#endif
+ 				}
+ 			}
+ #endif /* SO_TIMESTAMPING */
+@@ -1638,6 +1697,9 @@ netSendGeneral(Octet * buf, UInteger16 length, NetPath * netPath,
+ 	ssize_t ret;
+ 	struct sockaddr_in addr;
+ 
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(netPath, TRUE);/* HWTSTAMP_TX_ON */
++#endif
+ 	addr.sin_family = AF_INET;
+ 	addr.sin_port = htons(PTP_GENERAL_PORT);
+ 
+@@ -1707,6 +1769,9 @@ netSendPeerGeneral(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpt
+ 	ssize_t ret;
+ 	struct sockaddr_in addr;
+ 
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(netPath, TRUE);/* HWTSTAMP_TX_ON */
++#endif
+ 	addr.sin_family = AF_INET;
+ 	addr.sin_port = htons(PTP_GENERAL_PORT);
+ 
+@@ -1762,6 +1827,9 @@ netSendPeerEvent(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpts
+ 	ssize_t ret;
+ 	struct sockaddr_in addr;
+ 
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(netPath, TRUE);/* HWTSTAMP_TX_ON */
++#endif
+ 	addr.sin_family = AF_INET;
+ 	addr.sin_port = htons(PTP_EVENT_PORT);
+ 
+@@ -1788,6 +1856,9 @@ netSendPeerEvent(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpts
+ 			DBG("Error sending unicast peer event message\n");
+ 		else
+ 			netPath->sentPackets++;
++#if defined(FSL_1588)
++		usleep(100);
++#endif
+ 
+ #ifndef SO_TIMESTAMPING
+ 		/* 
+@@ -1804,10 +1875,14 @@ netSendPeerEvent(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpts
+ #else
+ 		if(!netPath->txTimestampFailure) {
+ 			if(!getTxTimestamp(netPath, tim)) {
++#if defined(FSL_1588)
++				printf("getTxTimestamp: get tx timestamp error\n");
++#else
+ 				netPath->txTimestampFailure = TRUE;
+ 				if (tim) {
+ 					clearTime(tim);
+ 				}
++#endif
+ 			}
+ 		}
+ 
+@@ -1839,9 +1914,15 @@ netSendPeerEvent(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpts
+ 			DBG("Error sending multicast peer event message\n");
+ 		else
+ 			netPath->sentPackets++;
++#if defined(FSL_1588)
++		usleep(100);
++#endif
+ #ifdef SO_TIMESTAMPING
+ 		if(!netPath->txTimestampFailure) {
+ 			if(!getTxTimestamp(netPath, tim)) {
++#if defined(FSL_1588)
++				printf("getTxTimestamp: get tx timestamp error\n");
++#else
+ 				if (tim) {
+ 					clearTime(tim);
+ 				}
+@@ -1850,6 +1931,7 @@ netSendPeerEvent(Octet * buf, UInteger16 length, NetPath * netPath, RunTimeOpts
+ 
+ 				/* Try re-enabling MULTICAST_LOOP */
+ 				netSetMulticastLoopback(netPath, TRUE);
++#endif
+ 			}
+ 		}
+ #endif /* SO_TIMESTAMPING */
+diff --git a/src/dep/ntpengine/ntpdcontrol.c b/src/dep/ntpengine/ntpdcontrol.c
+index d773284..e84af9e 100644
+--- a/src/dep/ntpengine/ntpdcontrol.c
++++ b/src/dep/ntpengine/ntpdcontrol.c
+@@ -170,6 +170,15 @@ get_systime(
+ {
+         double dtemp;
+ 
++#if defined(FSL_1588)
++	struct timespec tp;
++	clock_gettime(clkid, &tp);
++	tv.tv_sec = tp.tv_sec;
++	tv.tv_usec = tp.tv_nsec / 1000;
++
++	now->l_i = tv.tv_sec + JAN_1970;
++	dtemp = tv.tv_usec / 1e6;
++#else /* FSL_1588 */
+ #if defined(HAVE_CLOCK_GETTIME) || defined(HAVE_GETCLOCK)
+         struct timespec ts;     /* seconds and nanoseconds */
+ 
+@@ -195,6 +204,7 @@ get_systime(
+         dtemp = tv.tv_usec / 1e6;
+ 
+ #endif /* HAVE_CLOCK_GETTIME || HAVE_GETCLOCK */
++#endif /* FSL_1588 */
+ 
+         /*
+          * Renormalize to seconds past 1900 and fraction.
+diff --git a/src/dep/ptpd_dep.h b/src/dep/ptpd_dep.h
+index 8778988..03ae642 100644
+--- a/src/dep/ptpd_dep.h
++++ b/src/dep/ptpd_dep.h
+@@ -14,6 +14,7 @@
+ #define PTPD_DBGV
+ #endif
+ 
++#define FSL_1588 1
+  /** \name System messages*/
+  /**\{*/
+ 
+@@ -280,6 +281,11 @@ UInteger16 msgPackManagementResponse(Octet * buf,MsgHeader*,MsgManagement*,PtpCl
+  * -Init network stuff, send and receive datas*/
+  /**\{*/
+ 
++#if defined(FSL_1588)
++extern char fsl_1588_if_name[IFACE_NAME_LENGTH];
++/* select HWTSTAMP_TX_ON or HWTSTAMP_TX_OFF */
++void hwtstamp_tx_ctl(NetPath *netPath, Boolean enable);
++#endif
+ Boolean testInterface(char* ifaceName, RunTimeOpts* rtOpts);
+ Boolean netInit(NetPath*,RunTimeOpts*,PtpClock*);
+ Boolean netShutdown(NetPath*);
+@@ -357,6 +363,10 @@ void restartLogging(RunTimeOpts* rtOpts);
+ void logStatistics(RunTimeOpts *rtOpts, PtpClock *ptpClock);
+ void displayStatus(PtpClock *ptpClock, const char *prefixMessage);
+ void displayPortIdentity(PortIdentity *port, const char *prefixMessage);
++#if defined(FSL_1588)
++clockid_t get_clockid(int fd);
++int clock_adjtime(clockid_t id, struct timex *tx);
++#endif
+ Boolean nanoSleep(TimeInternal*);
+ void getTime(TimeInternal*);
+ void setTime(TimeInternal*);
+@@ -378,12 +388,15 @@ void adjTime(Integer32);
+ void adjFreq_wrapper(RunTimeOpts * rtOpts, PtpClock * ptpClock, double adj);
+ Boolean adjFreq(double);
+ double getAdjFreq(void);
++#ifndef FSL_1588
+ void informClockSource(PtpClock* ptpClock);
++#endif
+ 
+ /* Observed drift save / recovery functions */
+ void restoreDrift(PtpClock * ptpClock, RunTimeOpts * rtOpts, Boolean quiet);
+ void saveDrift(PtpClock * ptpClock, RunTimeOpts * rtOpts, Boolean quiet);
+ 
++#ifndef FSL_1588
+ /* Helper function to manage ntpadjtime / adjtimex flags */
+ void setTimexFlags(int flags, Boolean quiet);
+ void unsetTimexFlags(int flags, Boolean quiet);
+@@ -393,6 +406,7 @@ Boolean checkTimexFlags(int flags);
+ #if defined(MOD_TAI) &&  NTP_API == 4
+ void setKernelUtcOffset(int utc_offset);
+ #endif /* MOD_TAI */
++#endif
+ 
+ #endif /* HAVE_SYS_TIMEX_H */
+ 
+diff --git a/src/dep/servo.c b/src/dep/servo.c
+index 06215e6..6651a20 100644
+--- a/src/dep/servo.c
++++ b/src/dep/servo.c
+@@ -1013,10 +1013,12 @@ if(rtOpts->ntpOptions.enableEngine && rtOpts->panicModeNtp) {
+ 		/* Adjust the clock first -> the PI controller runs here */
+ 		adjFreq_wrapper(rtOpts, ptpClock, runPIservo(&ptpClock->servo, ptpClock->offsetFromMaster.nanoseconds));
+ 		warn_operator_fast_slewing(rtOpts, ptpClock, ptpClock->servo.observedDrift);
++#ifndef FSL_1588
+ 		/* Unset STA_UNSYNC */
+ 		unsetTimexFlags(STA_UNSYNC, TRUE);
+ 		/* "Tell" the clock about maxerror, esterror etc. */
+ 		informClockSource(ptpClock);
++#endif /* FSL_1588 */
+ #endif /* HAVE_SYS_TIMEX_H */
+ 	}
+ 
+diff --git a/src/dep/sys.c b/src/dep/sys.c
+index 52b274c..8551724 100644
+--- a/src/dep/sys.c
++++ b/src/dep/sys.c
+@@ -344,7 +344,14 @@ int writeMessage(FILE* destination, int priority, const char * format, va_list a
+ 		 * it also can cause problems in nested debug statements (which are solved by turning the signal
+ 		 *  handling synchronous, and not calling this function inside asycnhronous signal processing)
+ 		 */
++#if defined(FSL_1588)
++		struct timespec tp;
++		clock_gettime(clkid, &tp);
++		now.tv_sec = tp.tv_sec;
++		now.tv_usec = tp.tv_nsec / 1000;
++#else
+ 		gettimeofday(&now, 0);
++#endif
+ 		strftime(time_str, MAXTIMESTR, "%F %X", localtime((time_t*)&now.tv_sec));
+ 		fprintf(destination, "%s.%06d ", time_str, (int)now.tv_usec  );
+ 		fprintf(destination,PTPD_PROGNAME"[%d].%s (%-9s ",
+@@ -1174,13 +1181,33 @@ nanoSleep(TimeInternal * t)
+ 	return TRUE;
+ }
+ 
++#if defined(FSL_1588)
++clockid_t get_clockid(int fd)
++{
++#define CLOCKFD 3
++#define FD_TO_CLOCKID(fd)       ((~(clockid_t) (fd) << 3) | CLOCKFD)
++	return FD_TO_CLOCKID(fd);
++}
++
++/* When glibc offers the syscall, this will go away. */
++#include <sys/syscall.h>
++int clock_adjtime(clockid_t id, struct timex *tx)
++{
++	return syscall(__NR_clock_adjtime, id, tx);
++}
++#endif
++
+ void
+ getTime(TimeInternal * time)
+ {
+-#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0)
++#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0) || defined(FSL_1588)
+ 
+ 	struct timespec tp;
++#if defined(FSL_1588)
++	if (clock_gettime(clkid, &tp) < 0) {
++#else
+ 	if (clock_gettime(CLOCK_REALTIME, &tp) < 0) {
++#endif
+ 		PERROR("clock_gettime() failed, exiting.");
+ 		exit(0);
+ 	}
+@@ -1201,7 +1228,7 @@ void
+ setTime(TimeInternal * time)
+ {
+ 
+-#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0)
++#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0) || defined(FSL_1588)
+ 
+ 	struct timespec tp;
+ 	tp.tv_sec = time->seconds;
+@@ -1215,9 +1242,13 @@ setTime(TimeInternal * time)
+ 
+ #endif /* _POSIX_TIMERS */
+ 
+-#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0)
+ 
++#if defined(_POSIX_TIMERS) && (_POSIX_TIMERS > 0) || defined(FSL_1588)
++#if defined(FSL_1588)
++	if (clock_settime(clkid, &tp) < 0) {
++#else
+ 	if (clock_settime(CLOCK_REALTIME, &tp) < 0) {
++#endif
+ 		PERROR("Could not set system time");
+ 		return;
+ 	}
+@@ -1595,7 +1626,11 @@ adjFreq(double adj)
+ #endif /* HAVE_STRUCT_TIMEX_TICK */
+ 	DBG2("        adj is %.09f;  t freq is %d       (float: %.09f)\n", adj, t.freq,  dFreq);
+ 	
++#if defined(FSL_1588)
++	return !clock_adjtime(clkid, &t);
++#else
+ 	return !adjtimex(&t);
++#endif
+ }
+ 
+ 
+@@ -1609,7 +1644,11 @@ getAdjFreq(void)
+ 
+ 	memset(&t, 0, sizeof(t));
+ 	t.modes = 0;
++#if defined(FSL_1588)
++	clock_adjtime(clkid, &t);
++#else
+ 	adjtimex(&t);
++#endif
+ 
+ 	dFreq = (t.freq + 0.0) / ((1<<16) / 1000.0);
+ 
+@@ -1764,6 +1803,7 @@ saveDrift(PtpClock * ptpClock, RunTimeOpts * rtOpts, Boolean quiet)
+ 	fclose(driftFP);
+ }
+ 
++#ifndef FSL_1588
+ void
+ setTimexFlags(int flags, Boolean quiet)
+ {
+@@ -1922,6 +1962,7 @@ setKernelUtcOffset(int utc_offset) {
+ 	}
+ }
+ #endif /* MOD_TAI */
++#endif /* FSL_1588 */
+ 
+ 
+ #else
+diff --git a/src/protocol.c b/src/protocol.c
+index c73728b..90554f3 100644
+--- a/src/protocol.c
++++ b/src/protocol.c
+@@ -615,6 +615,7 @@ if(!rtOpts->panicModeNtp || !ptpClock->panicMode)
+ 		timerStart(STATISTICS_UPDATE_TIMER, rtOpts->statsUpdateInterval, ptpClock->itimer);
+ #endif /* PTPD_STATISTICS */
+ 
++#ifndef FSL_1588
+ #ifdef HAVE_SYS_TIMEX_H
+ 
+ 		/* 
+@@ -632,6 +633,7 @@ if(!rtOpts->panicModeNtp || !ptpClock->panicMode)
+ 			unsetTimexFlags(STA_INS | STA_DEL, TRUE);
+ 		}
+ #endif /* HAVE_SYS_TIMEX_H */
++#endif /* FSL_1588 */
+ 		break;
+ 	default:
+ 		DBG("to unrecognized state\n");
+@@ -934,6 +936,7 @@ doState(RunTimeOpts *rtOpts, PtpClock *ptpClock)
+                             WARNING("Leap second event imminent - pausing "
+ 				    "clock and offset updates\n");
+                             ptpClock->leapSecondInProgress = TRUE;
++#ifndef FSL_1588
+ #ifdef HAVE_SYS_TIMEX_H
+                             if(!checkTimexFlags(ptpClock->timePropertiesDS.leap61 ? 
+ 						STA_INS : STA_DEL)) {
+@@ -944,6 +947,7 @@ doState(RunTimeOpts *rtOpts, PtpClock *ptpClock)
+ 						  STA_INS : STA_DEL, FALSE);
+                             }
+ #endif /* HAVE_SYS_TIMEX_H */
++#endif /* FSL_1588 */
+ 			    /*
+ 			     * start pause timer from now until [pause] after
+ 			     * midnight, plus an extra second if inserting
+@@ -1290,6 +1294,9 @@ handle(RunTimeOpts *rtOpts, PtpClock *ptpClock)
+     int ret;
+     ssize_t length = -1;
+ 
++#if defined(FSL_1588)
++	hwtstamp_tx_ctl(&ptpClock->netPath, FALSE);/* HWTSTAMP_TX_OFF */
++#endif
+     TimeInternal timeStamp = { 0, 0 };
+     fd_set readfds;
+ 
+@@ -1437,9 +1444,11 @@ handleAnnounce(MsgHeader *header, ssize_t length,
+ 					ptpClock->leapSecondInProgress=FALSE;
+ 					ptpClock->timePropertiesDS.leap59 = FALSE;
+ 					ptpClock->timePropertiesDS.leap61 = FALSE;
++#ifndef FSL_1588
+ #ifdef HAVE_SYS_TIMEX_H
+ 					unsetTimexFlags(STA_INS | STA_DEL, TRUE);
+ #endif /* HAVE_SYS_TIMEX_H */
++#endif /* FSL_1588 */
+ 				}
+ 			}
+ 			DBG2("___ Announce: received Announce from current Master, so reset the Announce timer\n");
+diff --git a/src/ptpd.c b/src/ptpd.c
+index 3fad379..471b1e9 100644
+--- a/src/ptpd.c
++++ b/src/ptpd.c
+@@ -78,6 +78,21 @@ main(int argc, char **argv)
+ 	PtpClock *ptpClock;
+ 	Integer16 ret;
+ 
++#if defined(FSL_1588)
++	char device[] = "/dev/ptp0";
++	int fd;
++
++	fd = open(device, O_RDWR);
++	if (fd < 0) {
++		fprintf(stderr, "opening %s: %s\n", device, strerror(errno));
++		return -1;
++	}
++	clkid = get_clockid(fd);
++	if (clkid == -1) {
++		fprintf(stderr, "failed to read clock id\n");
++		return -1;
++	}
++#endif
+ 	startupInProgress = TRUE;
+ 
+ 	/* Initialize run time options with command line arguments */
+diff --git a/src/ptpd.h b/src/ptpd.h
+index 009f51c..6641649 100644
+--- a/src/ptpd.h
++++ b/src/ptpd.h
+@@ -172,6 +172,15 @@
+ #include <linux/rtc.h>
+ #endif /* HAVE_LINUX_RTC_H */
+ 
++#ifdef FSL_1588
++#ifndef SO_TIMESTAMPING
++#define SO_TIMESTAMPING 37
++#endif
++#ifndef HAVE_SYS_TIMEX_H
++#define HAVE_SYS_TIMEX_H 1
++#endif
++clockid_t clkid;
++#endif
+ /** \name arith.c
+  * -Timing management and arithmetic*/
+  /**\{*/
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index db74e44..274ea33 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -21,7 +21,9 @@ def get_sub(d):
     except:
         return parts[0]
 
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz \
+	file://ptpd-add-dpaa-etsec-support.patch \
+"
 
 SRC_URI[md5sum] = "1ef2f1f2825080a865bbce0eb61246d4"
 SRC_URI[sha256sum] = "2802aab758649bb222859dfcb62a5d282709ccb4d3f1df3f26f739cc091d0c8d"
-- 
1.9.3


