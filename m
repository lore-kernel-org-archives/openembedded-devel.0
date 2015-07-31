Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8871E76504
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:47:24 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so26639701wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:resent-user-agent:to:from:subject:message-id:date
	:user-agent:mime-version:content-type:content-transfer-encoding;
	bh=FxuSIRgu2odmdfg4gDDKXJPMTPHG7ZzwjB8dRwTlENE=;
	b=EYnJKUZVXdBZhpZTjdGCyR81BiXAc80vgJY7WSq59uvRQ3gKK4fp2OzlmEa5qe5CFI
	xbD15dlV/cXmIFIvgHX6cawsK6hv6JPGubUWGNw1qP8lrxjqa+316Cgrm6khZeLFoVqK
	Ba0lvE3rpRcaB7muJo06FjsxCeUKTXTsTWQuA2C7gMQnRb8w7TCPYUXUINXwVztFVsZI
	LWIIzQ/7OEBPO9vzXGfhnHZKQ2d3iIqkpE12MuN0zoHXHEp8RvjhLgiRUEUJwHj3Ye60
	GsnpomuN2NF/0jPZW//JGnMTR++Z0/a1TecAsxcCSdavjf/zSPg0qTshW+UuzYDT6qbL
	OP+A==
X-Gm-Message-State: ALoCoQl0+IS55p3rZDtdJleAY2GnnkTyYmJeRKA5E3joLioO55UJ9T/wYUe+ujzu3yfLxO0CaDJY
X-Received: by 10.180.9.6 with SMTP id v6mr5688982wia.83.1438339644938;
	Fri, 31 Jul 2015 03:47:24 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	h9sm6549577wjx.20.2015.07.31.03.47.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 03:47:24 -0700 (PDT)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-devel
 <openembedded-devel@lists.openembedded.org>
Resent-Date: Fri, 31 Jul 2015 12:47:22 +0200
Resent-Message-ID: <55BB523A.8080404@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Thunderbird/38.1.0
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	iy4sm3341065wic.24.2015.07.31.01.55.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 01:55:17 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Martin Jansa <Martin.Jansa@gmail.com>, Denis Carikli <GNUtoo@no-log.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <55BB37F3.9030304@dresearch-fe.de>
Date: Fri, 31 Jul 2015 10:55:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
Subject: outdated compat-wireless
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
X-List-Received-Date: Fri, 31 Jul 2015 10:47:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

meta-openembedded contains a recipe for compat-wireless. According to [1] this is really outdated and replaced by a renamed project called backports[2].

Has anyone tried or plans to replace compat-wireless with this?

[1] <https://wireless.wiki.kernel.org/en/users/Download>
[2] <https://backports.wiki.kernel.org>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

