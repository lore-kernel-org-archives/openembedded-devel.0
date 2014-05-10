Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (unknown [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id D02F66059B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 06:11:30 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 10 May 2014 15:11:31 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: 
In-Reply-To: 
Date: Sat, 10 May 2014 15:11:52 +0900
Message-ID: <012501cf6c16$bcae17c0$360a4740$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac9sDtbwKH0auyDTRvqRKA8/2e9wJgAB6WOA
Subject: Re: lttng-module error
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
X-List-Received-Date: Sat, 10 May 2014 06:11:34 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Sorry for this.

I resolved the problem that's my  mistake.
The cause is that we forcibly set the PACKAGES = "${PN}" in kernel-image.bb.
So kernel-3.4.0+ is not coming.

Thanks

-----Original Message-----
From: Changhyeok Bae [mailto:changhyeok.bae@lge.com] 
Sent: Saturday, May 10, 2014 2:17 PM
To: 'openembedded-devel@lists.openembedded.org'
Subject: lttng-module error

Hi

I'm building lttng-module with dylan.
However I got the error on creating rootfs.

Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-kernel-image:
|  * 	kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ * 	kernel-3.4.0+ * 	kernel-3.4.0+ *
kernel-3.4.0+ *
|  * opkg_install_cmd: Cannot install package packagegroup-kernel-image.
| ERROR: Function failed: do_rootfs (see /....
-linux-gnueabi/....-image/1.0-r4/temp/log.do_rootfs.24420 for further
information)
NOTE: recipe ....-image-1.0-r4: task do_rootfs: Failed


