Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9F75073E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:20:09 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTQ00NIOVTK0Q90@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	27 Aug 2015 09:20:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=XYJHFtupD_QA:10 a=-9mUelKeXuEA:10
	a=kj9zAlcOel0A:10 a=uRRa74qj2VoA:10	a=alK4_DS-AAAA:8 a=pGLkceISAAAA:8
	a=NEAV23lmAAAA:8 a=aEQYKJY4uoATvAp4la4A:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 43F90161BB4; Thu,
	27 Aug 2015 10:20:08 -0400 (EDT)
Date: Thu, 27 Aug 2015 10:20:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150827142008.GQ26375@denix.org>
References: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKoUaLm8yUiS1idtr+Neyth_oBufdME1XSJGdR2S7XbdzA@mail.gmail.com>
	<CAMKF1srdDoCk8_bbLVEYjWgUEF_MyfY5KcRor2QoLiN7FJoJ4g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1srdDoCk8_bbLVEYjWgUEF_MyfY5KcRor2QoLiN7FJoJ4g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH] layer.conf: define LAYERDEPENDS
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
X-List-Received-Date: Thu, 27 Aug 2015 14:20:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 27, 2015 at 06:30:13AM -0700, Khem Raj wrote:
> On Thu, Aug 27, 2015 at 5:46 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > On Wed, Aug 26, 2015 at 9:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> qtwebkit needs ruby-native which comes from meta-ruby
> >> this patch adds initial set of layer dependencies there may be more
> >> that can be added but its a start
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > This is only when someone uses QtWebkit; a lot of people does not use
> > it so it is not a real dependency.
> >
> 
> then it should be part of BBMASK which is default so if someone wants
> it then user gets a clear message and knows what to fix
> 
> > We could make it dependent on the collection availability?
> 
> yes that could be how do u propose to do so

Chris Larson shared this code for such purpose:

https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mel/conf/layer.conf#L5-L11

-- 
Denys

