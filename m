Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KziE0-0004wC-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 02:39:24 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KA500793B65LNY2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Nov 2008 19:37:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BE4E86B83B5; Mon,
	10 Nov 2008 20:37:16 -0500 (EST)
Date: Mon, 10 Nov 2008 20:37:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <gf10o2$hip$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081111013716.GA25909@denix.org>
MIME-version: 1.0
References: <20081104005512.GA12988@denix.org>
	<200811041213.25205.zecke@selfish.org>
	<20081104194812.GA18457@denix.org>
	<20081106231210.GB32229@denix.org> <gf10o2$hip$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: hal-0.5.11 fails with external toolchain/SDK
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
X-List-Received-Date: Tue, 11 Nov 2008 01:39:24 -0000
X-Groupsio-MsgNum: 6558
Content-type: multipart/mixed; boundary=dDRMvlgZJXvWKvBx
Content-disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2008 at 10:11:30AM +0100, Koen Kooi wrote:
> On 07-11-2008 00:12, Denys Dmytriyenko wrote:
>> On Tue, Nov 04, 2008 at 02:48:12PM -0500, Denys Dmytriyenko wrote:
>>> On Tue, Nov 04, 2008 at 12:13:24PM +0100, Holger Freyther wrote:
>>>> On Tuesday 04 November 2008 01:55:12 Denys Dmytriyenko wrote:
>>>>> Hi,
>>>>>
>>>>> New hal-0.5.11 from OpenMoko breaks builds with external-toolchain/SDK, 
>>>>> as
>>>>> it hardcodes linux/input.h like this:
>>>> It is Openmoko, and I did add it.
>>>>
>>>> what about something among the lines of?
>>>>
>>>> echo "#include<linux/input.h>" | cpp | less | grep "linux\/input.h"
>>> Thanks for the hint. I was able to fix it, so it finds the right 
>>> linux/input.h
>>> file even with external-toolchain/SDK.
>>>
>>> The patch is attached to the ticket #4799 and this email. I was not able 
>>> to
>>> call autoreconf, as it was giving too many problems. 
>>> autotools_do_configure
>>> worked fine, but unfortunately, it doesn't take parameters to pass to the
>>> oe_runconf, so I had to call it again with the correct --with flag. Let 
>>> me
>>> know if it's Ok or not. Thanks.
>>
>> What about this patch? Does it look good? Any comments/suggestions?
>
> I was about to propose somethine like:
>
> do_configure_prepend() {
> linux_input_h=$(echo "#include <linux/input.h>" | ${CPP} - | \
> 	grep "linux\/input.h" | head -n 1 | awk -F '"' '{print $2}')	
> }
> EXTRA_OECONF += "--with-linux-input-header=${linux_input_h}"
>
> But I then I realized that probably won't work as I expect it to work :)

Ok, what if we change autotools_do_configure to accept parameters and pass 
them to oe_runconf? It's quite a trivial change - see two patches attached.

-- 
Denys

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="autotools_do_configure-accept-parameters.patch"

From 507ee230617603258736ecbcf4895de5429f8672 Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 10 Nov 2008 20:13:22 -0500
Subject: [PATCH] autotools.bbclass: allow autotools_do_configure to accept parameters and pass to oe_runconf


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 82b5311..adb57f6 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -134,7 +134,7 @@ autotools_do_configure() {
 	;;
 	esac
 	if [ -e ${S}/configure ]; then
-		oe_runconf
+		oe_runconf $@
 	else
 		oenote "nothing to configure"
 	fi
-- 
1.5.6.4


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hal-0.5.11-fix-sdk-linux-input-h.patch"

From 1a568f9490eb7bfd1060f47e2584d3ce41820b6b Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 10 Nov 2008 20:17:02 -0500
Subject: [PATCH] hal: Find and use the right linux/input.h to work with external toolchain


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 packages/hal/hal_0.5.11.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/packages/hal/hal_0.5.11.bb b/packages/hal/hal_0.5.11.bb
index e93ad64..2b56fdf 100644
--- a/packages/hal/hal_0.5.11.bb
+++ b/packages/hal/hal_0.5.11.bb
@@ -1,8 +1,14 @@
 require hal.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " file://hal-right-input-h.patch;patch=1 \
              file://fix-configure.diff;patch=1"
 
-EXTRA_OECONF += "--with-linux-input-header=${STAGING_INCDIR}/linux/input.h"
+# The following code finds the right linux/input.h,
+# which also works with external-toolchain/SDK
+do_configure() {
+	linux_input_h=`echo "#include <linux/input.h>" | ${CPP} - | \
+		grep "linux\/input.h" | head -n 1 | awk -F '"' '{print $2}'`
+	autotools_do_configure --with-linux-input-header=${linux_input_h}
+}
-- 
1.5.6.4


--dDRMvlgZJXvWKvBx--
