Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB30600B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 11:08:17 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1YvOBY-0001Qh-OZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2015 12:58:44 +0200
Received: from host-87-242-63-200.prtelecom.hu ([87.242.63.200]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1YvOKg-0001IL-VQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2015 13:08:16 +0200
Message-ID: <555DBC98.4030506@pr.hu>
Date: Thu, 21 May 2015 13:08:08 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <555C7731.40605@pr.hu> <20150520124134.GA2386@jama>
In-Reply-To: <20150520124134.GA2386@jama>
X-Spam-Score: 0.3 (/)
X-Scan-Signature: 9c5e05eb7b369c1b31c27083e129340a
X-Spam-Tracer: backend.mail.pr.hu 0.3 20150521110816Z
Subject: Re: How can I disable automatic subpackage naming
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
X-List-Received-Date: Thu, 21 May 2015 11:08:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

2015-05-20 14:41 keltezéssel, Martin Jansa írta:
> On Wed, May 20, 2015 at 01:59:45PM +0200, Boszormenyi Zoltan wrote:
>> Hi,
>>
>> it seems that if bitbake finds a subpackage in the PACKAGES
>> variable that contain a single library, a new, automatic
>> subpackage gets created that will have the name "libxxxxN"
>> with libxxxx being the library name and N being the SO version.
>> With this, bitbake overrides my set of subpackages.
>>
>> How can I disable this in Daisy, i.e. bitbake 1.22.0, so I get the
>> explicit package name I added to PACKAGES?
> Remove "debian" from INHERIT variable.

Thanks!

>
>> Thanks in advance,
>> Zoltán Böszörményi
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


