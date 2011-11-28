Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RV1mr-0002Py-8d
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:02:25 +0100
Received: by wwo1 with SMTP id 1so9246971wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 05:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Usik/NPXJfTwzBt6327PMAKxx/KHETLT9aEF3Sb9jxs=;
	b=Dsoawx9yFZeRsEz9Kt2zVFnfeOtrPyCLP6TMy/yXQo/yIliD1Sc320qo4sX3O3rDB9
	oKR1qN/O8CNso1NIaun1EApcDCrSHdzRbt1HIEgPZpjqaqj1y9BOrDVWnRaS9tA2FfU1
	eIEsSI9Z++eGL1Jupnyo7244e8uVzrW8EVnkA=
MIME-Version: 1.0
Received: by 10.216.134.5 with SMTP id r5mr1707094wei.12.1322488546591; Mon,
	28 Nov 2011 05:55:46 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.88.143 with HTTP; Mon, 28 Nov 2011 05:55:46 -0800 (PST)
In-Reply-To: <cover.1322484731.git.otavio@ossystems.com.br>
References: <cover.1322484731.git.otavio@ossystems.com.br>
Date: Mon, 28 Nov 2011 07:55:46 -0600
X-Google-Sender-Auth: nWq1QYIusKgtqbRFaHZq7rxOrMo
Message-ID: <CAPOJ94MGM=UQY4x+miij+rMcCLXPbJ8M9QHvVQQmf5Loqemc6w@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/1] systemd-serialgetty improvement
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
X-List-Received-Date: Mon, 28 Nov 2011 14:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I'm still coming up to speed on OE standard practices, but on other
Unix-like systems I would expect /sbin/getty to be the standard
selection, though in some cases a symlink to a preferred alternative.
Why does the patch make /sbin/getty the last alternative checked,
instead of the first?

Peter

On Mon, Nov 28, 2011 at 6:52 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The following changes since commit 720cd3f32ca8cc4701e99effdd3b3da0cca834=
8d:
>
> =A0digitemp: fix QA issues: (2011-11-28 11:58:39 +0100)
>
> are available in the git repository at:
> =A0git://github.com/OSSystems/meta-oe master
> =A0https://github.com/OSSystems/meta-oe/tree/master
>
> Otavio Salvador (1):
> =A0systemd-serialgetty: use a wrapper script to find getty
>
> =A0.../recipes-core/systemd/systemd-serialgetty.bb =A0 =A0| =A0 13 ++++++=
++++---
> =A0.../systemd-serialgetty/serial-getty@.service =A0 =A0 =A0| =A0 =A02 +-
> =A0.../systemd-serialgetty/systemd-serialgetty =A0 =A0 =A0 =A0| =A0 13 ++=
+++++++++++
> =A03 files changed, 24 insertions(+), 4 deletions(-)
> =A0create mode 100755 meta-oe/recipes-core/systemd/systemd-serialgetty/sy=
stemd-serialgetty
>
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


