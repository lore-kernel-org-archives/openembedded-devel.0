Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O2lpK-0002t0-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 15:43:40 +0200
Received: by wwb18 with SMTP id 18so1281475wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=NSHRYvf9LJxVJSizVieT5FUPNAkruINuJqlCyJ7G1sg=;
	b=G0t8Vz22vcqquu4rxLPUmdN49XNWXqWvwKGhQ0XdziytnYtwj6lnH5dExZ/JimyGFS
	Nr+2lYtfoQimUIjw5HUGfjDtNFIEcqO6qsThb0OYG7er1UL4bgObiohJz4wgc2O+gkT1
	DGxZcfl0HXro6X3B2xdTXWaubjdpjJPE1qaEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g3kDU8u2bmR+J+WEH9I/1BbjmRoiEvW0wk8CrxQpbi0oV3BZDjhoWSXJ61lUIXywIs
	j5FRQDBzltPlGGlE1ZWCWbULrvawMcftoxba2n1lqvErg9USz/5T4oHSnWxE2szb5A6p
	a5DZJ7gxCnBY6TxcVbdUWgskEvGelNH5uFdVE=
MIME-Version: 1.0
Received: by 10.216.182.70 with HTTP; Fri, 16 Apr 2010 06:39:50 -0700 (PDT)
In-Reply-To: <20100416123920.GB3323@jama>
References: <20100416123920.GB3323@jama>
Date: Fri, 16 Apr 2010 17:39:50 +0400
Received: by 10.216.185.136 with SMTP id u8mr1834366wem.24.1271425190098; Fri, 
	16 Apr 2010 06:39:50 -0700 (PDT)
Message-ID: <j2o48239d391004160639p87e47f6enf6f096140c9ecd20@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Fri, 16 Apr 2010 13:43:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 16, 2010 at 4:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> on Openmoko Freerunner om-gta02 Xserver script takes about 3s on every
> boot
> http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r1.png
>
> it's started from /etc/init.d/xserver-nodm and with eliminated Xserver
> call by passing xinit call directly with right Xorg params I get this
>
> http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r3.png

Sorry to bother with off-topic post, but how these boot charts are
built? Really nice thing to have...


