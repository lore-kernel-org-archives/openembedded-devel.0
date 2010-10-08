Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Jxm-00021G-Nz
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:55:07 +0200
Received: by gwb17 with SMTP id 17so201476gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=aBjgx1DfZGpAdhUjfKGOaFUgAyzOtlmhHbhz3LSCdGc=;
	b=gOTZezMF3kZEISnF5AGRjmBh2Yc9FzY/Yswm55VRu2vATMP12H1oldex6+ZadAZ6ej
	ve+kp7IEURuKxWiK7BvEh5ksriDY/h/J9JYE76UDV2/JGhEokiSfsVwH3dKyzAjhRb2P
	aC82TXwlGMLuEywnHZbNvhsS1aInHaB+4RI8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=teHP0kwEFzQYeW2cg1t273ufFKMa7KAu0PRgBQ0PtVkaj7bEVCyZpDz/hY45YMdh1n
	ypjoBLY4HtdgLN2fTWnBM0FKmtmQxB8aftSKWPaE3pFaeMJXxPjUKGkln4I86V1T5eao
	yKNBK/QsjCGhP6fY8+ddTSTw+D2pDCcUT7/H4=
MIME-Version: 1.0
Received: by 10.151.84.3 with SMTP id m3mr3718039ybl.76.1286571260795; Fri, 08
	Oct 2010 13:54:20 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 13:54:20 -0700 (PDT)
Date: Fri, 8 Oct 2010 22:54:20 +0200
Message-ID: <AANLkTi=qFpjK39fB7NzZ-aTBfasWBjq5LBxKSbG9dWec@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: zsafe
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
X-List-Received-Date: Fri, 08 Oct 2010 20:55:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

By incident bumped into zsafe. No idea what it is, but something in
the recipe drew my attention:

FILES_zsafe = "zsafe"

do_install() {
        install -d ${D}${palmtopdir}/pics/${APPNAME}/
        install -m 0644 ${WORKDIR}/pics/${APPNAME}/*.xpm
${D}${palmtopdir}/pics/${APPNAME}/
        install -m 0644 ${WORKDIR}/zsafe.png ${D}${palmtopdir}/pics/
}

Seems kinda weird, installing files like zsafe.png and *.xpm but not
add them to the package
maybe inherit opie (which is also in the recipe will do some things
with this under water, but I would expect these files to go with the
exe.

Frans (puzzled)


