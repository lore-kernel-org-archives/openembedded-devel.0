Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKdCi-0000DP-3v
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 21:41:36 +0100
Received: by wyb40 with SMTP id 40so609616wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 12:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0N5omle5VwN/K3vqEwos8Tb7VD1D1UYJnEPbchBTxsc=;
	b=wjv/85yO0W7DpXHqM9Naq6vK1gGFCuCc8SKPZyZdqPkRxaJVIJ3oHcspVuHyNiINZr
	kxBOroGIHRkjbSJ+kTBaeQf+QTnz9GX40ZVvd5DUhQcj6tb/je79Sfh+rjGLol94gYEC
	SmQ3gXItLwHcU/aUTqpA06TY9HG/wLD7WBFYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=saL7kiWJnH8VAHtdM7oBwC26eICf8Rywp+gHiipwC8z+cQ1vJNA6BrWxO5fYKy3ImE
	I7XeV5nMi3J7b2F1SWI+TfKuYAjKMO9Y/ECI3L4pG4zycx6Hx6gxdAW7DCtDMCMh95QV
	07qv4RI9qjm2pZ4FdG7Mg4VbKFXLuLI5UQaIA=
MIME-Version: 1.0
Received: by 10.227.134.149 with SMTP id j21mr6523029wbt.194.1290458423288;
	Mon, 22 Nov 2010 12:40:23 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Mon, 22 Nov 2010 12:40:22 -0800 (PST)
In-Reply-To: <AANLkTinM80VFshaN2ZevB9kmLJ6BfLPjLV+UpinCMoyB@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
	<AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
	<AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
	<AANLkTi=pUsWJCyV8ARjfkvKzHK-gGz+e4Ea8VdOcm3JU@mail.gmail.com>
	<AANLkTinM80VFshaN2ZevB9kmLJ6BfLPjLV+UpinCMoyB@mail.gmail.com>
Date: Tue, 23 Nov 2010 07:10:22 +1030
Message-ID: <AANLkTimZNfkNULXJ_AdTErTrwtyq0wODAhsamOXoxf1N@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 22 Nov 2010 20:41:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 November 2010 17:24, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/11/22 Graham Gower <graham.gower@gmail.com>:
>> On 22 November 2010 10:42, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> I though tthe issue had disappeared (in the meanwhile I remove an
>>> obsolete dependency on zlib)
>>> but yesterday again...
>>>
>>> run.SRC_DISTRIBUTECOMMAND was malformed, broken at line 122 (export
>>> docdir="/oe/bu ).
>>>
>>> On second build the size is much bigger (1102 lines).
>>>
>>> Retrying..
>>> Andrea
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> With pstaging disabled, do_fetch is called twice. The second do_fetch
>> races with do_unpack. Presumably we see a problem in lzma-native
>> because it does oe.process.run() in do_unpack_append. I can't see
>> exactly *what* is racing though.
>>
>> I previously spoke to Kergoth about it on IRC and he suggested making
>> bb.build.exec_func("do_fetch", d) conditional on whether the do_fetch
>> stamp file exists... I've not gotten around to doing that (bad me).
>> Want to try it?
>
> Hm.
> I don't know the exact details, but this looks like a bandage, not
> like a fix for the root problem.

The conditional call of do_fetch is probably what we want, but I'd
prefer to see this race fixed before we do that to ensure we aren't
masking any other related races.

> Why is do_fetch called twice in the first place. I would expect this
> not to happen.

See src_distribute.bbclass and refer to do_distribute_sources().
do_fetch is only called twice if pstaging is disabled (which is not
the default).

-Graham


