Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1Qgdj1-0000Or-Mu
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jul 2011 16:14:33 +0200
Received: by iwn4 with SMTP id 4so4757717iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2011 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JoFegFtQ+O2T/VoQl6CA35n4f4kTdhzTPTdBE3ZM6pc=;
	b=lXwUlMWBfXOUjxd7p3+zORjE2l3hyYRCA/zlZMohhAgrKP0vCwugEWDl5SvAiMis97
	fk6ADSSlRsOgwfJ+QBcRt2caw2AX+gMcsgRaICJTbxO5+gvzIhKRaMN1EiZBdoHCpJAI
	3LHU0AyLJGuolUngj90WjO4bbvwdVvqkVElrI=
Received: by 10.43.62.13 with SMTP id wy13mr6501110icb.342.1310479772293;
	Tue, 12 Jul 2011 07:09:32 -0700 (PDT)
Received: from cverges-dev-lnx ([173.8.168.17])
	by mx.google.com with ESMTPS id a5sm880907icb.15.2011.07.12.07.09.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 07:09:31 -0700 (PDT)
Date: Tue, 12 Jul 2011 07:08:47 -0700
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110712140847.GA788@cverges-dev-lnx>
References: <0564089300001e7d@nedap.com>
	<201107121042.53976.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201107121042.53976.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bbappend
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
X-List-Received-Date: Tue, 12 Jul 2011 14:14:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 12, 2011 at 10:42:53AM +0100, Paul Eggleton wrote:
> FILESEXTRAPATHS is only available in oe-core. For classic OE you need
> to use something like:
> 
> THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> FILESPATHBASE_prepend := "${THISDIR}/files:"

Hi Paul,

Thanks for clarifying and proposing a workaround.  It looks like PRINC
is similar, where it is only available in oe-core.  It seems like the
code related to incrementing the PR variable is a several-line fix, so
is this something that can be abstracted into a class file in the
local-overlay?

Thanks again,
Chris



