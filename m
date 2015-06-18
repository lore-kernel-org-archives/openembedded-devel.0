Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE3E756E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 05:18:40 +0000 (UTC)
Received: by oigb199 with SMTP id b199so8212080oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yoBTXJbziesU8JGZ2w0UJIwzZcoKh387CcJzxw9pYKk=;
	b=GytAUUmJM3P9XpGixOIfG13QFDDSp20pfSNXiWuJ4YZ/bxIQrZAZL60q0Cl5X6hnXU
	8BDTrI2/WSUb067K0bm8y9/unay9PlzfA0IXjfbUEjWzjTyRtZVjKcTzcZR3NVrPYV+H
	X9F5BbRv2UmkQ/Ki2J7aBUNNGkRwxBMuFYTMtbubL+B2hJ67sH6QtRjozylKEZxRXnkj
	ROawPr3wUqoN79ZxnycYx4pPti0vUKmVZ/s8tnJYG8r4AmIpou9Ozz+dLoMRELDNScj8
	BrOJSxIRKqbqG2Jom00NhZYPA+5UpyN4q+LRFHPZmYV4CKX8+mZdjxl06zYGfrmAC1qN
	W5+A==
MIME-Version: 1.0
X-Received: by 10.202.94.215 with SMTP id s206mr7121422oib.15.1434604721590;
	Wed, 17 Jun 2015 22:18:41 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Wed, 17 Jun 2015 22:18:41 -0700 (PDT)
Date: Wed, 17 Jun 2015 22:18:41 -0700
Message-ID: <CAJ86T=VZuuxxBJtRHzMQHtFXGZz6yoUjoPaqU6Mp2NnH7EAdsA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: qtwebkit doesn't use system leveldb
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
X-List-Received-Date: Thu, 18 Jun 2015 05:18:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

The qtwebkit configure test for leveldb tries to include
<helpers/memenv/memenv.h> and link with -lmemenv, however the current
meta-oe leveldb package doesn't provide them and so qtwebkit always
falls back to using it's internal copy of leveldb.

I can work on a patch, but I'm not sure what the best approach is -
either rework leveldb so that it builds and installs a memenv library
+ memenv.h or just remove the leveldb dependency from qtwebkit and let
qtwebkit continue to always rely on it's internal leveldb?

Andre
--

