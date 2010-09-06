Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsYxg-0005ME-6c
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 12:30:05 +0200
Received: by gwb1 with SMTP id 1so1604413gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=oA7M7Kg/HRi/MXgOKzfhEYkAtDMFZIvNcaEYUqPgGYg=;
	b=Rkf5vO0+bW6VQct6VvVVcI7vLeHzzOCY/O+ZBggOYoxaGMeAq0eUH0CRbhOsFX5NXZ
	u9Z03r0d9R2bljOf0sWVepZVc3sz7Gs16jIRUEgTaozwnhEQRhfPJ9kkT9axJjwBJkTN
	93B50w31IXNmlQ8K9B/uAUpSkGObeQPOvPaks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=GK2m73Z8wFXNfOQ0bIXuQlkmqz3brMAbgfs3ewdsTtJh3HHdFhwbnvQ18JSi3lHHL2
	SK+v4Tj8vAnwz5wikJstsnR7z1fFExMCcoKXXP0JAsHezsB6Ziy4stKWz2c4PfRWPKYH
	QlHgZjkQYIoT4tHru3McCu7hgoItWi0UCx3s4=
MIME-Version: 1.0
Received: by 10.150.198.11 with SMTP id v11mr1019866ybf.99.1283768964272; Mon,
	06 Sep 2010 03:29:24 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 03:29:24 -0700 (PDT)
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5042F15B5@eu2-mail.mgc.mentorg.com>
References: <989A078976CDAD4CB2DC976EEF70E2A5042F15B5@eu2-mail.mgc.mentorg.com>
Date: Mon, 6 Sep 2010 12:29:24 +0200
Message-ID: <AANLkTi=_oLg6OsO5R3x4aQu0OGDeQGm_X8o640Cdc+uW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: robertschuster@fsfe.org
Subject: Re: llvm-native package dependency on binutils-croos package
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
X-List-Received-Date: Mon, 06 Sep 2010 10:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/6 Ahsan, Noor <Noor_Ahsan@mentor.com>:
> Hi all,
>
>
>
> I was looking into llvm2.7-native package (llvm2.7-native_2.7.bb). Its
> recipe file includes llvm-native.inc, in this file the DEPENDS lists
> contains binutils-cross package. I am bit confused that why a non-native
> package is present in DPENDS list of a native package. This commit link
> is 6da4ed714f269373271a14149b131bf1ff7a6def.
>
>
>
> When I removed the binutils-cross from the dependency list and cleaned
> binutils-cross and llvm-native packages and rebuilt llvm-native package
> it built without any problem. So if llvm-native build successfully then
> I think binutils-cross should be removed from the DEPENDS list. Can
> somebody explain the reason if binutils-cross in the DEPENDS list?
> Thanks.
>
>
>
> Regards,
>
> Noor
>
>

Noor, thanks for spotting this.
To me this dependency seems very weird.
I can imagine a dependency on binutils-native, but having a host
recipe depend on a target recipe is somewhat strange.
Should this be a dep on binutils-native ?
Robert, can you elaborate (as you added the dep)?

Thanks alot, Frans


