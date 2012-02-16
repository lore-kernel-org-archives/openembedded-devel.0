Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ry1FA-0005ex-QC
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 14:19:29 +0100
Received: by daln34 with SMTP id n34so1726967dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nh1eUHN5H2iJb//1v0e7nnY6xn9960HZXKF8S4CEq5Q=;
	b=jZghU9l3it9//4ZaMg2Vf2Ev/yqlfGQH2LnfQ79pufW6ns3737/XE1onsa0VqMTtgX
	ZBhdosaBJlX61DF8mK4ja/2pta6yjahZTrjz019PRAG9Q7hDzHdQazPQTUPO1gxmcKo8
	T2PG78Sdgj9AWdJREgvUXpPGX9vN3EcAl1aPw=
MIME-Version: 1.0
Received: by 10.68.130.40 with SMTP id ob8mr13316298pbb.106.1329397874960;
	Thu, 16 Feb 2012 05:11:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 16 Feb 2012 05:11:14 -0800 (PST)
In-Reply-To: <20120216125339.GC5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
Date: Thu, 16 Feb 2012 11:11:14 -0200
X-Google-Sender-Auth: 3E5BeSKPQW6Niq0d_giwCl1F7pg
Message-ID: <CAP9ODKqibhsPkK9QfNasmMCGQUFK3LXjJmsqnR+LLvrH5rjw7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Thu, 16 Feb 2012 13:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 16, 2012 at 10:53, Martin Jansa <martin.jansa@gmail.com> wrote:

> And I'm not sure if this change is intentional:
>
> http://git.shr-project.org/git/?p=buildhistory.git;a=commitdiff;h=3d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
>
> as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
> probably won't harm if xserver-nodm-init is used only to pull
> xinit+xserver-common dependency.
>

This is indeed wrong IMO.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

