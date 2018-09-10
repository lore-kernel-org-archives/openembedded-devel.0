Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9A47970D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:15:23 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id h3-v6so28090604ita.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZuueWcGnhHx0aokQNU4Df1fA2K2mAa8JIBhJ+7mBfK0=;
	b=YL2ClYqLtwOdQC2JGoT/8unnkikc8xAusdNl2WFb0zFF+WC9PZpXuT/RdQFxiRaieJ
	igbfDf1d4VLrdCJAYuLKV6I4AwO8qkjm8Amg4KPpjB/4YmmQtIrJPv9wcD3afFZrhfUV
	uRw8AMr3PP3f0V12q+g2SgHHC1GMc1kK2sLwJZCOQsYVSqIHlHl5b4m3m4UhctlxGM07
	c9QfOF0wqc6OAM5wZZ6CwzdVcRET+1f42SGm2tsrjFmIE5tkTneAXvblBDoyl12MeSc+
	XKegM2jLXDNoHtDflnI0dcFvF4bHPk1gBrSZxtsA/SSEAEVZXd4oEOcOTJERLYnFMsXR
	fI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZuueWcGnhHx0aokQNU4Df1fA2K2mAa8JIBhJ+7mBfK0=;
	b=NLYKyCiLqmBIZOCsiQhpTpr1jnt7W3Z23whIViFjfwhUr6ybnush2KfNPwkXBUj8YG
	3c70nKEmPAL4FV8WLtdM0U4nwKqfZdVUwQDY8Ja1xxHUBCLvLPuLj3pTqiD7Ywn980WJ
	b0w8cSwxkj0yEtPZ3n30ePLZZ0IaXFbK7hT+2lHXZ1Kpe7vVZUQB1+rtYuAL4BiFBPns
	rjHGb+lIwzVSUK/aC+Ne+PbeeXZr05leDPqsvmQxylv+WHhM395gq4Dgu5jRcYiJ2Cy0
	hD/b7cLwXONHBGjx5igchDtlAUfTux0AKO584sW6yvM4ILaaOcMiiBppGYzNyBRPdBAV
	M8nw==
X-Gm-Message-State: APzg51CIfSsRmkQRnejTGQt+VMsmOe8fp3KLyv9JLgmFRePC6j2N2dYW
	rsnfxrsl7SJO3DLfzbJUFeet61kMMEpexoqejdgRhQ==
X-Google-Smtp-Source: ANB0VdaXefkUus5Ts+a0zGrzcN3NdmgRmyuQ2zEc2QzAWfANtN3kMcgNT0p6LJRp9flCJ9azLC9k2CZPbiQDuiKqU3s=
X-Received: by 2002:a02:9d10:: with SMTP id
	n16-v6mr17303755jak.56.1536560123394; 
	Sun, 09 Sep 2018 23:15:23 -0700 (PDT)
MIME-Version: 1.0
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Mon, 10 Sep 2018 08:15:12 +0200
Message-ID: <CAATN8PW7KbbYPKnHhxM7Y8ZxbxTPvx7yngd=W-hBQm95YZZgtA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH V2 07/10] wvstreams: Add openssl 1.1.x support
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
X-List-Received-Date: Mon, 10 Sep 2018 06:15:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Khem,

did you forget a
sed s/openssl10/openssl/g in the bb file? :)

thanks for applying the fix!

G.

