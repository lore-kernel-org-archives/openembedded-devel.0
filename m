Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 21F5C6057A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:35:46 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ig19so3276587igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=xm6ynS61o6KnkNhNaL+qHj9mbnrVNR1s1cklKDCYl1s=;
	b=LbrU9/FgBvSc0C00qtofIGoBPwJMVgoPHokk+4pEcKhoAmxSKGvrgddu/aQlMgrpOC
	HVOT6j9gpq66pEiD+crSGuTxMdThE+DmxPKnsL9rr9Chww98FWWlaYMb71SV0jbX+nSe
	0rchEuzhgt7b4E45TK8p7W1YeA70iwJBzMVIdkzj2oB3Efcm7/TPsY0b+VtRTNoMYYOB
	CCZm71OGm+7b1W+drN0LEjSkF9nR7rDFndFMky779tURvt/iT7YL91KDZtdRvo/XUACW
	HtKmfr1wBrGsUp2qgV0A/omW8gSSWAr2Ck5Pfez5d6q5X4gnK8FGRJMPsGABMeh94k7H
	zMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=xm6ynS61o6KnkNhNaL+qHj9mbnrVNR1s1cklKDCYl1s=;
	b=WJBRZ9JNhetv9jsOcwcGTiCxWxTd5YUMmT1SXZJif9ypn2NLpZhIXDpwVetlQl9wg3
	3Cw474zqQk4win9dt8nfPixoJPJbr0w2V2t7hVmUCEdjylfZ0F69pvJvGnsyVv5VB0mZ
	9pPo3fGjeisIKqdT16RAqgzbPZ7p3y090Gx+wS3zmxOInZWmb2NgJIKkxXliou+Ssi7l
	d2zqcbZlfOBLu4Kg+p34vqjxe3O3Hnwcb+HHpCloNk7HTa4RXx2sP3hQNh5GYsRyMWi7
	dqKJp423kDdRJvaIy/zmLQKW0xIB+cFU63ygzVH4jnEqvaoh0N8P81896kJIwTKHLKiD
	kiGA==
X-Gm-Message-State: AD7BkJIGHttsntjibHj+iml/zTbW0ZhtQx0RhONrxTkXmijgu3JMfdtwJdqFohuOCHKEscjavdz5DjlJKxOS/A==
MIME-Version: 1.0
X-Received: by 10.50.110.99 with SMTP id hz3mr31432386igb.16.1458862547223;
	Thu, 24 Mar 2016 16:35:47 -0700 (PDT)
Received: by 10.64.69.138 with HTTP; Thu, 24 Mar 2016 16:35:47 -0700 (PDT)
Date: Thu, 24 Mar 2016 19:35:47 -0400
Message-ID: <CAMZfsd5N5XYMEed5j849GJEjw5xsuEzBbYeWLEFhX2YnRgAsGA@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] QtSVG Compile Error During Qt5 SDK Bitbake
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
X-List-Received-Date: Thu, 24 Mar 2016 23:35:47 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am trying to bitbake the Qt5 SDK and I am getting compile errors
regarding QtSVG. I have not included qtsvg in my local.conf so I do not
even know where it is coming from. I have even studies the dependencies
using bitbake -g and I do not see anything. The error log file is at
http://pastebin.com/kAAGmi6Q

Any help is greatly appreciated.

-Ryan

