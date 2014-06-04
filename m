Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id BFFAF6B89F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 18:40:40 +0000 (UTC)
Received: from [98.142.68.106] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1WsG77-000JxJ-Cm for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2014 18:40:41 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s54IeXaW017802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Jun 2014 13:40:38 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.106
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX19G04OvDt1I46DcdjOjKgkeDc4IutJIAqY=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 13:40:30 -0500
Message-Id: <1401907231-5559-1-git-send-email-blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] Upgrade geode video to working version
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
X-List-Received-Date: Wed, 04 Jun 2014 18:40:40 -0000

The latest version of the geode driver is 2.11.15, which is fully functional with just one patch to fix an error when building which all warnings treated as errors.  This update upgrades to that driver and adds the patch so that this driver can again be used under the open embedded build system.

blloyd (1):
  Upgrade geode video driver to 2.11.15

 .../xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch | 11 +++++++++++
 ...f86-video-geode_2.11.14.bb => xf86-video-geode_2.11.15.bb} |  6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/xf86SetModeDefaultName.patch
 rename meta-oe/recipes-graphics/xorg-driver/{nonworking/xf86-video-geode_2.11.14.bb => xf86-video-geode_2.11.15.bb} (60%)

-- 
1.9.0


