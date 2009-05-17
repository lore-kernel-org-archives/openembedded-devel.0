Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M5qKp-00026U-Qg
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 02:04:04 +0200
Received: (qmail 21637 invoked from network); 17 May 2009 23:56:50 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 May 2009 16:56:50 -0700
Date: Sun, 17 May 2009 16:56:49 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090517235649.GJ23842@smtp.west.cox.net>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<guq6vh$tmi$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <guq6vh$tmi$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Mon, 18 May 2009 00:04:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2009 at 01:35:07AM +0200, Rolf Leggewie wrote:
> Marcin Juszkiewicz wrote:
>> My addition to this:
>>
>> mkdir recipes-broken
>> git add  recipes-broken
>> git mv recipes/obsolete recipes-broken/obsolete
>> git mv recipes/nonworking recipes-broken/nonworking
>>
>> As this will allow users to set:
>>
>> BBFILES = "/somewhere/oe/recipes/"
>>
>> which is supported by BitBake for years.
>
> I'd like to revisit this suggestion from Marcin which came up during the  
> discussion of the packages->recipes renaming.  I think the above makes  
> sense and should be committed.  I think it would be nice if the folder  
> was named broken-recipes instead of recipes-broken.  First of all, it  
> sounds nicer IMHO ;-) but more importantly, this works better with  
> bash-completion.

I believe with the collection stuff we don't need to do this kind of
move for easier / smaller local.conf files.

I think what we really need to do (in part because I think there's some
bitbake changes needed for compelete functionality) we need to bump
dev's minimum bitbake and update local.conf.sample and the wiki.  Oh,
and check with Chris to make sure everything he's got in these areas is
in :)

-- 
Tom Rini


