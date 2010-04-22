Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O50TH-000876-7e
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 19:45:52 +0200
Received: by qyk33 with SMTP id 33so5650614qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=jEbIefJs63LfjyUZzmq77uJCtKfFpeFOvi7tKVZ4ZDo=;
	b=suwgrouxQznqkYM7BanjI6rtVCNn5S+SLGrZd4FOIZroBMJlqUpD6gYryz0PnVpnFX
	DlxA3vyJyA2272uNZH6kZeXz2RiqCaj8q0UDAYyDGnewgC+ZYZZO98V5yn3BtLg+7EiS
	dfKtAkE28ockoj4AVGnN5yRzSFM0+2lA5oAN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=YZiU/qXe5bPGqjUdbmjVNVdue3vdzXbzYXOhlNMnYatXCT2cTZsy4TEJRBNfGgg1TO
	zgQ14wC4F6/gSwxQYT3ARobrEaSTgfFwcTmEaZKTCWcZRifQi5mp1NlFAEKPT6iM9ks+
	emNpJ4m37zKd/m0eKxIa3gVPqu99sZPC94Wj4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Thu, 22 Apr 2010 10:41:54 -0700 (PDT)
In-Reply-To: <1271666500-17854-1-git-send-email-khimov@altell.ru>
References: <1271666500-17854-1-git-send-email-khimov@altell.ru>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 22 Apr 2010 10:41:54 -0700
X-Google-Sender-Auth: d1852dbb55ad23b1
Received: by 10.224.53.78 with SMTP id l14mr114662qag.367.1271958134405; Thu, 
	22 Apr 2010 10:42:14 -0700 (PDT)
Message-ID: <t2lb6ebd0a51004221041s1b7db732nebfd9277e3e93bfe@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] change INHIBIT_PACKAGE_STRIP to PACKAGE_STRIP with more options
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
X-List-Received-Date: Thu, 22 Apr 2010 17:45:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 19, 2010 at 1:41 AM, Roman I Khimov <khimov@altell.ru> wrote:

> Originally approached with "package.bbclass: introduce KEEP_GNU_DEBUGLINK":
> http://patchwork.openembedded.org/patch/886/
>
> Redone with a change from INHIBIT_PACKAGE_STRIP to PACKAGE_STRIP which
> allows more options. By default it does exactly the same thing as is done
> today, strips the binary, but keeps the gnu.debuglink section. When set to
> "no", stripping is not done at all, when set to "full" the gnu.debuglink
> section is not re-added to the binary.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>


Looks fine to me.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

