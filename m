Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P8CCr-00037S-Pp
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 15:26:22 +0200
Received: by gya1 with SMTP id 1so1214789gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=L7BdBhVd2KA8xjqHPPEccv+TMTt93FaBsrNSGzdZLFM=;
	b=gnpKk6OaNPntpfkFw9bxsO6O0+fyaoFfltcH6hd3s67iv/lVQhCILluDBkRE6LytrN
	Bvp5cF5fp7A1bg8OVH/GywU0tzs+mDNDGccNc8sfjfN1ecb2vVvnqJ6C8ruD8IK61Z3+
	WWuNrTZ0TOnO24ZoaQhI54HOB1uPq+CaWChW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cX0WaKBtiSH2q1tb/B58fgztfTIWcAtyo/lY0MnetaJm5TZU0N8KG2J51f3BDmfgQj
	XyOoL4QIN/l84glcSSvHRei7fWbhmnLDN51s3kcBYtQ7pyE/uxLblhNLEU+pZbrw80Ad
	SzSZtBA2C02JM+67oSzbdDssx9FoMC4hsVUfU=
MIME-Version: 1.0
Received: by 10.42.167.195 with SMTP id t3mr3617716icy.145.1287494740554; Tue,
	19 Oct 2010 06:25:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 06:25:40 -0700 (PDT)
In-Reply-To: <lypqv6492b.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<lypqv6492b.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 19 Oct 2010 15:25:40 +0200
Message-ID: <AANLkTikkRYEJUGrR5VYDwS7Yb6fW-aqfF_Ta1gh5sA8c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Tue, 19 Oct 2010 13:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/19 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>:
> Michael Smith <msmith@cbnco.com> writes:
>
>> + =A0 =A0 os.system('rm -rf %s/*' % (pkgcopy))
>
> Can be written as
>
> =A0os.system('rm -rf %s' % (pkgcopy))
>
> Every SUSv3 compliant 'cp' will create the 'pkgcopy' directory.
>
>
>> + =A0 =A0 os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
>

No this is not good. The rm command you give will also remove the dir.
The cp command will copy %s/.
There is a subtle difference with %s (although %s and %s/. refer to
the same path)
If you want to use %s instead of %s/* you also need to change the %s/. into=
 %s

Thinking of it doing both changes is better as the effect of
os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy)) is different
depending on whether pkgcopy already exist or not, while in the new
case it is not.
I can submit a patch if needed.

See also this log on hte behaviour of cp

frans@frans-desktop:/tmp$ mkdir tst
frans@frans-desktop:/tmp$ mkdir dest
frans@frans-desktop:/tmp$ date >tst/f
frans@frans-desktop:/tmp$ cp -pPR tst/. dest
frans@frans-desktop:/tmp$ ls -l dest
total 4
-rw-r--r-- 1 frans frans 30 2010-10-19 15:20 f
frans@frans-desktop:/tmp$ rm dest/*
frans@frans-desktop:/tmp$ cp -pPR tst dest
frans@frans-desktop:/tmp$ ls dest
tst
frans@frans-desktop:/tmp$ rm -rf dest
frans@frans-desktop:/tmp$ cp -pPR tst dest
frans@frans-desktop:/tmp$ ls dest
f
frans@frans-desktop:/tmp$

Enjoy, Frans


