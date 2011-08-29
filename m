Received: from bee.rz.hs-augsburg.de ([141.82.25.26])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.morscher@hs-augsburg.de>) id 1Qy8tU-0002RD-BD
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 22:57:20 +0200
Received: from [127.0.0.1] (ppp-188-174-27-188.dynamic.mnet-online.de
	[188.174.27.188]) (authenticated bits=0)
	by bee.RZ.HS-Augsburg.DE (8.14.3/8.14.3) with ESMTP id p7TKidIG027994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 22:44:39 +0200 (MEST)
Message-ID: <4E5BFA36.1080002@hs-augsburg.de>
Date: Mon, 29 Aug 2011 22:44:38 +0200
From: Michael Morscher <michael.morscher@hs-augsburg.de>
Organization: HS Augsburg
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.0
	(bee.RZ.HS-Augsburg.DE [141.82.16.16]);
	Mon, 29 Aug 2011 22:44:39 +0200 (MEST)
X-HSA-RZ-MailScanner-Information: Please contact the ISP for more information
X-HSA-RZ-MailScanner-ID: p7TKidIG027994
X-HSA-RZ-MailScanner: Found to be clean
X-HSA-RZ-MailScanner-From: michael.morscher@hs-augsburg.de
X-HSA-RZ-MailScanner-Watermark: 1315255481.20264@JkGdWUapSZv5wZzW3AFwbQ
X-Spam-Status: No
Subject: Still broken images due to gtk-icon-cache/scrollkeeper
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2011 20:57:20 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hey guys,

I'm using the latest git release and checked out all patches which Koen 
posted the last 4 weeks. But in my case, the image is still broken.
It looks like a Loop to me ...

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies 
for task-xfce46-base:
|  *    
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*    
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*    
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*    
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*   
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*    
hicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-themehicolor-icon-theme 
*
|  * opkg_install_cmd: Cannot install package task-xfce46-base.
|  * resolve_conffiles: Existing conffile 
/build/OE/tmp/rootfs/xfce46-image/etc/device_table is different from the 
conffile in the new package. The new conffile will be placed at 
/build/OE/tmp/rootfs/xfce46-image/etc/device_table-opkg.
NOTE: package xfce46-image-1.0-r1: task do_rootfs: Failed
ERROR: Task 14 (/build/OE/openembedded/recipes/images/xfce46-image.bb, 
do_rootfs) failed with exit code '1'
ERROR: '/build/OE/openembedded/recipes/images/xfce46-image.bb' failed


A complete log is available here: http://pastebin.de/18528
System is Ubuntu 10.04 x86 / bitbake 1.13.3

Thanks!
Bye


