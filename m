Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LcuU4-0003pS-2D
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 05:38:00 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1073923wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 20:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=L9ItuarVid1Fgtk8G5lONxXs66HTTM/Lli2G9+Db8mo=;
	b=xaWhi5ejgE6/ip8oegzlDkzvbcSubtDZv9V3yup2iglP0StKAFL8BDRLreo07NOAB4
	PGj+KTBXl7Q2K5CEQbz+SgrPOtcpBUek+etpSXeDhHvVD/L0FKTb6HCYWaA9Te1nFaP9
	zFdZE36Fcbr+dMJxbzM6c7bwAZ+QucvwDSYvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=A7rkxfuwwBn04T3TJYMcjD5qnI460gcCYW9/uC4iyL0j7xoauYc9RWkI5PBE8+VES2
	n+zhSnw3W+kIQqr6DUY/QSAwqtVv6YEbwStWdvOz/y9iCGF2N5U3/spGaq/0CL/KsLHW
	4pdL25YYS6PmMHcS5muws32WckVJrJcJ/2Zfw=
Received: by 10.142.214.11 with SMTP id m11mr1051280wfg.125.1235709275327;
	Thu, 26 Feb 2009 20:34:35 -0800 (PST)
Received: from gmail.com (adsl-71-146-30-62.dsl.pltn13.sbcglobal.net
	[71.146.30.62])
	by mx.google.com with ESMTPS id 22sm4779617wfg.43.2009.02.26.20.34.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Feb 2009 20:34:34 -0800 (PST)
Date: Thu, 26 Feb 2009 20:34:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090227043428.GA32604@gmail.com>
References: <200902140035.13820.khimov@altell.ru>
	<200902141715.56797.khimov@altell.ru>
	<87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
	<200902171525.28995.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200902171525.28995.khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Fri, 27 Feb 2009 04:38:00 -0000
X-Groupsio-MsgNum: 8028
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/02/09 15:25), Roman I Khimov wrote:
> Otavio Salvador:
> > Roman I Khimov <khimov@altell.ru> writes:
> > > Marcin Juszkiewicz:
> > >> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
> > >> > diff --git a/packages/siproxd/siproxd.inc
> > >> >
> > >> > +RDEPENDS = "libosip2"
> > >> >
> > >> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
> > >> >
> > >> > +PR = "r0"
> > >>
> > >> Drop those two lines. You should not add libs to RDEPENDS (OE takes
> > >> care of it) and "r0" is default PR value.
> > >
> > > OK.
> >
> > It would be quite nice if you could send a git exported patch since it
> > makes the life eaiser for anyone going to apply your commit (locally or
> > for pushing it) and also keeps the credit for you.
> 
> OK, let me try to embed it here first, then I'll try to send raw format-patch
> output for other patches. I've also fixed config files installation with this one.
> 
> From d6e5e440e1083455a916964f2da6695337fcffe6 Mon Sep 17 00:00:00 2001
> From: Roman I Khimov <khimov@altell.ru>
> Date: Mon, 16 Feb 2009 19:03:48 +0300
> Subject: [PATCH] siproxd: new package
> 
> ---
>  conf/checksums.ini                |    4 ++++
>  packages/siproxd/siproxd.inc      |   17 +++++++++++++++++
>  packages/siproxd/siproxd_0.7.1.bb |    1 +
>  3 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 packages/siproxd/siproxd.inc
>  create mode 100644 packages/siproxd/siproxd_0.7.1.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index e867c6e..e198cae 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -19754,6 +19754,10 @@ sha256=928fa03d1b8a2329f5e71dd9190080146b5275119e28c19c36fdd57e788d84ba
>  md5=597d7ff7edb42a18421c806ffd18a136
>  sha256=7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
>  
> +[http://downloads.sourceforge.net/siproxd/siproxd-0.7.1.tar.gz]
> +md5=45e5a44803181e2bf3361d562060c904
> +sha256=9e702c1fe770815ed87cf2a2b1d1d1d87551573d
> +
>  [http://download.berlios.de/sipsak/sipsak-0.9.6-1.tar.gz]
>  md5=c4eb8e282902e75f4f040f09ea9d99d5
>  sha256=5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
> diff --git a/packages/siproxd/siproxd.inc b/packages/siproxd/siproxd.inc
> new file mode 100644
> index 0000000..c4ac144
> --- /dev/null
> +++ b/packages/siproxd/siproxd.inc
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "SIP proxy/masquerading daemon"
> +SECTION = "net"
> +DEPENDS = "libosip2"
> +LICENSE = "GPL"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/siproxd/siproxd-${PV}.tar.gz"
> +
> +do_install_append() {
> +	mv ${D}/${sysconfdir}/siproxd.conf{.example,}
> +}
> +
> +CONFFILES_${PN} = " \
> +	${sysconfdir}/siproxd.conf \
> +	${sysconfdir}/siproxd_passwd.cfg \
> +	"
> +
> +inherit autotools
> diff --git a/packages/siproxd/siproxd_0.7.1.bb b/packages/siproxd/siproxd_0.7.1.bb
> new file mode 100644
> index 0000000..760a8b6
> --- /dev/null
> +++ b/packages/siproxd/siproxd_0.7.1.bb
> @@ -0,0 +1 @@
> +require siproxd.inc
> -- 

Thanks for the recipe. I was trying to build it but it failed for me. I
gave few rounds and came up with these two patches and added some more
stuff to the recipe.  Still it would fail while building docs so I gave
up. I am using latest dev tree with gcc 4.3.3

The build needs to be fixed before we apply the recipe.

I have attached my stuff here

Thanks

-Khem


--tThc/1wpZn/ma/RB
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="siproxd.tar.gz"
Content-Transfer-Encoding: base64

H4sIADdtp0kAA+1ZbW/iOBDu1+ZXzKKqC4WEhLd2qVpVouwKXa+toD2ddLeKTGLARxKzsdOXrfjv
N04CLen2bW/blW7zSGDi2OPxM+OZSRBsFvIrt7r2ijAR29tN1VrbTTO+tlq1uE2xZllW02q1Wo16
a820rHqztQbN11RqgUhIEgKsTUPyz2PjiOuz4C0UeluI1P5pa7DA+eFrKAOjZR+yv2VatYz96816
fQ3MH67JN/CL2/+wO+j0e6dnvZNj2IPCoHcKyhGuqz4RXyIaEpcFY3AJ9XlQ0AbdzmJkQGVBO+ye
do8PB+raY0OOTlQDlztDzqd6JJkn9IBIdkEL2lGv0z0edNXIT6dHBU0b9Dv2eb+nOjZuBifn/U73
40n/U9f+vdfvn/Tn1Yxn6hs3p3/MDTSWMf6K81kwoSGTQCLJJeee0DSX2w4PRmwchbRYghttfRxE
etLFvlJtnTged4inraOyag52go4DZtfYjHjoqDEozydTdYO4ru4zIZCBpD+kSpi2zqkdRkHyW/LI
mQBuYV7FnS+0tccRc6khxr6nzWPNWICO5nk2mc1o4Cbq+Rc48XBe3bgR10KJc1m43LihOm4MekX8
mUcrcyWnc3L88WPvqDuwkY3juSIP/tbWH57/4F17RoS4xEGjsRqDhP5sT8zxM7A4ZSPmUfFKVcDL
83+t0TLz/P8WWLU/ca5sZ0KdqZ2Gc/uChoLxwB6xK2NGpDP5jjWezP+N+qr9a1azkef/NwHmBUkc
KYAJmHEWSBqC5CCvZxRiB/CYkLYEFiSXPhWCjCkIGUaOxERrwBkmYorZkwJDOdSjPg2k0MSER54L
QwrEcXAWdeGSyQm81/ffAwlcCLhMe4z3mnY2IcEUk7j+24T6Wi9w6VUbFrnfNLYNC70Tq1Mvwrzq
N7S9/w5N1/XVJQwesvHKOus10/ygmzW91gKr2a432426sQxboJs7pqmVy+VHVM2KaLVN656IgwPQ
67UPlW0oJ83BgQYAPmFBXCvg77v8o0XkrupEiwHQXU3H7z1pLMxpBEObejikvNqv7y9u4Ny5Bp8r
Dx75PT6tQEmDvDD4P2M1/mOUt5PTaktu3zn/GA6+O/w/Ff/r23UzG/8befx/G3wz0IrQqYZ0jJan
oeG8ZqhdXWklUqow2a5/eEawfVxIvd2sfTPc1hpNFW6TJgm3AFtwlIRBmJFQUIGZqr24U+gkUbQN
W4VFn5xQGHHP45fqOfmSXEPxmEvahkMmZh5eBsSn797FCe+8f6TS7PH50VFJBWw1vzh2hyWYwVax
GB+3NFDbcqtUxGt9/zaic5fq+2l6LZVUZH+RAAz9GQnpFjaa+Bx54yb6KnXx0rzaIaOdncYOFLYK
FYhCL+40KzCmAT47hsQXt8PqO/NUWBXzRcztTr1imUhu0qbsboHH+RT5CpEPSNkEejVjITIdS6Wq
ANFVueEQgSXICPrdT73BWbevLQnHfnnJgWDFQb9ExItLkHviJgQ/bIzFCcxCht4mr99pqZKKfDaC
omTOlEp9H4nyxThDNmxuJlZCPDrwllNM1OUnRCdmULLLT8jOGiypAmBRCSwMHdNmj6m0h7H1ikul
U9zzi2fuprLU8MWCMqpXtFVB0P3ztNfvDiqwmVor2UUpLktUXZLUQ634gCbN4oDGQH/0yewv9tnA
1dgF3bN279ytbsHypI4YxSJU+eUS8S6ikNmOxwNahPsHJ8vgXQ6e6QklfR+VrECWw+eIundSE1lZ
Eu9g85YQrMsp7s4rZRg5488iI6uT5IuNKIs0aqaySNKsWOQ+58WlJg+sOAopLT6h+K9uqyLmtRdw
uBi9++yiPfOW1U5y83D4I2uMJ+o/s1ZrZd7/NMztVl7/vQVCzKAYgBcVlfr/5867+TIU1INBu/qc
N0O78feepd4nKydNZz79TJGdWMgfOXPkyJEjR44cOXLkeBX8Cx5ZEHoAKAAA

--tThc/1wpZn/ma/RB--
