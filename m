Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeUWM-0005ja-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 18:00:15 +0200
Received: by iwn4 with SMTP id 4so36506iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZUbtJAclzmI6ZmSH5CzS3eYdTFjiSSwHDL/Yc737x9Q=;
	b=qGCvUCvPdwoBdv9ahUF61Fg/pJx54HFU+hiAe54RHP7bJpDJG/GAJ/kEfiBzN59D4M
	VY7Y1nlJs3S6225SSLiPktUws97wnHynb3YGXNX4/7rHZs77qu9Fp+hY3FdKQHPupizI
	Bb2zYDBYS/sdOZcXeBCcxcz6w3NURER15+154=
MIME-Version: 1.0
Received: by 10.42.21.204 with SMTP id l12mr9303984icb.341.1309967783914; Wed,
	06 Jul 2011 08:56:23 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Wed, 6 Jul 2011 08:56:23 -0700 (PDT)
In-Reply-To: <1309945425.4518.11.camel@mattotaupa>
References: <1309916936-17283-1-git-send-email-agnel.joel@gmail.com>
	<1309945425.4518.11.camel@mattotaupa>
Date: Wed, 6 Jul 2011 10:56:23 -0500
Message-ID: <CAD=GYpbFv_ZkOy6vK1dJoUovhvV8RDRCA3=BorqjVwPHoZ4wwQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: jdk@ti.com, joelagnel@ti.com, openembedded-devel@lists.openembedded.org,
	beagle@list.ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Wed, 06 Jul 2011 16:00:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

Thanks for your suggestions.

On Wed, Jul 6, 2011 at 4:43 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Joel,
>
>
> Am Dienstag, den 05.07.2011, 20:48 -0500 schrieb Joel A Fernandes:
>
> 1. What has changed in this patch iteration? (You can put that below the
> `---`.)

Thanks, will do.

> 2. Could you elaborate a bit more what the problem was, i. e. how the
> situation was before, and how the fix works? For example pointing to the
> thread on the BeagleBoard list.(?)

I am not aware of any thread that showed concern about the incorrect
value. It so happened that the user-button wasn't working for me.

> 3. Is a similar patch also needed for 2.6.39?

A similar patch is already included in 2.6.39 and has the correct value.
(line 109 in linux/linux-omap-2.6.39/beagle/0001-OMAP3-beagle-add-support-for-beagleboard-xM-revision.patch)

Thanks,
Joel


