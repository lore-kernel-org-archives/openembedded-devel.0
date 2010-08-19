Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Om34b-0007Ql-QD
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 13:14:19 +0200
Received: by iwn38 with SMTP id 38so1707803iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zY4dOx60l9yLYSxIJ1uFmNXxDbk2+jkM5mVvjbmiN7E=;
	b=YQwBuwZHZqxHZ2McTGbqippggpOarGZnweDi1QTbt/a+ynY/EdJN6oGvmkPgy4yr2I
	kxkgvyWs8/dXusWA9hv66DUMbbjD4X0PlktI7cs1gIYP/4iXAT4K51JOMmorpiMhVxi7
	LwOIUt5NaK02uKrpqQRwdRBMrLbUnpLOAdEcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OolxiCzte65YkdGMk/QgpsZtXKrdYszK/sv1YBkWXWjS+f60kPjzaJ6LdGSTtWWeyb
	BTCb+hebVSZ6dyBeZv5Pfhxmg28cFafZUiSuT83UO2Ngaw9ZWDRRnokWpmvZL/KgLwv9
	18iYm8klQ597h7bvrzdO4pilkXOyRIx/eqLEM=
MIME-Version: 1.0
Received: by 10.231.168.21 with SMTP id s21mr11181970iby.123.1282216439068;
	Thu, 19 Aug 2010 04:13:59 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 04:13:58 -0700 (PDT)
In-Reply-To: <1282212714.27679.158.camel@pkl-fusman-ubuntu>
References: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTik0m-1QRcExaT9wX2kc5SA8XyBDOGiC7nad5rvz@mail.gmail.com>
	<1282212714.27679.158.camel@pkl-fusman-ubuntu>
Date: Thu, 19 Aug 2010 13:13:58 +0200
Message-ID: <AANLkTikg6S_BgHYYfDb63Pd1qLMHD5T8obfx4_R+rJNV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gawk-native_3.1.4.bb: Removed legacy style staging
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
X-List-Received-Date: Thu, 19 Aug 2010 11:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/19 Fahad <Fahad_Usman@mentor.com>:

>
> Hi Frans,
> With this do_install function, I get only one binary file
> (sysroots/i686-linux/usr/bin/gawk) in the resulting .ipk file, but if I
> remove the do_install function from the recipe and let the autotools's
> do_install execute, a bunch of other binary files end up in the .ipk
> file along with a lot of other stuff. Is it okay to have extra files in
> the ipk package or should I leave the do_install function in the recipe.
>
> Secondly, is there a way to merge native and non-native recipes if the
> native one need a different do_install function?

It is considered ok if do_install installs some additional files in
the native case.
(and maybe some will feel it is desirable that for native everything
is properly installed).

When merging native and nonnative:
if a different install is absolutely needed you can add a
do_install_virtclass-native
function
see e.g. the recipe for grep 2.6.3

you an also extend the recipe for native e.g. by
do_install_append_virtclass-native() {
do_install_prepend_virtclass-native() {
but (very odd) I have also seen a case with:
do_install_virtclass-native_prepend()

Note that virtclass-native only works with BBCLASSEXTEND = "native"

However note that having to redefine do_install (or modifying it) only
needs to be done very rarely. Currently we only have a handful of
recipes that do so, so generally it should not be needed

Frans


