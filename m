Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S21hW-0002uP-4K
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 15:37:18 +0100
Received: by pbbrp12 with SMTP id rp12so2818315pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 06:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of tom.rini@gmail.com designates
	10.68.134.198 as permitted sender) client-ip=10.68.134.198; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tom.rini@gmail.com
	designates 10.68.134.198 as permitted sender)
	smtp.mail=tom.rini@gmail.com;
	dkim=pass header.i=tom.rini@gmail.com
Received: from mr.google.com ([10.68.134.198])
	by 10.68.134.198 with SMTP id pm6mr38785256pbb.147.1330352931237
	(num_hops = 1); Mon, 27 Feb 2012 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LQUxcZMQgn6TwjJu0+b33Cdo5kN15+fNif1E5MIiBrc=;
	b=GEx3TWYHWzN5sCzVUVtrf+C4tTCCrrlYsibZGncWW2oNNACmvg5j3gyOHJNYMrdowV
	2fd667zha516MJsUKIdO0qny5oLVlnOJ/TswUuluh7q1YWjX5s701ek1ZZ+Z0Z53qcbl
	AMWBykOollFcSzvpWBCIOLzft0Om5132wRqwY=
MIME-Version: 1.0
Received: by 10.68.134.198 with SMTP id pm6mr33098763pbb.147.1330352931121;
	Mon, 27 Feb 2012 06:28:51 -0800 (PST)
Received: by 10.142.237.1 with HTTP; Mon, 27 Feb 2012 06:28:51 -0800 (PST)
In-Reply-To: <4F4B27FA.3050504@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
	<20120224202626.GA14969@bill-the-cat>
	<4F4B27FA.3050504@dresearch-fe.de>
Date: Mon, 27 Feb 2012 07:28:51 -0700
Message-ID: <CA+M6bXmYaNNnJUTbrSf=KFhJbzxDXNUD+9AWhJuCmUK3Nwz24g@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 2/7] fakeroot-native: update to 1.14.5
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
X-List-Received-Date: Mon, 27 Feb 2012 14:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 26, 2012 at 11:51 PM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> On 24.02.2012 21:26, Tom Rini wrote:
>> On Fri, Feb 24, 2012 at 04:47:19PM +0100, Steffen Sledz wrote:
>>
>>> * version 1.9.6 is no longer fetchable
>>
>> It _IS_ fetchable if you use a versioned string on snapshot.debian.org.
>> Please use this instead (and we have an example or two already, possibly
>> even for fakeroot I'd have sworn).
>
> Hmmmm?
>
> It's a pity that these comments did not came up, when the commits were proposed to oe-classic master some weeks before. Now they made it their way to the master branch (and our application) as they are.

Or that oe-classic diverged here after someone else pointed out this
change to me on this list a while ago.

>
> I would prefer if they make it to 2011.03-maintenance the same way to avoid confusions with master branch.
>
> Regards,
> Steffen
>
> PS: Can you explain for a non-debian user what you exactly mean with "use a versioned string on snapshot.debian.org". Thx

An example would be
http://git.openembedded.org/openembedded/commit/?h=2011.03-maintenance&id=8994c34bb3b50df579edbf5e085cada56846baa3

-- 
Tom


