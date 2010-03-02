Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NmYyZ-0008On-It
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 21:46:00 +0100
Received: by fxm20 with SMTP id 20so706806fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yn/5aLDY3K2jXpwmiZc8eSB7WRI8RohbpDGcSf7cmR8=;
	b=OApGeBQ8OA4WAp5hPzkCUb0oj+kjqodJsGUzr1aef0YO0cB/m3vkl+3WfHgYG/hsaS
	eQdy5qCf5hzPJYrEo+WT0evy4KutHOLypQI61LEHxEwccFKExFallHHryFmkXymal7F2
	gdUksi4Hz8dzo7m+t6wPkPn+kIOsaAlEzHUk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VsN5sPw2CbxlzTN/9pY/R0jiOoMhgZ/JybAytGw16Kf3zkq+kADLF44tyDF0N9YgK/
	mV0mSQXaF7z+9KnsxNOZBgpCIpU88gB6mYIJHLirwuFs1IC/c1wobBoCxAMQzNtHd7Hw
	SmM8k7/EKW919HPFT0VSe7DAknxXjWdhAUhPw=
Received: by 10.87.11.34 with SMTP id o34mr10622685fgi.26.1267562584842;
	Tue, 02 Mar 2010 12:43:04 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3173193fxm.6.2010.03.02.12.43.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Mar 2010 12:43:00 -0800 (PST)
Date: Tue, 2 Mar 2010 21:43:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100302204327.GI3206@jama>
References: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>
	<d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>
	<201003012255.35738.holger+oe@freyther.de>
	<hmivei$h8j$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hmivei$h8j$2@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : angstrom: sync pango and pango-native versions
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
X-List-Received-Date: Tue, 02 Mar 2010 20:46:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2010 at 01:14:10PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 01-03-10 22:55, Holger Hans Peter Freyther wrote:
> > On Monday 01 March 2010 22:37:23 Andrea Adami wrote:
> >> Thx, but after this patch I see
> >>
> >> NOTE: preferred version 1.24.4 of pango-native not available (for item
> >> pango-module-basic-x)
> >> NOTE: preferred version 1.24.4 of pango-native not available (for item
> >> pango-module-basic-fc)
> >> NOTE: preferred version 1.24.4 of pango-native not available (for item
> >> pango-native)
> > 
> > mea culpa, I asked koen to bump it.. and he blindly did. The fix should be to 
> > add a pango-native of that version.
> 
> Yes, my bad! I had an extension to pango.inc sitting in my tree that I
> didn't commit yet, but it's in now:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f45f0d3495aba36aafc286d25f96d5bd9a82c7d9
> 
> This commit also shows that using BBCLASSEXTEND isn't so hard, more
> people should try to convert their recipes to it instead of deleting them :)
> 
> regards,
> 
> Koen

Thanks Koen!

small issue:
the same .inc is also used from
pango-native_1.22.0.bb -> pango_1.22.0.bb -> pango.inc

So then it creates native-native and says
NOTE: multiple providers are available for pango-native (pango-native,
pango-native-native);
NOTE: consider defining PREFERRED_PROVIDER_pango-native

I guess that git rm -r pango-native_1.22.0.bb pango-native-1.22.0
is right sollution in this case but didn't checked it.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


