Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5bmf-00080u-UR
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 12:08:41 +0200
Received: by iwn2 with SMTP id 2so870011iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fuR1UP7TdGGbFe/ZjuGwzZia578TN/Xk7z1QIxpoL4A=;
	b=JCwpr5BUbFEfvy02KziyMfjFMDP8Ci8GCLOKjcD4oAG2EeuYpTSHuHq6jVJnjIsqpk
	KArHCxolIvo+G8z8gtkNUSkw7uQ6EdrkbNGGE22YIYGE54BZkZbJMZLJbBfyxm3is/aA
	1HO0kBjrv+RWHCMIVZX6VfjfNrolzKAytJFs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bpmSHSNTnOBWTb7lAvWCCC0WQeJKS3S2Yhrv7P0vfhQkUjgJOJaGht+2ZHs0oGKe5l
	5owM4Bt2k9b8+g+Qa7zyW6XlH0ZPiBkXrnkqB/YoW6+IuMf12pLjBelsPmHZi1ltyEGy
	lRujP+TqAS75pBMdEIMDb0FXXs6i4NiDRdNnY=
MIME-Version: 1.0
Received: by 10.42.57.73 with SMTP id c9mr2655537ich.39.1286878091403; Tue, 12
	Oct 2010 03:08:11 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 03:08:11 -0700 (PDT)
In-Reply-To: <i9154e$2rk$1@dough.gmane.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<i9154e$2rk$1@dough.gmane.org>
Date: Tue, 12 Oct 2010 12:08:11 +0200
Message-ID: <AANLkTimnE3nuhgQQpCrZ0ymjzmLUkK0wxNX8bqJwa=AF@mail.gmail.com>
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
Subject: Re: [PATCHv3 1/3] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 12 Oct 2010 10:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> ping

Haven't had time to test this yet (and won't have tonight as I have to
supervise a lab). It is on the to-do list.

[...]

>> +}
>> +
>> +do_compile_kernelmodules() {
>> + =A0 =A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE

Is it needed/required? I'm a little bit concerned by this.
(actually this was the only worry I had after reading the patch, don't
want to loose additional CFLAGS settings here (but must say I did not
dive into it, so not sure if things are arranged differently; that is
also why I wanted to do a test build).

Frans


