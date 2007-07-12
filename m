Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I8y0X-0003j5-NS
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2007 14:43:01 +0200
Received: by ug-out-1314.google.com with SMTP id i24so336456ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2007 05:37:05 -0700 (PDT)
Received: by 10.86.49.13 with SMTP id w13mr432144fgw.1184243825233;
	Thu, 12 Jul 2007 05:37:05 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id w5sm59337111mue.2007.07.12.05.37.02
	(version=SSLv3 cipher=OTHER); Thu, 12 Jul 2007 05:37:04 -0700 (PDT)
Date: Thu, 12 Jul 2007 15:36:42 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <131940156.20070712153642@gmail.com>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1312225382.20070710123312@vanille-media.de>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
	<1729618158.20070710002128@gmail.com>
	<1312225382.20070710123312@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Thu, 12 Jul 2007 12:43:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Michael,

Tuesday, July 10, 2007, 1:33:12 PM, you wrote:

> Hi Paul.

>> Monday, July 9, 2007, 11:01:36 PM, you wrote:
>>   I proposed to model variables in those namespace on the formfactor
>> package, and with Richard's and Marcin's explaining that there intention
>> was to have "physical" parameters, and with Graeme's vote, that's
>> apparently the way to go.

> So be it then, but while we're going the physical route, lets include
> the DEPTH as well.

  Ok, as we have issues with commit mails, here's what I'm committing for
bitbake.conf. As discussed, we want "non-zero" defaults just in case,
and I used QVGA defaults, which is consistent with our "smallscreen"
default for GUI_MACHINE_CLASS. This variable in turn is named
inconsistently with the rest of machine vars, so I proposed to rename
it to GUI_MACHINE_CLASS. Finally, I tried to be consistent with
formfactor's var names, so here's BPP, not DEPTH. Feel free to tweak
if needed. I'll proceed with adding these options to machine configs
within couple of days. (And of course I would need help with that.)

#
# old_revision [8654baa6db1769cd516400afebdc63c9b19ee633]
#
# patch "conf/bitbake.conf"
#  from [28be7aa3c03959211fa8fff38d1903e1ec2dd8de]
#    to [1a40a8a4b4660be43379de36b41dceabe1bebd19]
#
============================================================
--- conf/bitbake.conf   28be7aa3c03959211fa8fff38d1903e1ec2dd8de
+++ conf/bitbake.conf   1a40a8a4b4660be43379de36b41dceabe1bebd19
@@ -468,7 +468,7 @@ OES_BITBAKE_CONF = "1"
 OES_BITBAKE_CONF = "1"
 
 ##################################################################
-# Task-base stuff
+# Machine properties and task-base stuff
 ##################################################################
 
 MACHINE_FEATURES ?= "kernel26"
@@ -477,7 +477,13 @@ ROOT_FLASH_SIZE ?= "256"
 # This is used to limit what packages goes into images built, so set big by default
 ROOT_FLASH_SIZE ?= "256"
 
-GUI_MACHINE_CLASS ?= "smallscreen"
+MACHINE_GUI_CLASS ?= "smallscreen"
+# GUI_MACHINE_CLASS is deprecated, please use MACHINE_GUI_CLASS instead
+GUI_MACHINE_CLASS ?= "${MACHINE_GUI_CLASS}"
+MACHINE_DISPLAY_WIDTH_PIXELS ?= "240"
+MACHINE_DISPLAY_HEIGHT_PIXELS ?= "320"
+MACHINE_DISPLAY_ORIENTATION ?= "0"
+MACHINE_DISPLAY_BPP ?= "16"
 
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""

> Regards,

> :M:



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



