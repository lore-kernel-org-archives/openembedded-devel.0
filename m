Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id EB1E86BD60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 07:28:32 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q55so62792wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 00:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Ol2Trd2z/SFtQ7TbMpdVNheZIenO1ouVuz4cVVyZ+FE=;
	b=J8BZYwPCZN32gqXgQKE4CcB+ORFfVQufGkCbUpgVjGQ6W9XYWLYg8AqEicqtqt6mjp
	3U1GAU9vGkL9wiNbxtwOE/xaP/BmOevZzGRiEUU1H18EcN/PahVO0Rw7lHP1YQ1HzUaE
	4d7aRx4ZoWrIzvFf49oM3OMiG8Gad2fJZ8LRsa14uDSYQUgCt9NzXJ3x6q0vnuXJ7P4r
	L3NFoHI2u/rPTp/dFlH3AHHUZ2gMaoKMy519MPjuvVnl4HzwR9aKy+xdx+Nx3tTKWXHK
	aI4j86bqwkvvCizR6RCocPsJOc3uCqFCRKoaU3C1uFgdQqWtPClTuDxtKc31sc5WQWot
	ZMIg==
X-Gm-Message-State: ALoCoQmViG7Bs6TW4Vh/AnXL+VZ5uY0GlUM82RHxI1Tuq/nD4Ji8ZH9YnEjCHzKlTuwjrlS4Itoj
X-Received: by 10.194.86.5 with SMTP id l5mr3508276wjz.45.1377761312789;
	Thu, 29 Aug 2013 00:28:32 -0700 (PDT)
Received: from iMac.local (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id om9sm10276925wic.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 00:28:31 -0700 (PDT)
Message-ID: <521EF819.4040700@dominion.thruhere.net>
Date: Thu, 29 Aug 2013 09:28:25 +0200
From: Koen Kooi <koen@dominion.thruhere.net>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1377758712-4916-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1377758712-4916-1-git-send-email-b40290@freescale.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-oe][PATCH V3 ] daq: add recipe
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
X-List-Received-Date: Thu, 29 Aug 2013 07:28:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have a few minor style nitpicks, see below

Op 29-08-13 08:45, b40290@freescale.com schreef:


There's a stray space at the end. Can you also add a SUMMARY field?



These checksums tend to go below the SRC_URI


new file mode 100644

@@ -0,0 +1,19 @@


I guess it doesn't matter either way since OE actually has dependency
tracking, but would it make sense to fix the AC_CHECK_PCAP_VER to stop using
AC_TRY_RUN?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSHvgZMkyGM64RGpERApt/AJsEqzPKL5OHmzUefLfrzNxBUMlTIQCfRZfO
X3WZ7aQfuil0gVtyjfCAxoQ=
=na+u
-----END PGP SIGNATURE-----

