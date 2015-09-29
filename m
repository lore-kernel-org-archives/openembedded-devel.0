Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp4.bon.at (bsmtp4.bon.at [195.3.86.186])
	by mail.openembedded.org (Postfix) with ESMTP id 94C117680E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 15:09:51 +0000 (UTC)
Received: from [10.1.14.92] (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp4.bon.at (Postfix) with ESMTPSA id 3nQPJt6sytz5tlK
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:09:50 +0200 (CEST)
References: <560AA635.30407@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?Q?Radek_Dost=c3=a1l?= <radek.dostal@streamunlimited.com>
X-Forwarded-Message-Id: <560AA635.30407@streamunlimited.com>
Message-ID: <560AA9BF.10703@streamunlimited.com>
Date: Tue, 29 Sep 2015 17:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <560AA635.30407@streamunlimited.com>
Subject: Cmake + qt4 = linker error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Sep 2015 15:09:51 -0000
X-Groupsio-MsgNum: 57568
Content-Type: multipart/mixed; boundary="------------010304070503000607070408"

--------------010304070503000607070408
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have a very simple (hello world style) program which uses cmake for
compilation and depends on qt4. I am trying to put together bitbake
recipe for this program. See attached.

When compiling it fail with following error:
/tmp/oe-work/sysroots/x86_64-linux/usr/lib/libQtCore.so: file not
recognized: File format not recognized

I suspect it is looking for libraries in native sysroot due to following 
message in log.do_configure: "Found Qt4:
/tmp/oe-work/sysroots/x86_64-linux/usr/bin/qmake2 (found version "4.8.5")"

Obviously it can only find qmake2 binary in the native sysroot and not
in the target sysroot as it does not make any sense to build qmake2 for
target.

I checked meta-openembedded and openembedded-core and could not find any 
  example I could use for inspiration.

1) Is there something I am missing?

2) Is this a known problem?

Thanks,
Radek




--------------010304070503000607070408
Content-Type: text/plain; charset=UTF-8;
 name="nsdktoolbox.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="nsdktoolbox.bb"

TElDRU5TRSA9ICJDTE9TRUQiCgppbmhlcml0IGNtYWtlCgpERVBFTkRTICs9ICJxdDQtZW1iZWRk
ZWQiCgpTUkNfVVJJID0gIlwKCWZpbGU6Ly9tYWluLmNwcCBcCglmaWxlOi8vQ01ha2VMaXN0cy50
eHQgXAoiCgpTID0gIiR7V09SS0RJUn0iCg==

--------------010304070503000607070408
Content-Type: text/plain; charset=UTF-8;
 name="CMakeLists.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="CMakeLists.txt"

cHJvamVjdChuc2RrX3Rvb2xib3gpCmNtYWtlX21pbmltdW1fcmVxdWlyZWQoVkVSU0lPTiAyLjYp
CgpmaW5kX3BhY2thZ2UoUXQ0IFJFUVVJUkVEKQoKI2luY2x1ZGUoUXQ0TWFjcm9zKQoKaW5jbHVk
ZV9kaXJlY3Rvcmllcygke1FUX0lOQ0xVREVTfSkKCnNldChuc2RrX3Rvb2xib3hfU09VUkNFUwoJ
bWFpbi5jcHAKKQoKc2V0KG5zZGtfdG9vbGJveF9IRUFERVJTCikKCnF0NF93cmFwX2NwcChuc2Rr
X3Rvb2xib3hfTU9DICR7bnNka190b29sYm94X0hFQURFUlN9IE9QVElPTlMgLW53KQoKYWRkX2V4
ZWN1dGFibGUobnNka190b29sYm94ICR7bnNka190b29sYm94X1NPVVJDRVN9ICR7bnNka190b29s
Ym94X0hFQURFUlN9ICR7bnNka190b29sYm94X01PQ30pCgp0YXJnZXRfbGlua19saWJyYXJpZXMo
bnNka190b29sYm94ICR7UVRfUVRDT1JFX0xJQlJBUll9KQppbnN0YWxsKFRBUkdFVFMgbnNka190
b29sYm94IERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9QUkVGSVh9L2JpbikK

--------------010304070503000607070408--
