Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OHF6B-0003Wp-Fb
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 13:51:44 +0200
Received: by gya1 with SMTP id 1so2150095gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XA8+HyQx9qB8nsWBFkD4DlDXC4gg1rTZG8wDvRfEIys=;
	b=uTo9Fg+Hy4ZOjQRUq474EMEul5eC9kL8TUxA9XU6G8FdFCfIpAtyrgnt5tXGE58DII
	bomSMr3tqFefHjQA0uOQPzqYyRkhI3M460OeUFEhXABDbW7M+/i3gqA/G39N58To3Lm8
	UMRuau2CbsTEAxWOs+ipE7hlUdNj6o11/BD3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RasMZv55e405vcqPhUCVLck8Ao8OtKvN/LYvdReKqTxZjI1n8RT53TQ+RvTUHa50aU
	uRW3+BAvlhKvb2ks+yZIEHDoL8WAO5ROl100/ZP2SVEK/7ZkNuoqECbzTlRCc1YEI7Lv
	OvS8AMs7PGgxfLC+evHX2eWBBhIEEf3tLamIg=
MIME-Version: 1.0
Received: by 10.91.54.35 with SMTP id g35mr3798331agk.158.1274874265355; Wed, 
	26 May 2010 04:44:25 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Wed, 26 May 2010 04:44:25 -0700 (PDT)
In-Reply-To: <1274869581.6382.27.camel@mill.internal.reciva.com>
References: <1274859584-8442-1-git-send-email-raj.khem@gmail.com>
	<1274863471.6452.54.camel@lenovo.internal.reciva.com>
	<AANLkTilPhweXZYpmrBRRlW5uHJazro_WcZ5k1C10KqXN@mail.gmail.com>
	<1274869581.6382.27.camel@mill.internal.reciva.com>
Date: Wed, 26 May 2010 13:44:25 +0200
Message-ID: <AANLkTilBV_FYvAjP8C9xGnbR3UE-uJoYeLNdHN5J0zg_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 11:55:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

I agree that fixing this is better than a warning, but a warning is
better than nothing, so I suggest at least taking this patch.
No idea how to fix it structurally.
A workaround (read; dirty patch) would be to nuke off trailing slashes
when TMPDIR is retrieved.

BTW: the problem seems to be around quite a while and regularly seems
to bite people.

Frans


