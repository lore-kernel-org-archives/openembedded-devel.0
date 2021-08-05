Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.4165.1628132435476251426
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 20:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm3 header.b=S9D/CA0e;
 spf=pass (domain: aj.id.au, ip: 66.111.4.26, mailfrom: andrew@aj.id.au)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id AE7615C0134;
	Wed,  4 Aug 2021 23:00:34 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Wed, 04 Aug 2021 23:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=qnj4mn8I0AgxqzIW6T1JWDvWuQYFbAx
	L9g72Kx91N+8=; b=S9D/CA0eJUK7JSjEcBjNXW285lO1wIFdoLcr7SeeU14ZmtN
	pWCHGAAziIOB5nmyqdZkLuQg+t23wJEu0AQdLfEncdTGKOGmjLuLPdMX7TB/FkHE
	HGtX/vskGj8cixeUNlsRieLy3mNydS95QvJPKsTZbgxot6Nxg08YbOj+DpIn88zv
	GhS7yhTmu9ws5ygB0ywcxPxnFEkJQgcUBj9t2HHCqlS2KOAvN7qnB3CxlJxj2Udo
	kd9D54fZtqytXrzycFTWt3cYo2BFXSjDaoV7sQYsKueBjd/40gS2RbS957WtzZBR
	dIP3ofUZtoRatAUa30eTR2RufaAjkDETJHdgJbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qnj4mn
	8I0AgxqzIW6T1JWDvWuQYFbAxL9g72Kx91N+8=; b=B57uY1CUkplelM8Tuorj0E
	hE5B05p52+8tEmy683HkiylgPYiPeJ7Fc+0BF3b26LiNQj/+jEZZdkAaaE+DtVaZ
	Gil4NfQlljxr87pODUW0K0oD4t+VMgWC4k6rsObJwFFRWEsTUVPTNE3wdNwz7V+/
	14K1WJC2Q7ooD+5XL8BzGxcKUD3wrkJX8+vqCXvMsgdEozFCOCnJqHdFIdey36OK
	pU3INSDarpGjBUeKHPmbzfTQUc+S75tmjGG61h096Cf3Cccn95P81V7SyRPQ7aXd
	L+EM+YoZjGtRXF0PCB9QSSu8sQd3jfYQju/LGl4TgOBbNeaNGZu7zEfh3vynXKtg
	==
X-ME-Sender: <xms:UlQLYSGTbeRe8gACAEX38E8Qa88UCSKwwVeK_qnTUwvTfzkhX_SaFw>
    <xme:UlQLYTVnOT1VYkg1Qu8iMzFjRhCU4gekzFvM4ZJ5vwfL5Go5mSWFhmXOshnh0DPCL
    VMogzD8nB1MwD7DPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
    tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:UlQLYcLnZrbtPYkPO_grV-uy_SBlOA2TJSxDgAMMeMF3bTtjnqRlZQ>
    <xmx:UlQLYcFlxEWq8V-Hyhhvlr0CzsDjH4v0WPSxY1N5Joj054KXqtdXrg>
    <xmx:UlQLYYV9OpDQYFL2qjLYklQZs86aocK7oFhTAAbfsjl1CbYj7y62pw>
    <xmx:UlQLYbBr7dC71tdZS1-3b3CK1Uuw6JbOqtB7wi3gsNPXIqtbJtPzpQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1D978AC0DD0; Wed,  4 Aug 2021 23:00:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-551-g8030b8c701-fm-20210804.001-g8030b8c7
Mime-Version: 1.0
Message-Id: <7093a638-9d12-43dc-add0-a93b8aa662c3@www.fastmail.com>
In-Reply-To: <d7a8a64f-3ed7-3d55-afa3-ced9add34aae@gmail.com>
References: <20210805022906.1023804-1-andrew@aj.id.au>
 <20210805022906.1023804-2-andrew@aj.id.au>
 <d7a8a64f-3ed7-3d55-afa3-ced9add34aae@gmail.com>
Date: Thu, 05 Aug 2021 12:30:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Khem Raj" <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][PATCH 1/2] meta-oe: python3-gmpy: Add native support
Content-Type: text/plain



On Thu, 5 Aug 2021, at 12:27, Khem Raj wrote:
> 
> 
> On 8/4/21 7:29 PM, Andrew Jeffery wrote:
> > python3-gmpy is a transitive dependency of meta-aspeed's socsec package,
> > via python3-ecdsa. socsec is a set of tools for signing bootloaders and
> > forming a hardware root of trust for ASPEED BMC SoCs.
> > 
> 
> 
> Thanks for your contributions Andrew, a small nit on subject line we 
> dont need layer name. Format is something like below
> 
> recipe: short summary
> 
> Detailed commit explaination
> 
> 
> I have fixed it this time around, so no need to send v2.

Ah, that was an oversight as I cherry-picked the commit from the 
openbmc tree where I originally wrote it.

Thanks for fixing it up!

Andrew
