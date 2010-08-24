Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ontxc-0006F0-RT
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 15:54:48 +0200
Received: by wwi14 with SMTP id 14so1694425wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=WEp7Ju/YQCQZ8Jgu2JCisJDjFaW/s8qaH6b1WB0I4P8=;
	b=M6ZC0Hei9vdKJPzJ2cj/bxh37rD3II4h4pWY/LqhEEqUKg7gZcJTmd1l4L1vlBsV/S
	uu1Y65Un1UrQ82kZlzhv0GuGeGgNZlTnqmAKULUn1gjvOaGqLHSfMetl3mAQD+w6ppim
	r6JB8tu2K42C9rgF28LlWZuQl4y2dZKX3dCsI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=aAN3vRCnB1xPuBsJp4qiFYHBlQESMT/uKIS+yTYZP5xb+c5CQJp2Zcl9PheL47CSNP
	AcI8J70rQ2k2M7qaQrVjnG/zrBoRqjHtg8n5mI1IEw4xLUb8im+kV+Kj/zoqbVZ6BCKb
	CI5kfE1uL/p/JhRlIDaA7qfXNoS1PwaiRN4AY=
Received: by 10.216.26.194 with SMTP id c44mr5969974wea.104.1282658057150;
	Tue, 24 Aug 2010 06:54:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 24 Aug 2010 06:53:57 -0700 (PDT)
In-Reply-To: <1282619507633564500@rkmorris.us>
References: <1282619507633564500@rkmorris.us>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Aug 2010 06:53:57 -0700
X-Google-Sender-Auth: OU99xv5iUtHxTVjzNsOMM2AA8co
Message-ID: <AANLkTim+-=cuW25MrceDNWwExvw+gHcs=jdaw8LCo17L@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build Directory inside conf
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
X-List-Received-Date: Tue, 24 Aug 2010 13:54:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2010 at 8:11 PM, <openembedded@rkmorris.us> wrote:

> One item that may need to be cleaned up - there seems to be a copy of
> "build=E2=80=8B" inside "conf".


As there should be.  conf/bitbake.conf includes
conf/build/${BUILD_SYS}.conf.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

