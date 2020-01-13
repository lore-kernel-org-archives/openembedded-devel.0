Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF78A7FC1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:21:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00DKL6f8026840
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 13 Jan 2020 12:21:07 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 13 Jan 2020 12:21:06 -0800
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
	<bc6e63b4-17f5-4d2c-761b-abe8ef476551@windriver.com>
	<CALbNGRT-yQLsGTLsSTJzbhU5b6zzLxHmb6A2wi-pDfmZt-4_8A@mail.gmail.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CALbNGRT-yQLsGTLsSTJzbhU5b6zzLxHmb6A2wi-pDfmZt-4_8A@mail.gmail.com>
Date: Mon, 13 Jan 2020 15:20:52 -0500
Message-ID: <87k15vw1jv.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: Re: [PATCH 1/9] poppler: upgrade 0.82.0 -> 0.84.0
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
X-List-Received-Date: Mon, 13 Jan 2020 20:21:08 -0000
Content-Type: text/plain


>> Have you by chance tried to add ptest coverage for poppler?
>> If not, Matthew may do that.
>>
>>
> Have not done any ptest on this - just some runtime tests on target with evince
>
> Andreas

```
$ make test
Running tests...
Test project /home/mzeng/code/poppler/build
      Start  1: check_qt5_attachments
 1/21 Test  #1: check_qt5_attachments ............***Failed    2.47 sec
      Start  2: check_qt5_dateConversion
 2/21 Test  #2: check_qt5_dateConversion .........   Passed    0.58 sec
...
```

Poppler's `make test` runs tests from the `/build/qt5/tests` directory, which apparently are relying on qt5.

```
/****************************************************************************
** Meta object code from reading C++ file 'check_attachments.cpp'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.14.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
...
```

Is it worth it to write a ptest and sort out the meta-qt5 layer?

    Matthew

