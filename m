Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TleIa-0007BC-Dr
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 12:28:25 +0100
Received: by mail-ob0-f170.google.com with SMTP id wp18so3137529obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 03:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=hRHYsR1EDbyRBzU3Je8I7UWUmEb5Sa0aO4RAdvwhWTc=;
	b=rt/u4KgDHuL40j7cIdb1LeOr7bbfHClWI8QMZXW5SSxiorsy0Yi2C4FZkjP50El273
	ne6sFVmYtzAgHZw52S1YQp4iISe+NfJFGP0k6z1gO+ls9zFkCJt28l3B/eCXy77aFNVY
	7c9dRqrDZpaMZbL+q04ggM8B8DjKv8aBoyJhJul+Z8R6NGFiQjDEeh4Hpp0nUTVLvnUD
	o28cYVWqpkOFKlpf4Cknj+hUL8UEYZJ+BHwss2BD906oZrQ6LINxJhNeO+I2E9FkrdCq
	qyzE8j/sZf/kmyPF56EFbCrrP8zGI7Z/a/1dZ55LLUA/mn6v4/BKXE7V8NUJkG14g37k
	yp6A==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr7517268obp.62.1356002019385; Thu,
	20 Dec 2012 03:13:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 20 Dec 2012 03:13:39 -0800 (PST)
In-Reply-To: <20121220090157.GA30089@jama>
References: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
	<20121220090157.GA30089@jama>
Date: Thu, 20 Dec 2012 09:13:39 -0200
X-Google-Sender-Auth: WLZrIM_6e2JjA74p_HJ3K-mTJE0
Message-ID: <CAP9ODKp_34AC6oh-FRUVDb4vGZH95wXxZdescL_bM21owTpg4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/3] Revert "openmotif: remove due to lack of libxp in repository"
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
X-List-Received-Date: Thu, 20 Dec 2012 11:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 20, 2012 at 7:01 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Dec 19, 2012 at 02:32:09PM -0200, Otavio Salvador wrote:
>> This reverts commit 14b68506078a4133e743491d35245775a58a1317.
>>
>> Change-Id: I3dd4afe60d217e96fef08377c2d32f5c793af992
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Unfortunately still fails here:
> | gcc  -DHAVE_CONFIG_H -I. -I../../include -I../../lib/Xm     -O2 -pipe
> -g -feliminate-unused-debug-types -Wall -g -fno-strict-aliasing
> -Wno-unused -Wno-comment -fno-tree-ter
> -I/OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/freetype2
> -c makestrs.c
> | makestrs.c:51:21: fatal error: X11/Xos.h: No such file or directory
> | compilation terminated.
> | make: *** [makestrs.o] Error 1
> | make: Leaving directory
> `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/openmotif/2.3.3-r2/openmotif-2.3.3/config/util'

I built it here and I did it with a clean tmp and it worked. Please
check if it is a missing depends on xproto. If it works I can send a
new patch adding it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


