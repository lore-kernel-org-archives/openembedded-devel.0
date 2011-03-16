Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PztTy-0006TJ-CJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:21:58 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PztSI-0003Bz-7m from Tom_Rini@mentor.com ;
	Wed, 16 Mar 2011 09:20:14 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 16 Mar 2011 09:19:17 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 16 Mar 2011 09:19:16 -0700
Message-ID: <4D80E2F3.7020204@mentor.com>
Date: Wed, 16 Mar 2011 09:18:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Ben Gardiner <bengardiner@nanometrics.ca>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>	<20110315200131.GA3042@denix.org>
	<AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
In-Reply-To: <AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
X-OriginalArrivalTime: 16 Mar 2011 16:19:17.0186 (UTC)
	FILETIME=[E5C95220:01CBE3F5]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or .<type>.img
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
X-List-Received-Date: Wed, 16 Mar 2011 16:21:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 08:25 AM, Ben Gardiner wrote:
> Thanks, Denys for the Ack and Tom for picking up the patches.
>
> Now that they have hit mainline, I would like to request that they get
> into arago-oe-dev. From the 2010.03-maintenance announcement I'm
> guessing that means that they need to be backported to
> 2010.03-maintenance branch first.
>
> I've cherry-picked the following commits (some with fixups) to get a
> successful build of hello-worldimage with externa-toolchain and
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   =
> "upstream/oe/releases/2011.03-maintenance/features/BenGardiner/backport-ubifs-links"
> METADATA_REVISION = "64d4245"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "da850-omapl138-evm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2011.03"
> TARGET_FPU        = "soft"

OK.  I don't have a problem merging things into the maintenance branch 
that I pushed into mainline but I would like a few acks from other 
people.  And I'd also like the patches you tested (helloworld-image + 
beagleboard + angstrom-2008.1 should build and isn't too much to build) 
themselves posted as a request (and a pullable git tree on 
githib/gitorosis/local/whatever would be nice but isn't required).  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


