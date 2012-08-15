Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrapet@gmail.com>) id 1T1ZPQ-0004pJ-30
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 10:57:00 +0200
Received: by eaad12 with SMTP id d12so322073eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MWSsMP096TU1E2/rdBme1zjzDED1pyXzq06OOmtHykw=;
	b=AstsUUq7Bjg98TY9/x8Y/BgtWslXu/r0N139wXkkOdBzNTDOiuhdes7Xmzvi4QBn9z
	vXTKTmF3bUM7w5+n6Q13QQScXFKpZg7KnDZAIEFwd1NDd4vegaPwV0i7u2wLhfY1r2v4
	vGIqc7MQxkmPh+wGKlfab5K08MpwmNuRZBqk0Tl4V1Cuv5jvmzZMFs+HoPZ5OQwHiHOw
	5Gpf6JDDuGpnrB4CXDh5kFaX7ZTdM8SgsFHRc8k5Bt6YvHWySFN65RqgDVXNecTbxqAm
	7xNx53YWVsixz9RgtXAvp8mx1T51wKzgi3cjjYS54hu6KmnCjl5CGMVhSgf9nzjRPyXD
	6raQ==
Received: by 10.14.179.200 with SMTP id h48mr23591097eem.12.1345020304271;
	Wed, 15 Aug 2012 01:45:04 -0700 (PDT)
Received: from [192.168.0.48] (mur75-1-81-57-45-18.fbx.proxad.net.
	[81.57.45.18])
	by mx.google.com with ESMTPS id 45sm2230328eeb.8.2012.08.15.01.45.03
	(version=SSLv3 cipher=OTHER); Wed, 15 Aug 2012 01:45:04 -0700 (PDT)
Message-ID: <502B613B.4020200@gmail.com>
Date: Wed, 15 Aug 2012 10:43:39 +0200
From: Matthieu Crapet <mcrapet@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120510 Icedove/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
	<k0d7ds$odu$2@dough.gmane.org>
	<CAL2sKTm8xG5o7MfWiALcXrzTsvqk-vR0VmkJbC4Wt4ecCZVxPQ@mail.gmail.com>
	<502A8D7E.1000009@communistcode.co.uk>
In-Reply-To: <502A8D7E.1000009@communistcode.co.uk>
Subject: Re: [RFC][PATCH v2] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Wed, 15 Aug 2012 08:57:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for answer! The path in the "diff --git" line is not good. 
"meta-openembedded-contrib/meta-oe/recipes-support" is my suggestion.
However, I don't know if this kind of software is suitable for oe-devel. 
I just wanted to create a "valid" recipe.

I'm still confused with this SRCREV thing. Just want to retrieve HEAD 
from git master branch. Also tried using inherit gitpkgv
(like systemd) but It raises an error without SRCREV defined.

Regards,
Matthieu

PS: What's the difference between:
https://github.com/openembedded/meta-oe
http://cgit.openembedded.org/meta-openembedded/

>
> Before you bear the wrath of Koen, I would recommend you at least move 
> this to an appropriate layer (such as somewhere in meta-oe[1]).
>
> The general consensus is that things only go in oe-core if they are 
> required for a core-system build.
>
> [1] https://github.com/openembedded/meta-oe
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



