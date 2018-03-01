Return-Path: <michael@siebecker.ch>
Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch
	[217.26.49.177])
	by mail.openembedded.org (Postfix) with ESMTP id 15613600BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:24:06 +0000 (UTC)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtp (Exim 4.90_1 (FreeBSD))
	(envelope-from <michael@siebecker.ch>) id 1erSsB-000EgP-Fa
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2018 19:24:07 +0100
Received: from gw.ptr-80-238-209-140.customer.ch.netstream.com
	([80.238.209.140] helo=[172.16.11.51])
	by asmtp013.mail.hostpoint.ch with esmtpa (Exim 4.90_1 (FreeBSD))
	(envelope-from <michael@siebecker.ch>) id 1erSsB-000NUW-BQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2018 19:24:07 +0100
X-Authenticated-Sender-Id: michael@siebecker.ch
From: Michael Siebecker <michael@siebecker.ch>
To: openembedded-devel@lists.openembedded.org
Message-ID: <7c7baaf4-58e1-2135-98a9-99c614bfac3a@siebecker.ch>
Date: Thu, 1 Mar 2018 19:23:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Fix zram module paramter name
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
X-List-Received-Date: Thu, 01 Mar 2018 18:24:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


---
  meta-oe/recipes-extended/zram/zram/init | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram/init 
b/meta-oe/recipes-extended/zram/zram/init
index 7b6cbf4..a2c9c21 100644
--- a/meta-oe/recipes-extended/zram/zram/init
+++ b/meta-oe/recipes-extended/zram/zram/init
@@ -34,7 +34,7 @@ start() {
      mem_by_cpu=$(($memtotal/$num_cpus*$factor/100*1024))

      # load dependency modules
-    modprobe zram zram_num_devices=$num_cpus
+    modprobe zram num_devices=$num_cpus
      echo "zram devices probed successfully"

      # initialize the devices
-- 
2.7.4



