Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O8vFx-0004k0-SU
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 15:00:21 +0200
Received: by fxm11 with SMTP id 11so1980688fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YyGYi2AYo8563jv3lRpdxtfjo/x5Qi7utnvwR7NcquY=;
	b=umyRSFJqLiZx2JHtH0i8QBUVZYEgmQtOiwvWUk3qaU7rmKqI+3nbRT70VsoyuBKsLi
	Fnj5gu6F9JzfduNxH7Cn8X1ImvJ8UxMlamy7wsfdFJPCKI737SQpCV31H0PJJVbXymd9
	pC6yWSdAN28oDsrmvr7DXJKg1THj0g3cTu+8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CVrzVzbD0h/2ROY37NvBCWW3W1euceAZ6nDSeQU8hcXvoBpzyW6MBiTH8t70kBFxeD
	uoMAFZ1A0eqDY7x5zCUziF0UkfilprIC3/8gT2xSqugkRzO+7oxM+XLr/wrMTedzr9di
	5HswnPrxy5mdfEcuZFm5+M7Nlilz6ldZ9MpUo=
MIME-Version: 1.0
Received: by 10.239.155.135 with SMTP id i7mr423240hbc.13.1272891390486; Mon, 
	03 May 2010 05:56:30 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 05:56:30 -0700 (PDT)
In-Reply-To: <1272886909-18281-1-git-send-email-Martin.Jansa@gmail.com>
References: <20100503113525.GO7123@jama>
	<1272886909-18281-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 3 May 2010 14:56:30 +0200
Message-ID: <y2id1b08f941005030556o3eb18be4yfa157157f03ca775@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: add 1.5.17
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
X-List-Received-Date: Mon, 03 May 2010 13:00:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2010 at 1:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> From: Eric BENARD <eric@eukrea.com>
>
> Tested only on x86, with kernel 2.6.33 and 2.6.32
>
> Signed-off-by: Eric Benard <eric@eukrea.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/klibc/klibc-1.5.17/modprobe.patch =A0| 1993 ++++++++++++++++++=
++++++++++
> =A0recipes/klibc/klibc-1.5.17/wc.patch =A0 =A0 =A0 =A0| =A0245 ++++
> =A0recipes/klibc/klibc-utils-static_1.5.17.bb | =A0 =A03 +
> =A0recipes/klibc/klibc_1.5.17.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A03 +
> =A0recipes/klibc/klibc_1.5.17.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 44 +
> =A05 files changed, 2288 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/klibc/klibc-1.5.17/modprobe.patch
> =A0create mode 100644 recipes/klibc/klibc-1.5.17/wc.patch
> =A0create mode 100644 recipes/klibc/klibc-utils-static_1.5.17.bb
> =A0create mode 100644 recipes/klibc/klibc_1.5.17.bb
> =A0create mode 100644 recipes/klibc/klibc_1.5.17.inc
>
...

Acked-by: Andrea Adami <andrea.adami@gmail.com>


