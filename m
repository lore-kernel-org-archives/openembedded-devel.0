Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 389 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Mar 2016 10:05:38 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.200])
	by mail.openembedded.org (Postfix) with ESMTP id 55E7560796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 10:05:38 +0000 (UTC)
Received: from [216.82.242.35] by server-8.bemta-8.messagelabs.com id
	39/B1-31132-DE15AF65; Tue, 29 Mar 2016 09:59:09 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-75.messagelabs.com!1459245548!15549283!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 60272 invoked from network); 29 Mar 2016 09:59:09 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-4.tower-75.messagelabs.com with SMTP;
	29 Mar 2016 09:59:09 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 29 Mar 2016 11:59:01 +0200
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 29 Mar 2016 11:59:01 +0200
To: <openembedded-devel@lists.openembedded.org>, Pushpal Sidhu
	<psidhu@gateworks.com>, <martin.jansa@gmail.com>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama> <56E07715.8060801@gmail.com>
	<CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
	<20160317215442.GL2553@jama>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <56FA51DF.3070606@digi.com>
Date: Tue, 29 Mar 2016 11:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160317215442.GL2553@jama>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Tue, 29 Mar 2016 10:05:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/16 22:54, Martin Jansa wrote:
>
> I'm still seeing multiple issues caused by last openssl upgrade, e.g.
> ruby, pywbem, crda
>
> Are they all supposed to be fixed by this?

Well I just did a basic build tests with the three mentioned above 
(ruby, pywbem and crda) and these are the results:

RUBY
~~~~
I don't see any difference with or without the patch, it's building fine 
even without the patch but the patch does not hurt either.

PYWBEM_0.8.0
~~~~~~~~~~~~
Without the patch fails with:

   File 
"/ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/M2Crypto/_m2crypto.py", 
line 24, in swig_import_helper
     _mod = imp.load_module('__m2crypto', fp, pathname, description)
   ImportError: 
/ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: 
undefined symbol: SSLv2_method

With the patch PYWBEM builds fine.

CRDA_3.18
~~~~~~~~~
Without the patch fails with:

NOTE: make -j 8 MAKEFLAGS= 
DESTDIR=/ssd/dey/jethro/x11/ccimx6sbc/tmp/work/cortexa9hf-vfp-neon-dey-linux-gnueabi/crda/3.18-r0/image 
LIBDIR=/usr/lib/crda LDLIBREG=-Wl,-rpath,/usr/lib/crda -lreg all_noverify
   GEN  keys-gcrypt.c
   Trusted pubkeys: pubkeys/linville.key.pub.pem 
pubkeys/sforshee.key.pub.pem
ERROR: Failed to import the "M2Crypto" module: 
/ssd/dey/jethro/x11/ccimx6sbc/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: 
undefined symbol: SSLv2_method

With the patch CRDA builds fine.

So I would say that the patch improves the situation. It fixes the build 
for some packages and does not seem to break anything.


I'm also having build failures for CRDA since almost a month now, so I 
would like to have the 'jethro-next' merged to 'jethro' as well.


Thanks,

Javier Viguera

