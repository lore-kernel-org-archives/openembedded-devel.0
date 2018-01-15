Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DEB916010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:41:52 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t74so509972wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=VLycZZ8lQ/deXaLDD2I3STdNltFoiwoBl4myn4yJ1OM=;
	b=MoWRbGbtpz0XjR9fwMzp++SIVVFQDBuR7oUl2Vfpby/hagx1I2C8rFrrFKUq4X+qxv
	4sah02rgLCNrqk/88P2OWuN+UAFeSe0YBNmP+znJFrfZ3sad8SaYUbIBgdlaEU//wVzi
	LoHSZuHTS0DmN8RHZ7+LftOXb3xp4DWHLg2Gk80ZHYkq/AhyqTDPBQSrls+l9CvqzCQ3
	tVsX55O2uwCFkMocXYf3gfvrTy8hIXGr4WGSoViUO2/UafpBlMLL+UQBi1MiPHjf5JUf
	sZD7c+1eks0IXS+njHHpEZBvMEL0dD/+OIyYjlihUw2rdgUzwviOuIjylzEj47iZ1IAU
	WZbA==
X-Gm-Message-State: AKwxytdJhRmyWpXYz1Z5C5PdfGtpGYrDfufSw0OZIWPPMa2EAJaBwi5P
	zRM+8pqA7Zu9WIAi+/LsQmTk8BWL
X-Google-Smtp-Source: ACJfBovTU6SAulDW3HJVCGZMYu9rYBVhw1LbA6tgK6mYVWSjn4pp/ceUtVC2K4JUhU0//9fFkPrs7A==
X-Received: by 10.80.149.136 with SMTP id w8mr19619861eda.70.1516009313647;
	Mon, 15 Jan 2018 01:41:53 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id z2sm4260715edc.50.2018.01.15.01.41.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 01:41:52 -0800 (PST)
Message-ID: <1516009312.28972.43.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:41:52 +0000
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: native python recipes (packages)
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
X-List-Received-Date: Mon, 15 Jan 2018 09:41:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I need a few native python3 packages for a certain native recipe in my
build, but because RDEPENDS are ignored for native sysroot purposes, all the
runtime dependencies for each of the python packages have to be
added explicitly (recursively!) as well.

This is quite cumbersome and error-prone.

Am I missing something? What do others do?


Cheers,
Andre'


