Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Y6K-0007fO-6A
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:48:48 +0100
Received: by lahc1 with SMTP id c1so1456370lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:40:26 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.54.36 as permitted sender)
	client-ip=10.112.54.36; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.54.36 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.54.36])
	by 10.112.54.36 with SMTP id g4mr568792lbp.19.1330000826895 (num_hops =
	1); Thu, 23 Feb 2012 04:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Rmg/phkFtiKB/RPCN1gz3IUhHNiy133ac86L/RcmpXQ=;
	b=P99/ZZzyw0xN0FixV/3g4qeEk66o64/f5ZdRoZ11FDbHxAIVWyeGaoC+YjfvcSqpf7
	fx2CrPNzevjxe8tzSpUD6crPna80Eyz642WdPkAtmXqE/30YDvMnUwf1XkTOEPMgGeBK
	OBroAMUKTFEWuJT2wLxYzFXyJoJaLrGqmJV7o=
MIME-Version: 1.0
Received: by 10.112.54.36 with SMTP id g4mr473588lbp.19.1330000826816; Thu, 23
	Feb 2012 04:40:26 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Thu, 23 Feb 2012 04:40:26 -0800 (PST)
In-Reply-To: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
Date: Thu, 23 Feb 2012 13:40:26 +0100
Message-ID: <CALbNGRRYoVeK8AUWYdyWH0R6QGf8AzGC73UjAPX_MyaMKNcDWw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe V3 00/23] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 12:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 1:31 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 23, 2012 at 10:10, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> V2 -> V3:
>> (Hopefully) all suggestions and comments were incorporated =A0/ rebased
>
> This patchset is ready for merging IMO.
>
> Checking remaining recipes that might be change to use
> ${systemd_unitdir} I found:
>
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> meta-oe/recipes-connectivity/cherokee/cherokee.inc
> meta-oe/recipes-connectivity/gateone/gateone_git.bb
> meta-oe/recipes-core/systemd/systemd-compat-units.bb
> meta-oe/recipes-core/systemd/systemd-serialgetty.bb
> meta-oe/recipes-core/systemd/systemd_git.bb
> meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
> meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb
> meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
>
> I dropped udev ones as I am working on them :-)
>
I had these in my first RFC series - most of them can be taken without
modification - I think. But as mentioned, I left them out here because
I wanted to wait for a solution for ?-FEATURE to avoid modifying tons
of tasks/images spreaded on different layers. Is there a solution on
scratch?

Andreas


