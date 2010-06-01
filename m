Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OJSbM-0001jb-OV
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 16:37:58 +0200
Received: by gya1 with SMTP id 1so1496097gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=saSm6jZRdFKj2hkEDUpmlWAmgwq4hk4co5o/szUrUtw=;
	b=tQZpkCKBNQqWlLa4o1ARS4eScT1F3YkFycthK/znM0W6+h3f/tFzsAs8jIBa9ctCVx
	NMhdj3z3JC1Z0h2MKn6pjB7siqbOMw2oRLjl2xvOkJvthYhqTv5x965dD8S14KTq3qYq
	tiNrQmcZAEpKycwixXZe++sYLiPrGKRF6j4k8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=SuS4j09FLFAMZT9HYlKlZ5tuCqmHaVLxNX3lMqdvCqwCL5a8AuhDZ1VCZqL2G5nDLi
	R0P+3VgqyxMYR3DD2PchYE8ofwTfWOn+y2GbPKu+9Myu8dY3Db4DeMUuo5hgG8igFwwD
	18aKJHnLUehbpmzr0ecj2Cbg5OsaW2Y7qtGT4=
Received: by 10.224.26.94 with SMTP id d30mr1650656qac.328.1275402822280; Tue, 
	01 Jun 2010 07:33:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Tue, 1 Jun 2010 07:33:11 -0700 (PDT)
In-Reply-To: <4C050CE8.4080102@cbnco.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com> 
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com> 
	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com> 
	<AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com> 
	<A24693684029E5489D1D202277BE894455A0F458@dlee02.ent.ti.com> 
	<4C050CE8.4080102@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 1 Jun 2010 07:33:11 -0700
X-Google-Sender-Auth: Pdif_u4PFVNp7xS9QAg4JZB-oIA
Message-ID: <AANLkTilZ3hQkgDrCWCSijeXEb78WSlrCIe1RMjFEVakc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Tue, 01 Jun 2010 14:37:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 1, 2010 at 6:36 AM, Michael Smith <msmith@cbnco.com> wrote:

> Ambrose, Martin wrote:
>
>> On Sun, May 30, 2010 at 14:49:32, Chris Larson wrote:
>>
>>> Aside: the way it does so is quite the hack, we need to figure out
>>> a better way to manipulate the task graph like this.
>>>
>> >
>
>> Maybe that explains the problem I'm seeing with the dependency graph when
>> using srctree.
>>
>
>  Then it goes straight to the configure phase without ensuring the
>> dependencies are present.
>>
>
> Yes, I see similar things. I'm still on an ancient tree with
> do_populate_staging(). If memory serves, the prerequisite packages are
> unpacked, compiled and installed, but do_stage isn't run before the srctree
> recipe's do_configure.
>
> As long as you're not doing parallel builds it's easy enough to work
> around: just put the libraries you need in your IMAGE_INSTALL before the
> srctree packages.


I'll look into this today.  The class may need adjusting for the new staging
stuff, and some of what it does can be undone entirely in certain cases.
 It:
1) empties SRC_URI, sets S to FILE_DIRNAME
2) inherits 'clean' to set up a different default clean method and pull in
helpers
3) removes do_patch and its deps from the task graph entirely
4) merges operations above patch, up to install & stage

4) is the particularly ugly bit, and is only necessary due to the recipe not
using a separate build vs source dir.  The issue is variants, bbclassextend,
etc, from what I can recall.  You can't risk an interleaving of the
configure/compile/install tasks between the recipes that share the same
source tree.  A per task lockfile is insufficient, as it's released between
the tasks.  I'll see about adding a flag to control this behavior, and also
automatically disable it when a separate build dir is used (B variable), and
will see if it can be done in a better way, unless someone else gets to it
before me :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

