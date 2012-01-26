Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqSQb-0002sX-TE
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 17:44:02 +0100
Received: by lahc1 with SMTP id c1so356833lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 08:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=QsjjzHAKfyOWNaKKWKOjATxpeE14npEj6lLGOe1oveM=;
	b=W+GJ81pHa5dYMlEvOfonm6A6I6qwy+PN1JtCZooBKDQGfaUn5zLis+LceYpgeTOtqW
	tJgPoGwkZk5KWJhD6JoiHX7TY6uvKbfh+dBPnWDLXmMZ5Z837yVSHJHaZvBlIoh6a7rL
	GfvHr6TeSK/bVWoq2m42o2UQoewT7g3nNprEE=
Received: by 10.112.99.136 with SMTP id eq8mr775806lbb.42.1327595773475; Thu,
	26 Jan 2012 08:36:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 26 Jan 2012 08:35:43 -0800 (PST)
In-Reply-To: <1327569297.2716.64.camel@x121e.pbcl.net>
References: <1327489879-29117-1-git-send-email-yauhen.kharuzhy@promwad.com>
	<20120126054457.GE5566@sakrah.homelinux.org>
	<1327569297.2716.64.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2012 08:35:43 -0800
Message-ID: <CAMKF1sow5EM_BbbZPo3yX9Pmku5uFNEK3fogQjNuc4xssWb_iw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/10] Add recipe for krb5
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
X-List-Received-Date: Thu, 26 Jan 2012 16:44:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2012 at 1:14 AM, Phil Blundell <philb@gnu.org> wrote:
>
> Can you expand on why exactly this is better? =C2=A0I didn't quite unders=
tand
> what the advantage of CACHED_CONFIGUREVARS was meant to be.
>

this adds it to the environment by doing

${CACHED_CONFIGUREVARS} ./configure ....

not long ago I found a case where ./configure cachedvar=3Dyes ....

did not really work. Its somewhere in ml

> (It looks like at least some of those variables belong in the site files
> anyway.)


