Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA216EFD9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 11:29:51 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id f11so23070397qae.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Lgv51Qvr0YkBETMhgtS2QF15BDnz09eh+si2e2tsk4o=;
	b=cx9XLh03ODdJ97ca5OBCFnLWcnvyZxpfK+uvblgZWTzV2+GjMKRLfjDHBqX1KcEFEL
	rYytcHF0iZkeINm/d3jD726yzNzNPckf4D6qxFfYYQA/soNFptHpqVTEURI2QxXGwwwb
	uG2JINIo8rq0AXUS1F8VF0gfcDDkRUmOab1ekE7191HQ7NEfcVVD1Tju0MKQm9Y+8Qu/
	wXErzlwqVT0666rVyoyusqvufcZPu1UGifO//CIBrEpE3jusDZYpHI/1enlHW/UudWZL
	10t17nwg7MkWC/TXw+/pr5HB5UEtXEe2nSTY18v6zl8Ku9dMDI6sZbAjarHfsjIv/6jI
	nAkA==
X-Received: by 10.140.21.179 with SMTP id 48mr8923877qgl.78.1392722991313;
	Tue, 18 Feb 2014 03:29:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 03:29:31 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 08:29:31 -0300
Message-ID: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 11:29:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Folks,

libao compiling is failing because of a dependency on esound.
Adding EXTRA_OECONF += "--disable-esd" to recipe fix the issue.

Should I have to send a patch?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

