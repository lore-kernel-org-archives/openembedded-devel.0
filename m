Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1NsDgT-0000Hg-8k
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 12:14:43 +0100
Received: by ewy25 with SMTP id 25so249148ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xelFenQ0Kdfzu6dq6R02AMPpZuG3sKK0zERZTOThidU=;
	b=w0nLSrm3FifTi7O+gLFbXGwaR7vw/EElJtKAy/LvoOhMHJMbfppZ4myyckZ7YZGhs4
	1cN29D3lcOtMcuDdiZgKpOpgJ6RaAAvPFjdTCEmnX8Fz93ou64sglXcTfIkWMmZ2+aSC
	Awxdw618+ulFxEBLwxTA6y7KOdXphDIu7ocq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kgyn0UalkDsg8t3D/JBhQ39CNYtQ8xsREXY2LiPuA7jDqG1628fOZH8pdA9rWorQZo
	0Ztt+80H89zmCG+iwuw1yE2R8DhV+QeT4VuQlEcabJ/cuzXVcIWOx9R9CEZrhQUU69rc
	1zZwzsN/FZe0Zj54imdqkL2g1HDrnFMYowtOs=
MIME-Version: 1.0
Received: by 10.213.1.135 with SMTP id 7mr511982ebf.72.1268910692922; Thu, 18 
	Mar 2010 04:11:32 -0700 (PDT)
In-Reply-To: <1268909970.4619.8.camel@mattotaupa>
References: <1268909970.4619.8.camel@mattotaupa>
Date: Thu, 18 Mar 2010 12:11:32 +0100
Message-ID: <74d0deb31003180411g80d7bb5y9a9ef6f70ec4f4d5@mail.gmail.com>
From: pHilipp Zabel <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What is `PE` used for?
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
X-List-Received-Date: Thu, 18 Mar 2010 11:14:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2010 at 11:59 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> in [1] there is =BBPE =3D "1"=AB.
>
> I could not find `${PE}` in the user manual and searching for =BB"${pe}
> openembedded=AB did not work either.

It's the package "epoch" as described in the Debian Policy Manual:
http://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Version

It really seems to be missing from the documentation.

best regards
Philipp


