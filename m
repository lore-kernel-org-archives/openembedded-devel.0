Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U0dhJ-0000xE-MH
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 20:51:53 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so2056074obb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 11:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6WAQo5C8Eo2Puqw6bVRIiEW0X0RwF8mgk82EmXswXUs=;
	b=Xsdj2vnngboESYT8xfnApwijCDWtIBLciyqLoPZ6qkT7+kyGTqk29p3XTe7ekDaQFS
	tbHj/ozaLnw1YTbnH28o0BYLJTBAEWmWNXXq9T/5MVPJYRCLVNNz6/Pn14QQFDOPfK/u
	q2m2UOMXE1lTtBTget1Z7v4JD3CkCATYGjSHc5OVL9r6fUH5x/FWCXfCH/Ab01D7JEzs
	F0SLQObQDc7EM7EwuzsKIAOlw875GNJfvYr39Flw2WgYpmCA6MuJKA1684EunipaSoTn
	MbOaXPf8C7ewcXPheKdhvQmD89zqcgdSC+0ZNmuiJGX+89c07AMri1OaSusBWX2O0HnV
	pgLw==
MIME-Version: 1.0
X-Received: by 10.60.32.44 with SMTP id f12mr4645702oei.61.1359574571028; Wed,
	30 Jan 2013 11:36:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Wed, 30 Jan 2013 11:36:10 -0800 (PST)
In-Reply-To: <keb8ot$ea4$1@ger.gmane.org>
References: <1359539418-6925-1-git-send-email-koen@dominion.thruhere.net>
	<keb8ot$ea4$1@ger.gmane.org>
Date: Wed, 30 Jan 2013 17:36:10 -0200
X-Google-Sender-Auth: ZXl8-SYed7PmR6fFSSydglOf9vc
Message-ID: <CAP9ODKrq0rtHevYbN6g2fv_WQ44Gd4wuikC7Qr5Zj62vyDXtrw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][[RFC][PATCHv2] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 19:51:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 30, 2013 at 11:55 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 30-01-13 10:50, Koen Kooi schreef:
>> The hardfp patch is a forward port from the 0.6.x version in meta-oe, the
>> upstream version doesn't work. I don't know why __SOFTFP__ isn't getting
>> defined, but checking for the PCS version of VFP is a lot safer and
>> actually works.
>>
>> Runtime tested on armv7a/angstrom
>
> Should node also drag in dependencies that npm *might* need for some
> packages? I've come across npm packages that need 'git' and
> 'python-compiler', should I add those to RRECOMMENDS_${PN}?

You may add a new npn-runtime package which rdepends on those. What do
you think?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


