Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWSZ7-0001hb-Df
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 15:22:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2329F315C663
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 15:12:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YPbPKYVtWzh6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 15:12:13 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ed1c8.pool.mediaWays.net
	[89.14.209.200])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D9FDB315BF62
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 15:12:12 +0200 (CEST)
Message-ID: <4FBA3F2B.2080604@opendreambox.org>
Date: Mon, 21 May 2012 15:12:11 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
	<jpdbbe$uj9$1@dough.gmane.org>
In-Reply-To: <jpdbbe$uj9$1@dough.gmane.org>
Subject: Re: [meta-oe][PATCH] systemd.bbclass: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 13:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21.05.2012 14:10, Koen Kooi wrote:
> Op 16-05-12 18:56, Andreas Oberritter schreef:
>> * Calling "systemctl disable" from postrm is too late and causes the
>> following error:
> 
>> | Failed to issue method call: No such file or directory
> 
>> * Messing with $D is not needed in *rm scripts.
> 
> "Messing" with $D *is* needed in *rm scripts, so this one has been reverted.
> Feel free to resend patches with only the postrm/prerm changes.

Feel free to do it yourself.


