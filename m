Return-Path: <bill.randle@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6502E60806
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 04:26:58 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id q3so21476335oth.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 20:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XrXK8PnCJrQvwYXhm0g5YKEisZxfuJ0SwGjjj6wQuUQ=;
	b=gZKBPdg4xlxHddYGtEFTI/ksYeay/hDMubGplCpRwvHjtsVPJbH8nxE88lf3gV5cnb
	2kJ9oXB92V8ZRf/m1ZDwVmCxERpICfWEooZhkidHmhiRrwJnLI1ko9S2hchIsOfMCpUZ
	cvZTYvc98x5AeFi4Zv2EDQW3pCvUE3ncfL2+Ybpc8FdZyZr3GvRSZNNfwZhallupnTu9
	jXF3ERobac1Yehln/9eFs/Unt3fAH83vBo6+7azG4fA0AZkmL2I4PiyJeRJ2mxdSC0a7
	2P+5+87YNqOPpMrUOiOwaxUJhGh2wcXZe4Dh7uj620WfsSjuJSEvb8uK7l+hppYUiPOI
	RASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XrXK8PnCJrQvwYXhm0g5YKEisZxfuJ0SwGjjj6wQuUQ=;
	b=sP64Sz6q4i8DmKyfm5lF9ooI9yTB08l04iduOXroLJKW9Q39ErB5b0DoUN8/PjrY+/
	Vx+VJDkNC8ZCmQ48Ecc1oft1xM/GCUU0Nru+I5uxFFNxXaHVKwmsWhdVuikkis3CIaDn
	4U0HPkPam/dePI6Mb1nInp6Aa4NoVL/FpxG/1MqMh5LlDK+addgmut36ZGMOBijdvZf0
	zKoMBIdBRV3SRwNhiKgXQ2YDSy7KDBpDzQL4jV7U5ojkJniJ1tzLXYMZRceCt4vV1gAP
	hTFACou2EbvvhO3Z1UWbwv5tVz4g+4T8wEj2/AJD22/QKEahaYwn8wJV7gxg1CCdIass
	0FHA==
X-Gm-Message-State: AKGB3mJJB1rv70kkT37KwQlr5tqRQtgvCeNqheZrelwkGjhINSr6tjXA
	jdlmwbDfK5nKgiIDdpGWG/bBK4165LQ/kZEcJ18=
X-Google-Smtp-Source: ACJfBou+ov8JvkywrRqa2yvE4/t8vk32QKRApdfoZ+k1e5bVIwckxen5Eew8b/Fx51kI95OMtjXvIo77Q3tLTKWO4bI=
X-Received: by 10.157.14.89 with SMTP id n25mr7688477otd.224.1513830419146;
	Wed, 20 Dec 2017 20:26:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Wed, 20 Dec 2017 20:26:58 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
Date: Wed, 20 Dec 2017 20:26:58 -0800
Message-ID: <CA+n--H-+5egfyDravS4qDVHiwEXknty4Dvb=TykyuLLqn=ZOEw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe] smstools3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 04:26:58 -0000
Content-Type: text/plain; charset="UTF-8"

When smstools3 was added to meta-oe/recipes-connectivity in 2015, a
patch was included to the init script to change to 'ps' options used
to find the pid during stop. The original (as distributed by the
author) has PSOPT="-e" and the patch changes it to PSOPT="". The way
it is used is:
    if  "ps $PSOPT | grep smsd | grep -v grep >/dev/null; then
       do stuff
    fi

I'm considering submitting a patch to update the recipe from version
3.15 to 3.21, but before I do, I like to know why PSOPT was changed.
On my busybox test system, a "ps | grep smsd" returns nothing. I need
to use the "-e" option. So, I would like to drop this patch. Comments?

