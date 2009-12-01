Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NFQ0v-0003yp-8V
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 11:31:24 +0100
Received: by yxe5 with SMTP id 5so4355401yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 02:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/Pc4++j5ZeoK2x3Ot/zdpOhYBuBNMP5f8IyZKkTUciA=;
	b=Zd52E2LGknh8T/PzkItW/NV0eIPUzVHm1sTUfHEMVX7fnj9FQCHtjYQwdQaoBia5HE
	zPuOZCSUjFF91aGf60le0uvvtOuzkbhILUUS2wpTVGCYaQ9vLD4VlCmIFc4i63iD6AKM
	FaENo8aBHyyIvjTbC1Ye8L/osDmbFZd446LxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Of8E6NjeAvbc9a7r2kiAxVHiwJy+HM9zFRajokn4IU12ZTHGIXTu3zw4Bi9PaPqsQW
	oGzYE1coWgT3CscNcrOy8DJCwT33hdMwa2SChtJeZa/v7EGY21+SNvMz7DKYQt12USsO
	Gb3sMl55WfjZUOnIgarUgwGYjg+rTwUL7U+ks=
MIME-Version: 1.0
Received: by 10.101.11.34 with SMTP id o34mr2250157ani.25.1259663386313; Tue, 
	01 Dec 2009 02:29:46 -0800 (PST)
In-Reply-To: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
Date: Tue, 1 Dec 2009 11:29:46 +0100
Message-ID: <ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 10:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/12/1 vivek tambakad <vivektambakad@gmail.com>:
> hi
> I want cross compile linphone for compulab EM-x270 board.when i try
> =A0 sudo bitbake -b
> /home/development/em-x270/stuff/openembedded/recipes/linphone/
> linphone_3.1.0.bb
> =A0 =A0then i will get the following error
> =A0 *bb.parse.ParseError: Could not inherit file classes/autotools.bbclas=
s
> *
> =A0 =A0pleasse guide me in compiling linphone for compulab board.

first remark:
there is no need to run bitbake as root.

2nd thing you could check is if the file exists in your tree and if so
if your path is set properly.

FM


