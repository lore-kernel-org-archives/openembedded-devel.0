Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U9WqT-00064P-8z
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2013 09:22:11 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so1008063dam.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2013 00:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MCMB5r6PZiZvU83py0FUf37mgqsujz54/PStyw/K68Q=;
	b=O+TaXLdtHqvgioxVGej1TfFA2spt21MlazHQItNpz4qnAQhlHNapQTSZCCJLHdfsrU
	/PIRdauO8ZRFhHE2jJWhRDg0Kq5zNH1jBqh3l1hJJtQa0KNn3EOxMx8X02xNZLb2Vq2F
	JHGzFPauPiq0AOvzjAjnzucTzWfg7QwAbgNJj2ALDQcYqwg+6J3i6woX+d8nAf+L4M58
	wTUYaTl1LAT+Oyl/lXiHEjCHRqOtiU6pSunu6t5shNokg6F3LU0Y2SC2CZXF+3p6fWv6
	o+I38badTZ6fJCBectlPlUjuwMlmYcH3rxcUB8tEN5gng8fOjUrFA3TBRE2LVz6RrTG0
	x6Qg==
X-Received: by 10.66.72.198 with SMTP id f6mr12841351pav.42.1361693148592;
	Sun, 24 Feb 2013 00:05:48 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ax3sm8548564pbd.42.2013.02.24.00.05.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 00:05:48 -0800 (PST)
Date: Sun, 24 Feb 2013 00:05:44 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130224080543.GC3154@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
	<CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
	<CAJTo0LayOQb60HB--SWiWBYau=ECryZx7Kn_QD21-G8kEMZiog@mail.gmail.com>
	<511E200D.3000907@communistcode.co.uk>
	<CAJTo0LbUmwwPs2eRvOBSCzep0OHx3KRn+XPO5xWSpcgbuN0RjQ@mail.gmail.com>
	<CAKSKmM3siHyHoNkqE02JQZcLBkkHKQyfpeTG2W1zfi+BVs0Tmg@mail.gmail.com>
	<CAJTo0LZbQ2YSR5+1vSqChMDq85Rnj+WgMr=U4=rdrePBsp27KA@mail.gmail.com>
	<CAKSKmM061jii+YZzn-uBFuMoGW8eeR0y6OCoDkNxDwpTSr=gDA@mail.gmail.com>
	<CAJTo0LZmEoxWrjBKsHAh1iOsT9_+nWyK0na9WYEngRvjAB199w@mail.gmail.com>
	<CAKSKmM0KRgsyewoQEcvArS+MDQDpAbUbUw4iMvX-AEMfPJ7-yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKSKmM0KRgsyewoQEcvArS+MDQDpAbUbUw4iMvX-AEMfPJ7-yA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Sun, 24 Feb 2013 08:22:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/02/13 11:44), Sankar H Malarmani wrote:
> Hi,
> 
> I need to run my wxwidget application on the colibri module with the linux
> image built using openembedded. For that I need wxwidgets library in the
> colibri module.
> Is it possible ?? If so, how can I do it ??

You need to port the recipe over from OE-classic, should be relatively
simple. The classic recipes are here 
http://git.openembedded.org/openembedded/tree/recipes/wxwidgets

and please do not top post. reply inline so the context of threads
are kept intact.



