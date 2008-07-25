Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KMHou-0007Zt-U9
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 09:34:33 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3378664rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2008 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=LNnHRwJXTqnxzNBC+6BXyLY68OLYAZ73WyukguJF7Xg=;
	b=MvxGTZruzHU3G6ZW3uENIAfnyVlEEW6o7WYZWXMDaEb/LUxwns05eLb8FBlst49J7j
	Pji02URBhukZwStUlhyLT6yrkNRXMYvOz+RiAmjXGMA5uq0aLxrgnFrtBO3Jn4CVBf9Q
	+/8TlsoT4G9JWOPE0lzQ3pXg053PDBMNwiuR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OBJL0r+Y2MC/bOofJCtpv/A/OPIHgp0qA85tZTMERmwOZyRZOUpHojLYjD1OBORvTs
	EtdQYIyZBO6Qf0EkWlOtAC2qMyTqlhdEIXwGASGP7YvV5FTZUVTNu8ByIWtr2CvR1qSq
	9kJZrsbeBQY44LaM2jEGSFtwqe7DftgtuxPd8=
Received: by 10.140.165.21 with SMTP id n21mr723703rve.97.1216971193078;
	Fri, 25 Jul 2008 00:33:13 -0700 (PDT)
Received: from localhost ( [71.146.27.134])
	by mx.google.com with ESMTPS id c20sm15305424rvf.1.2008.07.25.00.33.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jul 2008 00:33:05 -0700 (PDT)
Date: Fri, 25 Jul 2008 00:33:04 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080725073304.GA10944@gmail.com>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
	<20080720014112.GA13759@oberlord>
	<20080723090416.GB24264@gmail.com>
	<1216890646.6103.5.camel@dax.rpnet.com>
	<1216915506.6103.40.camel@dax.rpnet.com>
	<g6a9vs$hok$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <g6a9vs$hok$1@ger.gmane.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 07:34:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/07/08 18:18), Koen Kooi wrote:
> Richard Purdie wrote:
>> On Thu, 2008-07-24 at 10:10 +0100, Richard Purdie wrote:
>>> I've patched Poky with a patch similar to yours and am in the process of
>>> running some tests. So far its all looking good, I expect the final
>>> tests to complete later today and will report back when they complete.
>>> If they work out, I'm happy for this to be committed.
>>
>> My tests all worked out apart from some unrelated issues so I'm happy
>> for this to be committed.
>
> My small test came out ok as well, so I'm happy for this to be committed  
> as well.

Thank you Koen and RP for testing it out and ACK'ing. I have committed
the big patch. Let me know of any fallouts and I will try to fix them.

Happy hacking.

-Khem


