Return-Path: <0x.andreas.wick@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB926FD2E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 14:09:12 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id h18so218503igc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=c0+G6nzMW/ZGLZ6oycJxmyj8r6XTj0jFqf8JLF5VaNU=;
	b=rvu2dw/wKmeaWumt6j3NmCzoul2NHXxK98i6ggTN+BXHZSVQPIM52MULGF988zBby3
	2St1n5YWpFo+ziFIwpUpYvaeT5sifOmDN5yxymTpEAO1eKYV9NDjmxE9Z8hPLS2Zv+Ud
	a7OEby4S2DxlPuDRjH6kIhaDNIbEwPnM455WuqPG74zQY7DH6gi0xDzCcmKvZXz9ehGG
	K9uZdt7WCMzQ5aIb7JrQdQ5Ds19w8G+n5/eMZHHOXR8MXbi8FiCuEETiQ96WjqWokb4V
	EBTZVWiigLhR2ql03sZP6c8frDZM8uxHYxAHkItpDbnSfKe2k++XxZooYeUbYYqpSLoa
	CVhA==
MIME-Version: 1.0
X-Received: by 10.43.81.199 with SMTP id zz7mr2759379icb.24.1403100553114;
	Wed, 18 Jun 2014 07:09:13 -0700 (PDT)
Received: by 10.50.37.233 with HTTP; Wed, 18 Jun 2014 07:09:13 -0700 (PDT)
Date: Wed, 18 Jun 2014 16:09:13 +0200
Message-ID: <CAB2+j+hbLc==rmymFKW-=eS6CjtzjdPvhpJDWzfXJfHY4xGR6w@mail.gmail.com>
From: Andreas Wick <0x.andreas.wick@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-opie] Avoid opie-image-16mb resulting in a 21 MB JFFS2 image
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
X-List-Received-Date: Wed, 18 Jun 2014 14:09:21 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I currently try to build opie-image-16mb for simpad. Unfortunately the
image is about 21 MB large whereas my available ROM is just 16MB.
Is there any way to strip down the image such that it the image will be
smaller than 16MB?

Thank you for your support.

Cheers,
Andreas

