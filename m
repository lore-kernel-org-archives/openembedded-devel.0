Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TiREp-0005ag-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 15:55:16 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2580826pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 06:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=89WTG+WDTNEAdBMdIO365UmP1u5Vi3Dj3MxlygEwzaw=;
	b=H661uLnlItHUp5EOxAkPzn2aEQSgVmifv7fBa5BfNX8Ttik4jackTfNBty4pSn+Igj
	nhPhDoEo5jqatjLPJnv5VVrFdSnctpijxEk3HLNQUPbVrzs5OmzHKpvbHBNB9R/7sWpF
	gcNUKALZzrL9sOowi6rJTPIEznIzHoqVrPdbHV7qNcP3Q2rKg6lxfXkiofAamhnZMyYb
	gdZJXW+hxFmP9OU53HEn4R1W9RlQGs/0x/r4/LOnapTdWPx8y5C3yuVYSt+TahZ4/o1f
	R3YN+jHjmtui7ZrUEPEsLacCW0J9//dPTr/oqMZe4PZ4ObcQxVavjlbhZdc5ySVABWla
	RExQ==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr49036477pbc.64.1355236842549; Tue,
	11 Dec 2012 06:40:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Tue, 11 Dec 2012 06:40:42 -0800 (PST)
In-Reply-To: <49c232118052aeef2336aafff464603cf6771eb9.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<cover.1355187290.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
	<49c232118052aeef2336aafff464603cf6771eb9.1355187290.git.Martin.Jansa@gmail.com>
Date: Tue, 11 Dec 2012 12:40:42 -0200
X-Google-Sender-Auth: AIH6m9zYtUMDa4OlLvtmtmJeRWw
Message-ID: <CAP9ODKrmXf3FQ4ax=R6qmk7wAGxOrdgvhJwJ=JnT_K1n4kUF-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 88/90] openbox: fix PR format and use new update-alternatives syntax
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
X-List-Received-Date: Tue, 11 Dec 2012 14:55:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 10, 2012 at 11:00 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * fixes:
>   NOTE: recipe openbox-3.5.0-1: task do_package: Started
>   WARNING: openbox: Use of ALTERNATIVE_NAME is deprecated, see
>   update-alternatives.bbclass for more info.
> * bump PE if you care about upgrade path from wrong PR, introduced in
>   commit 3becce8504033dfac7c497fa12675f873a5df9e0
>   Author: Mario Domenech Goulart <mario@ossystems.com.br>
>   Date:   Mon Dec 3 16:03:23 2012 +0000
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Eric, please add it to danny as well. This was not catch by me when
reviewing Mario's patch. Sorry.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

