Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZym7-0001TB-E2
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 08:22:23 +0200
Received: by wgbdr1 with SMTP id dr1so465821wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 23:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=gPL63M5b6SZzne4mhXza0uJGZmPXwxdpN5I7bncO2Vs=;
	b=nOjWuAXymOVvK4b/ZzZZCmOvICXgWdJCx6pEg0FL/kWU1/RNQx/DiN2s1qIPIGXDdT
	uLjGSDbagmf5ak6Jdws3NQpGz5ue7hxJ9U8QXaXLolIe+hgc/pdWF71EkwsQeZ1Rt6sh
	+0UCGZBcucpqQlcLEWKm0nUF9CALoYaGjY6AfilOBdwI4GB5lHUhwiELNZfpn95H1bZQ
	JNWPDp7KzoRKgxvDQzJZIxo+5mndTMVcKPlkVR0IQwQ5EXqj759um6Tb4fMpKvnbMRs9
	V2jhIPay7uWMwkJVKvSmvTPLRoPqdrp85Aq0WXYM1doJe/lEyPZPFWeAX1jo3d0OxGeD
	h/ew==
Received: by 10.216.226.198 with SMTP id b48mr6623889weq.186.1338444723906;
	Wed, 30 May 2012 23:12:03 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id et10sm1788971wib.2.2012.05.30.23.12.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 23:12:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAAB-1yyujmBXX6ULdGVA3oX0ROUFHa77+3nfmmXyg=kED42mNA@mail.gmail.com>
Date: Thu, 31 May 2012 08:12:06 +0200
Message-Id: <CB6A0F89-6140-4F12-9A26-16FC72305E2E@gmail.com>
References: <1338404160-6968-1-git-send-email-elvis.dowson@gmail.com>
	<20120530192452.GA8099@sakrah.homelinux.org>
	<CAAB-1yyujmBXX6ULdGVA3oX0ROUFHa77+3nfmmXyg=kED42mNA@mail.gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>, OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-xilinx] tune-ppc440.inc: Add support for PowerPC 440 processor for Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Thu, 31 May 2012 06:22:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On May 30, 2012, at 9:38 PM, Adrian Alonso wrote:

> the tune file its ok, but it should be better if you rather provide a
> fix for the tune-ppc440.inc
> that is part of meta-xilinx layer;

Here is a diff against the existing tune-ppc440.inc file in the =
meta-xilinx layer. I'll submit a patch shortly.

diff --git a/conf/machine/include/tune-ppc440.inc =
b/conf/machine/include/tune-ppc440.inc
index f77f628..394364d 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -4,11 +4,11 @@ require conf/machine/include/powerpc/arch-powerpc.inc
=20
 TUNEVALID[ppc440] =3D "Enable ppc440 specific processor optimizations"
 TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", =
"-mcpu=3D440", "", d)}"
-TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppc440", =
"ppc440", "${PPCPKGARCH}", d)}"
=20
-TARGET_FPU =3D "soft"
 AVAILTUNES +=3D "ppc440"
-TUNE_FEATURES_tune-ppc440 =3D "m32 ppc440"
-PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "ppc440"
+TUNE_FEATURES_tune-ppc440 =3D "m32 fpu-soft ppc440"
+TUNE_PKGARCH_tune-ppc440 =3D "ppc440"
+PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
=20
-#MACHINEOVERRIDES .=3D "ppc440"
+# glibc configure options to get 440 specific library (for sqrt)
+GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"ppc440", "-with-cpu=3D440", "", d)}"

Best regards,

Elvis Dowson=


