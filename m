Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 37D3D6EA4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 13:45:16 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so11503245ykr.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=wDqmmMX5Ix256k8TiT0bQoBEIjlh1YMaN0uDQBrXTgk=;
	b=qD6/+xkV9+AsaWuca5RMLMNFLff4cRDtLR+HkOerU25OC4nNBHzFFQU9kvSXx3iD2J
	OMJQB07TjsFaeH8qi9uqzowCjA2xOdCgSR1JpVHOU1ohUfQAGjaWNBwY2WLnNcBvNq0C
	wCAxck1FqZDCg4RifsBFKnXkIEGDo20lhRcQwkxApZeZRuPFpEyCo2kYib/MIoStHbPn
	Nn02tQdwsdq02PjtQDRUsSZFCVduu0qbJoBmGJrzwLJX2RVwlUb2AGlVgzCDG8O2vv+k
	j/0Otth6jMdaDqD+tBYTpPf5w2SSuQc80VY6HM17S6UiidaS4fpB7z8eJI8jev37nA2z
	ardw==
MIME-Version: 1.0
X-Received: by 10.236.130.80 with SMTP id j56mr24464923yhi.155.1393163117075; 
	Sun, 23 Feb 2014 05:45:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Sun, 23 Feb 2014 05:45:17 -0800 (PST)
In-Reply-To: <20140222063750.GI3854@jama>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
	<20140221211207.GW22890@denix.org> <20140222063750.GI3854@jama>
Date: Sun, 23 Feb 2014 10:45:17 -0300
X-Google-Sender-Auth: wMoMhmrGQy0ToUe5BHyMAlteyec
Message-ID: <CAP9ODKo9a9f8HXkbb_BMa0B8yAd-QNYG2knNm+Ct0_OrGmwBVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Sun, 23 Feb 2014 13:45:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 22, 2014 at 3:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Feb 21, 2014 at 04:12:07PM -0500, Denys Dmytriyenko wrote:
>> On Fri, Feb 21, 2014 at 05:41:01PM -0300, Otavio Salvador wrote:
>> > When looking for Qt5 headers we ought to use the Qt5 specific path. In
>> > case the distribution wants to have a flat tree it can set QT_DIR_NAME
>> > and it will still works as expected.
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Acked-by: Denys Dmytriyenko <denys@ti.com>
>>
>> Martin,
>>
>> Thinking about what you said in that Wiki section - I believe the number of
>> apps consuming headers from /usr/include/qt5 is much higher than number of
>> non-Qt5 libs/modules potentially installing headers in there... So, we
>> shouldn't require every app recipe to set PATH_HEADERS properly.
>
> Setting OE_QMAKE_PATH_HEADERS is simple oneline change:
> OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
>
> undoing this implementation isn't, if you really want to change
> OE_QMAKE_PATH_HEADERS then include QT_DIR_NAME in it, but leave
> OE_QMAKE_PATH_QT_HEADERS alone.

Ok; I will rework the patches and send a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

