Return-Path: <oliver.graute@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D14977A87
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 14:41:04 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id o21so37557011wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 07:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IkpmcRTeoI4j7NIMGc9mgrnYvY9zQkzuOVEDF71YW9c=;
	b=NXAQvxZ6ooO9bvN56BAPFqbp2yVCN13sVaFXv4xOGplK1NxyGSm35G7puWYbmmkS0n
	v211hpcrW8stvzodDibxz8Io3WlB/QFRTthZoc/IuqcbRwhDrXfjPWAjXWmuhhCk2Pne
	6zIJqfNwX5HpDkqHZrsb7rKUNPaGeetyv/UBaRs4NCSVYzMA57B0/MWjyXCHW87g4cXz
	tYzaWbsbvgbUlQzFSvbdX1FxutaFOAxODjq80Q91gJKKW/lFpBI6vxliVVnPq6BGPii5
	RAg4fD8Di3fA8sIiP2tViAdviwXHNCY5TvJtHwZdmAI1dNns9fqqXCNRFaudUirHmsxN
	F3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IkpmcRTeoI4j7NIMGc9mgrnYvY9zQkzuOVEDF71YW9c=;
	b=NJXIUWB7R8OcVzK7Rz3h69jLB2h0R7A3KH/PHe6sQPISCcaRLcrDlgP/g47/RHZioS
	YYDe2sZnWtsnKaPDQf70zKnYECGR8WfH1JtnUkAIYK3qPK2ejDJXAyfm/+lNZPN9zTiG
	V2NisF4zLuyItEGCnNPcThtyDJWPeEbsq7d7cF9GAPlYmWlnsL2eiNmKI1MjcrsbpHVN
	ESgPoqeI6ZlgaI4WsDys86CUpdysZTdC83EfWClqSv/ok5MUH7sUgsfPFVn1iX2GB6+w
	SmjvZ8v1UDkznrKsEB2Rv1605YEQUc/8USN1MGWoB6mSPdK6VcATNxo/5GL/bFvVaW59
	fMpw==
X-Gm-Message-State: AFeK/H0doXuRFXNFP9ONdpznu2KZxoSZVZjnt0CtSY82ztMQlf/XGUyS0RKtdx/OZOPdEg==
X-Received: by 10.223.165.85 with SMTP id j21mr28938655wrb.56.1491489665005;
	Thu, 06 Apr 2017 07:41:05 -0700 (PDT)
Received: from localhost (x55b0f93f.dyn.telefonica.de. [85.176.249.63])
	by smtp.gmail.com with ESMTPSA id
	y190sm26589623wmy.15.2017.04.06.07.41.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 07:41:04 -0700 (PDT)
Date: Thu, 6 Apr 2017 16:06:14 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170406140614.GA17864@graute-opti>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20170405133857.GA15126@graute-opti> <20170405184218.GD3301@jama>
MIME-Version: 1.0
In-Reply-To: <20170405184218.GD3301@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH v2] nfacct: added nfacct recipe to meta-networking
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
X-List-Received-Date: Thu, 06 Apr 2017 14:41:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/04/17, Martin Jansa wrote:
> On Wed, Apr 05, 2017 at 03:38:57PM +0200, Oliver Graute wrote:
> > this patch adds nfacct to meta-networking
> 
> nfacct -> ${BPN}
> nfacct-1.0.2 -> ${BP}
> 
> > +S = "${WORKDIR}/nfacct-${PV}"
> 
> This is the default, drop.

just saw that first version of this patch was already applied. I'll send
a patch to fix the remarks.

Best Regards,

Oliver

