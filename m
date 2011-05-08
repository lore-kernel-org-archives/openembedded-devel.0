Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QJ391-0007su-S3
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 14:31:31 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 01A2C799012; Sun,  8 May 2011 14:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-070-129-150.pools.arcor-ip.net
	[88.70.129.150]) by gravedo.de (Postfix) with ESMTPSA id 2F528798D6F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 May 2011 14:28:48 +0200 (CEST)
Message-ID: <4DC68C80.2040506@gravedo.de>
Date: Sun, 08 May 2011 14:28:48 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304773638-24877-1-git-send-email-morphis@gravedo.de>
	<BANLkTik1ArwPz=B-OGrsfNWza2ad4d4g6Q@mail.gmail.com>
In-Reply-To: <BANLkTik1ArwPz=B-OGrsfNWza2ad4d4g6Q@mail.gmail.com>
Subject: Re: [PATCH] qt4-libs-native: add initial recipe
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
X-List-Received-Date: Sun, 08 May 2011 12:31:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07.05.2011 21:17, Otavio Salvador wrote:
> On Sat, May 7, 2011 at 10:07, Simon Busch <morphis@gravedo.de> wrote:
>> The native version of the qt4 libraries is needed by some other native recipes to build.
>> It's mostly a copy of the qt4-tools-native recipes with some changed configuration optons
>> and is only available for version 4.7.2 now.
> 
> I second this idea since I will be a user of it but seems better to me
> to have a full qt4-native since this would reduce build duplication
> time, no?

You are right. As qt4-libs-native and qt4-tools-native are build mostly
the same stuff we could merge them and create a qt4-native recipe if
nobody else has any concerns. I will provide a patch for this.

regards,
Simon





