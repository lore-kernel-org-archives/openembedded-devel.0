Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C703B6E71A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 14:30:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,758,1384297200"; d="scan'208";a="40366186"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 31 Jan 2014 15:30:54 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	id 14.2.318.1; Fri, 31 Jan 2014 15:30:53 +0100
thread-index: Ac8ekQvhwxw6ecyJQau8rcqaVIFdXw==
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.3168
Importance: normal
Priority: normal
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Fri, 31 Jan 2014 15:30:53 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jan 2014 15:25:46 +0100
Message-ID: <1391178346-11804-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 31 Jan 2014 14:30:53.0423 (UTC)
	FILETIME=[0BCED7F0:01CF1E91]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libnetfilter-log: add newrecipe for version 1.0.1
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
X-List-Received-Date: Fri, 31 Jan 2014 14:30:57 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain

This library is usefull for userspace netfilter log messages
(c.f. iptables and -j NFLOG target).

libnetfilter-conntrack, libnetfilter-cttimeout, libnetfilter-cthelper and
libnetfilter-queue are already available since december of 2012.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb  | 14 
++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 
meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb

diff --git 
a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb 
b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
new file mode 100644
index 0000000..81909b8
--- /dev/null
+++ 
b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Netfilter logging library"
+DESCRIPTION = "Userspace library providing a programming interface (API) 
to the Linux kernel netfilter log message (NFLOG)"
+HOMEPAGE = 
"http://www.netfilter.org/projects/libnetfilter_log/index.html"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink"
+
+SRC_URI = 
"http://www.netfilter.org/projects/libnetfilter_log/files/libnetfilter_log-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "2a4bb0654ae675a52d2e8d1c06090b94"
+SRC_URI[tar.sha256sum] = 
"74e0fe75753dba3ac114531b5e73240452c789a3f3adccf5c51217da1d933b21"
+
+S = "${WORKDIR}/libnetfilter_log-${PV}"
+
+inherit autotools pkgconfig
-- 
1.8.2.1



About Ingenico (Euronext: FR0000125346 – ING)
Ingenico is a leading provider of payment solutions, with over 20 million 
terminals deployed in more than 125 countries. Its 4,000 employees 
worldwide support retailers, banks and service providers to optimize and 
secure their electronic payments solutions, develop their offer of 
services and increase their point of sales revenue. More information on 
http://www.ingenico.com/ | http://twitter.com/Ingenico.
This message may contain confidential and/or privileged information. If 
you are not the addressee or authorized to receive this for the addressee, 
you must not use, copy, disclose or take any action based on this message 
or any information herein. If you have received this message in error, 
please advise the sender immediately by reply e-mail and delete this 
message. Thank you for your cooperation.
P Please consider the environment before printing this e-mail




