Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QrlTx-0002A3-8W
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 08:44:39 +0200
Received: by iyf13 with SMTP id 13so1020343iyf.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2011 23:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Oh2fV28v6f6dvIIFC34irrGOS6qPPPYcJMazzWPEi+4=;
	b=uajp9/c2YnBwPlzwxoW6wYAhj/pxI6QyRv/up9IHT3hZyiNl4yVus9bI+qoV0qG69L
	cQta3yrXM/oFADAnwjBRdyNtbojObimLFCLRXRXnWV40F8Vafgswm1/KbW23swypQpvT
	nnHIxawRE+mKTFh9hp71iF4SE8+Li0xVG86AY=
Received: by 10.42.162.198 with SMTP id z6mr612392icx.233.1313131204276;
	Thu, 11 Aug 2011 23:40:04 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g21sm2079437ibl.41.2011.08.11.23.40.03
	(version=SSLv3 cipher=OTHER); Thu, 11 Aug 2011 23:40:03 -0700 (PDT)
Message-ID: <4E44CAC2.6010300@gmail.com>
Date: Thu, 11 Aug 2011 23:40:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1313126272-32091-1-git-send-email-denis@denix.org>
	<20110812063125.GD13857@denix.org>
In-Reply-To: <20110812063125.GD13857@denix.org>
X-Enigmail-Version: 1.2pre
Subject: Re: [meta-oe][PATCH] gcc: append PR to S to match oe-core and fix do_headerfix
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
X-List-Received-Date: Fri, 12 Aug 2011 06:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/11/2011 11:31 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 12, 2011 at 01:17:52AM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>> 
>> This fixes the gcc-cross-inital failure, as reported here: 
>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/6150
>
>> 
> BTW, one of the Linaro patches fails because the file got previously
> updated by do_headerfix(), which runs before do_patch(). A little
> manual intervention is currently required through TERMCMDRUN...
> 

would you mind submitting a patch refresh ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5EysEACgkQuwUzVZGdMxSltwCeLhuIjrTEkz7fMOc30aP8PZyM
Zf8AmwbvdZgbS1jn+ZDXe+q7nDui/uW4
=qCGh
-----END PGP SIGNATURE-----


