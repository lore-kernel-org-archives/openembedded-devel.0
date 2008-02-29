Received: from [64.233.178.250] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JV9ze-0000oh-4f
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Feb 2008 19:30:05 +0100
Received: by hs-out-0708.google.com with SMTP id 23so1154896hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Feb 2008 10:29:06 -0800 (PST)
Received: by 10.100.201.16 with SMTP id y16mr20153406anf.33.1204309746637;
	Fri, 29 Feb 2008 10:29:06 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 29 Feb 2008 10:29:06 -0800 (PST)
Message-ID: <c384c5ea0802291029o2cc478dr278b40e103350326@mail.gmail.com>
Date: Fri, 29 Feb 2008 19:29:06 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204308250.8126.42.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<c384c5ea0802290924i636e65dey9b6bfdceda20d17f@mail.gmail.com>
	<1204308250.8126.42.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 64.233.178.250
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Feb 2008 18:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Fri, Feb 29, 2008 at 7:04 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2008-02-29 at 18:24 +0100, Leon Woestenberg wrote:
>  > excellent work and plan of attack.
>
>  > Could you explain why this must be TARGET_VENDOR instead of BUILD_VENDOR?
>
>  Its a little bit hacky but there is a good reason. Basically you don't
>  want -native and -sdk packages in the same directory. If you don't
>
Could we just add a comment explaining this approach above the assignment?
Everything that is not trivial by code inspection surely deserves a comment.

I recon I could try the patch already.

Regards,
-- 
Leon


