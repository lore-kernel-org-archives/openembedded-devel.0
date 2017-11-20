Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8851678655
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 23:03:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAKN30r4018307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Nov 2017 15:03:01 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.25.24) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 20 Nov 2017 15:02:59 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 20 Nov 2017 18:02:58 -0500
Message-ID: <11298886.dRQHnAXMpE@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <1510870442.5979.36.camel@intel.com>
References: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
	<1822334.tYZlPLg4XR@yow-masselst-lx1>
	<1510870442.5979.36.camel@intel.com>
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
X-List-Received-Date: Mon, 20 Nov 2017 23:03:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, November 16, 2017 5:14:02 PM EST Patrick Ohly wrote:
> On Thu, 2017-11-16 at 15:00 -0500, Mark Asselstine wrote:
> > On Thursday, November 16, 2017 7:28:06 PM EST Patrick Ohly wrote:
> > > On Thu, 2017-11-16 at 10:19 -0500, Mark Asselstine wrote:
> > > > The current assignment does not allow a bbappend to be used to
> > > > overwrite the SYSTEMD_AUTO_ENABLE value in order to have apache2
> > > > auto
> > > > start.
> > > 
> > > Why does SYSTEMD_AUTO_ENABLE_${PN} = "enable" in a apache2_*.bb not
> > 
> > > work? It works fine for me with wpa-supplicant:
> > Sorry. You are correct the bbappend will overwrite it, but this
> > requires a bbappend. If this used "?=" you could achieve this in a
> > local.conf or similar. 
> 
> SYSTEMD_AUTO_ENABLE_pn-wpa-supplicant = "enable" in local.conf also
> overrides the = assignment in the .bb file.
> 
> > In general if there is a possibility for a value to be desireable to
> > overwrite using "?=" makes sense. Thoughts?
> 
> I thought the same for a while, but since then I've come around to the
> interpretation that for recipe-specific variables, using =? is mostly
> just a cosmetic thing. I can't think of a good example where it really
> matters in practice.
> 
> It's different for global variables which might get set prior to
> parsing a recipe (distro config, local.conf). There it makes sense to
> not overwrite a potentially existing value.

I guess I am just in the habit of using the assignment operator which makes 
the most sense (even just for readability sake). Sure in this case it can be 
overwritten but like me I suspect others would have to actually attempt this 
to convince themselves it works, whereas the early assignment operator would 
have made it more explicit. Anyway, not worth pursuing any further.

The bigger question for me is why these recipes are disabling their auto start 
out of the gate. If I do 'apt install apache2' on a Ubu box I expect that the 
service will start automatically, and it does, so why do we force folks to 
'work around' this recipe disabling apache2 from auto starting? (I have yet to 
go back to look at the history to see if there is a legit reason)

MarkA








