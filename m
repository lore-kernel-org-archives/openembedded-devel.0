Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7ucR-0004E3-Dn
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:39:35 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 41EB3275CE2F; Mon, 18 Oct 2010 20:39:02 +0200 (CEST)
Received: from [192.168.1.142] (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 53805275CE43
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 20:39:01 +0200 (CEST)
Message-ID: <4CBC9444.5090801@gravedo.de>
Date: Mon, 18 Oct 2010 20:39:00 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12pre) Gecko/20101011 Shredder/3.1.6pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287123859-31756-1-git-send-email-morphis@gravedo.de>	<AANLkTi=tvR6=LmMyEjwXQSuDBHJsbMH6dUZrnpBzOMc3@mail.gmail.com>
	<4CB8855F.4090304@gravedo.de>
In-Reply-To: <4CB8855F.4090304@gravedo.de>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-pycairo: convert to new style staging and bump PR
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
X-List-Received-Date: Mon, 18 Oct 2010 18:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15.10.2010 18:46, Simon Busch wrote:
> On 15.10.2010 09:07, Frans Meulenbroeks wrote:
>> Some concerns:
>> I don't think STAGING_INCDIR should be used; guess it should go to
>> ${D}/${includedir} (just like the 1.8.0 version does).
>> You might also peek at the do_install_append of the 1.8.0 recipe as it
>> does different/more things. I don't know too much about pycairo, but I
>> can imagine these make sense for 1.4.0 too.
> 
> I even don't know much about pycairo in detail I just noted that it does
> not compile in its current state and changed it to new style staging.
> But I will check if it makes more sense to change the staging path to
> ${D}/${includedir} as I just copied what was already there in do_stage().
> 
>> Then again perhaps it is time to move to 1.8.0; this version has a
>> DEFAULT_PREFERENCE of -1, but angstrom 2008 and 2010 and kaeilos
>> already have 1.8.0 as preferred version (and the 1.8.0 version is
>> around for 1.5 year or so).
> 
> For me it should be ok to drop 1.4.0 and use 1.8.0 if nobody else uses
> it. Btw. there is already a newer version of pycairo available. It's
> 1.8.10 but they changed it's name to py2cairo. pycairo is now the name
> for the version with python 3.x support.

As SHR is now using 1.8.0 as default python-pycairo version I am fine
with dropping version 1.4.0.

regards,
morphis




