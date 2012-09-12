Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBs3o-0005X2-AM
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 20:53:16 +0200
Received: by eaad12 with SMTP id d12so880268eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 11:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RRQGWszPCnpXy4K0wN2LC7D7eO0bb3/YaJq4YKvKNho=;
	b=Et2FGYzLFpoQociqf3qJhnhefdmP9qNAcLzQ5Ycqqq12H3E2U4YXdz0qjcaSaFzP95
	ST2yfHgLBjoJMBK8ZjMPYNO4JXjAi5p2Eh2rDr9we5x5zenXIvNViOP5C56bwRtRlLQ9
	pUBjiTPSmiaQmKdpVqw/h3ELDuGH6S4JXyEEEzaVFc9paChVO2Dj5b1EZ7mAEFTX9QI+
	DENiM6NbQFlxBQeUPbf8kV/S3AIX7g0fX7Usf51JbFGINPahcrjvh+IGxNePw60MTNds
	wuY+EEiDVG1kyxWGNZ8bEoZJhYxL69YQrav0/lUfhId2wkOTBg1MSU5J/HwoWjoOxMXA
	3j/g==
Received: by 10.14.211.3 with SMTP id v3mr32434721eeo.43.1347475243856; Wed,
	12 Sep 2012 11:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 12 Sep 2012 11:40:13 -0700 (PDT)
In-Reply-To: <50504801.8020006@oneaccess-net.com>
References: <50504801.8020006@oneaccess-net.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 11:40:13 -0700
Message-ID: <CAMKF1sphEUhsD45FLesA1+Qu-bQLq7sqqnjLCwLoGr64PzJwAA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [recipe]variable shared
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
X-List-Received-Date: Wed, 12 Sep 2012 18:53:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 12, 2012 at 1:29 AM, Sophie Bonnouvrier
<sophie.bonnouvrier-ext@oneaccess-net.com> wrote:
>
>
> I would like to set a variable in a recipe and used it in another one.
> but when I get the variable in the second recipe the value is none.
> How can I shared variable ?

you have to define such variables in global metadata. any metadata
defined in recipe is recipe specific
may be add it to configuration metadata or some sort of abstracted out class.

>
> Sophie
>
>
> recipe 1:
> export XENO_DIR = "${@get_xenomai_dir(bb, d)} "
> export XENO_PV   = "${@get_xenomai_pv(bb, d)} "
>
> recipe 2:
>   xeno_dir = bb.data.getVar('XENO_DIR',d,1)
>   xeno_pv  = bb.data.getVar('XENO_PV',d,1)


