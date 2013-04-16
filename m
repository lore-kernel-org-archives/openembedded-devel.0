Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1US2r5-0000ed-PB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 12:11:17 +0200
Received: by mail-ve0-f172.google.com with SMTP id db10so243945veb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=Vke0mzRd0hPwuLYes3d6YdHkjR1Vd6ixeAbJeniplz0=;
	b=fbVbe2b0WM5PMS3jOd0H5R0p13TH2wK0GbY2M45w8XDb+NDi5XeaZmijO9JI67BN/H
	hd4tHHIayHhs3c3B2X3TbwrhqE3Od2UGMhOyGe9OT2lmFgzKhmISSWxbgHzsA7yPa1wz
	YKgKmdVbdZDLohVunP43jJqEBZ8t3vrBdesrTlvVeO26Bac4EZLobBJMZoFeX9vliQsy
	RZQR1/YmWXCvdLGcUP32jX5onASR9u9mObD9yveP3R2bAQFzDbk3tSBbct0DRmtDnaBr
	95ZyrneehvNBcfrMmcwJhHvbnmL/Q4ySIAmlPjeOPbwCSNYQw1CMxqwXXcY63vB2sU6J
	KrRA==
MIME-Version: 1.0
X-Received: by 10.52.170.143 with SMTP id am15mr784251vdc.87.1366106024531;
	Tue, 16 Apr 2013 02:53:44 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 16 Apr 2013 02:53:44 -0700 (PDT)
Date: Tue, 16 Apr 2013 10:53:44 +0100
X-Google-Sender-Auth: tTivwHzyAoO4pWMJWai8hP8lavo
Message-ID: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] vim 7.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 10:11:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I've had a look at the recipe for vim in meta-oe, it's currently a
full release behind upstream and applies patches to the 7.2 source to
get version 7.2.446. We have a recipe which provides mercurial-native
in meta-oe so we should be capable of pulling the upstream sources
directly from vim.googlecode.com. We can easily pull a given version,
I've wrote a recipe to build vim 7.3.875 which I'm going to update to
the latest version and look at testing over this weekend (it builds
but I want to do some basic runtime testing).

If I get this working and it downloads sources via mercurial is it
likely to be accepted? A quick grep doesn't show any other packages
using source URLs beginning "hg://".

I've also found that just installing vim doesn't give me everything I
expect, I also need vim-syntax, vim-help, vim-tutor, vim-vimrc and
vim-data. I think for most applications where people want to install
vim over using plain vi they probably want these extra runtime files.
Is it worth creating a package group to install all these together
and/or setting RRECOMMENDS for vim?

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


