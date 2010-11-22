Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKdsj-00054p-9M
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 22:25:02 +0100
Received: by ywg8 with SMTP id 8so1757825ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=v+OH8jgP6KPy9BkQ2K4AiHaj47QbmC+f3ZMiPLxBgpI=;
	b=A7IrHFkyzO6lA/mOWG6vpjFvbbSfU45K0vkZ7gAzwkcvPJZ+EUEyGgxY01SEBDGKtG
	UahP4VVLLC3V1e8k7KbxhjXYLNgxvw0sY0yjui6AiRxkhktsb4ErVU/gbdOj+09j5RUs
	+uy8K+T+IuYijiL1FvyNV485zFhnz+QZnMglo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jM8bRPQYrPKOHbr0HxQ2lMxvAqcOrkSGxVdTSUvUaF/PeyGpSY0a1pq+ipcet3C3L8
	rD5w7Pto+SsFM3+UfxIyAb8JqnGOy3pXb3snLbwjZWjdlh83zlu+aoPlfrdT6kguxQqi
	vbdmXhsZW/mJf8V3xmeQ0fKeX9gJtPuJPGGTE=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr7259088ibe.101.1290461027815; Mon,
	22 Nov 2010 13:23:47 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 13:23:47 -0800 (PST)
In-Reply-To: <AANLkTimZNfkNULXJ_AdTErTrwtyq0wODAhsamOXoxf1N@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
	<AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
	<AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
	<AANLkTi=pUsWJCyV8ARjfkvKzHK-gGz+e4Ea8VdOcm3JU@mail.gmail.com>
	<AANLkTinM80VFshaN2ZevB9kmLJ6BfLPjLV+UpinCMoyB@mail.gmail.com>
	<AANLkTimZNfkNULXJ_AdTErTrwtyq0wODAhsamOXoxf1N@mail.gmail.com>
Date: Mon, 22 Nov 2010 22:23:47 +0100
Message-ID: <AANLkTikp_E90iY9RwDuK1Vh0MOmVhP7N296GEb31d-YH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Mon, 22 Nov 2010 21:25:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/22 Graham Gower <graham.gower@gmail.com>:

>
> The conditional call of do_fetch is probably what we want, but I'd
> prefer to see this race fixed before we do that to ensure we aren't
> masking any other related races.

There should definitely be a dependency on the stamp and if the stamp
is newer the fetch should not be called (or generated)
>
>> Why is do_fetch called twice in the first place. I would expect this
>> not to happen.
>
> See src_distribute.bbclass and refer to do_distribute_sources().
> do_fetch is only called twice if pstaging is disabled (which is not
> the default).

Without too much knowledge on the internals, I'd say the 2nd fetch
should be conditional on pstaging then.

Did a quick peek at that bbclass file:

addtask distribute_sources before do_build after do_fetch
python do_distribute_sources () {
        bb.build.exec_func("do_fetch", d)

This greatly puzzles me. distribute_sources comes after do_fetch and
it starts doing a do_fetch ???
Isn't it possible to just eliminate this 2nd fetch ???

Puzzled. Frans


