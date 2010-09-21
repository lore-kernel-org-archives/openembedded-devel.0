Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OxqNI-0000IB-Vu
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 02:06:21 +0200
Received: by iwn2 with SMTP id 2so4741541iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 17:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VUvqeM3fsz9o7a90wGa6EDpObrmOazUAzufQ16an1tU=;
	b=WEPdVIM7XujeI/wrzVwEaxKmBkyADqVahZfYsITgQ0MA52jneVsFLWovcXMb9Mxwfu
	+prctRyFImAdHs/A9cOwiyy21oVFxi7DkqIa5zyBmM/hUddiN31IO30u7t6JIk9k3WPr
	Ajdg2C7p2xGSQ057B+TpT5G0S21fwk/SdUrBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=v8gaNOaC7Wp5G6tlW46Whu4Iz6Wz1/Eo9G/0OaE0x2us+Jj/3bb9eGsbXAWY//sgWC
	sQxLSvcmFU9/ijuQN09o8+tX3K7WwpDyRK0uWer1icDOHkBZB7EC9vQ0HaCefWNe9dYn
	dRJDgGLVGV6LWnsXWraw12uKVltO6xUeTc9sc=
MIME-Version: 1.0
Received: by 10.231.176.73 with SMTP id bd9mr6064179ibb.134.1285027579184;
	Mon, 20 Sep 2010 17:06:19 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Mon, 20 Sep 2010 17:06:19 -0700 (PDT)
In-Reply-To: <4C97F1CD.4070804@gmail.com>
References: <4C97F1CD.4070804@gmail.com>
Date: Tue, 21 Sep 2010 09:36:19 +0930
Message-ID: <AANLkTi=8nUfXETp6GKHn124smQGbT0+rNc18n2ddbW4V@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] opkg: disable GPLv3 code.
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
X-List-Received-Date: Tue, 21 Sep 2010 00:06:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 September 2010 09:14, Graham Gower <graham.gower@gmail.com> wrote:
> The sha256 code is GPLv3 licensed. This was not obvious and the license clause
> in opkg recipes was not updated when the sha256 code was added.
>
> All other files in opkg remain licensed GPLv2 (or later).

I forgot to mention that sha256 checksums for packages are currently
not used in OE, thus disabling this feature should not present
problems.

-Graham


