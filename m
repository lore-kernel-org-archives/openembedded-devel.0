Return-Path: <michael@siebecker.ch>
Received: from mxout012.mail.hostpoint.ch (mxout012.mail.hostpoint.ch
	[217.26.49.172])
	by mail.openembedded.org (Postfix) with ESMTP id D33CC7198F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 07:10:08 +0000 (UTC)
Received: from [10.0.2.45] (helo=asmtp012.mail.hostpoint.ch)
	by mxout012.mail.hostpoint.ch with esmtp (Exim 4.90_1 (FreeBSD))
	(envelope-from <michael@siebecker.ch>) id 1erILx-000MYy-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2018 08:10:09 +0100
Received: from gw.ptr-80-238-209-140.customer.ch.netstream.com
	([80.238.209.140] helo=[172.16.11.51])
	by asmtp012.mail.hostpoint.ch with esmtpa (Exim 4.90_1 (FreeBSD))
	(envelope-from <michael@siebecker.ch>) id 1erILw-000CS1-QJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2018 08:10:08 +0100
X-Authenticated-Sender-Id: michael@siebecker.ch
To: openembedded-devel@lists.openembedded.org
From: Michael Siebecker <michael@siebecker.ch>
Message-ID: <e36fe405-abe4-9017-5f7a-f39249293c8f@siebecker.ch>
Date: Thu, 1 Mar 2018 08:08:36 +0100
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
X-List-Received-Date: Thu, 01 Mar 2018 07:10:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


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



