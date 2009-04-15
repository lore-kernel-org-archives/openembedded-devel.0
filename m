Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu1lw-0005hf-M1
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 11:51:14 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lu1iG-000FOO-LL
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 13:47:24 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 13:47:16 +0400
User-Agent: KMail/1.9.9
References: <1239784615-19928-1-git-send-email-khimov@altell.ru>
	<gs47uf$uv2$1@ger.gmane.org>
In-Reply-To: <gs47uf$uv2$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904151347.16942.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 09:51:14 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 13:04:15 Koen Kooi wrote:
> On 15-04-09 10:36, Roman I Khimov wrote:
> > libpcap can be used in distros where no bluetooth support will ever
> > exist. So this dependency should be weakened to only exist in distros
> > that explicitly need bluetooth.
>
> NACK, no USE flags in OE. 

Even if hostap-daemon and wpa-supplicant and tasks already use FEATURES in 
similar fashion, changing package-task behaviour?

> If you want a pcap without bluez you can 
> either do:
>
> libpcap.bb + libpcap-bluetooth.bb OR libpcap.bb + libpcap-no-bluetooth.bb
>
> And add the needed virtuals.

Is this a policy? I'm not sure it makes sense to add tons 
of 'package-this', 'package-that', 'package-yet-another-thing',
'package-this-that-but-not-yet-another-thing' for every case.

I've used this 'virtual' kind of approach with two another packages but there 
I'd extended functionality by applying patches, so another package with all 
virtual stuff makes more sense. But here what I'm doing is configuring the 
same source to fit my needs and 'bluetooth' thing already exist in FEATURES. 
So how to use it if not this way?

Though if it is a policy around here, so be it.


