Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D9A1B6FEA8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:17:18 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUbaH-0001RS-9g; Thu, 18 Sep 2014 15:17:17 +0200
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUbaC-0001Ha-RP; Thu, 18 Sep 2014 15:17:15 +0200
Message-ID: <541ADB55.8080108@pr.hu>
Date: Thu, 18 Sep 2014 15:17:09 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org
References: <541AD1C0.8000008@pr.hu>
	<1614913.ETddqcUbxW@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1614913.ETddqcUbxW@peggleto-mobl5.ger.corp.intel.com>
X-Spam-Score: 0.8 (/)
X-Scan-Signature: 85009d953b1791c297252820971497a4
X-Spam-Tracer: backend.mail.pr.hu 0.8 20140918131715Z
Cc: angstrom-distro-devel@linuxtogo.org, Christian Betz <cbetz@sicom.com>
Subject: Re: SSL crypto broken in Daisy?
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
X-List-Received-Date: Thu, 18 Sep 2014 13:17:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi,

2014-09-18 14:41 keltezéssel, Paul Eggleton írta:
> Hi Zoltán,
>
> On Thursday 18 September 2014 14:36:16 Boszormenyi Zoltan wrote:
>> I have built systemd-gnome-image from Daisy-based Angström using
>> instructions from
>>
>> http://wp.angstrom-distribution.org/?page_id=53
>>
>> The set of layers include "meta-intel" and I use the "genericx86" CPU.
>>
>> The image I have has curl installed and whenever I want to use an https://
>> URL from the internal LAN it fails with:
>>
>> ========================================
>> curl: (35) gnutls_handshake() failed: Handshake failed
>> ========================================
>>
>> The same happens with and without option "-k" (or "--insecure") to curl.
>>
>> The webserver's cert is not actually right, as I get this when I use curl
>> from Fedora 19, 20 or 21Alpha:
>>
>> ========================================
>> curl: (60) Peer's Certificate issuer is not recognized.
>> More details here: http://curl.haxx.se/docs/sslcerts.html
>>
>> curl performs SSL certificate verification by default, using a "bundle"
>>  of Certificate Authority (CA) public keys (CA certs). If the default
>>  bundle file isn't adequate, you can specify an alternate file
>>  using the --cacert option.
>> If this HTTPS server uses a certificate signed by a CA represented in
>>  the bundle, the certificate verification probably failed due to a
>>  problem with the certificate (it might be expired, or the name might
>>  not match the domain name in the URL).
>> If you'd like to turn off curl's verification of the certificate, use
>>  the -k (or --insecure) option.
>> ========================================
>>
>> But using "curl -k" with the same URL from the *Fedora client* fetches the
>> data properly.
>>
>> Is this problem already known in Daisy or Daisy-based Angström?
> Hmm, this sounds like it might be related to the following bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6708

Yes, it sounds like it, but wget (in my tree currently built against gnutls) works when
the cert is ignored.
I'll try building curl against OpenSSL in my tree.

Thanks,
Zoltán Böszörményi

>
> Cheers,
> Paul
>


