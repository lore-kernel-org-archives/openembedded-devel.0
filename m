Return-Path: <randy.mort@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E9FA171AB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 01:01:29 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id r16so87821095pfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2016 18:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:subject:message-id:date:to
	:mime-version; bh=rSW7kBa2gYirs4St7JIhQ/mwKzdHmZom+YVlpvRvy4Q=;
	b=M+xiDsx+WIFYRlKcmIfReBF9RjNegSsiW3pOAcLSBwOqUAiyQZJlR9CdyewJ+dEXad
	pzV8WAqzLpW4TOTB+N9SOaF5eoK0QOoJF04eZZz33e6tta+pdZbrGoPJkfM784ko7W6W
	Rp+HmL7Wa0t0p/GXIHX1IghZEB6ebJYhDHjVbvAk6qEKnWNMFg/qmUVw1N6qF+aq7m4Y
	Zguz5gpCR/DbN+aj2pucUTR+uFWF0oHWBCr7eFbzbZzO5fBxjr7mDgLzv3O0wrecqx25
	/4LDoJHejl6WIvBWMknZyRanrVgqZdForFREV1aAmNAoTOv8EBpoH70+AFZPVzS6XL1Q
	qA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:subject
	:message-id:date:to:mime-version;
	bh=rSW7kBa2gYirs4St7JIhQ/mwKzdHmZom+YVlpvRvy4Q=;
	b=fTWIleLtKgrrLv7ODQC0GJbGmhGwuXSmApRov+3VbGkbRXLE/920kWQ5VrV6WE18jp
	tYMyocIpbwWrDh/7ii61odqLwuZpwFbzEm2MJnxI3J9Qubl1PcMIsDEiTSqqk8fMFaQn
	bWwbspoCYPJaIGzwUnN/m4QVDC2FDjWg/ZD6SSdcWpBLEvRu8HkHo2PUb5Qw25dxoWIV
	EawXIY0iVlDOGPM3eLucQgALSCODZmk9HsNAbJUJwPpSl6v5wQ/5MP0AY2gyLNmQbgAi
	O/mgjmt+oV383J2/PMGxo26+UExMrg2Y60/UwUaNFneA24L5QRNFw51aS1+R623HgULe
	dmsg==
X-Gm-Message-State: ABUngvdTuDNRxpJg86plFhZ4fpiZFwnxcM6H3qRKW10mLPJVqwgd0OaWDevy5GAWbN0+0w==
X-Received: by 10.99.121.133 with SMTP id u127mr19523663pgc.4.1477270890076;
	Sun, 23 Oct 2016 18:01:30 -0700 (PDT)
Received: from [10.24.0.6] ([199.229.250.98]) by smtp.gmail.com with ESMTPSA id
	144sm19934282pfz.72.2016.10.23.18.01.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 18:01:29 -0700 (PDT)
From: Randy Mortensen <randy.mort@gmail.com>
Message-Id: <6137B5D0-B8F8-4137-B822-D555F003E385@gmail.com>
Date: Sun, 23 Oct 2016 19:01:27 -0600
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: openjdk-8 runtime failure with x11
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
X-List-Received-Date: Mon, 24 Oct 2016 01:01:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Using yocto jethro and meta-java to build openjdk-8 but when running a =
java swing app, it fails with the following:

Exception in thread "main" java.awt.AWTError: Toolkit not found: =
sun.awt.X11.XToolkit followed by a stack trace.

It seems openjdk-8 is being built without X11 support?
Is there a fix or known workaround?
Thanks=

