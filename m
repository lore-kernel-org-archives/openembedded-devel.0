Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OghxV-0007PF-0P
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:40:53 +0200
Received: by wwb22 with SMTP id 22so943294wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=LelmTjpTyFiymo+rt3/JAIW2VZCJjUIkf1R/rWaGvnY=;
	b=E0Di/lludV9oPtysKRjyuXyg4S1FswzN88TAgxndMYCCPFusYtmp0NUcwa9PE9kmZU
	DIqiZ/NCHEhqBHtdix3PpEuMPyHMYtVwQ9VkU6A17kgvfx00VjNHnJI1Bl15hTLJzpuv
	xH1h80Zc2SbOQfUZ7sFEb9vZ0iORDGQNQNTe4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kNZGk5KsmrlWshhmGMU4WWzQYRA64SUSACmx1PswVyIAgURnh1TQKLOp7p5SA7FLHX
	k0MzFskze8ZQwp1kFrwWeykBPApPv4X0TS4+ev4jPK4QpmWd4DaqETmWE46KWcghjY/x
	Igi+reVYVOrjbM2E877k2qWC0MdUp6OGqIIpY=
MIME-Version: 1.0
Received: by 10.227.138.134 with SMTP id a6mr8103998wbu.68.1280943648101; Wed, 
	04 Aug 2010 10:40:48 -0700 (PDT)
Received: by 10.227.128.207 with HTTP; Wed, 4 Aug 2010 10:40:47 -0700 (PDT)
Received: by 10.227.128.207 with HTTP; Wed, 4 Aug 2010 10:40:47 -0700 (PDT)
In-Reply-To: <AANLkTin7L42p5JHP3SV9Gbo9VLtZyOHkeKx1OxEx9-bS@mail.gmail.com>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
	<20100804165030.GG28187@mx.loc>
	<AANLkTin7L42p5JHP3SV9Gbo9VLtZyOHkeKx1OxEx9-bS@mail.gmail.com>
Date: Wed, 4 Aug 2010 19:40:47 +0200
Message-ID: <AANLkTimXqKMUJT4Cs+7h8pHEnhd5aQye_dLU35nqYtJq@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 17:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Were these really removed yet? I have just pulled and they are still in the
tree?
Note that I saw this when parsing, not building this old version.
Thanks,

On 4 Aug 2010 19:23, "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
wrote:

2010/8/4 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>


>
> Hi,
>
> i'm seeing this:
> ERROR: This recipe recipes/libidl/libidl_0.8.3.bb) has a
> do_stage_...
Yeah it is risk that if e.g. an inc contains a do_stage and the recipe
appends or prepends to that.
Actually I should have checked that, but didn't think of it.

As far as your removal of recipes concerns:
I saw that Koen yesterday already removed them.

Frans.

(PS: how did you find this/why where you building such an old version?)

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@l...

