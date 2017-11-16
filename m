Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08ED9787DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 20:00:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAGK0NTU023066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Nov 2017 12:00:23 -0800
Received: from yow-masselst-lx1.localnet (128.224.24.244) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 16 Nov 2017 12:00:22 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 16 Nov 2017 15:00:21 -0500
Message-ID: <1822334.tYZlPLg4XR@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-38-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <1510856886.5979.34.camel@intel.com>
References: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
	<1510856886.5979.34.camel@intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] meta-webserver: apache2 allow SYSTEMD_AUTO_ENABLE to be overwritten
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
X-List-Received-Date: Thu, 16 Nov 2017 20:00:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, November 16, 2017 7:28:06 PM EST Patrick Ohly wrote:
> On Thu, 2017-11-16 at 10:19 -0500, Mark Asselstine wrote:
> > The current assignment does not allow a bbappend to be used to
> > overwrite the SYSTEMD_AUTO_ENABLE value in order to have apache2 auto
> > start.
> 
> Why does SYSTEMD_AUTO_ENABLE_${PN} = "enable" in a apache2_*.bb not
> work? It works fine for me with wpa-supplicant:

Sorry. You are correct the bbappend will overwrite it, but this requires a 
bbappend. If this used "?=" you could achieve this in a local.conf or similar. 
In general if there is a possibility for a value to be desireable to overwrite 
using "?=" makes sense. Thoughts?

Mark


> 
> wpa-supplicant_2.6.bb: SYSTEMD_AUTO_ENABLE = "disable"
> wpa-supplicant_2.6.bbappend: SYSTEMD_AUTO_ENABLE = "enable"
> => bitbake -e shows "enable"



