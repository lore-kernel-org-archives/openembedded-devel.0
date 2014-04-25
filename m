Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 989B365DCC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 13:02:17 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id mc6so1856061lab.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vwYyOOFZRMUZJY+n3vV4VDcEOMn20waDIPGjn3hUtgY=;
	b=080MgSzW8Uf0wD2rwkP1p1IIBuJX44Gig+kak2TpaxMTJlXxW/rQSjmF10WCQYf9Ok
	k/hx9TsBEqZ1lZnv+yFAy5WXhoodGAxAez7HsyNqZzAqwRtul51yjEluJcqKIWHWhL6l
	0sERgL/ozmv0vit/CHsm1vMcpbhmiaHzDNDLJSRaJG61oWo6n4RGk3YHX4di0Qbb46ml
	Qb6OWTTydjhPRw1f8jAePdfpBn/vHgpu1AumskCHyf1uxbRo8KaIYi1XIQcOB4e4s6bP
	TIjWgugdOAuaefHk9KeNgu01n9+hVBaK5CiZgdWs3TKJznE321u9YaLT4yl5lOCwJP45
	0HeA==
MIME-Version: 1.0
X-Received: by 10.152.234.130 with SMTP id ue2mr5750179lac.0.1398430937948;
	Fri, 25 Apr 2014 06:02:17 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Fri, 25 Apr 2014 06:02:17 -0700 (PDT)
In-Reply-To: <ljcuj9$fuc$1@ger.gmane.org>
References: <ljcuj9$fuc$1@ger.gmane.org>
Date: Fri, 25 Apr 2014 15:02:17 +0200
Message-ID: <CAPbeDCmCodtS+O8tBJwjGyhr0FsiWCd9Sffv9JGsU+p6J1EE2w@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5]remove -reduce-relocations on arm platform
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 13:02:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 25, 2014 at 8:16 AM, Neuer User <auslands-kv@gmx.de> wrote:

> On arm platform the compiler does not implement "-reduce-relocations",
> see here: https://bugreports.qt-project.org/browse/QTBUG-36129
>
> The meta-qt5 layer, however, uses this option, so configure will fail
> for qtbase.
>
>
I'm building for Wandboard, ARM Cortex-A9, but I haven't had any problems
building qtbase.
Is this more of a runtime bug ?

/Jacob

