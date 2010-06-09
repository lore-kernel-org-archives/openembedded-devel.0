Received: from fallback4.mail.ru ([94.100.176.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OMRS6-0002Tr-HB
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 22:00:43 +0200
Received: from mx75.mail.ru (mx75.mail.ru [94.100.176.90])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id 0DC122107C4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 23:46:57 +0400 (MSD)
Received: from [77.51.33.209] (port=40618 helo=localhost)
	by mx75.mail.ru with asmtp id 1OMREl-000PiQ-00
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 23:46:55 +0400
Date: Wed, 9 Jun 2010 23:46:54 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609194654.GB12397@rainbow>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<1276068782-23257-3-git-send-email-mad_soft@inbox.ru>
	<20100609133126.GB29724@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100609133126.GB29724@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam: Not detected
X-Mras: Ok
X-SA-Exim-Connect-IP: 94.100.176.42
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] jbig2dec-0.11: new recipe
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
X-List-Received-Date: Wed, 09 Jun 2010 20:00:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06:31 Wed 09 Jun     , Khem Raj wrote:
> On (09/06/10 11:33), Dmitry Artamonow wrote:
> > +inherit autotools
> > +
> > +do_stage() {
> > +        autotools_stage_all
> > +}
> 
> do_stage is not needed for new staging.

So I can drop this "autotools_stage_all" hack entirely and it will do
the right thing? Nice! Ok, will redo both openjpeg and jbig2dec recipes,
test them and resubmit.

BTW, it would be nice to have this thing removed from other existing recipes
tree-wide, so it won't be tempting to "copy-paste" it, as I did :)

-- 
Best regards,
Dmitry "MAD" Artamonow



