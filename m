Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A345871485
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 09:38:34 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUue9-0005MI-10; Fri, 19 Sep 2014 11:38:33 +0200
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XUue4-0004MW-Iv; Fri, 19 Sep 2014 11:38:30 +0200
Message-ID: <541BF991.1000805@pr.hu>
Date: Fri, 19 Sep 2014 11:38:25 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org
References: <541AD1C0.8000008@pr.hu>	<1614913.ETddqcUbxW@peggleto-mobl5.ger.corp.intel.com>
	<541ADB55.8080108@pr.hu>
In-Reply-To: <541ADB55.8080108@pr.hu>
X-Spam-Score: 0.8 (/)
X-Scan-Signature: a689203be2006d9326ab14b7d6d44a87
X-Spam-Tracer: backend.mail.pr.hu 0.8 20140919093830Z
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
X-List-Received-Date: Fri, 19 Sep 2014 09:38:42 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

2014-09-18 15:17 keltezéssel, Boszormenyi Zoltan írta:
> Hi,
>
> 2014-09-18 14:41 keltezéssel, Paul Eggleton írta:
>> Hi Zoltán,
>>
>> On Thursday 18 September 2014 14:36:16 Boszormenyi Zoltan wrote:
>>> I have built systemd-gnome-image from Daisy-based Angström using
>>> instructions from
>>>
>>> http://wp.angstrom-distribution.org/?page_id=53
>>>
>>> The set of layers include "meta-intel" and I use the "genericx86" CPU.
>>>
>>> The image I have has curl installed and whenever I want to use an https://
>>> URL from the internal LAN it fails with:
>>>
>>> ========================================
>>> curl: (35) gnutls_handshake() failed: Handshake failed
>>> ========================================
>>>
>>> The same happens with and without option "-k" (or "--insecure") to curl.
>>>
>>> The webserver's cert is not actually right, as I get this when I use curl
>>> from Fedora 19, 20 or 21Alpha:
>>>
>>> ========================================
>>> curl: (60) Peer's Certificate issuer is not recognized.
>>> More details here: http://curl.haxx.se/docs/sslcerts.html
>>>
>>> curl performs SSL certificate verification by default, using a "bundle"
>>>  of Certificate Authority (CA) public keys (CA certs). If the default
>>>  bundle file isn't adequate, you can specify an alternate file
>>>  using the --cacert option.
>>> If this HTTPS server uses a certificate signed by a CA represented in
>>>  the bundle, the certificate verification probably failed due to a
>>>  problem with the certificate (it might be expired, or the name might
>>>  not match the domain name in the URL).
>>> If you'd like to turn off curl's verification of the certificate, use
>>>  the -k (or --insecure) option.
>>> ========================================
>>>
>>> But using "curl -k" with the same URL from the *Fedora client* fetches the
>>> data properly.
>>>
>>> Is this problem already known in Daisy or Daisy-based Angström?
>> Hmm, this sounds like it might be related to the following bug:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6708
> Yes, it sounds like it, but wget (in my tree currently built against gnutls) works when
> the cert is ignored.
> I'll try building curl against OpenSSL in my tree.

It seems the problem is not totally identical to bug #6708.

Neither buiding GnuTLS from master (3.3.5) nor porting the GnuTLS RPM spec
file from Fedora 21 Alpha (GnuTLS 3.3.7) to an OE recipe fixed it.

However, changing CURL's configuration to use SSL did fix it, this is what
Fedora uses. So, the other half of the bug report works for me, i.e. moving
away from GnuTLS. The bug report used OpenSSL, which

I have verified that wget does indeed use GnuTLS, as forcibly removing
libgnutls28 breaks wget and opkg, too, since it uses wget to dl the packages,
so don't try this at home.

Another thing I noticed while working on this problem is that Fedora cuts out
patented crypto algorithms out of the sources of GnuTLS and OpenSSL, in order
to avoid paying royalties. Despite this fact, these packages in OE don't need the
"commercial" flag and use the upstream pristine sources.

I have the set of package recipes that removes the non-free parts from both,
basically I used the "hobble-gnutls" and "hobble-openssl" from Fedora.

Also, I split up the NSS package per the Fedora style, so I have nss-util, nss-softokn
and nss recipes now. In my extra layer, ca-certificates is now at 20140201, i.e.
2014.2.1 from Fedora.

Is anyone interested in upstreaming these recipes? Or the patent protection parts?

Best regards,
Zoltán Böszörményi

>
> Thanks,
> Zoltán Böszörményi
>
>> Cheers,
>> Paul
>>


