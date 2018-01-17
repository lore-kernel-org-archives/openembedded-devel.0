Return-Path: <athoik@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id CEDCA78062
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 21:20:32 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id g16so5480731pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bIE4N0WW5dqp5wbK8cWR6F6JWQJi1XdaXsN4rkD3QVE=;
	b=cJPA/dM68CcfJyGnXhDcrpJvX5DzQSEAxyxoMzFI6qk/r+mm9ppQfPU/L/QxbW6XyI
	AmmpaYEQ3sE9mDAh1U0sN0+wpA6ndcLBD8/sUxWKfXufeqtQCfSVBARN73iFitkcixVv
	8LBPROAD/Tp3CkQiE4GfD6ZiA7s82fJtxr3dxNcdGTtNx9Z2QCiXwIBCTvcGRAsdHnTY
	0L1x052j8Yiu5crK/zF4WU8LsSmf6y9bLxvQERk8bmD0AVMUxE7r7Xvv2iy4lAygVB/m
	FE1WMjVoa8gK8wZdM3eupIxrPp7YgpBqujfdYRtEIVcl4LZufb9qvOXL49raRdAvQcNi
	fCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bIE4N0WW5dqp5wbK8cWR6F6JWQJi1XdaXsN4rkD3QVE=;
	b=K5pxZfranH6SUC7behfmWP5oqAeebI1qoT3VUp5XJWo+ibH0ur1adQQElFYBGWq1wz
	Pk1TnSD6yUWY8cKsbNdHS0E9C+kOA/4eLKBWLf8rm0aVEQUpzMiuyFnhKMUdrEBqUH6N
	NM3vUOB4e6qASZQkXi7qvlPiGmwoBmurK+zBCp+2ojbSmI/4noq53xITfV+dc51sF6iD
	Hc5ZSdx3IgeSr6t7cayavReeA8U6PQJZ9a1jVytiJsMl+s05qpb2vyxp8DfbbktgcTn3
	FSSPCFAayDF/UGGBO94ljN6bvA2vf3hPbIQhEoCL8YuhI6HltkbIuznpwAee7mMKL1y4
	XkNA==
X-Gm-Message-State: AKwxytdRRnaDV+8QDqUhHF4axIMIrn9yBZxDIlvZfaLryjE4ejMqDO10
	n3E1IGvHT/S9SJJmEalZwqwlSQkzxwiDQbjtA07l
X-Google-Smtp-Source: ACJfBov/2/uizGLVXv/dVXRRz448Huxdc51S/SGz2Bkee3Gnn95xFXgUTLxcyYT1n1jYpJIPWPgOzgaB/uDjICuEwkY=
X-Received: by 10.84.248.144 with SMTP id q16mr22985478pll.150.1516224031221; 
	Wed, 17 Jan 2018 13:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.166.2 with HTTP; Wed, 17 Jan 2018 13:20:30 -0800 (PST)
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Wed, 17 Jan 2018 23:20:30 +0200
Message-ID: <CANDbA3d=8s+fo78NAacpW31PRsO-UkpEApE8cC6EM=QsRPx16w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-openembedded] fix getVar/setVar syntax on morty
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
X-List-Received-Date: Wed, 17 Jan 2018 21:20:32 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,


Is it possible to cherry-pick commit
d361ef01a9a61cd8a83f7728f7d3e9f118233cb8 nis, opencv: Update
getVar/setVar syntax on morty branch?

It helps building morty using bitabake 1.34 where deadlock problem
(commit 3cb0d1c78b4c2e4f251a59b86c8da583828ad08b bitbake-worker:
Handle cooker/worker IO deadlocking) is resolved. Will 1.34 bitbake
there are no delays any more on the building process.

Of course if there is a fix for the 1.32 branch of bitbake, that would
be fine too. It was faster to use 1.34 branch for me.

Finally another small fix required in oe-core,
meta/classes/binconfig.bbclass but that's another mailing list
discussion.

Thanks,
Athanasios

