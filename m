Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 41C7D6098C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 12:20:59 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id a41so6286828yho.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zu1z62Q6riSXtx1CWmJ5FTfXvaTjtxWXwHgo06UXf8Q=;
	b=vczvIf38AVHOLlfwsH7DF/zpeSNfhc1Mdfsh/DdbRG+G2ORrOxQ/+AtUQamcpiizN+
	iYeMwehxG413ZDL+d55PxPU/XqzmUxtsXg/t0leEM+KzCx7y3WN9eBlFb+gtMXiBWev2
	l4KucqtLSFkRXkXzUffQGnbKQkkygmE89COQpa89bqRj239v2xwM5Qa4BacQB9uXSp47
	b+g3lG6QJDw8G0e5qGBgVC709jBJOIv2A2mGqJv1eegI6uDgnYlJ7BQeK8y3r6lCCtw6
	BpdXQSaDgA1y78wBq6b7efaBmJz0NpmAA1jE6zadgUn41wvDNAI2kNBYkX6fN9PfytB8
	vdJQ==
MIME-Version: 1.0
X-Received: by 10.236.189.198 with SMTP id c46mr47724423yhn.47.1399292460718; 
	Mon, 05 May 2014 05:21:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Mon, 5 May 2014 05:21:00 -0700 (PDT)
In-Reply-To: <20140504214712.GG2486@jama>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
	<20140504214712.GG2486@jama>
Date: Mon, 5 May 2014 09:21:00 -0300
X-Google-Sender-Auth: 3eGa-fL4VdEz-IKT7cN5i55AE1Y
Message-ID: <CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Mon, 05 May 2014 12:21:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
>> qtdeclarative requires accessibility to be enabled and it is added by
>> default to the toolchain so we ought to have it enabled to ensure the
>> default toolchain generation works.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
...
> As I told you on gtalk, I would prefer default to stay as minimal as
> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
> use RRECOMMENDS instead of RDEPENDS so that missing
> qtquickcontrols-qmlplugins package doesn't break it when it's not
> available (because it's empty)?

I don't have a strong opinion for either case however I think we ought
to know what other meta-qt5 users think about it.

In support to this patch addition I think we ought to provide the most
used features of Qt5 working out of box to users have a good first
use. Special cases can customize it per need basis. I think QML is
common enough for us to provide full support for it by default.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

