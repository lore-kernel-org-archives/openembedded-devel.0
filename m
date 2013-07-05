Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from dgate20.ts.fujitsu.com (dgate20.ts.fujitsu.com [80.70.172.51])
	by mail.openembedded.org (Postfix) with ESMTP id E4C526AC48
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 12:34:56 +0000 (UTC)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding;
	b=X7f9olx3HS61gE5hQrSeMkR0GR/yFVY+Zk37z2Zliqv8wRCKMJT2WlDG
	fiKtieRBviVnmf9Wi8Iz/bHs2g9jauehYteT5zAEeLuh40rpBfxSu3M6B
	lgLc+sW2yN1m7VyjeQsziyzIiexjI3NeajpSRpHGAv3f2PB4rG81ObkvN
	U5301yv9GAxiJSlBUwpczMlLDbwVVi9NrV5eWy4QJEvyepzCKlRtGb0Kp
	OrCKu/csoCvByFerwT+ignav6iCXe;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=@ts.fujitsu.com; q=dns/txt;
	s=s1536b; t=1373027698; x=1404563698;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=msitgwDVnrIHS9an0MB0mmcuyYzqdKJ1dVGA4SHk72g=;
	b=LB9qRP052PEnE2aKWXRJhNMTA+99fU/nyAkLYGAcyvTVfi8Pjpji2nAd
	zqvG1/SY9y4/44+xu/XrAkO9/sjpL5KM5Eo6xeUapomuBMTMoMrQruVhg
	iU6e4F9LdjZ+hU309ooakrQ2zOBwk/ChIn7ZOSYfhMksjq8wETWudl9HC
	cpggQKIY6qpN2NM0SZ+BwOu/i8Fgo/ef6QJY0OMp32pXGnDjavnYT/CR3
	5lkiLQMOrTtoXbfG4r+BoJvWOagNA;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.87,1001,1363129200"; d="scan'208";a="129143707"
Received: from unknown (HELO abgdgate60u.abg.fsc.net) ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 05 Jul 2013 14:34:55 +0200
X-IronPort-AV: E=Sophos;i="4.87,1001,1363129200"; d="scan'208";a="63613909"
Received: from unknown (HELO [192.168.0.34]) ([172.25.162.11])
	by abgdgate60u.abg.fsc.net with ESMTP; 05 Jul 2013 14:34:56 +0200
Message-ID: <51D6BD77.4050008@ts.fujitsu.com>
Date: Fri, 05 Jul 2013 14:35:03 +0200
From: Cestonaro Thilo <thilo.cestonaro@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51D42561.8060907@ts.fujitsu.com> <49035936.yua4bikce8@helios>
	<CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
	<1721069.SICaQ1bLDa@helios>
	<CANyK_8eNmm_jnpFgn44TwBLhOdSr1vyVouraHnvwz0T9iWfbkQ@mail.gmail.com>
In-Reply-To: <CANyK_8eNmm_jnpFgn44TwBLhOdSr1vyVouraHnvwz0T9iWfbkQ@mail.gmail.com>
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 12:34:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey,
> Not got time to try reproducing right now, but I did have a very quick
> look in git.
>
> On the bitbake side:
> http://git.openembedded.org/bitbake/commit/?id=860ec42b220b7ed3f3bbe52c3546bba66644eac8
>
> On the oe-core side:
> http://git.openembedded.org/openembedded-core/commit/?id=003ea0fd1017dde50ced710179d0dc2e835d5185
>
>
"git show <commit>" shows that my bitbake clone has the commit 86..., 
but my oe-core clone is missing the 003.... commit.
So I guess that this is the problem.

Ok. The Problem was, that I cloned clones of the oe-core and meta-oe 
layers (via setup-scripts.git from Angstrom) but the bitbake clone was 
from the original openembedded.org.

so, sorry for the confusion and thanks a lot for the quick look you have 
taken!

Greetings
Thilo

