Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 01CC47213A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 20:13:08 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sAHKD8xJ020589 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2014 14:13:08 -0600
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014111714130873-46636 ;
	Mon, 17 Nov 2014 14:13:08 -0600 
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 7963BAC9:9E8B5CCA-86257D89:007D0CB6;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 Septem 15, 2011
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <OF7963BAC9.9E8B5CCA-ON86257D89.007D0CB6-86257D93.006F121B@ni.com>
Date: Mon, 17 Nov 2014 14:13:10 -0600
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/17/2014 02:13:08 PM,
	Serialize complete at 11/17/2014 02:13:08 PM,
	Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/17/2014 02:13:08 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/17/2014 02:13:08 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.28,
	0.0.0000
	definitions=2014-11-17_03:2014-11-15, 2014-11-17,
	1970-01-01 signatures=0
Subject: BUILD_FROM_FEEDS
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
X-List-Received-Date: Mon, 17 Nov 2014 20:13:09 -0000
Content-Type: text/plain; charset="US-ASCII"

Hello,

We have a build system were we build ~10 different images for targets that 
share the same architecture. We plan to leverage BUILD_FROM_FEEDS (very 
powerful feature!), to split the build process in 2. One process will 
create the feeds, while a different process will be in charge of building 
images. Our images pick and choose which packagegroups they need, based on 
the target flavor. This approach enable our internal users to build images 
very quickly, while our core team focuses on maintaining the feed build. 
With some caveats, our process is working and looks like the right 
solution for us (we will soon need many more images)

The main hurdle that I see now is that some of our images require 
different IMAGE_FEATURES. For example, some of our images use x11. Since 
we build a single feed, we either build packages (dbus, for example) with 
the IMAGE_FEATURE enabled or not, which is unfortunate as some of our 
targets are headless. Does anyone have thoughts on how we can overcome the 
problem without creating separate feeds?

It would be terrific if there was an option to build both versions of the 
package. For dbus, that would mean having 2 packages, which could be named 
dbus-x11_1.6.18-r0.12_core2-64.ipk &  dbus_1.6.18-r0.12_core2-64.ipk. 
Then, my images could choose which version to use, based on their 
IMAGE_FEATURES.

Message sent to openembedded-devel only, please let me know if I should 
also send it to openembedded-core.

thanks!

-Alejandro


