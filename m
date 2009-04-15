Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1LuCAk-0001Bp-IA
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 22:57:32 +0200
Received: from localhost ([95.72.100.66]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n3FKraJE017733
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2009 00:53:38 +0400
Date: Thu, 16 Apr 2009 00:53:36 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Message-ID: <20090415205336.GB17954@rainbow>
References: <1239791510-14596-1-git-send-email-mad_soft@inbox.ru>
	<gs4euu$jbv$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gs4euu$jbv$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Thu, 16 Apr 2009 00:53:39 +0400 (MSD)
X-SA-Exim-Connect-IP: 83.222.19.8
X-SA-Exim-Mail-From: mad@mail.asoft.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glista: new recipe
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
X-List-Received-Date: Wed, 15 Apr 2009 20:57:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 13:03 Wed 15 Apr     , Koen Kooi wrote:
> On 15-04-09 12:31, Dmitry Artamonow wrote:
>
>> +inherit autotools pkgconfig
>
> inheriting pkgconfig should be done:
>
> 1) it's for staging .pc files
> 2) if you *do* want to stage .pc files use AUTOTOOLS_STAGE_PKGCONFIG = "1" 
> instead
Thanks for explaining. There's no .pc files in glista, so dropping
'inherit pkgconfig' should be enough.
Updated patch follows.

-- 
Best regards,
Dmitry "MAD" Artamonow



