Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSsLa-0007eB-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 15:28:52 +0100
Received: by bwz12 with SMTP id 12so2254549bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=b1jeC+qJqcTckTIx0IJlVTl3tK046v0XOeqHbayI6QE=;
	b=Ze4TQDOIfAecqq6gY4MDHL5aHooOqOmy3x1GcHq36imfgkgu3QK01lmgkyo5+1j8LL
	KLS6DUp4mEQeWr5i3W5PQXClFfD41431utTpiC7KCdDLh2EZ8vO0bFEdf1L2Codpj85H
	2VmqYOzB4phfjIkNAqKzZVcd/04wJqKZOqD4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=wLMdWwrkCwQTjvjSXNYuiF4RbHp0ZOIJmIU2QzHpQbdXUZ2atqGfViTYm3J5vgKZ11
	d9Jf+OZ4lulF7xYe626MG4Z0SekbGQWYomMztqVfQck0tmbNlT22JcGxGhLJt7sBqy7i
	+wR2Vyq4Dz7DqgsBX61TJ2h4FXJs5N7KC3fyY=
MIME-Version: 1.0
Received: by 10.204.100.70 with SMTP id x6mr6981640bkn.0.1292423233028; Wed,
	15 Dec 2010 06:27:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.71.8 with HTTP; Wed, 15 Dec 2010 06:27:12 -0800 (PST)
In-Reply-To: <20101215130120.GB3238@jama>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
	<20101215130120.GB3238@jama>
Date: Wed, 15 Dec 2010 12:27:12 -0200
X-Google-Sender-Auth: MCZh4ESn5SG8c_O36698rAbDqbA
Message-ID: <AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 14:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 11:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Dec 15, 2010 at 10:50:25AM -0200, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> =A0classes/gitpv.bbclass | =A0 41 ++++++++++++++++++++++++++++++++++++++=
+++
>> =A01 files changed, 41 insertions(+), 0 deletions(-)
>> =A0create mode 100644 classes/gitpv.bbclass
>>
>> diff --git a/classes/gitpv.bbclass b/classes/gitpv.bbclass
>> new file mode 100644
>> index 0000000..c9496f1
>> --- /dev/null
>> +++ b/classes/gitpv.bbclass
>> @@ -0,0 +1,41 @@
>> +# gitpv.bbclass provides a PV variable which is a sortable version
>> +# with the output of "git describe".
>> +#
>> +# It can handle SRCREV =3D ${AUTOREV}, as well as SRCREV =3D "<hash>"
>> +
>> +PV =3D "${@get_git_pv(d)}"
>
> can you integrate it with
> classes/gitpkgv.bbclass ?

I can however I think the usage is different.

The gitpkgv does not use describe and if there's users of it (there's
no in recipes) we'd change it for them. That is wrong in my opinion.

So I thought about adding another class and not messing with it.

> get_git_pkgv() there is quite similar
> and after improving it with git describe you can use it here as ${GITPKGV=
}
>
> and maybe assign to PV only ?=3D as IMHO recipe should be able to say
> different base version than 0.0 or use it only in PKGV..

about assign to PV ?=3D I agree however why someone might want to use it
only in PKGV?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


