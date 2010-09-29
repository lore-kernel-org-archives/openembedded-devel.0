Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P140B-00062G-ML
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:15:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 199B53148E16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 23:15:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Vig5Zs5IO8MF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 23:15:28 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id D0C743148D58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 23:15:28 +0200 (CEST)
Message-ID: <4CA3AC70.1020505@opendreambox.org>
Date: Wed, 29 Sep 2010 23:15:28 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>	<1285792594-10032-15-git-send-email-obi@opendreambox.org>
	<AANLkTinYVSenDQqqN0kTBJq7R0_tpsXUD=iszxv0-3XF@mail.gmail.com>
In-Reply-To: <AANLkTinYVSenDQqqN0kTBJq7R0_tpsXUD=iszxv0-3XF@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/18] cdparanoia: create libcdparanoia packages
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
X-List-Received-Date: Wed, 29 Sep 2010 21:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 29.09.2010 22:56, Frans Meulenbroeks wrote:
> I feel there should be an
> RDEPENDS_${PN} += "libcdparanioa"
> to add the dependency that is now created (if i recall correctly
> cdparanoia is statically build).

The dependency is generated automatically by shlibdeps. The executable
gets linked dynamically.

> There is no -doc package?

There is cdparanoia-doc, wich only contains a man page for the
executable. I left it to the default.

> Other wise this one looks fine to me. Will test tomorrow (time permitting).

Thanks!

Best regards,
Andreas



