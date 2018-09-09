Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 02AF479721
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 17:27:17 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id j81-v6so26688914ite.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 10:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5ibjHUcNxx/cg4sXV9L+uYVfwxLNrusV0o3xeZeNqd0=;
	b=E3quU+oy/8AV1bQvuVCWJdq1IAT+YE9BTzp29Sin3BIWAfDkV6NSxubHLpl1qVfY5w
	KT+ILfjgtU0uE63grFyMdt665W8S/e5aUEWvqXsvt4aOUzVOF1eilkaCo5skZJBz5iP3
	lnEvqS1nD0tkvAW9fDYTAIleTDvSsrbhzThTrGmPPC8EQ+oI5QbQEqJRs6f4jNDvW7bY
	2JvFEcNLQxDvY3ys7cJiFSzxn0Au73chRSTfP5wXFTQXKzGiXGVKZeJ/ikru/VstwtHB
	Vnusz/BUkyNCbb1ip8Q9h2Ozplj91YOlEaCVurWdYgzbraFAIOqDlZY6NvhX9x397HAD
	YbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5ibjHUcNxx/cg4sXV9L+uYVfwxLNrusV0o3xeZeNqd0=;
	b=jKUH78MYPLG1bdVVw6myMSo7N6covdGW/6e+C57gMnDig0Ekn2KDPw7WyB5r84Ato2
	Lim4GYsaZz1cH+g4dHZ4ggeBmzMyPFeMBtutjg59tAtYXK7halDbpkvHgmisaPheUpXt
	/ME5sSR2Ivd0ny9zo7lTrF0fR3/CZFKTKlummYdRpcWvx7vqc/Hu2WUgldahUOWhIRby
	HkPrbuT51cn4UUFnZDCOiFhw//opvldYDHB77QGgyIw++CGx6i5eieLoBV36hrLgTNEK
	bBsREcDm2Xp7wMkYJOcWTOL/atsrNfBgqSel3Tc2/PRljbVH58AUCe60z1QF6pTNPylU
	MXMA==
X-Gm-Message-State: APzg51Cviqgg7fvzn92zABtYIaLgZHaxKH9CHFsf9xFT6zRxKgXvHhlL
	gxpmDdYlP+NrWa8qLKmn7ZQnWbmayzcnDPl1zpHkYpEH
X-Google-Smtp-Source: ANB0VdYNe2bV8M4soN6jPEbfIvLdlC/b8KwyQIxfq7kHTsSwR6bW7KeKxDuw8vEpqJPZP3w7XIYI76ez7+iWDp/iDz8=
X-Received: by 2002:a24:e142:: with SMTP id
	n63-v6mr14050290ith.94.1536514038714; 
	Sun, 09 Sep 2018 10:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.7483.1536390700.1670.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.7483.1536390700.1670.openembedded-devel@lists.openembedded.org>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Sun, 9 Sep 2018 19:27:07 +0200
Message-ID: <CAATN8PUr0-pam4S6CgHT3t0iKiKjyC-pmPrxS=3uosuFkO0MRQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/5] wvstreams: Depend on openssl10 and add patch to build with openssl
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
X-List-Received-Date: Sun, 09 Sep 2018 17:27:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hello, can you please consider keeping openssl 1.1 as default and apply
this patch to the package?
https://sources.debian.org/src/wvstreams/4.6.1-14/debian/patches/wvstreams_openssl1.1.patch/

We fixed in Debian this openssl incompatibility some weeks ago, nobody
tested the patch deeply, I only reviewed it, but the package is in testing
and Ubuntu since some days and nobody reported regressions so far.

(and I really think we should try to move away from openssl10!)

cheers,

Gianfranco

