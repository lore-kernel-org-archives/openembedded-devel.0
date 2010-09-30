Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1PmO-0000nW-GJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 22:31:02 +0200
Received: by iwn2 with SMTP id 2so2919098iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vydhTGvxWY1aK1MhNvFLO3agY8Lr/7MOUxlD14zWwzQ=;
	b=OR6QNiDj5caGznQ7xJbMbfaZaUm0wydWFF2fn4yhdIvRCfsT/Eznc0h+UQJOj/OaGr
	EGg/8D90hZiYd9EoLw6rThrjHLdJqqs3K3AQqmjxnW7Pa2FK2ncHI9sLF9YxQXxlPfyL
	vSI+gksEiB9CmKgEj93/DG0WFD9wvPqxFjqEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hjGscuNf8bllUYwBuq88H5WKcAiuAT9ewvG1w4QzWK3XSWGrO+80HXl4yhadV+HsOh
	I2aHaL4nGgws85Rtn6iJcTIK1l4xXBGhxoNqKdNzhaSQQeypWKKHrg0zLp84d7aUX/0S
	AlM+8aicdxZi9HSZgxCfCsj04fZqiMdGb9qq8=
MIME-Version: 1.0
Received: by 10.231.14.69 with SMTP id f5mr4372621iba.116.1285878647471; Thu,
	30 Sep 2010 13:30:47 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 13:30:47 -0700 (PDT)
Date: Thu, 30 Sep 2010 22:30:47 +0200
Message-ID: <AANLkTi=6KMYVWORbcf+BLZYGV6JrscxBEjq-KWXnhzU+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] delete old monotone recipes
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
X-List-Received-Date: Thu, 30 Sep 2010 20:31:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

As it stands we have 6 monotone recipes:

monotone-5_0.25.2.bb
monotone-6_0.27.bb
monotone-6_0.31.bb
monotone-6_0.33.bb
monotone-6_0.34.bb
monotone-6_0.37.bb

There are all target-only recipes

I can imagine it made sense to have a monotone recipe for the target
when our sources were still in monotone, but I feel that nowadays it
is less useful
(apart from the question whether it is useful to have an SCM on an
embedded system).

Therefore I would like to bring up the following discussion topics:

Is there any use to keep the old monotone-6 recipes? (all but 0.37).
Or should we remove?

And what about the monotone-5 recipe. Is that still useful?

And what about the latest monotone-6 recipe? Is that still useful to keep?

Your opinion is appreciated.

Frans


