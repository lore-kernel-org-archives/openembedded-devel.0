Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C91F2719D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1K3VB4O026479 for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:31:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yzTGzh8x71wg
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:31:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1K3V4fJ026474
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 03:31:07 GMT
Message-ID: <1487561463.17001.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Feb 2017 19:31:03 -0800
In-Reply-To: <3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
	<3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 03:31:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-17 at 14:45 -0500, Philip Balister wrote:
> And I'm with these gyus. Splitting the git repository doesn't solve
> any underlying problems. The real problem from my point of view is
> very few of use are actually paid to maintain the layers we maintain.
> 
> Employers want to pay things they profit from, and that is not paying
> someone to maintain "core infrastructure".
> 
> Layer maintainers interests change over time, and you burn out
> supporting people who get to do all the cool stuff with the layers
> you maintain. In the end, you get all the crap and non of the glory.
> Within this list, most people appreciate your work. Outside the
> community, people completely underestimate the amount of work
> required to keep the ecosystem running.
> 
> Yeah, add my name to the list of cranky people.

I do think this is a valid question that Ross asks and that whilst the
first quick reaction is "no", its worth thinking about the pros/cons.

The pros to me would be about better test time on patches and in theory
more specialist knowledge. This isn't to say Martin/Joe don't do a bad
job but the size of meta-oe does mean there are limits.

The cons are more around finding suitable layer maintainers, which as
we all know are hard to find.

I'd probably suggest that:

a) We need to encourage/empower more people to maintain layers
b) Having better infrastructure, tools and processes that help a) would
   therefore be desirable.
c) We need to be willing to separate out pieces for people to maintain
   in such layers. It might not always work out but we should be 
   willing to try.

As for the comments about core changes, I really do try hard not to
make them in many ways. The ones we do make, I'd hope are for the right
reasons.

No easy answers but don't shoot Ross for asking what I think is a
reasonable question.

Cheers,

Richard


