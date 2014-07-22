Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B9C3870191
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 06:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="573619218"
Received: from johnmcca-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.249])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 06:40:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 22 Jul 2014 14:40:37 +0100
Message-ID: <1802663.L2TxUvrga6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <53CE64C9.2010402@linaro.org>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>
	<53CE64C9.2010402@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
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
X-List-Received-Date: Tue, 22 Jul 2014 13:40:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Tuesday 22 July 2014 09:19:05 Trevor Woerner wrote:
> On 07/14/14 08:26, Paul Eggleton wrote:
> > Unfortunately as far as the BitBake manual is concerned, it pretty
> > much has to be abstract. Remember that there are no base
> > implementations of any task functions in BitBake itself; the ones you
> > refer to are in OE's base.bbclass.
> 
> In reality there are only about 2 people on the whole planet for whom
> that distinction is important :-)

I see where you're coming from, but we want BitBake to remain usable 
independently, and that means it affects anyone who works on BitBake not just 
the few that do use it independently. That also means that the documentation 
should stand on its own - it *can* use examples from the OE metadata, but it 
has to be clear that it is an example from OE, and it should describe the 
example fully - it can't blur the lines between OE and BitBake; if you start 
assuming OE functionality when documenting BitBake, that's exactly what you'll 
be doing.

> For the rest of us, it would be nice if there was some middle ground
> from which a document could be written that treated these two entities
> as one; 

That's exactly what the Yocto Project manuals do. They refer to the BitBake 
manual where we want to describe some syntax or other fundamental BitBake 
concept in more detail. However, it's OK to have duplication between the 
BitBake manual and the Yocto Project manuals where we can add more relevant 
detail on the Yocto Project side - but I'd rather not see complete 
duplication.

> at least up until such a time as some other project comes along
> and uses bitbake for something other than OE/Yocto :-D

FWIW I think there are other projects already. We don't hear about them a lot, 
but they have come up from time to time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

