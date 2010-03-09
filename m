Received: from wbm12.pair.net ([66.39.3.90])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1NozH7-0003KB-2K
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 14:15:06 +0100
Received: by wbm12.pair.net (Postfix, from userid 65534)
	id 65A186CC1F; Tue,  9 Mar 2010 07:52:17 -0500 (EST)
Received: from 193.195.44.178 ([193.195.44.178])
	(SquirrelMail authenticated user blueligh@bluelightning.org)
	by webmail12.pair.com with HTTP; Tue, 9 Mar 2010 12:52:17 -0000 (GMT)
Message-ID: <25809.193.195.44.178.1268139137.squirrel@webmail12.pair.com>
In-Reply-To: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
References: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
Date: Tue, 9 Mar 2010 12:52:17 -0000 (GMT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.5
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SA-Exim-Connect-IP: 66.39.3.90
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'bitbake opie-image' problem
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
X-List-Received-Date: Tue, 09 Mar 2010 13:15:07 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Jiason Li wrote:
> I was trying to make some images followed the getting_started guide,
> 'bitbake nano', 'bitbake console-image' all succeeded,
> but soon I encountered problem when doing 'bitbake opie-image'.
>
> Do you have any idea about this issue?

This is due to libopkg's C headers having changed recently. Not only has
the API changed, but the headers are now uncompilable within a C++
program. I am in the process of fixing this, hopefully I will have some
patches done this evening.

Cheers,
Paul


