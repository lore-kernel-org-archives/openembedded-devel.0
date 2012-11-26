Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TcvtH-0007ej-MH
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:26:16 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so10075518ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=P/DKJfZEknlLKkWNhYp7UDOR3LIG1feGEaQ0YaHR6TI=;
	b=FqGuALZyIF3iTIpPAGZCCH7lgB3exVG+A3UXSkEro8nnlqpyKGHU0XiLGmCnOif1xn
	2aumAHftvyZdYVwMaKx+9EpekiJc38pVo0YYco2Bszuy+2nJBkiwJMGPkfAbFFPpeNnb
	WViNI02Eb7YVh8Q8UHJxfdZbegtdNwjvJl+6htHw0R8xzN8h7FvG3BurvN8csVBeDoUs
	kLKDdha4N+tclIxY2WXf81AJKWvhv9B3LQV5HTl+mg/SDyFEoDITm764EGqQ4FoY8nu1
	sgc5XaZrfwXDTIY6CYXSkZ64PHjLtO3G+96nXz0ixYCh9DipWtbyblnZHSexCu3yF3y0
	3Vkw==
MIME-Version: 1.0
Received: by 10.50.208.99 with SMTP id md3mr10318168igc.67.1353924723684; Mon,
	26 Nov 2012 02:12:03 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Mon, 26 Nov 2012 02:12:03 -0800 (PST)
Date: Mon, 26 Nov 2012 12:12:03 +0200
Message-ID: <CAF6bG8cuyegcR02JTs3Nty=33XxA+oKkTE4ejmLO7BFvuYFTVg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Policy on tar.gz -> tar.bz2 -> tar.xz
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
X-List-Received-Date: Mon, 26 Nov 2012 10:26:16 -0000
Content-Type: text/plain; charset=UTF-8

If one changes compressions of the package to be fetched, what about
old versions of the package:

- Never change compression of something people may have already
downloaded with different compression, even if that means bigger
download for new downloads
- Do not change compression of old versions if they live in version
specific file, but if SRC_URI is in .inc, keep it so even with new
compression, affecting also old version recipes
- Always make future downloads with best compression even if that
means redownload for those who already have downloaded with old
compression.


 - ML


