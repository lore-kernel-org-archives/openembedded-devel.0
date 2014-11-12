Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 2248 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Nov 2014 18:53:14 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D8E4F713A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 18:53:14 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sACIFks0027732 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 12:15:46 -0600
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014111212154611-992790 ;
	Wed, 12 Nov 2014 12:15:46 -0600 
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 81A9A14C:EC58A864-86257D8E:00636115;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 Septem 15, 2011
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <OF81A9A14C.EC58A864-ON86257D8E.00636115-86257D8E.0064525F@ni.com>
Date: Wed, 12 Nov 2014 12:15:46 -0600
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/12/2014 12:15:46 PM,
	Serialize complete at 11/12/2014 12:15:46 PM,
	Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/12/2014 12:15:46 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/12/2014 12:15:46 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.28,
	0.0.0000
	definitions=2014-11-12_08:2014-11-11, 2014-11-12,
	1970-01-01 signatures=0
Subject: Opkg files at /var/lib/opkg/lists
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
X-List-Received-Date: Wed, 12 Nov 2014 18:53:17 -0000
Content-Type: text/plain; charset="US-ASCII"

Hello,

I noticed that the OE build process is leaving files at 
/var/lib/opkg/lists (~1.5 MB on my system), which I believe are the feed 
content used to build the image. The target opkg.conf file configure 
lists_dir to be at /var/lib/opkg (instead of the default 
/var/lib/opkg/lists), so the feed content under /var/lib/opkg/lists is not 
used at all. 

Does anyone know if there Is a reason why the files are left over or is 
this a bug? Shouldn't the image creation process remove the whole 
directory if it's not going to be used? 

BTW, Dylan doesn't have this problem, but Daisy and Dizzy do (not sure 
about Dora).

cheers,

-Alejandro


