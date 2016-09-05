Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A34977241
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Sep 2016 09:05:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w12so2741164wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2016 02:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=AcwpqhVkEfp4Re1jYuXEBKA/0QLv1ZPHnPserJhBCk4=;
	b=P3u/5gQhdvk/iE+3akaxSiLu9rZUju2RmN3uHQjJVMM4/CLZjsNwIhb9zg5JrWsT02
	e3DfYYWvd+oTcS7iuX04m+5bn/dnppPp8/jMDABLR+EqERvN/5hl0Dk0LhiAoW5gPI4Z
	0guq0eJAL83YIaVCdyrFD2CFSyUVMUtK1dOtl5fdTKXxraAc+ptY8JUsKHC1MEuuDYOW
	/ZUhWuX14rgsaC1vR97JB7Pw8T0bytDMOsJpuCQd6n1KPVl6mB+sSjsosh3PYXYsrC6Y
	R+Du4eslfq+l3wu5FaO85g/dJlqEuSyex8Rpadz/YPXT/ttb3g3nUD002bB3R5z+RKRV
	QdHg==
X-Gm-Message-State: AE9vXwPgbEC8WPbrnaoY+koXOl9/Bn4OgzQz8VQp3vyQhT1B3VlMsKoOeRzCqAhz1wqP/Q==
X-Received: by 10.194.0.73 with SMTP id 9mr3860763wjc.123.1473066314796;
	Mon, 05 Sep 2016 02:05:14 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id r9sm3191388wjp.15.2016.09.05.02.05.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Sep 2016 02:05:13 -0700 (PDT)
Message-ID: <1473066311.17211.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 05 Sep 2016 10:05:11 +0100
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: persistent storage & RO rootfs
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
X-List-Received-Date: Mon, 05 Sep 2016 09:05:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

I want to use a read-only rootfs, but some packages will need persistent
storage, which typically involves /var/lib/<package>

Two solutions come to mind:
- bbappend each involved recipe and set the --localstatedir ./configure
  option as needed
- symlink /var/lib/<package> to my persistent storage dir as needed

Anything else? What is typically done in such a case?


Cheers,
Andre'


