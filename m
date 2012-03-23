Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SBCO1-0005iW-S1
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 22:51:06 +0100
Received: by obqv19 with SMTP id v19so2947945obq.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 14:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=Lj2ZeKQH7YFYbZs+1Oweo28rxFaDVXZpPbmjOUh6cc8=;
	b=XKpJcqGLNl3xlkoPVx4Le5BzY4eYPt9Em4Mz9/kCZt6cVAof5+6dxaW+t/neCXV+Ox
	VKLBNcQc944kSwpM7iZdjnuDVRn4LI7qh0Lhbni6LwgECmr074dZJI9aJxHUnadD9bYY
	+rqU7f6L7NGOBHKrFC571QiQQ+Mi4bqSCW1Q7nWQ4AeT5sBkYhLWob9bmujJiJKQEdir
	OaZFBRPP7hbmLopuXACGbDsFmUrF4MMe4GW1YsDCHW3cco4Lhxw67ZlFKRSL1hxku0Yq
	LlVybH1IpO5NZ0+ChkjY3clNtm3mpQ2lghIsQ1KRaJ5ITaXiXJ6QYLzojAe70/feUJ4Z
	NcYg==
Received: by 10.182.85.39 with SMTP id e7mr16251849obz.51.1332538928754;
	Fri, 23 Mar 2012 14:42:08 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id w4sm8900467obx.2.2012.03.23.14.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 14:42:07 -0700 (PDT)
Date: Fri, 23 Mar 2012 14:42:10 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120323214210.GJ9551@bill-the-cat>
References: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Fri, 23 Mar 2012 21:51:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 23, 2012 at 10:10:57PM +0100, Henning Heinold wrote:

> Hi,
> 
> while building openjdk I discovered that relocatable.bbclass strips
> all PATHS with ORIGIN, that is problematic, when binaries like an jdk
> is installed not in the standard paths /lib or /usr/lib.
> 
> This patch let all exisiting ORIGIN stay in the binary. So
> far I only saw problems with some perl-native libs, where chrpath fails
> now, because the path is to long. But it seems they work anyway.

Perhaps my memory is hazy, but this feels like an openjdk problem.  Why
is openjdk putting things other than were our $ORIGIN mangle expects
them to have been placed?

-- 
Tom


