Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 93A1A6EB1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:48:50 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so3029248yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LIqESZhWsJUFu4uRdsjtV23XfRXF7hYPME2Lc8ldhoI=;
	b=klt/FoY9BuPngfn/8D5Nxk2sSH7RWT57UFPxzv+n1V5bc5+lIfFOARXB0hWR1dj0iU
	4nHkKsC59Y3urVOzXzyVgWH+Q7Dy+61ssqSkJbKuH16puDEWyulQFWomQV3DHPnt3ZUb
	dP4OsSHO+M2AbLXGWmxiVaMq09O/K6qCW6Cfo4pPAm7LH6nc97DXHAnCVxTRrndAW5LH
	x4IcQ3zX39RtY1i+tLY/wP9JqjyPuK9KQ3U4iTQDum2YhGpLmK24eR3GnoMOcy+vL2GI
	/JRg2OlBMbynbdl0+U2sU2ZLOBDLe1P+JIhZTzlNih7pCrXQDagsJKEruUrMRB++vrGG
	IhgA==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr14345318yhk.2.1393019331198;
	Fri, 21 Feb 2014 13:48:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Fri, 21 Feb 2014 13:48:51 -0800 (PST)
In-Reply-To: <20140221211207.GW22890@denix.org>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
	<20140221211207.GW22890@denix.org>
Date: Fri, 21 Feb 2014 18:48:51 -0300
X-Google-Sender-Auth: gUBrnPkyNHXji8_LycsGyadqth0
Message-ID: <CAP9ODKorus3S2JJEmoda4OjAYEH_rWRt4CrtxnfMQ5NKKADEgA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Fri, 21 Feb 2014 21:48:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 21, 2014 at 6:12 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Feb 21, 2014 at 05:41:01PM -0300, Otavio Salvador wrote:
>> When looking for Qt5 headers we ought to use the Qt5 specific path. In
>> case the distribution wants to have a flat tree it can set QT_DIR_NAME
>> and it will still works as expected.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>
> Martin,
>
> Thinking about what you said in that Wiki section - I believe the number of
> apps consuming headers from /usr/include/qt5 is much higher than number of
> non-Qt5 libs/modules potentially installing headers in there... So, we
> shouldn't require every app recipe to set PATH_HEADERS properly.

I agree with Denys here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

