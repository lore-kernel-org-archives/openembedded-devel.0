Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 295F471951
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A40F431C5F45;
	Fri,  2 Feb 2018 08:46:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id opDOgNGzN9Op; Fri,  2 Feb 2018 08:46:47 +0100 (CET)
Received: from t460p (p4FE9ACAE.dip0.t-ipconnect.de [79.233.172.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 389A331C6097;
	Fri,  2 Feb 2018 08:46:47 +0100 (CET)
Date: Fri, 2 Feb 2018 08:46:46 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180202084646.32bbade3@t460p>
In-Reply-To: <CA+chaQeDFexQPwNj8o4PS2zKqjsbwHBgdqhdDjBx2gxuiHDyow@mail.gmail.com>
References: <20180201142340.11083-1-Martin.Jansa@gmail.com>
	<20180201142340.11083-2-Martin.Jansa@gmail.com>
	<20180201165756.0f54c7bc@t460p>
	<CA+chaQeDFexQPwNj8o4PS2zKqjsbwHBgdqhdDjBx2gxuiHDyow@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 02 Feb 2018 07:46:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martin,

On Thu, 1 Feb 2018 17:07:55 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi Andreas,
> 
> I'm just trying to get rid of libpam from builds without pam in
> DISTRO_FEATURES (even for world builds, see the change for oe-core).
> 
> I'm aware that libpam usage from samba is a bit strange as discussed few
> times:
> http://lists.openembedded.org/pipermail/openembedded-commits/2016-October/198752.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106583.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109143.html
> 
> Now RSS and also with libpam being available only when pam is in
> DISTRO_FEATURES, we might possibly return the PACKAGECONFIG without
> re-introducing undeterministic link with libpam, but I'm not using samba
> (other than building it in bitbake world) so I'll let that to people who
> actually care about samba itself (and can properly test it in runtime).

I see. Somebody can revert fb5967aaff1a7ee6b5508269735ce2f1b1a7e020 later.

Regards,
Andreas

