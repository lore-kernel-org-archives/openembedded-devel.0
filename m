Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MGgBz-0001hG-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 23:27:43 +0200
Received: by yw-out-1718.google.com with SMTP id 5so2246327ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2009 14:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=o1R957zV11zGLpFKHs537wgT9Uf+L4IAbA90Bsm3JV8=;
	b=qaD4M9ceL+Xw6TnoT7A4rnZk4p/yIyV16sxb1tzto7ckd3/2PLVuH3GxiC2GlxA7gJ
	c5J8ukTbtBC6T6VkvfOZ8UkH2cpoWauATygX+G2eesa2+G8wi+Hqp4F6VM3Atv+hV8Ox
	4rwhJ9xuCSuf7cBZVtOIoi3gT9oCc7v6b8khg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vkaqWKgZwQkf7BQJF1Lvlb+z2FxTeuW6s1f5Juc7drb2axr911W95uP0fasQP1PM/J
	a+0F1E1bT1xJcQhkTaWHk1GmHvhzEU0a9ST0rLmPa2w/SEF8b8V2YrDrSkcBe4mP57su
	tA7CuUpVuq5ZIZpTq+RdNlMNwdUq3ZV4BVECg=
MIME-Version: 1.0
Received: by 10.231.10.134 with SMTP id p6mr3151131ibp.36.1245187041416; Tue, 
	16 Jun 2009 14:17:21 -0700 (PDT)
In-Reply-To: <c384c5ea0906111046y378a58c6xe6db8fd54af4aeda@mail.gmail.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
	<CEB81C4F-48EC-4D42-84C2-F7779D133565@mac.com>
	<ac9c93b10906110722g77626187m50f92b8f20c9579c@mail.gmail.com>
	<c384c5ea0906111046y378a58c6xe6db8fd54af4aeda@mail.gmail.com>
Date: Tue, 16 Jun 2009 23:17:21 +0200
Message-ID: <c384c5ea0906161417w5d5b808esf056f74286336e08@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Tue, 16 Jun 2009 21:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Jun 11, 2009 at 7:46 PM, Leon
Woestenberg<leon.woestenberg@gmail.com> wrote:
>
> Given the number of reports (and people "fixing" it by doing a new
> run) I think a race condition is likely.
>
> If indeed it's fixed, we should at least find out what fixed it.
>
Today I did a fresh checkout and build of .dev and hit both
e2fsprogs-libs as well as util-linux-ng hitting the problem again,
failing the build

An individual clean followed by individual rebuild solves the problem.

What I did notice, is that after cleaning util-linux-ng and then
rebuilding, a whole lot (all?) packages got their do_package_* methods
called.

Regards,
-- 
Leon


