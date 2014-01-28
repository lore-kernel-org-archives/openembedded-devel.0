Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF746E8A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:53:37 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so1096638obc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=a2TtZ2Jjgxa5y3tpznzEmhddA2/Muglk+DyCQB9kU/4=;
	b=FfoVkcEvrEILifLz5gjw93CMOUKDNk711QKDuCONAt1FHHtBAXkasI/MZ1L6BGW6XG
	LgLXVv7Pt7Qu9vbz9+IllgRXKQtuHBUnH18Z16NbRT38I2J3qbzNY5LJbisX0XNw8i5a
	qfgbcRdpfQ6VXWhpHJ4GJkYP4AJ4aE4Xhh0hMhxF9lHttJJo8RX26UulMVbnhDG8gjww
	bfmmDeFnE+ePXTJkeFCwzmBJdreBp9K/8NbmEuGlBDE7sQzQQpCvc+D2FqznbLP72faZ
	mHgQBfKN/Oh/CzII+5Au+2nGXpGXRxFLXQVWegRkVAzIbQNCupwTLRvhdoGCL4WFaRi7
	nIHw==
MIME-Version: 1.0
X-Received: by 10.182.129.201 with SMTP id ny9mr2998681obb.0.1390946018957;
	Tue, 28 Jan 2014 13:53:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 28 Jan 2014 13:53:38 -0800 (PST)
In-Reply-To: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
References: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
Date: Tue, 28 Jan 2014 19:53:38 -0200
X-Google-Sender-Auth: nMkNIu7bp23b6wNQEwpVRnmTh_8
Message-ID: <CAP9ODKpur=uXCNj7AxysK_2E4iJps7rp4qE37FoiwjOZEyCUzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][RFC PATCH] libconnman-qt5: libconnman-qt, Qt5 edition
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
X-List-Received-Date: Tue, 28 Jan 2014 21:53:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 28, 2014 at 7:29 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Please, don't apply! ;-)
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> Several questions arose regarding this recipe:
>
> 1.) Where to put it? It depends on both meta-openembedded and meta-qt5.

We can add meta-openembedded inside meta-qt5 and make it to be parsed
if it is found in the collections. What people thing?

> 2.) Regarding OE_QMAKE_PATH_HEADERS: I stole this from maliit to fix a
>     compiler error, but the same assignment is also present in qt5.inc.
>     Shouldn't this rather be the default?

I agree.

> 3.) libconnman-qt installs a qml plugin, resulting in:
>     | WARNING: QA Issue: libconnman-qt5: Files/directories were installed but not shipped
>     | [...]
>     | ${STAGING_DIR_TARGET}/usr/lib/qt5/qml/MeeGo/Connman/libConnmanQtDeclarative.so
>
>     How would I get rid of the STAGING_DIR_TARGET prefix? Is this an error in
>     qmake5.bblass? This doesn't happen with Qt4/X11 or Qt4/Embedded.

No clue.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

