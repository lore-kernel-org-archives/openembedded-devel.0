Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tikcq-0008IT-9U
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:37:23 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so456651pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=CVGbS/dG70ROrNrauwH0ns+vaoWGcv9hY7DnqgAAWY8=;
	b=iPGBNWCi+v8LznlUyD/mUHBkoRY4NNlaQ8+YdHbcdR8gAtccTa9jzFlzaCKIXb8Srx
	YFxUWcKjC6tGddTCJgg//pmpUkapcAWv5ZpG6o+ngFYj7+Ur2z90xXfwDcJcxoFm9DmJ
	kUaqtVDLMQl1Z3Wiy0U8WIlCq0rN18PTdcfrbtKjzF/4tz0u7CNaeVzLoR4avYD3Q3kX
	DvnlmoUIDh/q1ARb5D97FrgqhbKD35aysuBNkbCloraDBPfvsd0p3rzq/O94YREhGvGt
	WWZYDn38tc+IwYZ/1h9truK5zHWKqzH3q55bfdV2ZYePQ62tsa7UcIK/sYnFAmzZq75b
	f45Q==
MIME-Version: 1.0
Received: by 10.66.81.198 with SMTP id c6mr1761755pay.50.1355311366017; Wed,
	12 Dec 2012 03:22:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Wed, 12 Dec 2012 03:22:45 -0800 (PST)
In-Reply-To: <CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
References: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
	<CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
Date: Wed, 12 Dec 2012 09:22:45 -0200
X-Google-Sender-Auth: pcyBgauVweQbRdUcKIfw_G2RYBY
Message-ID: <CAP9ODKr+Ksv7WdeFp1B-tXLffbw4upgfrNgT=K8moQruiV+tsA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: udev (master and danny)
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
X-List-Received-Date: Wed, 12 Dec 2012 11:37:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 12, 2012 at 9:09 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 7 December 2012 18:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > For master:
> >
> >  * OE-Core has 182 version of udev;
> >  * meta-oe has 173, 175 and 182 versions of udev;
> >
> > Everything works but we have udev recipes at master of meta-oe unused. I
> > plan to send a patch to remove udev (173, 175 and 182) from master.
>
> Ping?  It *doesn't* work: oe-core master and meta-oe master results in
> meta-oe's udev 182 being used, which fails to boot on atom-pc from a
> hddimg, hanging at "waiting for removable media" (nothing is ever
> mounted).
>

I'd like to remove udev from meta-oe's master. So we'd use oe-core one. The
meta-oe one lacks init scripts so it might be one of the reasions why it
fails?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

