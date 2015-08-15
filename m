Return-Path: <andreas.baak@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3251C65C78
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 07:51:11 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so34948180wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=vuNLb0oJD00sd03WOey3YQVLRQGheD2I7EGk13hgeF4=;
	b=UtXZXtd3PxN7oAipX0a3ulZ351VzGjo9XVmtFL3KZNhBOZumXrl9ZjtOrQu6s8KuyL
	gvcYWDeHWEAPkBOrq5Dw8Bz7dFajKq6Z37vIL8Y3jDDTA8nZhLI1MiCTZVQ4KDFnBtdr
	CP+Bd5/Tk1CapGYNhNvLZOZ7txLjYhpOglC0omLVSZwiVMu7J8WDPQVW7tEIq5eMTOjB
	iUvVXuMppmZIAAhCRHs6WZS77c9+BIKA6/0lWTtofHUW1uq7vM+jnm71kaBj69wWXaWc
	JQfBjtb1OhOJ0gRm1q3/5H1L0EFrOMJs3JTz5xUZlkzvQrwQc/kjgJ98xzTBl1YVn7ZP
	hiIA==
X-Received: by 10.180.104.68 with SMTP id gc4mr14424696wib.78.1439625071401;
	Sat, 15 Aug 2015 00:51:11 -0700 (PDT)
Received: from [192.168.178.33]
	(dslb-088-064-113-036.088.064.pools.vodafone-ip.de. [88.64.113.36])
	by smtp.googlemail.com with ESMTPSA id
	ej5sm11770003wjd.22.2015.08.15.00.51.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Aug 2015 00:51:10 -0700 (PDT)
Message-ID: <55CEEF76.5080207@gmail.com>
Date: Sat, 15 Aug 2015 09:51:18 +0200
From: Andreas Baak <andreas.baak@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Where to place a new recipe for epeg
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
X-List-Received-Date: Sat, 15 Aug 2015 07:51:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject: meta-openembedded/meta-efl/recipes-efl/efl/epeg_svn.bb

Hi all,

epeg is a fast jpeg scaling tool, originally developed in the efl 
project https://www.enlightenment.org/ . In the current version of efl, 
the source code of epeg is not present anymore since the tool is 
deprecated. Its functionality has become obsolete by Evas 
(https://en.wikipedia.org/wiki/Enlightenment_Foundation_Libraries#Defunct.2Fdeprecated_EFL_components). 
The source code of epeg is kept in a legacy repository 
https://svn.enlightenment.org/svn/e/OLD/ . The current epeg recipe 
downloads the sources from this legacy repository.

The code for epeg has been adopted and improved by mattes 
(https://github.com/mattes/epeg).
I would like to replace the recipe efl/epeg_svn.bb by a new recipe 
epeg_git.bb.
However, I am not sure if will be accepted to delete the 
efl/epeg_svn.bb. Also, I don't know in which folder to put it. 
meta-openembedded/meta-efl/recipes-efl/efl would not be a good option 
since epeg does not belong to efl anymore.

Any thoughts?
Cheers,
Andreas

