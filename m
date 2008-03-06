Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JXP3t-0004mX-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Mar 2008 23:59:42 +0100
Received: by an-out-0708.google.com with SMTP id b33so31756ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2008 14:58:06 -0800 (PST)
Received: by 10.100.43.13 with SMTP id q13mr1005648anq.18.1204844286373;
	Thu, 06 Mar 2008 14:58:06 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Thu, 6 Mar 2008 14:58:06 -0800 (PST)
Message-ID: <c384c5ea0803061458x79980e7cvf369d3baf5960adb@mail.gmail.com>
Date: Thu, 6 Mar 2008 23:58:06 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204748655.8110.174.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1204740661.8110.135.camel@dax.rpnet.com>
	<c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
	<1204748655.8110.174.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 209.85.132.250
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Thu, 06 Mar 2008 22:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

On Wed, Mar 5, 2008 at 9:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2008-03-05 at 20:06 +0100, Leon Woestenberg wrote:
>  > On Wed, Mar 5, 2008 at 7:11 PM, Richard Purdie <rpurdie@rpsys.net> wrote:


>
>  The 'normal' situation for OE is:
>
>   build = "build system"
>   host = target = "set by machine config"
>
>  cross.bbclass:
>
>   build = host = "build system"
>   target = "set by machine config"
>
>  native.bbclass:
>
>   build = host = target = "build system"
>
>  sdk.bbclass (previously)
>
>   build = host = "build system"
>   target = "set by machine config"
>
>  sdk.bbclass (previously)
>
>   build = "build system"
>   host = "build system with modified vendor"
>   target = "set by machine config"
>
OK, so you meant that this last instance in fact was a Canadian cross
toolchain?

> Does that cover what you wanted?
>
Your answers covered my questions, thanks!

I don't need a Canadian cross toolchain myself, btw.

Regards,
-- 
Leon


