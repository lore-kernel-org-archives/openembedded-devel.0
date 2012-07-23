Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1StFMw-0006fq-1z
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 11:56:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=1032; q=dns/txt;
	s=iport; t=1343036677; x=1344246277;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=kY0TRq31LoCldsdWTRKG0f1UlcF77gDoamHtTwS4sTE=;
	b=KZBqKVqb/vFYJIeOsVQtYr7A3Awjf2FzD4UYrMm56JtXyMGKtbSA2dXB
	CQnSc8smX17PyMElM6APpd3C2kjq5KLij1B4+SQWP/iwLtkzsSs0m0Tbn
	fvu0bGxUAhLLwOz8DbNzS4EvT+4Pi8+btMeGXABtoehkIawkQ6+Gh+Cn3 Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EANYbDVCQ/khL/2dsb2JhbABFuTWBB4IgAQEBBAEBAQ8BHwE7ChELGAkWDwkDAgECARUBLxMGAgEBHodrC546nx2PBIMcA5MdgiyBFIRHiEyBZoJh
X-IronPort-AV: E=Sophos;i="4.77,638,1336348800"; 
   d="scan'208";a="6829071"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-4.cisco.com with ESMTP; 23 Jul 2012 09:43:30 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q6N9hU1H026336
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 09:43:30 GMT
Message-ID: <500D1CC2.8090502@cisco.com>
Date: Mon, 23 Jul 2012 11:43:30 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <500D0F6D.70001@cisco.com>
In-Reply-To: <500D0F6D.70001@cisco.com>
Subject: Re: Moving pkg.m4 to the x86 sysroot instead of arm sysroot in toolchain
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
X-List-Received-Date: Mon, 23 Jul 2012 09:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

The issue was quite simple. My thoughts were correct, but should add
pkgconfig-nativesdk-dev to task-sdk-host-nativesdk.

- Martin

On 07/23/12 10:46, Martin Ertsås wrote:
> Hi.
>
> When building meta-toolchain, pkg.m4 is put in the arm sysroot of the
> toolchain, instead of the x86 sysroot where it belongs. pkg-config is in
> the x86 directory, and when it is in the arm directory, we need to hack
> the aclocal flags to point to it for stuff to compile.
>
> I have tried a few things, like adding pkgconfig-nativesdk to the
> task-sdk-host-nativesdk and pkgconfig to task-core-standalone-sdk. From
> my understanding, the former should populate the x86 directory, but
> obviously it didn't. Any ideas to what I can do to fix this? It would be
> greatly appreciated.
>
> Best regard
> Martin Ertsaas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



