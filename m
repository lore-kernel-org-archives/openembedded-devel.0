Return-Path: <NIDHI.CHADHA2@cognizant.com>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Jun 2016 05:54:21 UTC
Received: from chnog22.cognizant.com (chnog22.cognizant.com [203.99.199.27])
	by mail.openembedded.org (Postfix) with ESMTP id C869762132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 05:54:21 +0000 (UTC)
From: <NIDHI.CHADHA2@cognizant.com>
To: <openembedded-devel@lists.openembedded.org>
Thread-Topic: hostapd and openssl version mismatch 
Thread-Index: AdHC27h/dyeDkkW0QoOfUFTxFACUDg==
Date: Fri, 10 Jun 2016 05:48:47 +0000
Message-ID: <C2EDADA61C95714D9B62AFF0B58BEC4D098E590C@CTSINCHNSXMBL.cts.com>
Accept-Language: en-US, en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.232.192.81]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: hostapd and openssl version mismatch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 05:54:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Reference to oe-core branch  Jethro
Revision: 69b1e25a53255433262178b91ab3e328768ad725

Hostapd 2.4-r0 build with openssl version 1.0.2d has an issue in compilatio=
n due to no
Compile time support of md4 in 1.0.2d version of openssl .
The compilation issue is undefined reference to EVP_md4 , which is defined
In openssl/1.0.2d-r0/openssl-1.0.2d/crypto/evp/evp.h under the MACRO OPENSS=
L_NO_MD4.
The macro OPENSSL_NO_MD4 is enabled only if openssl configuration and gener=
ated makefile define "no-md4"

// place where EVP_md4 is defined
openssl/1.0.2d-r0/openssl-1.0.2d/crypto/evp/evp.h
# ifndef OPENSSL_NO_MD4
const EVP_MD *EVP_md4(void);
# endif

//Makefile which configures no-md4 flag
CONFIGURE_ARGS : no-md4
DEPFLAG=3D -DOPENSSL_NO_MD4

Hostapd depends on md4 for number of EAP methods which require md4 support =
.
To disable the use of EVP_md4 function call in function md4_vector , macro =
defined in
OPENSSL_NO_MD4 should be used . In case of OPENSSL_NO_MD4 enabled ,
md4_vector returns the value returned by function
openssl_digest_vector(EVP_md4(), num_elem, addr, len, mac);

following patch should be applied in crypto_openssl.c

--- crypto_openssl.c_ori               2016-06-07 12:51:35.571749090 +0530
+++ crypto_openssl.c    2016-06-07 12:37:54.967772380 +0530
@@ -95,7 +95,11 @@

 int md4_vector(size_t num_elem, const u8 *addr[], const size_t *len, u8 *m=
ac)
{
+#ifdef OPENSSL_NO_MD4
+             return -1;
+#else
               return openssl_digest_vector(EVP_md4(), num_elem, addr, len,=
 mac);
+#endif
}

Has anyone faced this issue or Jethro branch has already taken care or this=
 is just a version mismatch for openssl and hostpad?


Thanks
Nidhi


This e-mail and any files transmitted with it are for the sole use of the i=
ntended recipient(s) and may contain confidential and privileged informatio=
n. If you are not the intended recipient(s), please reply to the sender and=
 destroy all copies of the original message. Any unauthorized review, use, =
disclosure, dissemination, forwarding, printing or copying of this email, a=
nd/or any action taken in reliance on the contents of this e-mail is strict=
ly prohibited and may be unlawful. Where permitted by applicable law, this =
e-mail and other e-mail communications sent to and from Cognizant e-mail ad=
dresses may be monitored.

