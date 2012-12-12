Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tikdr-0008Nc-E5
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:38:30 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so457349pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NjYJksdDcQ9XjsDmRYO0hAPKQtUVu5prf5o+ANFZpBg=;
	b=f5epGhqUZNaMAWgxQXCyxWgwe8DXBIQv472/rQhRK4yvaANH8tnWfY037LKsCHqiUt
	8Epd7L0M9ZNSf1kv0UFsIgGqARVAf4QC5o2usXc41GLbCJpZLpp7D1C/2EiIG676fCBc
	PqRYZlI3GdIERIlctaP2eD3aum1DVHHYO971KhVvHhstIQcnyl+iwyVei9RTgK4ggqR9
	Lm7ugIR/hlc2HMJPYiv8ZOobftwg2s6Qwu10vauUPQ7/oEnfTMlo4BlHfAjMx72Ok0SX
	ukoP95zcCaoad3KAdUojaqIOgrdj07Rfy3+Bd/J9ji3APcCZnF/PTTywgKAp+WoLalnF
	kB2Q==
MIME-Version: 1.0
Received: by 10.66.52.79 with SMTP id r15mr1768897pao.46.1355311429178; Wed,
	12 Dec 2012 03:23:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Wed, 12 Dec 2012 03:23:49 -0800 (PST)
In-Reply-To: <CA+chaQfuvaEKQnph6mOpZq=bCCKNe=yXd9g6dPkXjfq7aK_wyA@mail.gmail.com>
References: <CAP9ODKqQGbR83_sXRzs=ATNLvZu9JF=HHPQcvM0j37cYV=jExw@mail.gmail.com>
	<CAJTo0LYOB_dJZygwvp9S8BJ7eAxjVkZJk-m4BOzf2nHAa-9Zuw@mail.gmail.com>
	<CA+chaQfuvaEKQnph6mOpZq=bCCKNe=yXd9g6dPkXjfq7aK_wyA@mail.gmail.com>
Date: Wed, 12 Dec 2012 09:23:49 -0200
X-Google-Sender-Auth: ViXe2HS7kIAyHIgX5n7yc1yDTMU
Message-ID: <CAP9ODKpTHJmnih0McoN4CqXFSaFP5f9q3zYLDNhAzeX8FGMtAA@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Dec 2012 11:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 12, 2012 at 9:14 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Dec 12, 2012 at 12:09 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > results in
> > meta-oe's udev 182 being used, which fails to boot on atom-pc from a
> > hddimg, hanging at "waiting for removable media" (nothing is
>
> There is patch to remove udev from meta-oe, but that merge of udev in
> oe-core kept significant diff between both 182 version, no idea why it
> wasn't taken into account when 182 was introduced in oe-core..
>
> I'm using udev from systemd recipe so I'm not really interested in
> udev recipe in meta-oe.
>

And how did you include the init scripts on it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

