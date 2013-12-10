Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id AEE5A6D990
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 00:45:23 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wm4so4595032obc.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 16:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=hAB/pdBgHvQ0uH4SfaMVmgIigSNYm4H6EZJA++hV78U=;
	b=LVAOzoqfFI4s2l/U09XiT2sObE3zAT1YVgC2ZmdjW4A4P48aBM6lf2Wx9OPUKFOYMM
	yonxOWC0R0ReOnXIY+cp+SiqwjS1Tp+OCH875SglSlnixeDF53GUETj5UbAyCy/xaNrg
	xvMUT3ID2P8XWEBb7GMIX/PtxPJS1oAIi049C5o8D9hJvd4ReshmUCs8Uboq56S/Z7Nu
	LeNzim62ZE+gjvcXX8JBLWrZGpGTVO72TrPLmfacEbWQYo4NoOpx+QGmFpx6AVvJgq1k
	pHsohd53V43/PjSvLtWRyeFSxBBuHL/4vXNy57hK7CrN6IujjYk9npZb+iHx9r1dWZLA
	1g6A==
MIME-Version: 1.0
X-Received: by 10.60.165.2 with SMTP id yu2mr938497oeb.78.1386636322683; Mon,
	09 Dec 2013 16:45:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 9 Dec 2013 16:45:22 -0800 (PST)
In-Reply-To: <20131209192301.GA524@windriver.com>
References: <20131209192301.GA524@windriver.com>
Date: Mon, 9 Dec 2013 22:45:22 -0200
X-Google-Sender-Auth: 1qLttsVvh0LPwb7uztS8oRIfIiQ
Message-ID: <CAP9ODKroiJuuJXqfPVAsnOLzY-dXct4DHWB0mTpL19gcidMWpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] Uprev classpath-initial and jamvm-initial
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
X-List-Received-Date: Tue, 10 Dec 2013 00:45:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 5:23 PM, Amy Fong <amy.fong@windriver.com> wrote:
> Note:
> 1. the segfaults were regularly observed when using gcc versions 4.8.*
> 2. precompiled glibj.zip not attached to message (too big: 9.5M in size).

...
> diff --git a/recipes-core/classpath/classpath-0.98/glibj.zip b/recipes-core/classpath/classpath-0.98/glibj.zip
...

NACK! Store this file somewhere else, not in the repository. This is
not need and will make it bigger for no good reason.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

