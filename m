Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7A02E71A99
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 07:41:18 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id c7so71404776itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Feb 2017 23:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=XzIGXKa6z7cEt7axtNK9pEqAoVeUFMaFWC66Y4QKRp8=;
	b=qcwWHr6Ewgl5W+uPKYlddG2k1cIO2b3CAvbLJp5O4iv7oTJYRTx6XM15SUFFityyJ+
	MC1DxL9zuVQJjz9LOWSQfMnj/s0LnAJJBdi+9R9gjvEIZexaEZ9oD+qaxqoSaYtvrqMb
	U+Vs0ZUO/crIHZTwkkZxfRla4ezzNJltjm/ZfXoz6Q4Kl8R4zigpgIhu+t2qOSOd+GRf
	blFHW6N5+3A3ArWS3wAMrQqrKBQsiHXnjKjBoENPZfLB1mV191nwSPDwkkibOjz81pPO
	VxFjf2wJj3sse1fBhdgq7lIJ9OXAD7h9J7FvcEvu12mzR/DJ1E8splV7hPP9Zmz2E7ch
	2+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=XzIGXKa6z7cEt7axtNK9pEqAoVeUFMaFWC66Y4QKRp8=;
	b=CuEsBDFBTIuHbsTQJThbIdW6pFXelahtC/bL+f2VEOfkO/7/mtpzahnSpwBRmui2OK
	kTb1eYkCkn5mg/lhoubUvFcUT0SxabikrbUGvJ66O91OkEEXpUQ4IVozhgulpZWojKtC
	fYxEcptbc2xRt3a9oBysMYqIW4c0f/DsP/BjssVEuMwYS0reUDdlC9u9l4hj+jr2gWVk
	br7iS0LwYdt06SbS/nxT9n33/TIAgqruTo9jjWi3akw5irbXReFXYgeY7yd/W9SyZ29p
	ejMiDtNyS+lVuOk+v/+vxdzV+bC22z/U0NmSDqzr5rMv8ItJxD6+7VhH2BzHt/3oG9kg
	2X+A==
X-Gm-Message-State: AIkVDXJheFbqNO7FtxAPfZrLxCUHFNZ/3pFw6O9+zZ0Kc1KvD8/2Hgxiwrt9BzwfL/u0eNcV
X-Received: by 10.36.120.73 with SMTP id p70mr10329817itc.115.1486453278460;
	Mon, 06 Feb 2017 23:41:18 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DF93.dip0.t-ipconnect.de. [93.232.223.147])
	by smtp.gmail.com with ESMTPSA id
	x197sm5660947ite.17.2017.02.06.23.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 23:41:17 -0800 (PST)
Message-ID: <1486453274.14889.135.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Feb 2017 08:41:14 +0100
In-Reply-To: <caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH] crda: fix build issue do to missing python module
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
X-List-Received-Date: Tue, 07 Feb 2017 07:41:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-06 at 09:10 -0800, akuster808 wrote:
> please drop. this is fixed via a change in master-next.
> 
> http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=2e83e33c592543045a7761907d8cd62937e1e60d

Let's see whether the magic keyword works :-)

[Patchwork-Status: Superseded]

https://patchwork.openembedded.org/patch/136794/

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




