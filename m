Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NXdPS-0006kI-SM
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 17:28:01 +0100
Received: by bwz20 with SMTP id 20so243862bwz.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=lCgFhaZHa4IZfA+6yChRztk+3VxolhbjW2KeWTkVWLM=;
	b=icnLPTWTYghv0sogqS7OV0uCkCXhEbPgZlVW7etJG7znVcTj/pLCFPdnWd/hTh3HC4
	KN7+RXZNg95220D8SoFwlep5U4SpfZdzLuuxVSbdnwjuI7V9V5oRSNmP9nnVT9xiAJcy
	6jqyKYCycK9u0VuWRIlnofgaoumkmRUCo0Y44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dLTUonJEwqW5E2VP5AC4KzHPFO/rtPmGO9nmTitKJdm5FR3iFQWVjr323nfv4/CcPF
	lKbUVMrXgSzW6DYvpSGANT72XomoQxv2KFGj3tpLCsy6q0WHb0JWc+k0tLw/Ycgw3jV+
	CN0Z8l2XdG37ihZERIT9UUAoAr860cBJlrCKA=
MIME-Version: 1.0
Received: by 10.204.32.72 with SMTP id b8mr86783bkd.203.1264004740169; Wed, 20 
	Jan 2010 08:25:40 -0800 (PST)
Date: Wed, 20 Jan 2010 17:25:40 +0100
Message-ID: <fca63bcf1001200825q63ec4375w8d2a6f35359284c0@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: libxml-perl (new recipe) problems (make test)
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
X-List-Received-Date: Wed, 20 Jan 2010 16:28:02 -0000
X-Groupsio-MsgNum: 15938
Content-Type: multipart/mixed; boundary=0003255528ce8840ec047d9b092d

--0003255528ce8840ec047d9b092d
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Since oe was missing an libxml-perl module I tried to it myself. After
looking at some other modules, I created the recipe attached.

The problem is that Makefile.PL failes because of some dynamic loading error.

| Can't load 'blib/arch/auto/Conftest/Conftest.so' for module
Conftest: blib/arch/auto/Conftest/Conftest.so: wrong ELF class:
ELFCLASS32 at /home/mlippautz/oe/tmp/staging/x86_64-linux/usr/lib/perl/5.8.8/DynaLoader.pm
line 230.

I can't think of why conftest should become a 32 bit (?) library. I am
using 64bit gentoo as my workstation and the oe tree also contains
x64_64 stagings dirs.

regards,
Michael

--0003255528ce8840ec047d9b092d
Content-Type: application/octet-stream; name="libxml-perl_1.70.bb"
Content-Disposition: attachment; filename="libxml-perl_1.70.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g4obnjeb0

REVTQ1JJUFRJT04gPSAiWE1ML0xpYlhNTCIKU0VDVElPTiA9ICJsaWJzIgpMSUNFTlNFID0gIiIK
UFIgPSAicjAiCgpERVBFTkRTKz0ibGlieG1sMiBsaWJ4bWwyLW5hdGl2ZSIKClNSQ19VUkkgPSAi
aHR0cDovL3NlYXJjaC5jcGFuLm9yZy9DUEFOL2F1dGhvcnMvaWQvUC9QQS9QQUpBUy9YTUwtTGli
WE1MLSR7UFZ9LnRhci5nejtuYW1lPWxpYnhtbCIKClNSQ19VUklbbGlieG1sLm1kNXN1bV0gPSAi
MzNkNDI5NGY3MDhlMjBjMjk4Y2ZlNTM0ZDExNjY4NDQiClNSQ19VUklbbGlieG1sLnNoYTI1NnN1
bV0gPSAiNTNlNmNmMDY3NzJiYTlkODUwNTVkYzZlNDQ4OGRiZDg3NmQyMzc2ZTQ4ZWYzNTc4ZmE3
MzI0NmVlOThiM2JhMCIKClMgPSAiJHtXT1JLRElSfS9YTUwtTGliWE1MLSR7UFZ9IgoKRVhUUkFf
Q1BBTkZMQUdTID0gIkRFQlVHPTEgSU5DPS1JJHtTVEFHSU5HX0xJQkRJUn0gTElCUz0tTCR7U1RB
R0lOR19MSUJESVJ9IgoKaW5oZXJpdCBjcGFuCgo=

--0003255528ce8840ec047d9b092d--
