Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Ol3t5-0004Vd-Rt
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 19:54:20 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id CF9AA275D865; Mon, 16 Aug 2010 19:54:04 +0200 (CEST)
Received: from [192.168.1.142] (p5489A50E.dip.t-dialin.net [84.137.165.14])
	by gravedo.de (Postfix) with ESMTPSA id 323DC275D863
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 19:54:01 +0200 (CEST)
Message-ID: <4C697B38.5070408@gravedo.de>
Date: Mon, 16 Aug 2010 19:54:00 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12pre) Gecko/20100809 Shredder/3.0.7pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281468568-8990-1-git-send-email-morphis@gravedo.de>	<20100813215226.GB19855@excalibur.local>
	<1281813967.2127.1.camel@saphir>
In-Reply-To: <1281813967.2127.1.camel@saphir>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ecore: remove fix-ecore-fb-initialization.patch
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
X-List-Received-Date: Mon, 16 Aug 2010 17:54:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 14.08.2010 21:26, schrieb Michael 'Mickey' Lauer:
> Am Freitag, den 13.08.2010, 23:52 +0200 schrieb Stefan Schmidt:
>> Hello.
>>
>> On Tue, 2010-08-10 at 21:29, Simon Busch wrote:
>>> Removing the fix-ecore-fb-initialization patch as it let ecore open the supplied
>>> touchscreen device twice which results in an error on platforms where the touchscreen
>>> device node can be opened only once. Furthermore I doubt that it is necessary to open the
>>> touchscreen device node more than one time.
>>
>> Sounds good, but I want to hear Mickey on this before pushing it as it is his
>> patch.
> 
> NACK. Last time I checked, this patch was still necessary to fix
> touchscreen access using Ecore on pure framebuffer. There may be
> better approaches to it, but removing it now will break ecore on fb.
> 
> Regards,

I think the best solution to work around this is using tsmd: our
touchscreen daemon which opens the touchscreen device node and forwards
it to a uninput device which can be opened more than on time.

Will write a recipe for it and send it in for integration.

regards,
morphis


