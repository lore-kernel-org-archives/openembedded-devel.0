Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoEtk-00054A-0T
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 14:16:08 +0200
Received: by yxk30 with SMTP id 30so155162yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=xUU8Gc3RPP+riqgHk+qFU8l3UREPspHk7051DjDXpsQ=;
	b=bfaG0dvaLxEmnV49SQjf/0pO3NEHBJqjC+tCdxueDQuoY8Dks5/jyPlc7hRulrC8dr
	UkM048Hh0E6AQ4XMQVCwPZoirQKMAK3+XcRYq0hhRdZqx9DKaKEjEQ+/4mwtkQGWxQMK
	4sdeTYTDO5pGXrt01FBjB5JEbNSS4ZQKDsoYQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cUz2pay3S0PA0fHkL7g+SOH5wEtVIPGWiKs4xMFiW+ZvY4rF7dYSRQ97Jp32pa/o0p
	qM+1Wop8jfP4Yl6wFY6j5X8BXBbpImN6j4PnBPE8ZpFYXAkfqLibDsZWbLA9hTRKgaq5
	xeqvNIGJhbtFVNWugV+PD2O0Yky2pK6KCXk7c=
MIME-Version: 1.0
Received: by 10.150.182.8 with SMTP id e8mr8373558ybf.424.1282738540865; Wed,
	25 Aug 2010 05:15:40 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 05:15:40 -0700 (PDT)
Date: Wed, 25 Aug 2010 14:15:40 +0200
Message-ID: <AANLkTin7=Kq6GAzXmOSZErzd=FvXNtNL8zGuVQ-mE7wX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: PR on native recipe
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
X-List-Received-Date: Wed, 25 Aug 2010 12:16:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Fahad Usman asked a while ago on how to deal with PR in native recipes
if the native recipe does an include of the non-native recipe (which
is quite common).
Currently I see two solutions being used.

One is to give a native recipe its own PR. Issue is that if the target
recipe changes, the native recipe should also have a PR bump (and I
fear that that is often forgotten).
The other is to have no PR in the native recipe and bump the target
recipe PR even if the native recipe only changes.

Both occur now. What is the preferred solution?

(btw there are other solutions possible too. Not sure if something like
PR += ".0"
in the native recipe is possible. That could be a good alternative.

(and yeah: I know we should try to get rid of those native recipes,
but that is not always possible right away).

Frans


