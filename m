Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id AF5986BC26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 17:56:20 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uy5so98493obc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=a7jCkfjg0gelh+CRyRbVCDgpH7TeCicl9eyx2JjwgYE=;
	b=i2bOuZiXjmICjc834280boBjYChE9Wx7StRsPBjgGY8xem8hmmV5feyxYdLYJmGa7D
	S3O4bqEWAjQia6fPk9fn1kTcyuepR6bI5aCRKxoJOR9CasBVvjJa4UdNcOvysx8OsaSQ
	p5tel5bS0mW1lNMEnVc5xusKtrweQchvIsIUI5oPlrNYOp+1yCEQ66VjWNIGCn2Cw3wf
	6y4Bqaq5czB4mM9xkL1qmZK68pR+WFy/KMPu+issbPMg3M9NeZmo/n+FJrBGGjmiNaDn
	oLb24OirNoraxe/jrhJkOa/y5VvEdfBwlkDpk24KRhD0fV2rJXseHuYGGxEjDZEBk08l
	4xSQ==
MIME-Version: 1.0
X-Received: by 10.60.68.135 with SMTP id w7mr6681252oet.9.1385056579436; Thu,
	21 Nov 2013 09:56:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 21 Nov 2013 09:56:19 -0800 (PST)
In-Reply-To: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
Date: Thu, 21 Nov 2013 15:56:19 -0200
X-Google-Sender-Auth: 9x8CMkVKNPaSkcU3vTjBvK1xB24
Message-ID: <CAP9ODKoFwva0PPQCvJddLDJK0DRCAKL2BydwNk3OG3RashavZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Thu, 21 Nov 2013 17:56:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 21, 2013 at 6:33 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> so i have a couple of questions:
>
>  - are we doing something really wrong here? or are we getting issues that
> anyone would get when trying to have a OE based product with Qt5 and
> multiple machines from the same <arch>?
>
>  - assuming this is a typical use case... i wish there was an easy
> mechanism to 'mark' all Qt5 packages as PACKAGE_ARCH = "${MACHINE_ARCH}",
> without having to .bbappend every single recipe. It is indeed quite common
> to have a .bbappend for qtbase, but not for the other packages...

We have a similar case in meta-fsl where we have several packages
which are machine specific and SoC specific. We solved this using a
class that 'changes' the package-arch using the depends.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/classes/fsl-dynamic-packagearch.bbclass

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

