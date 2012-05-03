Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPwbS-0004xJ-OD
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 16:01:54 +0200
Received: by pbbrq2 with SMTP id rq2so2150535pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=tj6f2ZrkwXr5xCDaKHQEEj5GBuE7JxiGw9xMbTYy//4=;
	b=ryctd4HvKbLb4NehjyZkyo4o3BkDeZ+0d4SRyuukOXU7X5FTSxkgm+TtX1wwzZGSvH
	KEVqlOEWNVG/KlmP7Pvy3Q84dUXOQH6/CMDtWhADFcMtI+GVkeF+ANUkmzE6LbZw+RI3
	5wj6e1iaOIdlxbNprCVa3RgkUkxVGqxpS32tX1HDwT1e/ZKLlnNmePCKeQe/NJ84Mbgx
	PCvsLS5Ji8S3b07jyFQ6RKItRlu+s3n4kPHse4YJ+e+VoEV2AjofqN8uztxmp+MhDcLN
	4WgAcqGRmznB0kjtdzCQyMbaNyvhx7G+7ybe6gYAcu/KvlilE/pFL/7y2TlouTjtu438
	AIsg==
Received: by 10.68.221.133 with SMTP id qe5mr8143164pbc.24.1336053128318;
	Thu, 03 May 2012 06:52:08 -0700 (PDT)
Received: from [172.23.4.147] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id nt8sm5382556pbb.12.2012.05.03.06.52.06
	(version=SSLv3 cipher=OTHER); Thu, 03 May 2012 06:52:06 -0700 (PDT)
Message-ID: <4FA28D83.90604@gmail.com>
Date: Thu, 03 May 2012 06:52:03 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
	<4FA0FFD5.6080201@gmail.com> <4FA1A1C8.3030705@gmail.com>
	<4FA22A58.3040100@gmail.com> <jntd9a$pip$1@dough.gmane.org>
	<4FA23915.6040604@gmail.com>
In-Reply-To: <4FA23915.6040604@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Thu, 03 May 2012 14:01:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/03/2012 12:51 AM, Martin Ertsås wrote:
> Fair point, I was just told that some packages might look at the
> name of the toolchain, and perhaps not give the optimal path for
> hard floats with the name of linux-gnueabi. Clearly some packages
> do actually look at the name of the toolchain, but for most cases
> at least, the only difference will be the hardfloat flag given to
> the compiler. Also seen quite a few toolchains using hardfloats
> which has the hf prefix, to show that this is actually a hardfloat
> toolchain.

some distros may rely on triplet and if it makes into gcc and gcc
starts relying on it we will have to reconsider but at present I dont
see a need to change triplet
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+ijYMACgkQuwUzVZGdMxQoGACfSjsIVwB+uPW/cDbtUbQR87oC
r/gAniC35ygSHDUIe0O1urrsO/w+gcEl
=ZLo8
-----END PGP SIGNATURE-----


