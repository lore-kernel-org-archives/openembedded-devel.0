Return-Path: <yuhsuan@google.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id DD5717D725
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 04:03:53 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id d13so3919351edr.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 21:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=qyGjnnqUPi6Yr2gVsHeM75WQ7chJwqhjlOuHgjxyIZY=;
	b=VJIMfvH/SD7E8hqyEsYM8PebRScWqyGxhwBCoz34gGztAun+CDKGHZLGwQORyXhpUO
	oOv+hj4VJJigNKUkLZb5U9fve81UIz8G6sjTlDCk+/jssDvP6r7gpdQBKkgiK6XgnhUD
	z7vL08fCrebBrhFhCkrrKf32vydk2WTMHkyN1ByyI0smI+LviN98iahQo7FMpv+L5g1L
	NAZc3N7g7bBrdKJ0FzTOwP6gnp8eiaNmlUhFlKEr8XU+/HE+IY9ncBcR5SMwoqrwAifh
	KtbNhWmv86YRJiQDC5nCqk9/afI3T36JMoxpe7ej6yvBNCHI3tM2jLynaDp76YI66MrY
	g9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=qyGjnnqUPi6Yr2gVsHeM75WQ7chJwqhjlOuHgjxyIZY=;
	b=OoO2chp6YVcBr44OqHfHJcB36dYG4H+Gu2z+6VGJasBmgN70fTUu1DtcpalK5uPM2h
	YRf3NjpRXbh65gr4jk2Am02y+5CNZpdFytyXU2vJBk7aSXJvZgHSUK7yUinLCMy7VPlF
	sI9LLlziVggq5iZFq0HQOlnnPtMLo+wRron7svqTvkfmJ0am/Mv/pmsI+sOTJ5GS2PVz
	h8H+/f6XZcwvTooTnAIju78k6ZgWtANOf7c/Ewoql/inS3w0Ex4GzPd+zu174Q6ltUiy
	2AvVDuhX63GDTxGCmSn9k+baGTkxmldtFw8Hd5KQR7cN0F6pEpcogalisQ58IoYgQ7bi
	xE1w==
X-Gm-Message-State: APjAAAWQewxzpQdNK4m3bqEAsu/yMf4AjiGyeUmpjz5bR2e6fWGrbfoI
	UMy1oqc2SFpInuj4CN3xoAzSiKmCJWQz/ER4QewBuF52qmQ=
X-Google-Smtp-Source: APXvYqz5KKhWJVYfcO0NXjoNoJxiabGfiG8Rr7aXXdgZFD8+wQ9jKMFYwSoC5aCK9nQPL6xRaCo0HLvgSdBoRrqwJgo=
X-Received: by 2002:aa7:d710:: with SMTP id t16mr2283158edq.222.1554955433899; 
	Wed, 10 Apr 2019 21:03:53 -0700 (PDT)
MIME-Version: 1.0
From: Yu-hsuan Hsu <yuhsuan@google.com>
Date: Thu, 11 Apr 2019 12:03:42 +0800
Message-ID: <CAEy1m_C-rVkHZAU21nkm2n6B4gYxioZcXA-udKFfrrkQH3fgTw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: pip fails with "ImportError: No module named ntpath"
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
X-List-Received-Date: Thu, 11 Apr 2019 04:03:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I found that ntpath has been the builtin package in pip since Jan 28 2019. (
https://github.com/pypa/setuptools/commit/91d769e88f0ae9e5dfce1fb9448864201407b579
)
However, the python in angstrom doesn't have this package.
It causes pip to fail with "ImportError: No module named ntpath".
Could anyone take a look and fix it? Thanks.

-yuhsuan

