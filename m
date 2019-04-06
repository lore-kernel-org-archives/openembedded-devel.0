Return-Path: <joelv1907@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id D05237D42F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 20:30:27 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id m10so8690258otp.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=oWF9h84Lf9eK3JdtR2Az9njApImN/DPp4Y8mXCs93LU=;
	b=K49BmM56jSfMLLhOjEmR1pUbF6/49A6r14GKIwugplsuLieWThCBY0eqV7ZLe7EbJT
	D/eaDwgGnqb6RJ2spi0Q+4qUbAL30zYX6pFQM55coJEnkxyx50s3f1tEUfHrzh4PDRiN
	bnq2PWTf1IWFERHALyliQQyHv/YZJbmEbSOHcezKvdjOzhDCj/r6RqGY/eV7NgyWnr7W
	AKGTXKMeAjXxNaOyx4HMyr2MzSRu4HFgcAKJ+FNiBlZNfvwiHQK1OnFb8d1BI/DSOhRB
	OIGH/pIYHv/pFReq/Kj/yodbthTLdMn7H8eTC/RYus6UQ+7swjImbBVJw6HtUKB0Co2P
	2KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=oWF9h84Lf9eK3JdtR2Az9njApImN/DPp4Y8mXCs93LU=;
	b=BAZWFESiYJ6y1qu0KVocOE0RhdwBVldE0+UgBGxa98kt4l9hDfvk7rJWsJH+GtNJgE
	dZEbE+XZDzeq82ZY+7A7AMMlmuYKey4OlG8yGegNCUr1Q/hf6W+DDpTonwATvUmelHxT
	S7plU06dVph/Eku9jTfW6WgyYgR35E00CxlDPel6XbK5QjDpQ/pyBKTQqhWJMAnXqZX6
	N/FIHKdUyU0z56ZGPhmXePl+Yx3kyAxvoDhMK9jW4+TdJ33NJMKFUM2dRehphdx6c48k
	67OxJBE4d6wSK6rB8fAdcVdFtVT/1MHy14Veg4TRR1sCZCO3OLEzwBi99VhrdftRxVvF
	GDhA==
X-Gm-Message-State: APjAAAX/1iV5E/TN+R5Rlj5rshHqru7DuFUcUy+RcdFn3qYf0D+gVPgk
	2hUObw6V0GgzV8QEd39Infjm48n0efOT94kvjFIDvQ==
X-Google-Smtp-Source: APXvYqxY1XLKpeEfdnp2cze9dZjhpE118yV5cHTXOg8tUUyV4xKQxiolJCB2u5CRpoGahV6JACdgbMiTVaNbItLnSW0=
X-Received: by 2002:a9d:6a88:: with SMTP id l8mr13808095otq.260.1554582628483; 
	Sat, 06 Apr 2019 13:30:28 -0700 (PDT)
MIME-Version: 1.0
From: Joel Valenciano <joelv1907@gmail.com>
Date: Sat, 6 Apr 2019 15:30:17 -0500
Message-ID: <CADp9aar2rCbD20Sp24D8AyxYrofUDFuZkY5fqJV8g032m-TwHg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Adding support for Android.bp files
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
X-List-Received-Date: Sat, 06 Apr 2019 20:30:28 -0000
Content-Type: text/plain; charset="UTF-8"

I was thinking it would be nice if we could run Android apps on Linux,
without the performance issues that come with virtual machines.

A good solution, I think, would be to make the Android frameworks use GNU
APIs for things like system services (e.g. make Android system server wrap
around systemd), but AOSP uses it's own build system called soong. Metadata
is stored in Android.bp files, that use a JSON-like format, parsed by
another program called Blueprint.

 I think soong and bitbake work with very similar concepts, so it might be
possible to write a bitbake class that uses the soong parser to parse the
files, but builds in bitbake.

