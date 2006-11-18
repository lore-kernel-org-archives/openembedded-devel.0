Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GlUwi-00027Z-Ma
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Nov 2006 19:29:44 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1810028nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Nov 2006 10:27:11 -0800 (PST)
Received: by 10.48.242.19 with SMTP id p19mr3536239nfh.1163874431847;
	Sat, 18 Nov 2006 10:27:11 -0800 (PST)
Received: from CUBE ( [82.193.96.239])
	by mx.google.com with ESMTP id c1sm15784659nfe.2006.11.18.10.27.09;
	Sat, 18 Nov 2006 10:27:11 -0800 (PST)
Date: Sat, 18 Nov 2006 20:27:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <445085120.20061118202707@gmail.com>
To: Holger Freyther <freyther@gmx.net>
In-Reply-To: <8AE3EAEE-5469-405E-8510-AAB99B47D328@gmx.net>
References: <31406A3C-DA2A-420F-8DDC-D57F0B6FC345@inf.fu-berlin.de>
	<200611181458.18269.openembedded@hrw.one.pl>
	<8AE3EAEE-5469-405E-8510-AAB99B47D328@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: I need your number(s), BitBake/OE parsing speed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Nov 2006 18:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Holger,

Saturday, November 18, 2006, 4:23:53 PM, you wrote:

> Am 18.11.2006 um 14:58 schrieb Marcin Juszkiewicz:
> Thanks,

> please do it again an put CACHE=""  in your local.conf...

  I knew it's no that easy ;-)

1. Unpatched, cache is being killed before each run:

$ time ~/linux-ppc/bitbake/bin/bitbake -p opie-image

real    5m55.958s
user    0m20.940s
sys     5m31.190s

real    5m33.998s
user    0m18.310s
sys     5m10.850s

real    5m39.153s
user    0m18.140s
sys     5m16.650s

2. Applied oe_less_anons.patch and glib-2.0.inc

real    5m18.270s
user    0m24.590s
sys     4m50.210s

real    5m18.651s
user    0m17.270s
sys     4m58.080s

real    5m26.934s
user    0m16.670s
sys     5m5.440s

3. Applied bitbake_one_queue.patch

real    5m22.281s
user    0m17.420s
sys     5m1.330s

real    5m12.338s
user    0m24.290s
sys     4m44.470s

real    5m12.112s
user    0m16.080s
sys     4m52.810s


> h.


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



