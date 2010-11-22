Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKKHt-0001nw-US
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:29:42 +0100
Received: by wyb34 with SMTP id 34so1978876wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 16:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Sl9RkiNX86vDPbf6HlIVPik/I6f02zb97arWxaoKGXI=;
	b=A/WwW+gglQasLnC7T6QtavcSpGgj0ZuTVOhIwZhnxaNMuB+xQUyN0w2bPwwapvs9IR
	RsfYzBS6+x6BsKIY1ebpdb/CLYaosjbInL+iPuWS4qU1BklI3YwQkgEAf7za3N6C+cnQ
	tUkCRBppRTbCEUGvw5P7l74lWDP/P4p8ki1z0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CZq3fDXiwRIVZXm5fTm+cudMrRroPttxtC8D/rNX93If9CraP/0nogFMZhBaCQY4Db
	+acscu84s5wfLqixeSP1Qy4fJI2MJXnjKqnPNJeVTW9hAuBfTJgIAG51rAf/sgw03Oq2
	FEfZsM393qFzoiKo4k2j/A+VjZVpSe+pUs98o=
MIME-Version: 1.0
Received: by 10.227.132.206 with SMTP id c14mr5188704wbt.78.1290385710405;
	Sun, 21 Nov 2010 16:28:30 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Sun, 21 Nov 2010 16:28:30 -0800 (PST)
In-Reply-To: <AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
	<AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
	<AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
Date: Mon, 22 Nov 2010 10:58:30 +1030
Message-ID: <AANLkTi=pUsWJCyV8ARjfkvKzHK-gGz+e4Ea8VdOcm3JU@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Nov 2010 00:29:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 22 November 2010 10:42, Andrea Adami <andrea.adami@gmail.com> wrote:
> I though tthe issue had disappeared (in the meanwhile I remove an
> obsolete dependency on zlib)
> but yesterday again...
>
> run.SRC_DISTRIBUTECOMMAND was malformed, broken at line 122 (export
> docdir="/oe/bu ).
>
> On second build the size is much bigger (1102 lines).
>
> Retrying..
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

With pstaging disabled, do_fetch is called twice. The second do_fetch
races with do_unpack. Presumably we see a problem in lzma-native
because it does oe.process.run() in do_unpack_append. I can't see
exactly *what* is racing though.

I previously spoke to Kergoth about it on IRC and he suggested making
bb.build.exec_func("do_fetch", d) conditional on whether the do_fetch
stamp file exists... I've not gotten around to doing that (bad me).
Want to try it?

-Graham


