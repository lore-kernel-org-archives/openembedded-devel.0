Return-Path: <leon@sidebranch.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id D713B7A0B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 14:20:57 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id j17-v6so4925700uan.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=tJFsTh2GL4mAfoV0MgylcsuZy/Kt3lvfQ4wu2uBjiqc=;
	b=ChuR0DPdZ8Z6wW1VKDUcUcHljzCUIVSnKXHyUv13ZRHqBAZ4O2783YXibsMevLIJ94
	vruQ603oObjlxWez1zPnN4e7SKJSNtOZnEWakxOkMdYf0yWw+naJ3fpeAvdxgZUNs518
	EPfLSEGtGNfAI2JIVy34g0S8bC9+UYThxCvI8MotexG33/SmK0HS0lhmdoednkF5RUNP
	r2BaeMXFqPq9OlPYgOp6UOT8AbRTxzJppqUz6xbKV+kGNQPd0sRmHSl3EYSkLbTylZbv
	tRU/gQbdfT8SmM3dyrCHAz2mT1yXlOuWn7xba3rOKskGzZEUn3BF9aSXJgAv/BCDakfH
	t7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tJFsTh2GL4mAfoV0MgylcsuZy/Kt3lvfQ4wu2uBjiqc=;
	b=j6lcoERkhMXdCSCZHZzIbiNfqLTXS2jJd/v3yoQKqR4vPpY+/1vpxKAumRmNq6bQcf
	3j0KZsKi2pIK+FDLnA91pYFpOpCedXx31gmMzf6c/fp46LH0zAcaahx5eCvEeevrq7d1
	FSJDo2X5Tb8NA2W/mdJzMXECb5ZQL8z8vy/isa1R8hzkto0DEpjkgoyurkXHxMXtTn8U
	lqfCpChp8PAvIv9DcQKIb1F4e+LF4DnHkDVJ43V87M4QSw2Wpun98YX/Oh/QmjZF7wDl
	ZS+yCvRzCUX5TjqrDjZj2RfolPOswAkRuP605Z6DLKgW+rMXn1uj/orjSOP3sgv6QWd1
	ePZw==
X-Gm-Message-State: ABuFfoj2zxtxcHERs0lgcHNBeZtzntpRhnVviLcSNixYil+rDPK6Sn3o
	wm4LU5f2TzFutMdNDC4YBCzUP2owfEoLNLci0W/+ErF1od8=
X-Google-Smtp-Source: ACcGV62PShJ8vcpTF8GiUmRDq0DBItrUzr+B74whQ3Cu/0gG54FfS35miH2b/sdDifn3WPY8TFogUyR1KGNJo3RPsfo=
X-Received: by 2002:ab0:1d0d:: with SMTP id j13mr101273uak.1.1538403658087;
	Mon, 01 Oct 2018 07:20:58 -0700 (PDT)
MIME-Version: 1.0
From: Leon Woestenberg <leon@sidebranch.com>
Date: Mon, 1 Oct 2018 16:20:48 +0200
Message-ID: <CAMjhiJgX33NGofM6tDnrOF71199B50wWA4vP5FcUXjUO6s0qNw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] Best option for headless java for ARM (32-bit) on sumo release?
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
X-List-Received-Date: Mon, 01 Oct 2018 14:20:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

What are the current options for a headless JRE on 32-bit ARM, for sumo?

Should I go with openjre-8?

And can I package for a specific profile?

From: https://docs.oracle.com/javase/8/embedded/develop-apps-platforms/jrecreate.htm
"Smallest JRE: headless, compact1 profile, minimal JVM (default for compact1)."

Thanks,

Leon.

