Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7mrr-0005Cf-BP
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:22:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 87FE43149FB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:22:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lhV3m758vlll
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:22:18 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 13A773149FA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:22:18 +0200 (CEST)
Message-ID: <4CBC1FBE.9020808@opendreambox.org>
Date: Mon, 18 Oct 2010 12:21:50 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287353716-27717-1-git-send-email-obi@opendreambox.org>
	<i9gsjn$8r0$3@dough.gmane.org>
In-Reply-To: <i9gsjn$8r0$3@dough.gmane.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libfribidi-0.10.4: update recipe, fix packaging
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
X-List-Received-Date: Mon, 18 Oct 2010 10:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/18/2010 09:22 AM, Koen Kooi wrote:
> On 18-10-10 00:15, Andreas Oberritter wrote:
>> * added LICENSE
>> * removed configure patch
>> * use lib_package and binconfig to package all installed files
> 
> What's the upgrade path? I assume package names have changes due to this.

I guess my patch description wasn't clear enough.

The previously unpackaged files ${bindir}/fribidi and
${bindir}/fribidi-config are now packaged into libfribidi-bin and
libfribidi-dev, respectively.

The only file which moved to a different package is libfribidi.a, from
libfribidi-static to libfribidi-dev.

Does this change require special treatment for upgrades?

Regards,
Andreas


