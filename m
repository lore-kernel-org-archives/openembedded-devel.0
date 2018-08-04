Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id EABE974892
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 09:53:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r4-v6so2962159edp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 02:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Er0OD9yvy/WybAGumvi9hOZb9MlI1ALhhpzZMiaXwFE=;
	b=QCc4hWjNxFOhMg0EHDD9C6k+BS9dHVai2zJ8qq8Zt9xk0ogur/OdE2L24TleIpIoQ9
	II1ZyDZLyNjUMX1v2vWKRyZJykV6E2PHm/hN5jiS+UTFyw9rEnqiMfYip8/N/9c0x0z5
	2m+alFmEDHFwhExycLEoNLHHDI7TPRZHiRL1vJkQZ51rt27VcnWSNg8UYQVYVhHzO8gP
	nPC+wbI6KsPcIqFWzlWTKyEVAUQymSgo6MpOZZ5iSaKUXAOv+JTiIWFqQ6cJGeq4ok0/
	XRJ4w0/XNblZAZIB3AcGCwoABbJig6k4Xanni1Z/EolIe/AuWsuwybL/w9sMtAO4NuzI
	cMgw==
X-Gm-Message-State: AOUpUlGEyxluUz1y81/8ZouzuLQYkXzAF7OmEgwkPrK0Vlt8uTTZT19D
	0zMZ4noxncON2QmpqmpzZPrqvUum
X-Google-Smtp-Source: AAOMgpeWV7b337yI4K2aTmfuf++9rxFo8SIOl0f+lbc23LF/DCtFxxti3CdyOT2q2UExWWOreoEQZA==
X-Received: by 2002:a50:9704:: with SMTP id
	c4-v6mr10440216edb.246.1533376390554; 
	Sat, 04 Aug 2018 02:53:10 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	j23-v6sm3644957edh.29.2018.08.04.02.53.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Aug 2018 02:53:09 -0700 (PDT)
Message-ID: <44106c2a8fb083e5ad989a46c03cc5bbc996b754.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 04 Aug 2018 10:53:09 +0100
In-Reply-To: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
References: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 1/2] classes:java: move version_specific_cflags to java.bbclass
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
X-List-Received-Date: Sat, 04 Aug 2018 09:53:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-02 at 16:45 +0200, Andreas Obergschwandtner wrote:
> moved version_specific_cflags from openjfdk-8-common.inc to java.bbclass
> and
> renamed it to java_version_specific_cflags because it will be used for a
> fix
> in icedtea7

Does it really make sense to have openjdk / icedtea specific flags in a
generic java class in a function with a generic name as is
java_version_specific_cflags?

Maybe it would be better to create a new class for these things instead?


Cheers,
Andre'


