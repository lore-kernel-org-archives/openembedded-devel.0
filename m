Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1NrDNx-0001Zq-1G
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 17:43:25 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o2FGci804613; 
	Mon, 15 Mar 2010 17:38:44 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 15 Mar 2010 17:09:39 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o2FGRSg07492; 
	Mon, 15 Mar 2010 17:27:28 +0100 (MET)
Message-ID: <4B9E5FF6.1030407@atmel.com>
Date: Mon, 15 Mar 2010 17:27:34 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
References: <201003150738.22158.marcin@juszkiewicz.com.pl>	<1268659726-20887-1-git-send-email-nicolas.ferre@atmel.com>
	<201003151346.43686.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003151346.43686.marcin@juszkiewicz.com.pl>
X-MIME-Autoconverted: from 8bit to quoted-printable by atmel-es2.atmel.fr id
	o2FGci804613
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.30: add linux4sam patches
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
X-List-Received-Date: Mon, 15 Mar 2010 16:43:25 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Le 15/03/2010 13:46, Marcin Juszkiewicz :
> Dnia poniedzia=B3ek, 15 marca 2010 o 14:28:46 Nicolas Ferre napisa=B3(a=
):
>> Marcin, what do you think of this patch architecture and URI managemen=
t?
>=20
> Nice. Few notes:
>=20
> 1. do it all in linux_2.6.30.bb recipe

Ah? won't it be a too long recipe file for people not having to deal
with at91 ?

> 2. we rather user CAPS for variable names

OK.

> 3. AT91_SRC_URI =3D "contents of at91_kernel + contents of lnx4sam_exp3=
" would=20
> be better

You mean:
AT91_SRC_URI =3D "${AT91_KERNEL} ${LNX4SAM_EXP3}"
and:
SRC_URI_at91sam9260ek =3D ${AT91_SRC_URI}
...
?

> 4. can't you just squash 2.6.30-at91-exp3.tar.gz into one patch?

I would like to keep a patch series in separated patches as this is what
is submitted and accepted during kernel development.
Keeping single patches, we can keep a patch archive and remove
individual ones from applying in a newer revision of the kernel.

>> The defconfig are not included in this patch and shall be sent in anot=
her
>> patch series.
>=20
> Merge those into one patch - otherwise you will make "PR bump" flood.

Ok I will after the discussion settles...

Bye,
--=20
Nicolas Ferre



