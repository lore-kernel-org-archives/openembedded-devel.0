Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Xae-0008K2-8r
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:28:11 +0200
Received: by iwn7 with SMTP id 7so674490iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oSAFvovEaeKXeO/vXaowhYgoFPWlqZVNoKWvjkhktDE=;
	b=oNEgPNb1KCfgTpdbVVrkicz2hygof9YoJPX7w9dnAX28h3lAAPm9jQN1vEp1b7rVot
	bFzVbbqvk7JobfUIWwYqYF3P/vJ9c7ytSHmZgFhOqqFu3oQSdCevpASC/EfoKuVsVqg4
	OOt1XbQO/9jcI5xu5vULj7D3/nTCi3yYq1p0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jAw+KGBhYqaHxg5h3nNpTWGaoEY/7XQFMf2qXNibd1ABk7oENh3L1wIgp+di/6yidx
	l2S0EYcikADB+bAjY3HS2ERQkAsAlqGHgTuCuoCcBBxST1O09pAbIuTfU/scXfjbqHOi
	mpmtNuEWou3POp37A154WqtJMW3+5V5Mu//RM=
MIME-Version: 1.0
Received: by 10.231.172.205 with SMTP id m13mr3193326ibz.35.1286623627203;
	Sat, 09 Oct 2010 04:27:07 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 04:27:07 -0700 (PDT)
In-Reply-To: <018d01cb67a1$20dde640$6299b2c0$@net>
References: <018d01cb67a1$20dde640$6299b2c0$@net>
Date: Sat, 9 Oct 2010 13:27:07 +0200
Message-ID: <AANLkTi=UDMu1GiHuTM25TVQ72+LzoZuKrBoJXjJRQcpa@mail.gmail.com>
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
Subject: Re: Can someone provide any input as to why this is failing to build?
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
X-List-Received-Date: Sat, 09 Oct 2010 11:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/9 N Twerdochlib <nik@nikom.net>:
> nik@bobbob:~/development/embedded$ bitbake =A0-b
> /home/nik/development/embedded/openembedded/recipes/webm/libvpx_0.9.1.bb

bitbake -b will not build packages that are required for that package
use
bitbake libvpx
instead.

Have fun, Frans.


