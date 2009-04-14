Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <crquan@gmail.com>) id 1LteIU-0005nN-Ez
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 10:47:52 +0200
Received: by ewy20 with SMTP id 20so2470153ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=E6CkdGpwjcgpx6st9ebS3MMFy9q/efpO4fIeuyBUVh4=;
	b=WrriZcG0Yhs3tzmE1WSllqjVQHMpPL2PrMiPJ7cCre+If1IYrhnXKdDImWlbKXeEtu
	J1Az4uZokifb7hb65U0Zs07Y/nwp6XGaIxgp1wLxmacFmZJPfKg6NG+5hSw6+cozfCFQ
	fg3XCXnhriHsTyJE66l41Ci8U/femJ0UjyfUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=R7xizUM8Q0gYFFcXYdakoxBoAGtNRZGyK9X1NQ3yhTA3JgyK1EueOKDHeZwoiu064d
	PjDLCizKuAJW93iK/+B46xBim0QuCHXZ3HegE3Q77N2hqp9uW7ejOBa2TZZD+QNqtQgu
	tBwI9lf5xAfark0upp1ecnBH0TAa1mbTXI7sA=
MIME-Version: 1.0
Received: by 10.210.111.17 with SMTP id j17mr6034197ebc.22.1239698612942; Tue, 
	14 Apr 2009 01:43:32 -0700 (PDT)
Date: Tue, 14 Apr 2009 16:43:32 +0800
Message-ID: <91b13c310904140143v20312bdagc7ac724a8ac02617@mail.gmail.com>
From: Cheng Renquan <crquan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: crquan@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problems on openembedded/conf/checksums.ini
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
X-List-Received-Date: Tue, 14 Apr 2009 08:48:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, all:
  I don't really understand why there is absolute path of checksums in
openembedded/conf/checksums.ini, such as

[ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz]
md5=3D0499a958a561781b125c740f18061ea8
sha256=3D47e8f9a33ba06fa6710b42d6f6ded41f45027f6f4039b0a3ed887c5116bc2173

the absolute path m4-1.4.12.tar.gz even includes the site base and the path=
,
I don't know why and how to avoid that,

Here at China, the master site ftp.gnu.org is not much fast,
fortunately I can find a mirror
to download instead, from the "GNU FTP Mirror List"

http://www.gnu.org/prep/ftp.html

such as, http://ftp.twaren.net/Unix/GNU/gnu/

but after I downloaded m4-1.4.12.tar.gz into ~/sources/, the bitbake
cannot recognize it
and download it again,

I try to change openembbed/conf/bitbake.conf from

GNU_MIRROR =3D "ftp://ftp.gnu.org/gnu"

to

GNU_MIRROR =3D "http://ftp.twaren.net/Unix/GNU/gnu"

but the checksum will fail, just because the absolute path containing
the whole URL,

I think this problem is easier to solve by modifying bitbake and
checksums.ini to use only
the last basename, but I'm curious if there is already someone resolved tha=
t?

Or someone knows how to use a local mirror, and make the checksum working?

My using bitbake is svn checkout'ed from
svn://svn.berlios.de/bitbake/branches/bitbake-1.8

Thanks,

--=20
Cheng Renquan (=E7=A8=8B=E4=BB=BB=E5=85=A8), from Shenzhen, China


