Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 544117FF81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47d0Tw4xqjzQ3;
	Wed, 18 Dec 2019 04:14:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576638853;
	bh=tU8FqhQ6T8c0mZEL/ABpiI3TXAp+Sc2IX00XhdVwU0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLu+LnLUtW+OlwZX8aV6Na/fIrbMz96iD6FVYNx8kQukEBeC+fNR9rOscQj9TDZih
	FoGHKcoi0AuXaFC24ByUsw5y/8Z14bRKUCdTPABx7yCWGlbvi9HIYyx38mB1vognLi
	QaD1SrdF2KpAEz0/zdE0Hh+BGkwZ/DJq7Jg6OaOn4fCDof0baa57iQvOh06PHYG/gQ
	t6MsoBFiy+IM4v+BO8cw+kbCA/+4pfjdkhTMvnzWjHUUORxdBA+y3KjbHaZaybljgh
	h/nlIzTboKQW/bKR6u/G2zmFBRDxsS2h0gxwlXWSKTt7Y70+XXFbrgFENv2IFETHNH
	t/FbINJZxkj2GMRKFl+lLDzXFF/BeaXZ70Z+5nahj8gX+ajtY1VJxZsJ1RcqKIEU7H
	4+CKUZo2XGygpLdyXvh36hLKc0qsx3hVCrDZnHHRknruag+WUFjZz0W8HpON0KDmNK
	8NJ3pEDdcVo/PAHd5rYO12oBsgrvyuLwo2rHcTTSCesM1B1vHyPoS1oJRDGJK/CTwk
	UYPyzukBjVOFSTgwrowHF3p1FQHmGyb2OEsGrtE4eAdRiQ+EGrLKKsv3mTGsZG4psg
	A2ZIudyaFUSdb4NT+qbZE7+UmG3MTJmyPGaDa++bUnoWfg3Wuv8UBAk8WGbybPFpy2
	+UqfdARz0j8fJ9+w8IIT7iQg=
Date: Wed, 18 Dec 2019 05:14:09 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <20191218031409.GA1997@localhost>
References: <20191218011113.4072000-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191218011113.4072000-1-trevor.gamblin@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] net-snmp: update default community string
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 03:14:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Dec 17, 2019 at 08:11:13PM -0500, Trevor Gamblin wrote:
> snmpd.conf, by default, lists the string "public" as the community string. As
> a consequence, any build incorporating net-snmp implicitly enables a
> vulnerability (CVE-1999-0517) where an attacker could obtain information about
> (and potential control of) the device and its network. This issue is picked up
> by common security scan tools, and given the age of the vulnerability, some
> minimum mitigation steps should be taken. While the conf file itself
> recommends setting the community string to a value known only within the
> user's organization, changing this string's default value for Yocto builds is
> a minimum step to help mitigate this issue.
>...
> -com2sec paranoid  default         public
> +com2sec paranoid  default         yocto-snmp-community
>...

Instead of mitigation this might do more bad than good.

Attackers and security scan tools will just start to also
scan for the known alternative "yocto-snmp-community".

The problem is that attackers tend to be faster with that,
so the actual change would be that security scan tools might
no longer report a vulnerability attackers will still use.

cu
Adrian

