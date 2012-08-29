Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6mM1-0003Yv-Jk
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 19:47:01 +0200
Received: by eaad12 with SMTP id d12so227890eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6tRUGpb/U7mr3RBl2meDC5IH+McxhCa5VpD5uKLzgXE=;
	b=RhkJJAN6h038JlKg7m7RawZqFfC7/LUstqVt1n42/wkeTgKxu79rNvSkqZpOu9u4u7
	fGJ9lwciRM1FyO+ebq8iXhKBg8USrkRS6If9iJfy8dGnC24xa2Mg09rPHanDilcsRCFC
	cSPjyGg+AG7gKiviM/fip4m1Usar49M/Acqf4jLq3eSZ3ssvn3jr2C0gMXD6Wtf9rkhj
	V/deW9M3cEhQ0WNgYFNdOJiAc93ZXNI4Vdr5tnhuMcq3UxfpkOWdaOrtjoFdE+UYPfqL
	4PgIYpMrPYihu9uS/eYYi9go5luQB81O5sn86/SQqnBRtHB8UVcAt3xn8Ndbo2kaY70B
	5VOg==
Received: by 10.14.5.67 with SMTP id 43mr2974137eek.15.1346261687400; Wed, 29
	Aug 2012 10:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 29 Aug 2012 10:34:17 -0700 (PDT)
In-Reply-To: <CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
	<CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2012 10:34:17 -0700
Message-ID: <CAMKF1srEAmTthOBC6D23uCfO6YW=ZD-BW+mF4UZYwdFbXyKrjg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 17:47:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 29, 2012 at 8:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> Thinking about it, I'd like to retract this patch and leave the Poky
> distro overrides in that file.  If someone wants dates/contacts/tasks
> on Poky then they'll get the extra integration, and it serves as an
> example/reminder of the functionality it brings (makes the menu bar a
> dropdown from the window title).

Patch is fine.
it should go into meta-yocto which is integration layer for poky distro
so you patch to delete is fine. may be convert it to some sort of PACKAGECONFIG
which distros can use.


