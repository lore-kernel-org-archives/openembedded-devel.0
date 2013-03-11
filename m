Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UEtOD-000547-5M
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 04:27:08 +0100
Received: by mail-vb0-f42.google.com with SMTP id ff1so1432122vbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2013 20:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=EDtR7NplRuy9g73CtPTHJfMySb21LP1T0xgZKDox5zI=;
	b=Ol2X8N3uzgpIOwQPS3DYWBbuMgWxvKhFVAkJCYTyAbzx5pT4PiZ3ySVT9h4MQNjtcq
	s8QJlV8RZUsXVvgzCPcUyltgF0YXnfe1oMawM8h0iH2QoMvsB1AkuVAwpL9BAqrvg88J
	JU8X8fwSxecmCYjKad+7Iwut9pQ0M5lHdaawnWMC6fhpps3pty6nXNho06UEWrT4sNeI
	rCTH88XK9FGyBa3U4VCr5e1cEXs4wdygSiNPV/J2zYH+8Y9moUdwy3ieCjhrCzdbdIkh
	sPspZZ6OnWt+OitsJ1WZWA6XK3mLW4JC9naLHe4dFPf6L6WSf13R6Mf36dJ1I+cq20ne
	USzg==
X-Received: by 10.58.220.229 with SMTP id pz5mr4367871vec.30.1362971426708;
	Sun, 10 Mar 2013 20:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.213.2 with HTTP; Sun, 10 Mar 2013 20:10:05 -0700 (PDT)
In-Reply-To: <3813608.lTKvSajpAY@helios>
References: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
	<1500617.PjPkZjIiXc@helios>
	<20130309063059.GA9724@jama.dyndns-home.com>
	<3813608.lTKvSajpAY@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 10 Mar 2013 20:10:05 -0700
Message-ID: <CAJTo0LbL+t-ECOy_feVBDPw1f7aUJ7GrkA6JqjAdpB+F8fh6+A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm4nGo9W6JAZjPDctoPx7jKSvNQxuxq20w0OmhV7/eFwRFPKb4aW5yxu1IHKE+B/DLP8H+V
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Mon, 11 Mar 2013 03:27:13 -0000
Content-Type: text/plain; charset=UTF-8

On 10 March 2013 13:42, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> we dont know which oe-core and meta-oe revisions are used together and
>> this needs to be applied in both at the same time.. so no, we need to
>> wait for PE/PV change in oe-core.
>
> I guess you're probably right. Yet another reason to never add any more
> bbappends to meta-oe.

For what it's worth I've got a series I'm about to submit to
oe-core/meta-oe that removes polkit from oe-core and moves it to
meta-oe, so this problem will just disappear then as we can bump PR in
meta-oe.

(the background being that polkit is entirely optional, and new
upstreams require a JS interpretter)

Ross


