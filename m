Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Osxau-0003v9-Fp
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:49:04 +0200
Received: by ywa8 with SMTP id 8so2063590ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7PVUPhuj8X8iPWKr8ml3vsYg3P9I2kUWlGHASEG5rKY=;
	b=Okwrm/2B8lv8Yu2AkBa8TGc23qtfof1oS87Rif4klbDYmI2zl9NVwiJwwuM4wSFaUm
	GJngBEOvtTmZPyt8dv8fyKeQ7pcFWCKGTZ/26A62qIClju/thBXs4EnIMtR3FM132S8x
	J3QaNIbP9lMsprycopU8MKq4dAj67EKdPZHAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qzO5o1ZF5Nc+CBgq61bpoi7+/ZMct/aB6QEYQrAD0JUQ1cu2h2o2erYsfVaH0RxGtt
	DctDMqUrKLLc/3qOQ9gbwp6Rn5V/WkeHBoYQ7mQapIMXg8nGpx/SCIIWCJz1zEElJ2Jj
	jiZ374QT1olgYBGy/dgvMSdVLJi5uag6wl+uI=
MIME-Version: 1.0
Received: by 10.151.130.17 with SMTP id h17mr1066626ybn.426.1283863650836;
	Tue, 07 Sep 2010 05:47:30 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Tue, 7 Sep 2010 05:47:30 -0700 (PDT)
In-Reply-To: <BLU132-W287C05944F8D53A62038EDB0710@phx.gbl>
References: <BLU132-W8FA51733A7631FEA4FB63B0710@phx.gbl>
	<AANLkTi=Y90PWXBSsZmbtub-S519CdBaAEEDQ-dnTrsvN@mail.gmail.com>
	<BLU132-W287C05944F8D53A62038EDB0710@phx.gbl>
Date: Tue, 7 Sep 2010 14:47:30 +0200
Message-ID: <AANLkTintK8OdmZbumTuVA6UAv=PYujw9PmjzKL1wtDMj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: selecting needed applications only
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
X-List-Received-Date: Tue, 07 Sep 2010 12:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 mahmut g <mgcse@hotmail.com>:
>
>
> =A0 =A0 Thanks Frans, in this case I have a new question. How can I deter=
mine the packages' dependency? For instance I just want to use QT on user s=
pace. Is that a way to learn which packages must be for QT? I am familiar w=
ith menuconfig selection, is there any tool/script which handles dependenci=
es?
> Regards,
> MahmutG
>
>
Please do not top post.
There is no need to determine dependencies.
The build machinery will take care about that and include all what is
needed (this is specified in the recipe in DEPENDS/RDEPENDS)

Just give it a try!

Frans


