Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Ljio3-0005zy-Lg
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 00:34:56 +0100
Received: by fxm20 with SMTP id 20so393815fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lnYbVlTDtgnTGJ15Sy4mHml7PNJx1QgUczVORW40LSg=;
	b=YyRAL8f1+1xZlWsVA6q9T18mZ2KraNyvdh+NEe3Fbg4QWgi8GZl4UWUkvQByB4wfu9
	5jFuSULUvVJWQyEJmcPWQeVUadvenXL46afJYPjbSckiAEZJ/vkH6wGo8kz1u4nNMwzm
	P000t4R0TfwQCIPaMZEm7WuzoVdINsNaHoq9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UQdjeQn+8/7wVG9EWjDQn4co5RQq/k72dOCOvN/rYntHfsi9faKlHLyB8y5bHRI9jA
	1CmgN2fM1CSax81qpIr1zZ9/hGr83uX4GbR/SZMVdO4lIb4A25Nn1hADMTdFyqgd9de0
	2C7S0rYrcuxF51VrTtZB6M5u+gaRPrO7FsbNc=
MIME-Version: 1.0
Received: by 10.223.110.144 with SMTP id n16mr514902fap.63.1237332838684; Tue, 
	17 Mar 2009 16:33:58 -0700 (PDT)
In-Reply-To: <1237328436.20770.57.camel@homestead>
References: <1237328436.20770.57.camel@homestead>
Date: Wed, 18 Mar 2009 00:33:58 +0100
Message-ID: <d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.172
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Tue, 17 Mar 2009 23:35:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This will change hopefully soon. There are plans to redesign the whole tmpdir.
My first wish is to have pstage out of there, in order to reduce build
time (I'd keep /tmp in RAM).

Regards
Andrea


