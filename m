Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UeLyW-0004me-RO
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 11:01:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2013 01:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,706,1363158000"; d="scan'208";a="244037774"
Received: from unknown (HELO helios.localnet) ([10.255.12.168])
	by AZSMGA002.ch.intel.com with ESMTP; 20 May 2013 01:43:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 09:43:24 +0100
Message-ID: <2790826.iUURuodTo5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAMKF1soJ=_CAZ7BO3NsSLyUSZSaJo8wFdaHuJW+6h9E0xoiVAg@mail.gmail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
	<1368959233-28288-2-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1soJ=_CAZ7BO3NsSLyUSZSaJo8wFdaHuJW+6h9E0xoiVAg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe++/master 01/11] mm-common: update to 0.9.6
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
X-List-Received-Date: Mon, 20 May 2013 09:01:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 19 May 2013 12:55:48 Khem Raj wrote:
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.6.bb
> > @@ -0,0 +1,12 @@
> > +inherit gnomebase
> > +
> > +GNOME_COMPRESS_TYPE="xz"
> 
> Does this mean you need to add dependency on xz-native ?

No need, base.bbclass does this automatically if .xz is in a SRC_URI entry.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


